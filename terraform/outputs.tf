output "jenkins_ip" {
  value = module.jenkins.public_ip
}

output "sonarqube_ip" {
  value = module.sonarqube.public_ip
}

output "nexus_ip" {
  value = module.nexus.public_ip
}

output "docker_ip" {
  value = module.docker.public_ip
}
