function FindProxyForURL(url, host)
{
  if (url.match(/.*\.rco\.local(:[0-9]+)?/)) {
    return "SOCKS localhost:30000";
  } else {
    return "DIRECT";
  }
}
