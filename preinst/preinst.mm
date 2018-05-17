int main(int argc, const char **argv)
{
  //Tell Cydia to respring after installation
  int cydiaFd = (int)strtoul(getenv("CYDIA"), NULL, 10);
  write(cydiaFd, "finish:reboot", 13);

  return 0;
}
