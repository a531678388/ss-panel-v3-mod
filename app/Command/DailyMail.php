<?php


namespace App\Command;

use App\Models\User;
use App\Models\Ann;
use App\Services\Config;
use App\Services\Mail;
use App\Utils\Telegram;
use App\Utils\Tools;
use App\Services\Analytics;

class DailyMail
{
    public static function sendDailyMail()
    {
        $sts = new Analytics();
        $todayCheckinUser = $sts->getTodayCheckinUser();
        $users = User::all();
        $logs = Ann::orderBy('id', 'desc')->get();
        $ann="";
        
        foreach ($logs as $log) {
            if (strpos($log->content, "Links") === false) {
                $ann.=$log->content."<br><br>";
            }
        }
        $lastday_total = 0;
        
        foreach ($users as $user) {
            $lastday_total += (($user->u+$user->d)-$user->last_day_t);
            
            if ($user->sendDailyMail==1) {
                echo "Send daily mail to user: ".$user->id;
                $subject = Config::get('appName')." - 流量报告以及公告";
                $to = $user->email;
                $text = "公告:<br><br>".$ann."<br><br>晚安！";
                
                
                try {
                    Mail::send($to, $subject, 'news/daily-traffic-report.tpl', [
                        "user" => $user,"text" => $text
                    ], [
                    ], true);
                } catch (Exception $e) {
                    echo $e->getMessage();
                }
            }
        }
        
        Telegram::Send("各位老爷少奶奶，为大家报告一下系统今天的运行状况~".
        PHP_EOL.
        "今日签到人数:".$todayCheckinUser.PHP_EOL.
        "今日使用总流量:".Tools::flowAutoShow($lastday_total).PHP_EOL.
        "晚安~"
        );
    }


    public static function reall()
    {
        $users = User::all();
        foreach ($users as $user) {
            $user->last_day_t=($user->u+$user->d);
            $user->save();
        }
    }
}
