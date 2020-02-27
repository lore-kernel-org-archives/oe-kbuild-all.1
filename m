Content-Type: multipart/mixed; boundary="===============7304457883532747451=="
MIME-Version: 1.0
From: 唐彬 <tangbin@cmss.chinamobile.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] i2c:i2c-core-of:remove redundant dev_err message
Date: Thu, 27 Feb 2020 22:42:56 +0800
Message-ID: <202002272242556279375@cmss.chinamobile.com>
In-Reply-To: <202002270841.TZb6or1C%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7304457883532747451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Teacher;
     I'm sorry for the email I just send, I realise my mistake and cancel i=
t. Thankyou .




 =

From: kbuild test robot
Date: 2020-02-27 09:02
To: tangbin
CC: kbuild-all
Subject: Re: [PATCH] i2c:i2c-core-of:remove redundant dev_err message
Hi tangbin,
 =

Thank you for the patch! Perhaps something to improve:
 =

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.6-rc3 next-20200226]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]
 =

url:    https://github.com/0day-ci/linux/commits/tangbin/i2c-i2c-core-of-re=
move-redundant-dev_err-message/20200226-222935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next
config: i386-allyesconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Di386 =

 =

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
 =

All warnings (new ones prefixed by >>):
 =

   drivers/i2c/i2c-core-of.c: In function 'of_i2c_register_devices':
>> drivers/i2c/i2c-core-of.c:106:11: warning: 'return' with a value, in fun=
ction returning void
       return PTR_ERR(client);
              ^~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-of.c:85:6: note: declared here
    void of_i2c_register_devices(struct i2c_adapter *adap)
         ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/i2c-core-of.c:106:11: warning: ignoring return value of 'PTR=
_ERR', declared with attribute warn_unused_result [-Wunused-result]
       return PTR_ERR(client);
              ^~~~~~~~~~~~~~~
 =

