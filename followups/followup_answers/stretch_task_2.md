2. If you identified a different approach to hosting apps containers, investigate more and explain your discovered new approach including, what are the pros and cons of adopting it, if our start point is where the course examples left off?


## AWS App Runner (Fully managed container hosting)

**How it works:**
Connects directly to your ECR or GitHub repository, and automatically pulls and deploys your container it. App Runner handles HTTPS, load balancing, and scaling automatically.

**Pros:**
- Easy and simple setup.
- Auto-scaling and HTTPS are built in.
- No need to manage EC2 instances or ECS clusters.

**Cons:**
- Less control over networking, VPC, or cluster setup.
- Slightly more expensive than running containers on your own EC2/Fargate cluster if your workload is steady.
- Limited fine-grained infrastructure customisation.


## AWS Fargate (Serverless ECS)

**How it works:**
Fargate runs your containers as ECS tasks without needing to manage servers. You define a task definition with the container image, CPU/memory, and networking info, then ECS + Fargate takes care of scheduling and running the container.

**Pros:**
- More control than App Runner as you can customise VPC, IAM roles, and task definitions.
- It is serverless so there are no EC2 instances to manage.
- Works well if you have multiple services or microservices.

**Cons:**
- Setup is more complex.
- Requires understanding of ECS tasks, services, and networking.
- Cost may be higher if tasks are running continuously.

## AWS Elastic Beanstalk 

**How it works:**
Elastic Beanstalk is AWS's Platform-as-a-Service (Paas) which means that it provides a complete platform for developing, running, and managing applications without you needing to manage the underlying infrastructure. You just have to provide your application code or Docker container and then Elastic Beanstalk automatically handles:
- Provisioning resources (EC2 instances, load balancers)
- Auto-scaling and load balancing
- Health monitoring and metrics
- Rolling updates and platform updates

**Pros:**
- Easy and simple way to deploy apps with minimal AWS knowledge.
- Managed auto-scaling and load balancing.
- Easy deployment of Dockerized apps.
- Works with CloudWatch for logging and health metrics.
- Quick Setup using platform templates making it fast to get started.

**Cons:**
- Less control due to limited direct access to EC2 instances.
- Can be clunky for complex multi-service or microservices architectures.
- Not ideal for multi-container Docker setups.
- Advanced custom infrastructure setups may be more difficult compared to ECS or Fargate.