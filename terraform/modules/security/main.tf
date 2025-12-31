resource "aws_security_group" "jenkins_sg" {
  name   = "jenkins-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sonarqube_sg" {
  name   = "sonarqube-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    security_groups = [aws_security_group.jenkins_sg.id]
  }
}

resource "aws_security_group" "nexus_sg" {
  name   = "nexus-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    security_groups = [aws_security_group.jenkins_sg.id]
  }
}

resource "aws_security_group" "docker_sg" {
  name   = "docker-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 2375
    to_port     = 2375
    protocol    = "tcp"
    security_groups = [aws_security_group.jenkins_sg.id]
  }
}
