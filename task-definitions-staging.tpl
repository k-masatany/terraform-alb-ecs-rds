[{
    "name": "${container_name}",
    "image": "${repository_url}:production",
    "cpu": ${cpu},
    "memoryReservation": ${memoryReservation},
    "essential": true,
    "environment": [{
        "name": "ENV",
        "value": "production"
    }],
    "portMappings": [{
        "containerPort": 80,
        "hostPort": 0
    }],
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
            "awslogs-group": "${log_group}",
            "awslogs-region": "ap-northeast-1"
        }
    }
}]
