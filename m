Content-Type: multipart/mixed; boundary="===============5369518518399441940=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [pavel-linux-leds:for-next 24/30] drivers/leds/leds-lm36274.c:77:6: error: implicit declaration of function 'device_get_child_node_count'
Date: Sun, 30 May 2021 03:03:27 +0300
Message-ID: <CAHp75Vdo+1ovn_bZtP9pBm5oxoXVfFbh=t1oGFLMgZ7aJaP8eA@mail.gmail.com>
In-Reply-To: <202105292204.dVIuHCEm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5369518518399441940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Saturday, May 29, 2021, kernel test robot <lkp@intel.com> wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
> for-next
> head:   e1012160bbbca92d67c729f68108734b7d679db9
> commit: e2e8e4e8187509a77cb6328d876d9c09c07c2e82 [24/30] leds: lm36274:
> Correct headers (of*.h -> mod_devicetable.h)
> config: m68k-randconfig-r032-20210529 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/
> sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/pavel/
> linux-leds.git/commit/?id=3De2e8e4e8187509a77cb6328d876d9c09c07c2e82
>         git remote add pavel-linux-leds git://git.kernel.org/pub/scm/
> linux/kernel/git/pavel/linux-leds.git
>         git fetch --no-tags pavel-linux-leds for-next
>         git checkout e2e8e4e8187509a77cb6328d876d9c09c07c2e82
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross
> ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All error/warnings (new ones prefixed by >>):



I understand that it seems due to missed property.h. What I don=E2=80=99t
understand right now is why I missed it during my test compilation... Okay,
I will check it later on and send a fix.



