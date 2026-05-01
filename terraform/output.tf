output "public_ip" {
  value       = aws_instance.sna_server.public_ip
  description = "Public IP of the Flask server"
}