[{
    "name": "${container_name}",
    "image": "${repository_url}:staging",
    "cpu": ${cpu},
    "memoryReservation": ${memoryReservation},
    "essential": true,
    "environment": [{
        "name": "ENV",
        "value": "staging"
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
