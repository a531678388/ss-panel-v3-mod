<?php

namespace App\Controllers\Admin;

use App\Models\Shop;
use App\Models\Bought;
use App\Models\User;
use App\Controllers\AdminController;

use Ozdemir\Datatables\Datatables;
use App\Utils\DatatablesHelper;

class ShopController extends AdminController
{
    public function index($request, $response, $args)
    {
        $table_config['total_column'] = array("op" => "操作", "id" => "ID", "name" => "商品名称",
                        "price" => "价格", "content" => "商品内容",
                        "auto_renew" => "自动续费", "auto_reset_bandwidth" => "续费时是否重置流量",
                        "status" => "状态");
        $table_config['default_show_column'] = array();
        foreach ($table_config['total_column'] as $column => $value) {
            array_push($table_config['default_show_column'], $column);
        }
        $table_config['ajax_url'] = 'shop/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/shop/index.tpl');
    }

    public function create($request, $response, $args)
    {
        return $this->view()->display('admin/shop/create.tpl');
    }

    public function add($request, $response, $args)
    {
        $shop = new Shop();
        $shop->name =  $request->getParam('name');
        $shop->price =  $request->getParam('price');
        $shop->auto_renew =  $request->getParam('auto_renew');
        $shop->auto_reset_bandwidth =  $request->getParam('auto_reset_bandwidth');

        $content = array();
        if ($request->getParam('group_limit') != '') {
            $content["group_limit"] = $request->getParam('group_limit');
        }
        
        if ($request->getParam('class_limit_operator') != 'none'
                && $request->getParam('class_limit_content') != '') {
            if ($request->getParam('class_limit_operator') != 'equal'
                    && $request->getParam('class_limit_operator') != 'not'
                    && strpos($request->getParam('class_limit_content'), ',') !== false) {
                $rs['ret'] = 0;
                $rs['msg'] = "该等级限制运算符只能设置一个等级";
                return $response->getBody()->write(json_encode($rs));
            }
            
            $content["class_limit_operator"] = $request->getParam('class_limit_operator');
            $content["class_limit_content"] = $request->getParam('class_limit_content');
        }
        
        if ($request->getParam('bandwidth') != 0) {
            $content["bandwidth"] = $request->getParam('bandwidth');
        }
        
        if ($request->getParam('traffic_package') != 0) {
            $content["traffic_package"] = $request->getParam('traffic_package');
        }

        if ($request->getParam('node_speedlimit') != 0) {
            $content["node_speedlimit"] = $request->getParam('node_speedlimit');
        }

        if ($request->getParam('node_connector') != 0) {
            $content["node_connector"] = $request->getParam('node_connector');
        }

        if ($request->getParam('expire') != 0) {
            $content["expire"] = $request->getParam('expire');
        }

        if ($request->getParam('class') != 0) {
            $content["class"] = $request->getParam('class');
        }

        if ($request->getParam('class_expire') != 0) {
            $content["class_expire"] = $request->getParam('class_expire');
        }

        if ($request->getParam('user_group') != 0) {
            $content["user_group"] = $request->getParam('user_group');
        }

        if ($request->getParam('reset') != 0) {
            $content["reset"] = $request->getParam('reset');
        }

        if ($request->getParam('reset_value') != 0) {
            $content["reset_value"] = $request->getParam('reset_value');
        }

        if ($request->getParam('reset_exp') != 0) {
            $content["reset_exp"] = $request->getParam('reset_exp');
        }

        $shop->content=json_encode($content);


        if (!$shop->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "添加失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "添加成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function edit($request, $response, $args)
    {
        $id = $args['id'];
        $shop = Shop::find($id);
        if ($shop == null) {
        }
        return $this->view()->assign('shop', $shop)->display('admin/shop/edit.tpl');
    }

    public function update($request, $response, $args)
    {
        $id = $args['id'];
        $shop = Shop::find($id);

        $shop->name =  $request->getParam('name');
        $shop->price =  $request->getParam('price');
        $shop->auto_renew =  $request->getParam('auto_renew');

        $deleted = false;
        if ($shop->auto_reset_bandwidth == 1 && $request->getParam('auto_reset_bandwidth') == 0) {
            $boughts = Bought::where("shopid", $id)->get();

            foreach ($boughts as $bought) {
                $bought->renew = 0;
                $bought->save();
            }
            
            $deleted = true;
        }

        $shop->auto_reset_bandwidth =  $request->getParam('auto_reset_bandwidth');
        $shop->status = 1;

        $content = array();
        if ($request->getParam('group_limit') != '') {
            $content["group_limit"] = $request->getParam('group_limit');
        }
        
        if ($request->getParam('class_limit_operator') != 'none'
                && $request->getParam('class_limit_content') != '') {
            if ($request->getParam('class_limit_operator') != 'equal'
                    && $request->getParam('class_limit_operator') != 'not'
                    && strpos($request->getParam('class_limit_content'), ',') !== false) {
                $rs['ret'] = 0;
                $rs['msg'] = "该等级限制运算符只能设置一个等级";
                return $response->getBody()->write(json_encode($rs));
            }
            
            $content["class_limit_operator"] = $request->getParam('class_limit_operator');
            $content["class_limit_content"] = $request->getParam('class_limit_content');
        }
        
        $needCheck = !$deleted && ($shop->group_limit() != $request->getParam('group_limit')
                || $shop->class_limit_operator() != $request->getParam('class_limit_operator')
                || $shop->class_limit_content() != $request->getParam('class_limit_content'));
        
        if ($request->getParam('bandwidth') != 0) {
            $content["bandwidth"] = $request->getParam('bandwidth');
        }
        
        if ($request->getParam('traffic_package') != 0) {
            $content["traffic_package"] = $request->getParam('traffic_package');
        }
        
        if ($request->getParam('node_speedlimit') != 0) {
            $content["node_speedlimit"] = $request->getParam('node_speedlimit');
        }
        
        if ($request->getParam('node_connector') != 0) {
            $content["node_connector"] = $request->getParam('node_connector');
        }

        if ($request->getParam('expire') != 0) {
            $content["expire"] = $request->getParam('expire');
        }

        if ($request->getParam('class') != 0) {
            $content["class"] = $request->getParam('class');
        }

        if ($request->getParam('class_expire') != 0) {
            $content["class_expire"] = $request->getParam('class_expire');
        }

        if ($request->getParam('user_group') != 0) {
            $content["user_group"] = $request->getParam('user_group');
        }

        if ($request->getParam('reset') != 0) {
            $content["reset"] = $request->getParam('reset');
        }

        if ($request->getParam('reset_value') != 0) {
            $content["reset_value"] = $request->getParam('reset_value');
        }

        if ($request->getParam('reset_exp') != 0) {
            $content["reset_exp"] = $request->getParam('reset_exp');
        }

        $shop->content = json_encode($content);
        
        if ($needCheck) {
            $boughts = Bought::where("shopid", $id)->get();
            
            foreach ($boughts as $bought) {
                $user=User::where("id", $bought->userid)->first();
                
                if ($user == null) {
                    $bought->delete();
                    continue;
                }
                
                if (!$shop->canBuy($user)) {
                    $bought->renew=0;
                    $bought->save();
                }
            }
        }

        if (!$shop->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "保存失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "保存成功";
        return $response->getBody()->write(json_encode($rs));
    }



    public function deleteGet($request, $response, $args)
    {
        $id = $request->getParam('id');
        $shop = Shop::find($id);
        $shop->status=0;
        if (!$shop->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "下架失败";
            return $response->getBody()->write(json_encode($rs));
        }

        $boughts = Bought::where("shopid", $id)->get();

        foreach ($boughts as $bought) {
            $bought->renew = 0;
            $bought->save();
        }

        $rs['ret'] = 1;
        $rs['msg'] = "下架成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function bought($request, $response, $args)
    {
        $table_config['total_column'] = array("op" => "操作", "id" => "ID", 
                        "datetime" => "购买日期","content" => "内容",
                        "price" => "价格", "user_id" => "用户ID",
                        "user_name" => "用户名", "renew" => "自动续费时间", 
                        "auto_reset_bandwidth" => "续费时是否重置流量");
        $table_config['default_show_column'] = array();
        foreach ($table_config['total_column'] as $column => $value) {
            array_push($table_config['default_show_column'], $column);
        }
        $table_config['ajax_url'] = 'bought/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/shop/bought.tpl');
    }

    public function deleteBoughtGet($request, $response, $args)
    {
        $id = $request->getParam('id');
        $shop = Bought::find($id);
        $shop->renew = 0;
        if (!$shop->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "退订失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "退订成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function ajax_shop($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select id as op,id,name,price,content,auto_renew,auto_reset_bandwidth,status from shop');

        $datatables->edit('op', function ($data) {
            return '<a class="btn btn-brand" href="/admin/shop/'.$data['id'].'/edit">编辑</a>
                    <a class="btn btn-brand-accent" '.($data['status'] == 0 ? "disabled" : 'id="row_delete_'.$data['id'].'" href="javascript:void(0);" onClick="delete_modal_show(\''.$data['id'].'\')"').'>下架</a>';
        });

        $datatables->edit('content', function ($data) {
            $shop = Shop::find($data['id']);
            return $shop->content();
        });

        $datatables->edit('auto_renew', function ($data) {
            if ($data['auto_renew'] == 0) {
                return "不自动续费";
            } else {
                return $data['auto_renew']." 天后续费";
            }
        });

        $datatables->edit('auto_reset_bandwidth', function ($data) {
            return $data['auto_reset_bandwidth'] == 0 ? '不自动重置' : '自动重置';
        });

        $datatables->edit('status', function ($data) {
            return $data['status'] == 1 ? '上架' : '下架';
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }

    public function ajax_bought($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select bought.id as op,bought.id as id,shop.id as content,bought.price,user.id as user_id,user.user_name,renew,shop.auto_reset_bandwidth,bought.datetime from bought,user,shop where bought.shopid = shop.id and bought.userid = user.id');

        $datatables->edit('op', function ($data) {
            return '<a class="btn btn-brand-accent" '.($data['renew'] == 0 ? "disabled" : ' id="row_delete_'.$data['id'].'" href="javascript:void(0);" onClick="delete_modal_show(\''.$data['id'].'\')"').'>中止</a>';
        });

        $datatables->edit('content', function ($data) {
            $shop = Shop::find($data['content']);
            return $shop->content();
        });

        $datatables->edit('renew', function ($data) {
            if ($data['renew'] == 0) {
                return "不自动续费";
            } else {
                return date('Y-m-d H:i:s', $data['renew'])." 续费";
            }
        });

        $datatables->edit('auto_reset_bandwidth', function ($data) {
            return $data['auto_reset_bandwidth'] == 0 ? '不自动重置' : '自动重置';
        });

        $datatables->edit('datetime', function ($data) {
            return date('Y-m-d H:i:s', $data['datetime']);
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }
}