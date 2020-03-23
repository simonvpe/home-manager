function FindProxyForURL(url, host)
{
  if (shExpMatch(url, "*.getingegroup.local/*")) {
    return "SOCKS localhost:30000";
  } else {
    return "DIRECT";
  }
}