>
>    drivers/leds/leds-lm36274.c: In function 'lm36274_parse_dt':
> >> drivers/leds/leds-lm36274.c:77:6: error: implicit declaration of
> function 'device_get_child_node_count' [-Werror=3Dimplicit-function-
> declaration]
>       77 |  if (device_get_child_node_count(dev) !=3D 1)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/leds/leds-lm36274.c:80:10: error: implicit declaration of
> function 'device_get_next_child_node' [-Werror=3Dimplicit-function-
> declaration]
>       80 |  child =3D device_get_next_child_node(dev, NULL);
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/leds/leds-lm36274.c:80:8: warning: assignment to 'struct
> fwnode_handle *' from 'int' makes pointer from integer without a cast
> [-Wint-conversion]
>       80 |  child =3D device_get_next_child_node(dev, NULL);
>          |        ^
> >> drivers/leds/leds-lm36274.c:87:19: error: implicit declaration of
> function 'fwnode_property_count_u32' [-Werror=3Dimplicit-function-
> declaration]
>       87 |  chip->num_leds =3D fwnode_property_count_u32(child,
> "led-sources");
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/leds/leds-lm36274.c:93:8: error: implicit declaration of
> function 'fwnode_property_read_u32_array' [-Werror=3Dimplicit-function-
> declaration]
>       93 |  ret =3D fwnode_property_read_u32_array(child, "led-sources",
>          |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/leds/leds-lm36274.c:102:2: error: implicit declaration of
> function 'fwnode_handle_put' [-Werror=3Dimplicit-function-declaration]
>      102 |  fwnode_handle_put(child);
>          |  ^~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>
>
> vim +/device_get_child_node_count +77 drivers/leds/leds-lm36274.c
>
> 11e1bbc116a75d Dan Murphy  2019-06-05   68
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   69  static int
> lm36274_parse_dt(struct lm36274 *chip,
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   70                          =
struct
> led_init_data *init_data)
> 11e1bbc116a75d Dan Murphy  2019-06-05   71  {
> 5c0d20a968ae87 Marek Beh=C3=BAn 2020-09-19   72      struct device *dev =
=3D
> chip->dev;
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   73      struct fwnode_handle
> *child;
> a448fcf19c9c5d Marek Beh=C3=BAn 2020-09-19   74      int ret;
> 11e1bbc116a75d Dan Murphy  2019-06-05   75
> 11e1bbc116a75d Dan Murphy  2019-06-05   76      /* There should only be 1
> node */
> a448fcf19c9c5d Marek Beh=C3=BAn 2020-09-19  @77      if
> (device_get_child_node_count(dev) !=3D 1)
> 11e1bbc116a75d Dan Murphy  2019-06-05   78              return -EINVAL;
> 11e1bbc116a75d Dan Murphy  2019-06-05   79
> a448fcf19c9c5d Marek Beh=C3=BAn 2020-09-19  @80      child =3D
> device_get_next_child_node(dev, NULL);
> a448fcf19c9c5d Marek Beh=C3=BAn 2020-09-19   81
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   82      init_data->fwnode =
=3D child;
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   83      init_data->devicenam=
e =3D
> chip->pdev->name;
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   84      /* for backwards
> compatibility when `label` property is not present */
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   85      init_data->default_l=
abel =3D
> ":";
> 11e1bbc116a75d Dan Murphy  2019-06-05   86
> d3ab963cf98015 Marek Beh=C3=BAn 2020-09-19  @87      chip->num_leds =3D
> fwnode_property_count_u32(child, "led-sources");
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   88      if (chip->num_leds <=
=3D 0) {
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   89              ret =3D -ENO=
DEV;
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   90              goto err;
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   91      }
> 11e1bbc116a75d Dan Murphy  2019-06-05   92
> 11e1bbc116a75d Dan Murphy  2019-06-05  @93      ret =3D
> fwnode_property_read_u32_array(child, "led-sources",
> a448fcf19c9c5d Marek Beh=C3=BAn 2020-09-19   94
>            chip->led_sources, chip->num_leds);
> 11e1bbc116a75d Dan Murphy  2019-06-05   95      if (ret) {
> 11e1bbc116a75d Dan Murphy  2019-06-05   96              dev_err(dev,
> "led-sources property missing\n");
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19   97              goto err;
> 11e1bbc116a75d Dan Murphy  2019-06-05   98      }
> 11e1bbc116a75d Dan Murphy  2019-06-05   99
> 11e1bbc116a75d Dan Murphy  2019-06-05  100      return 0;
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19  101  err:
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19 @102      fwnode_handle_put(ch=
ild);
> 1aeef38c6a4a87 Marek Beh=C3=BAn 2020-09-19  103      return ret;
> 11e1bbc116a75d Dan Murphy  2019-06-05  104  }
> 11e1bbc116a75d Dan Murphy  2019-06-05  105
>
> :::::: The code at line 77 was first introduced by commit
> :::::: a448fcf19c9c5d3ddd9066accbd8d28c4950bb9f leds: lm36274: don't
> iterate through children since there is only one
>
> :::::: TO: Marek Beh=C3=BAn <marek.behun@nic.cz>
> :::::: CC: Pavel Machek <pavel@ucw.cz>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>


-- =

With Best Regards,
Andy Shevchenko

--===============5369518518399441940==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGJyPjxicj5PbiBTYXR1cmRheSwgTWF5IDI5LCAyMDIxLCBrZXJuZWwgdGVzdCByb2JvdCAmbHQ7
PGEgaHJlZj0ibWFpbHRvOmxrcEBpbnRlbC5jb20iPmxrcEBpbnRlbC5jb208L2E+Jmd0OyB3cm90
ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAw
IC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+dHJlZTrC
oCDCoGdpdDovLzxhIGhyZWY9Imh0dHA6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvcGF2ZWwvbGludXgtbGVkcy5naXQiIHRhcmdldD0iX2JsYW5rIj5naXQua2VybmVs
Lm9yZy9wdWIvc2NtLzx3YnI+bGludXgva2VybmVsL2dpdC9wYXZlbC9saW51eC08d2JyPmxlZHMu
Z2l0PC9hPiBmb3ItbmV4dDxicj4KaGVhZDrCoCDCoGUxMDEyMTYwYmJiY2E5MmQ2N2M3MjlmNjgx
MDg3Mzx3YnI+NGI3ZDY3OWRiOTxicj4KY29tbWl0OiBlMmU4ZTRlODE4NzUwOWE3N2NiNjMyOGQ4
NzZkOWM8d2JyPjA5YzA3YzJlODIgWzI0LzMwXSBsZWRzOiBsbTM2Mjc0OiBDb3JyZWN0IGhlYWRl
cnMgKG9mKi5oIC0mZ3Q7IG1vZF9kZXZpY2V0YWJsZS5oKTxicj4KY29uZmlnOiBtNjhrLXJhbmRj
b25maWctcjAzMi0yMDIxMDUyOSAoYXR0YWNoZWQgYXMgLmNvbmZpZyk8YnI+CmNvbXBpbGVyOiBt
NjhrLWxpbnV4LWdjYyAoR0NDKSA5LjMuMDxicj4KcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1
aWxkKTo8YnI+CsKgIMKgIMKgIMKgIHdnZXQgPGEgaHJlZj0iaHR0cHM6Ly9yYXcuZ2l0aHVidXNl
cmNvbnRlbnQuY29tL2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNyb3NzIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuPHdicj5jb20vaW50ZWwv
bGtwLXRlc3RzL21hc3Rlci88d2JyPnNiaW4vbWFrZS5jcm9zczwvYT4gLU8gfi9iaW4vbWFrZS5j
cm9zczxicj4KwqAgwqAgwqAgwqAgY2htb2QgK3ggfi9iaW4vbWFrZS5jcm9zczxicj4KwqAgwqAg
wqAgwqAgIyA8YSBocmVmPSJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9wYXZlbC9saW51eC1sZWRzLmdpdC9jb21taXQvP2lkPWUyZThlNGU4MTg3NTA5YTc3
Y2I2MzI4ZDg3NmQ5YzA5YzA3YzJlODIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi88d2JyPnNjbS9saW51eC9rZXJuZWwvZ2l0L3BhdmVsLzx3YnI+bGludXgtbGVk
cy5naXQvY29tbWl0Lz9pZD08d2JyPmUyZThlNGU4MTg3NTA5YTc3Y2I2MzI4ZDg3NmQ5Yzx3YnI+
MDljMDdjMmU4MjwvYT48YnI+CsKgIMKgIMKgIMKgIGdpdCByZW1vdGUgYWRkIHBhdmVsLWxpbnV4
LWxlZHMgZ2l0Oi8vPGEgaHJlZj0iaHR0cDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9wYXZlbC9saW51eC1sZWRzLmdpdCIgdGFyZ2V0PSJfYmxhbmsiPmdpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vPHdicj5saW51eC9rZXJuZWwvZ2l0L3BhdmVsL2xpbnV4LTx3YnI+bGVk
cy5naXQ8L2E+PGJyPgrCoCDCoCDCoCDCoCBnaXQgZmV0Y2ggLS1uby10YWdzIHBhdmVsLWxpbnV4
LWxlZHMgZm9yLW5leHQ8YnI+CsKgIMKgIMKgIMKgIGdpdCBjaGVja291dCBlMmU4ZTRlODE4NzUw
OWE3N2NiNjMyOGQ4NzZkOWM8d2JyPjA5YzA3YzJlODI8YnI+CsKgIMKgIMKgIMKgICMgc2F2ZSB0
aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51eCBidWlsZCB0cmVlPGJyPgrCoCDCoCDCoCDCoCBD
T01QSUxFUl9JTlNUQUxMX1BBVEg9JEhPTUUvPHdicj4wZGF5IENPTVBJTEVSPWdjYy05LjMuMCBt
YWtlLmNyb3NzIEFSQ0g9bTY4ayA8YnI+Cjxicj4KSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRs
eSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZTxicj4KUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSI+bGtwQGludGVs
LmNvbTwvYT4mZ3Q7PGJyPgo8YnI+CkFsbCBlcnJvci93YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4
ZWQgYnkgJmd0OyZndDspOjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PkkgdW5kZXJzdGFuZCB0aGF0IGl0IHNlZW1zIGR1ZSB0byBtaXNzZWQgcHJvcGVydHku
aC4gV2hhdCBJIGRvbuKAmXQgdW5kZXJzdGFuZCByaWdodCBub3cgaXMgd2h5IEkgbWlzc2VkIGl0
IGR1cmluZyBteSB0ZXN0IGNvbXBpbGF0aW9uLi4uIE9rYXksIEkgd2lsbCBjaGVjayBpdCBsYXRl
ciBvbiBhbmQgc2VuZCBhIGZpeC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PsKgPC9kaXY+PGJs
b2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9y
ZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+Cjxicj4KwqAgwqBkcml2
ZXJzL2xlZHMvbGVkcy1sbTM2Mjc0LmM6IEluIGZ1bmN0aW9uICYjMzk7bG0zNjI3NF9wYXJzZV9k
dCYjMzk7Ojxicj4KJmd0OyZndDsgZHJpdmVycy9sZWRzL2xlZHMtbG0zNjI3NC5jOjx3YnI+Nzc6
NjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICYjMzk7ZGV2aWNlX2dl
dF9jaGlsZF9ub2RlX2NvdW50JiMzOTsgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tPHdicj5k
ZWNsYXJhdGlvbl08YnI+CsKgIMKgIMKgIDc3IHzCoCBpZiAoZGV2aWNlX2dldF9jaGlsZF9ub2Rl
X2NvdW50KDx3YnI+ZGV2KSAhPSAxKTxicj4KwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+PGJyPgomZ3Q7Jmd0OyBkcml2ZXJzL2xlZHMvbGVkcy1sbTM2
Mjc0LmM6PHdicj44MDoxMDogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9u
ICYjMzk7ZGV2aWNlX2dldF9uZXh0X2NoaWxkX25vZGUmIzM5OyBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi08d2JyPmRlY2xhcmF0aW9uXTxicj4KwqAgwqAgwqAgODAgfMKgIGNoaWxkID0gZGV2
aWNlX2dldF9uZXh0X2NoaWxkX25vZGUoPHdicj5kZXYsIE5VTEwpOzxicj4KwqAgwqAgwqAgwqAg
wqB8wqAgwqAgwqAgwqAgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn48YnI+CiZndDsmZ3Q7
IGRyaXZlcnMvbGVkcy9sZWRzLWxtMzYyNzQuYzo8d2JyPjgwOjg6IHdhcm5pbmc6IGFzc2lnbm1l
bnQgdG8gJiMzOTtzdHJ1Y3QgZndub2RlX2hhbmRsZSAqJiMzOTsgZnJvbSAmIzM5O2ludCYjMzk7
IG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2ludC1jb252ZXJz
aW9uXTxicj4KwqAgwqAgwqAgODAgfMKgIGNoaWxkID0gZGV2aWNlX2dldF9uZXh0X2NoaWxkX25v
ZGUoPHdicj5kZXYsIE5VTEwpOzxicj4KwqAgwqAgwqAgwqAgwqB8wqAgwqAgwqAgwqAgXjxicj4K
Jmd0OyZndDsgZHJpdmVycy9sZWRzL2xlZHMtbG0zNjI3NC5jOjx3YnI+ODc6MTk6IGVycm9yOiBp
bXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAmIzM5O2Z3bm9kZV9wcm9wZXJ0eV9jb3Vu
dF91MzImIzM5OyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi08d2JyPmRlY2xhcmF0aW9uXTxi
cj4KwqAgwqAgwqAgODcgfMKgIGNoaXAtJmd0O251bV9sZWRzID0gZndub2RlX3Byb3BlcnR5X2Nv
dW50X3UzMig8d2JyPmNoaWxkLCAmcXVvdDtsZWQtc291cmNlcyZxdW90Oyk7PGJyPgrCoCDCoCDC
oCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn48YnI+CiZndDsmZ3Q7IGRyaXZlcnMvbGVkcy9sZWRzLWxtMzYyNzQuYzo8d2JyPjkzOjg6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAmIzM5O2Z3bm9kZV9wcm9w
ZXJ0eV9yZWFkX3UzMl88d2JyPmFycmF5JiMzOTsgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24t
PHdicj5kZWNsYXJhdGlvbl08YnI+CsKgIMKgIMKgIDkzIHzCoCByZXQgPSBmd25vZGVfcHJvcGVy
dHlfcmVhZF91MzJfPHdicj5hcnJheShjaGlsZCwgJnF1b3Q7bGVkLXNvdXJjZXMmcXVvdDssPGJy
PgrCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn48YnI+CiZndDsmZ3Q7IGRyaXZlcnMvbGVkcy9sZWRzLWxtMzYyNzQuYzo8d2JyPjEwMjoyOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJiMzOTtmd25vZGVfaGFuZGxl
X3B1dCYjMzk7IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLTx3YnI+ZGVjbGFyYXRpb25dPGJy
PgrCoCDCoCDCoDEwMiB8wqAgZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOzxicj4KwqAgwqAgwqAg
wqAgwqB8wqAgXn5+fn5+fn5+fn5+fn5+fn48YnI+CsKgIMKgY2MxOiBzb21lIHdhcm5pbmdzIGJl
aW5nIHRyZWF0ZWQgYXMgZXJyb3JzPGJyPgo8YnI+Cjxicj4KdmltICsvZGV2aWNlX2dldF9jaGls
ZF9ub2RlX2NvdW50ICs3NyBkcml2ZXJzL2xlZHMvbGVkcy1sbTM2Mjc0LmM8YnI+Cjxicj4KMTFl
MWJiYzExNmE3NWQgRGFuIE11cnBoecKgIDIwMTktMDYtMDXCoCDCoDY4wqAgPGJyPgoxYWVlZjM4
YzZhNGE4NyBNYXJlayBCZWjDum4gMjAyMC0wOS0xOcKgIMKgNjnCoCBzdGF0aWMgaW50IGxtMzYy
NzRfcGFyc2VfZHQoc3RydWN0IGxtMzYyNzQgKmNoaXAsPGJyPgoxYWVlZjM4YzZhNGE4NyBNYXJl
ayBCZWjDum4gMjAyMC0wOS0xOcKgIMKgNzDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBzdHJ1Y3QgbGVkX2luaXRfZGF0YSAqaW5pdF9kYXRhKTxicj4KMTFlMWJiYzExNmE3
NWQgRGFuIE11cnBoecKgIDIwMTktMDYtMDXCoCDCoDcxwqAgezxicj4KNWMwZDIwYTk2OGFlODcg
TWFyZWsgQmVow7puIDIwMjAtMDktMTnCoCDCoDcywqAgwqAgwqAgc3RydWN0IGRldmljZSAqZGV2
ID0gY2hpcC0mZ3Q7ZGV2Ozxicj4KMWFlZWYzOGM2YTRhODcgTWFyZWsgQmVow7puIDIwMjAtMDkt
MTnCoCDCoDczwqAgwqAgwqAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmNoaWxkOzxicj4KYTQ0OGZj
ZjE5YzljNWQgTWFyZWsgQmVow7puIDIwMjAtMDktMTnCoCDCoDc0wqAgwqAgwqAgaW50IHJldDs8
YnI+CjExZTFiYmMxMTZhNzVkIERhbiBNdXJwaHnCoCAyMDE5LTA2LTA1wqAgwqA3NcKgIDxicj4K
MTFlMWJiYzExNmE3NWQgRGFuIE11cnBoecKgIDIwMTktMDYtMDXCoCDCoDc2wqAgwqAgwqAgLyog
VGhlcmUgc2hvdWxkIG9ubHkgYmUgMSBub2RlICovPGJyPgphNDQ4ZmNmMTljOWM1ZCBNYXJlayBC
ZWjDum4gMjAyMC0wOS0xOcKgIEA3N8KgIMKgIMKgIGlmIChkZXZpY2VfZ2V0X2NoaWxkX25vZGVf
Y291bnQoPHdicj5kZXYpICE9IDEpPGJyPgoxMWUxYmJjMTE2YTc1ZCBEYW4gTXVycGh5wqAgMjAx
OS0wNi0wNcKgIMKgNzjCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDs8YnI+CjEx
ZTFiYmMxMTZhNzVkIERhbiBNdXJwaHnCoCAyMDE5LTA2LTA1wqAgwqA3OcKgIDxicj4KYTQ0OGZj
ZjE5YzljNWQgTWFyZWsgQmVow7puIDIwMjAtMDktMTnCoCBAODDCoCDCoCDCoCBjaGlsZCA9IGRl
dmljZV9nZXRfbmV4dF9jaGlsZF9ub2RlKDx3YnI+ZGV2LCBOVUxMKTs8YnI+CmE0NDhmY2YxOWM5
YzVkIE1hcmVrIEJlaMO6biAyMDIwLTA5LTE5wqAgwqA4McKgIDxicj4KMWFlZWYzOGM2YTRhODcg
TWFyZWsgQmVow7puIDIwMjAtMDktMTnCoCDCoDgywqAgwqAgwqAgaW5pdF9kYXRhLSZndDtmd25v
ZGUgPSBjaGlsZDs8YnI+CjFhZWVmMzhjNmE0YTg3IE1hcmVrIEJlaMO6biAyMDIwLTA5LTE5wqAg
wqA4M8KgIMKgIMKgIGluaXRfZGF0YS0mZ3Q7ZGV2aWNlbmFtZSA9IGNoaXAtJmd0O3BkZXYtJmd0
O25hbWU7PGJyPgoxYWVlZjM4YzZhNGE4NyBNYXJlayBCZWjDum4gMjAyMC0wOS0xOcKgIMKgODTC
oCDCoCDCoCAvKiBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2hlbiBgbGFiZWxgIHByb3Bl
cnR5IGlzIG5vdCBwcmVzZW50ICovPGJyPgoxYWVlZjM4YzZhNGE4NyBNYXJlayBCZWjDum4gMjAy
MC0wOS0xOcKgIMKgODXCoCDCoCDCoCBpbml0X2RhdGEtJmd0O2RlZmF1bHRfbGFiZWwgPSAmcXVv
dDs6JnF1b3Q7Ozxicj4KMTFlMWJiYzExNmE3NWQgRGFuIE11cnBoecKgIDIwMTktMDYtMDXCoCDC
oDg2wqAgPGJyPgpkM2FiOTYzY2Y5ODAxNSBNYXJlayBCZWjDum4gMjAyMC0wOS0xOcKgIEA4N8Kg
IMKgIMKgIGNoaXAtJmd0O251bV9sZWRzID0gZndub2RlX3Byb3BlcnR5X2NvdW50X3UzMig8d2Jy
PmNoaWxkLCAmcXVvdDtsZWQtc291cmNlcyZxdW90Oyk7PGJyPgoxYWVlZjM4YzZhNGE4NyBNYXJl
ayBCZWjDum4gMjAyMC0wOS0xOcKgIMKgODjCoCDCoCDCoCBpZiAoY2hpcC0mZ3Q7bnVtX2xlZHMg
Jmx0Oz0gMCkgezxicj4KMWFlZWYzOGM2YTRhODcgTWFyZWsgQmVow7puIDIwMjAtMDktMTnCoCDC
oDg5wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0ID0gLUVOT0RFVjs8YnI+CjFhZWVmMzhjNmE0YTg3
IE1hcmVrIEJlaMO6biAyMDIwLTA5LTE5wqAgwqA5MMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8g
ZXJyOzxicj4KMWFlZWYzOGM2YTRhODcgTWFyZWsgQmVow7puIDIwMjAtMDktMTnCoCDCoDkxwqAg
wqAgwqAgfTxicj4KMTFlMWJiYzExNmE3NWQgRGFuIE11cnBoecKgIDIwMTktMDYtMDXCoCDCoDky
wqAgPGJyPgoxMWUxYmJjMTE2YTc1ZCBEYW4gTXVycGh5wqAgMjAxOS0wNi0wNcKgIEA5M8KgIMKg
IMKgIHJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMl88d2JyPmFycmF5KGNoaWxkLCAmcXVv
dDtsZWQtc291cmNlcyZxdW90Oyw8YnI+CmE0NDhmY2YxOWM5YzVkIE1hcmVrIEJlaMO6biAyMDIw
LTA5LTE5wqAgwqA5NMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2hpcC0mZ3Q7bGVkX3NvdXJjZXMsIGNoaXAtJmd0O251bV9s
ZWRzKTs8YnI+CjExZTFiYmMxMTZhNzVkIERhbiBNdXJwaHnCoCAyMDE5LTA2LTA1wqAgwqA5NcKg
IMKgIMKgIGlmIChyZXQpIHs8YnI+CjExZTFiYmMxMTZhNzVkIERhbiBNdXJwaHnCoCAyMDE5LTA2
LTA1wqAgwqA5NsKgIMKgIMKgIMKgIMKgIMKgIMKgIGRldl9lcnIoZGV2LCAmcXVvdDtsZWQtc291
cmNlcyBwcm9wZXJ0eSBtaXNzaW5nXG4mcXVvdDspOzxicj4KMWFlZWYzOGM2YTRhODcgTWFyZWsg
QmVow7puIDIwMjAtMDktMTnCoCDCoDk3wqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBlcnI7PGJy
PgoxMWUxYmJjMTE2YTc1ZCBEYW4gTXVycGh5wqAgMjAxOS0wNi0wNcKgIMKgOTjCoCDCoCDCoCB9
PGJyPgoxMWUxYmJjMTE2YTc1ZCBEYW4gTXVycGh5wqAgMjAxOS0wNi0wNcKgIMKgOTnCoCA8YnI+
CjExZTFiYmMxMTZhNzVkIERhbiBNdXJwaHnCoCAyMDE5LTA2LTA1wqAgMTAwwqAgwqAgwqAgcmV0
dXJuIDA7PGJyPgoxYWVlZjM4YzZhNGE4NyBNYXJlayBCZWjDum4gMjAyMC0wOS0xOcKgIDEwMcKg
IGVycjo8YnI+CjFhZWVmMzhjNmE0YTg3IE1hcmVrIEJlaMO6biAyMDIwLTA5LTE5IEAxMDLCoCDC
oCDCoCBmd25vZGVfaGFuZGxlX3B1dChjaGlsZCk7PGJyPgoxYWVlZjM4YzZhNGE4NyBNYXJlayBC
ZWjDum4gMjAyMC0wOS0xOcKgIDEwM8KgIMKgIMKgIHJldHVybiByZXQ7PGJyPgoxMWUxYmJjMTE2
YTc1ZCBEYW4gTXVycGh5wqAgMjAxOS0wNi0wNcKgIDEwNMKgIH08YnI+CjExZTFiYmMxMTZhNzVk
IERhbiBNdXJwaHnCoCAyMDE5LTA2LTA1wqAgMTA1wqAgPGJyPgo8YnI+Cjo6Ojo6OiBUaGUgY29k
ZSBhdCBsaW5lIDc3IHdhcyBmaXJzdCBpbnRyb2R1Y2VkIGJ5IGNvbW1pdDxicj4KOjo6Ojo6IGE0
NDhmY2YxOWM5YzVkM2RkZDkwNjZhY2NiZDhkMjx3YnI+OGM0OTUwYmI5ZiBsZWRzOiBsbTM2Mjc0
OiBkb24mIzM5O3QgaXRlcmF0ZSB0aHJvdWdoIGNoaWxkcmVuIHNpbmNlIHRoZXJlIGlzIG9ubHkg
b25lPGJyPgo8YnI+Cjo6Ojo6OiBUTzogTWFyZWsgQmVow7puICZsdDs8YSBocmVmPSJtYWlsdG86
bWFyZWsuYmVodW5AbmljLmN6Ij5tYXJlay5iZWh1bkBuaWMuY3o8L2E+Jmd0Ozxicj4KOjo6Ojo6
IENDOiBQYXZlbCBNYWNoZWsgJmx0OzxhIGhyZWY9Im1haWx0bzpwYXZlbEB1Y3cuY3oiPnBhdmVs
QHVjdy5jejwvYT4mZ3Q7PGJyPgo8YnI+Ci0tLTxicj4KMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2Vy
dmljZSwgSW50ZWwgQ29ycG9yYXRpb248YnI+CjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3Jn
L2h5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxsQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHBzOi8vbGlzdHMuMDEub3JnLzx3YnI+aHlwZXJraXR0eS9saXN0L2tidWlsZC1hbGxAPHdi
cj5saXN0cy4wMS5vcmc8L2E+PGJyPgo8L2Jsb2NrcXVvdGU+PGJyPjxicj4tLSA8YnI+V2l0aCBC
ZXN0IFJlZ2FyZHMsPGJyPkFuZHkgU2hldmNoZW5rbzxicj48YnI+PGJyPgo=

--===============5369518518399441940==--

