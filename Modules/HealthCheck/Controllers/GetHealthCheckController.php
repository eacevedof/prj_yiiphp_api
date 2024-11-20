<?php

declare(strict_types=1);

namespace app\modules\healthCheck\controllers;

use yii\web\Controller;
use yii\web\Response;

final class GetHealthCheckController extends Controller
{
    public function actionIndex(): Response
    {
        \Yii::$app->response->format = Response::FORMAT_JSON;
        return $this->asJson(["status" => "ok"]);
    }
}