vim +/return +106 drivers/i2c/i2c-core-of.c
 =

    84 =

    85 void of_i2c_register_devices(struct i2c_adapter *adap)
    86 {
    87 struct device_node *bus, *node;
    88 struct i2c_client *client;
    89 =

    90 /* Only register child devices if the adapter has a node pointer set=
 */
    91 if (!adap->dev.of_node)
    92 return;
    93 =

    94 dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
    95 =

    96 bus =3D of_get_child_by_name(adap->dev.of_node, "i2c-bus");
    97 if (!bus)
    98 bus =3D of_node_get(adap->dev.of_node);
    99 =

   100 for_each_available_child_of_node(bus, node) {
   101 if (of_node_test_and_set_flag(node, OF_POPULATED))
   102 continue;
   103 =

   104 client =3D of_i2c_register_device(adap, node);
   105 if (IS_ERR(client)) {
> 106 return PTR_ERR(client);
   107 of_node_clear_flag(node, OF_POPULATED);
   108 }
   109 }
   110 =

   111 of_node_put(bus);
   112 }
   113 =

 =

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7304457883532747451==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjxzdHlsZT5ib2R5IHsgbGluZS1oZWlnaHQ6IDEuNTsgfWJs
b2NrcXVvdGUgeyBtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgbWFyZ2luLWxl
ZnQ6IDAuNWVtOyB9Ym9keSB7IGZvbnQtc2l6ZTogMTAuNXB0OyBmb250LWZhbWlseTogJ01pY3Jv
c29mdCBZYUhlaSBVSSc7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGxpbmUtaGVpZ2h0OiAxLjU7IH08
L3N0eWxlPjwvaGVhZD48Ym9keT4KPGRpdj48c3Bhbj48L3NwYW4+RGVhciBUZWFjaGVyOzwvZGl2
PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDtJJ20gc29ycnkgZm9yIHRoZSBlbWFpbCBJIGp1c3Qg
c2VuZCwgSSByZWFsaXNlIG15IG1pc3Rha2UgYW5kIGNhbmNlbCBpdC4gVGhhbmt5b3UgLjwvZGl2
Pgo8ZGl2Pjxicj48L2Rpdj48aHIgc3R5bGU9IndpZHRoOiAyMTBweDsgaGVpZ2h0OiAxcHg7IiBj
b2xvcj0iI2I1YzRkZiIgc2l6ZT0iMSIgYWxpZ249ImxlZnQiPgo8ZGl2PjxzcGFuPjxkaXYgc3R5
bGU9Ik1BUkdJTjogMTBweDsgRk9OVC1GQU1JTFk6IHZlcmRhbmE7IEZPTlQtU0laRTogMTBwdCI+
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6ICdNaWNyb3NvZnQgWWFIZWkgVUknOyBmb250LXNpemU6
IDE0cHg7IGNvbG9yOiByZ2IoMCwgMCwgMjU1KTsgbGluZS1oZWlnaHQ6IG5vcm1hbDsiPjxicj48
L2Rpdj48L2Rpdj48L3NwYW4+PC9kaXY+CjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW4tVG9wOiAw
cHg7IG1hcmdpbi1Cb3R0b206IDBweDsgbWFyZ2luLUxlZnQ6IDAuNWVtIj48ZGl2PiZuYnNwOzwv
ZGl2PjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1QzRERiAxLjBw
dDtwYWRkaW5nOjMuMHB0IDBjbSAwY20gMGNtIj48ZGl2IHN0eWxlPSJQQURESU5HLVJJR0hUOiA4
cHg7IFBBRERJTkctTEVGVDogOHB4OyBGT05ULVNJWkU6IDEycHg7Rk9OVC1GQU1JTFk6dGFob21h
O0NPTE9SOiMwMDAwMDA7IEJBQ0tHUk9VTkQ6ICNlZmVmZWY7IFBBRERJTkctQk9UVE9NOiA4cHg7
IFBBRERJTkctVE9QOiA4cHgiPjxkaXY+PGI+RnJvbTo8L2I+Jm5ic3A7PGEgaHJlZj0ibWFpbHRv
OmxrcEBpbnRlbC5jb20iPmtidWlsZCB0ZXN0IHJvYm90PC9hPjwvZGl2PjxkaXY+PGI+RGF0ZTo8
L2I+Jm5ic3A7MjAyMC0wMi0yNyZuYnNwOzA5OjAyPC9kaXY+PGRpdj48Yj5Ubzo8L2I+Jm5ic3A7
PGEgaHJlZj0ibWFpbHRvOnRhbmdiaW5AY21zcy5jaGluYW1vYmlsZS5jb20iPnRhbmdiaW48L2E+
PC9kaXY+PGRpdj48Yj5DQzo8L2I+Jm5ic3A7PGEgaHJlZj0ibWFpbHRvOmtidWlsZC1hbGxAbGlz
dHMuMDEub3JnIj5rYnVpbGQtYWxsPC9hPjwvZGl2PjxkaXY+PGI+U3ViamVjdDo8L2I+Jm5ic3A7
UmU6IFtQQVRDSF0gaTJjOmkyYy1jb3JlLW9mOnJlbW92ZSByZWR1bmRhbnQgZGV2X2VyciBtZXNz
YWdlPC9kaXY+PC9kaXY+PC9kaXY+PGRpdj48ZGl2PkhpIHRhbmdiaW4sPC9kaXY+CjxkaXY+Jm5i
c3A7PC9kaXY+CjxkaXY+VGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghIFBlcmhhcHMgc29tZXRoaW5n
IHRvIGltcHJvdmU6PC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+W2F1dG8gYnVpbGQgdGVz
dCBXQVJOSU5HIG9uIHdzYS9pMmMvZm9yLW5leHRdPC9kaXY+CjxkaXY+W2Fsc28gYnVpbGQgdGVz
dCBXQVJOSU5HIG9uIHY1LjYtcmMzIG5leHQtMjAyMDAyMjZdPC9kaXY+CjxkaXY+W2lmIHlvdXIg
cGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBkcm9wIHVzIGEg
bm90ZSB0byBoZWxwPC9kaXY+CjxkaXY+aW1wcm92ZSB0aGUgc3lzdGVtLiBCVFcsIHdlIGFsc28g
c3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgb3B0aW9uIHRvIHNwZWNpZnkgdGhlPC9kaXY+CjxkaXY+
YmFzZSB0cmVlIGluIGdpdCBmb3JtYXQtcGF0Y2gsIHBsZWFzZSBzZWUgaHR0cHM6Ly9zdGFja292
ZXJmbG93LmNvbS9hLzM3NDA2OTgyXTwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PnVybDom
bmJzcDsmbmJzcDsmbmJzcDsgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0
cy90YW5nYmluL2kyYy1pMmMtY29yZS1vZi1yZW1vdmUtcmVkdW5kYW50LWRldl9lcnItbWVzc2Fn
ZS8yMDIwMDIyNi0yMjI5MzU8L2Rpdj4KPGRpdj5iYXNlOiZuYnNwOyZuYnNwOyBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC93c2EvbGludXguZ2l0IGkyYy9m
b3ItbmV4dDwvZGl2Pgo8ZGl2PmNvbmZpZzogaTM4Ni1hbGx5ZXNjb25maWcgKGF0dGFjaGVkIGFz
IC5jb25maWcpPC9kaXY+CjxkaXY+Y29tcGlsZXI6IGdjYy03IChEZWJpYW4gNy41LjAtNSkgNy41
LjA8L2Rpdj4KPGRpdj5yZXByb2R1Y2U6PC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51
eCBidWlsZCB0cmVlPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IG1ha2UgQVJDSD1pMzg2IDwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2Pklm
IHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWc8L2Rpdj4KPGRpdj5S
ZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgJmx0O2xrcEBpbnRlbC5jb20mZ3Q7PC9kaXY+
CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+QWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBi
eSAmZ3Q7Jmd0Oyk6PC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7IGRy
aXZlcnMvaTJjL2kyYy1jb3JlLW9mLmM6IEluIGZ1bmN0aW9uICdvZl9pMmNfcmVnaXN0ZXJfZGV2
aWNlcyc6PC9kaXY+CjxkaXY+Jmd0OyZndDsgZHJpdmVycy9pMmMvaTJjLWNvcmUtb2YuYzoxMDY6
MTE6IHdhcm5pbmc6ICdyZXR1cm4nIHdpdGggYSB2YWx1ZSwgaW4gZnVuY3Rpb24gcmV0dXJuaW5n
IHZvaWQ8L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0
dXJuIFBUUl9FUlIoY2xpZW50KTs8L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgXn5+
fn5+fn5+fn5+fn5+PC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7IGRyaXZlcnMvaTJjL2kyYy1jb3Jl
LW9mLmM6ODU6Njogbm90ZTogZGVjbGFyZWQgaGVyZTwvZGl2Pgo8ZGl2PiZuYnNwOyZuYnNwOyZu
YnNwOyB2b2lkIG9mX2kyY19yZWdpc3Rlcl9kZXZpY2VzKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRh
cCk8L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn48L2Rpdj4KPGRpdj4mZ3Q7Jmd0OyBkcml2ZXJz
L2kyYy9pMmMtY29yZS1vZi5jOjEwNjoxMTogd2FybmluZzogaWdub3JpbmcgcmV0dXJuIHZhbHVl
IG9mICdQVFJfRVJSJywgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgd2Fybl91bnVzZWRfcmVzdWx0
IFstV3VudXNlZC1yZXN1bHRdPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IHJldHVybiBQVFJfRVJSKGNsaWVudCk7PC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IF5+fn5+fn5+fn5+fn5+fjwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PnZp
bSArL3JldHVybiArMTA2IGRyaXZlcnMvaTJjL2kyYy1jb3JlLW9mLmM8L2Rpdj4KPGRpdj4mbmJz
cDs8L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgODQJPC9kaXY+CjxkaXY+Jm5ic3A7Jm5i
c3A7Jm5ic3A7IDg1CXZvaWQgb2ZfaTJjX3JlZ2lzdGVyX2RldmljZXMoc3RydWN0IGkyY19hZGFw
dGVyICphZGFwKTwvZGl2Pgo8ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyA4Ngl7PC9kaXY+CjxkaXY+
Jm5ic3A7Jm5ic3A7Jm5ic3A7IDg3CQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmJ1cywgKm5vZGU7PC9k
aXY+CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IDg4CQlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
OzwvZGl2Pgo8ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyA4OQk8L2Rpdj4KPGRpdj4mbmJzcDsmbmJz
cDsmbmJzcDsgOTAJCS8qIE9ubHkgcmVnaXN0ZXIgY2hpbGQgZGV2aWNlcyBpZiB0aGUgYWRhcHRl
ciBoYXMgYSBub2RlIHBvaW50ZXIgc2V0ICovPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7
IDkxCQlpZiAoIWFkYXAtJmd0O2Rldi5vZl9ub2RlKTwvZGl2Pgo8ZGl2PiZuYnNwOyZuYnNwOyZu
YnNwOyA5MgkJCXJldHVybjs8L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgOTMJPC9kaXY+
CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IDk0CQlkZXZfZGJnKCZhbXA7YWRhcC0mZ3Q7ZGV2LCAi
b2ZfaTJjOiB3YWxraW5nIGNoaWxkIG5vZGVzXG4iKTs8L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsm
bmJzcDsgOTUJPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IDk2CQlidXMgPSBvZl9nZXRf
Y2hpbGRfYnlfbmFtZShhZGFwLSZndDtkZXYub2Zfbm9kZSwgImkyYy1idXMiKTs8L2Rpdj4KPGRp
dj4mbmJzcDsmbmJzcDsmbmJzcDsgOTcJCWlmICghYnVzKTwvZGl2Pgo8ZGl2PiZuYnNwOyZuYnNw
OyZuYnNwOyA5OAkJCWJ1cyA9IG9mX25vZGVfZ2V0KGFkYXAtJmd0O2Rldi5vZl9ub2RlKTs8L2Rp
dj4KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgOTkJPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7IDEw
MAkJZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGUoYnVzLCBub2RlKSB7PC9kaXY+Cjxk
aXY+Jm5ic3A7Jm5ic3A7IDEwMQkJCWlmIChvZl9ub2RlX3Rlc3RfYW5kX3NldF9mbGFnKG5vZGUs
IE9GX1BPUFVMQVRFRCkpPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7IDEwMgkJCQljb250aW51ZTs8
L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsgMTAzCTwvZGl2Pgo8ZGl2PiZuYnNwOyZuYnNwOyAxMDQJ
CQljbGllbnQgPSBvZl9pMmNfcmVnaXN0ZXJfZGV2aWNlKGFkYXAsIG5vZGUpOzwvZGl2Pgo8ZGl2
PiZuYnNwOyZuYnNwOyAxMDUJCQlpZiAoSVNfRVJSKGNsaWVudCkpIHs8L2Rpdj4KPGRpdj4gJmd0
OyAxMDYJCQkJcmV0dXJuIFBUUl9FUlIoY2xpZW50KTs8L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsg
MTA3CQkJCW9mX25vZGVfY2xlYXJfZmxhZyhub2RlLCBPRl9QT1BVTEFURUQpOzwvZGl2Pgo8ZGl2
PiZuYnNwOyZuYnNwOyAxMDgJCQl9PC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7IDEwOQkJfTwvZGl2
Pgo8ZGl2PiZuYnNwOyZuYnNwOyAxMTAJPC9kaXY+CjxkaXY+Jm5ic3A7Jm5ic3A7IDExMQkJb2Zf
bm9kZV9wdXQoYnVzKTs8L2Rpdj4KPGRpdj4mbmJzcDsmbmJzcDsgMTEyCX08L2Rpdj4KPGRpdj4m
bmJzcDsmbmJzcDsgMTEzCTwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2Pi0tLTwvZGl2Pgo8
ZGl2PjAtREFZIENJIEtlcm5lbCBUZXN0IFNlcnZpY2UsIEludGVsIENvcnBvcmF0aW9uPC9kaXY+
CjxkaXY+aHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L2tidWlsZC1hbGxAbGlz
dHMuMDEub3JnPC9kaXY+CjwvZGl2PjwvYmxvY2txdW90ZT4KPC9ib2R5PjwvaHRtbD4=
--===============7304457883532747451==--

