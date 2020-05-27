Content-Type: multipart/mixed; boundary="===============4520030475955977435=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 4/6] bus: Add Baikal-T1 AXI-bus driver
Date: Thu, 28 May 2020 01:04:40 +0300
Message-ID: <CAHp75Vd+HwjBA+ZjKh7=g+x+OCTr8S-Ud1vZbeGxq5SY0thVCg@mail.gmail.com>
In-Reply-To: <202005280301.bu7ZwOYT%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4520030475955977435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wednesday, May 27, 2020, kbuild test robot <lkp@intel.com> wrote:

> Hi Serge,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on char-misc/char-misc-testing
> staging/staging-testing linus/master v5.7-rc7 next-20200526]
> [if your patch is applied to the wrong git tree, please drop us a note to
> help
> improve the system. BTW, we also suggest to use '--base' option to specify
> the
> base tree in git format-patch, please see https://stackoverflow.com/a/
> 37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Serge-Semin/bus-
> memory-Add-Baikal-T1-SoC-APB-AXI-L2-drivers/20200526-210837
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
> for-next
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> reproduce (this is a W=3D1 build):
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Di386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/bus/bt1-axi.c:301:34: error: array type has incomplete element
> type 'struct of_device_id'
> 301 | static const struct of_device_id bt1_axi_of_match[] =3D {
> |                                  ^~~~~~~~~~~~~~~~
> >> drivers/bus/bt1-axi.c:302:4: error: field name not in record or union
> initializer
> 302 |  { .compatible =3D "baikal,bt1-axi" },
> |    ^
> drivers/bus/bt1-axi.c:302:4: note: (near initialization for
> 'bt1_axi_of_match')
> drivers/bus/bt1-axi.c:301:34: warning: 'bt1_axi_of_match' defined but not
> used [-Wunused-variable]
> 301 | static const struct of_device_id bt1_axi_of_match[] =3D {
> |                                  ^~~~~~~~~~~~~~~~
>
>
I wish kbuild bot be intelligent for such cases ;)

#include <linux/mod_devicetable.h>
 will fix this.

vim +301 drivers/bus/bt1-axi.c
>
>    300
>  > 301  static const struct of_device_id bt1_axi_of_match[] =3D {
>  > 302          { .compatible =3D "baikal,bt1-axi" },
>    303          { }
>    304  };
>    305  MODULE_DEVICE_TABLE(of, bt1_axi_of_match);
>    306
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>


-- =

With Best Regards,
Andy Shevchenko

--===============4520030475955977435==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGJyPjxicj5PbiBXZWRuZXNkYXksIE1heSAyNywgMjAyMCwga2J1aWxkIHRlc3Qgcm9ib3QgJmx0
OzxhIGhyZWY9Im1haWx0bzpsa3BAaW50ZWwuY29tIj5sa3BAaW50ZWwuY29tPC9hPiZndDsgd3Jv
dGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAg
MCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkhpIFNl
cmdlLDxicj4KPGJyPgpJIGxvdmUgeW91ciBwYXRjaCEgWWV0IHNvbWV0aGluZyB0byBpbXByb3Zl
Ojxicj4KPGJyPgpbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIHJvYmgvZm9yLW5leHRdPGJyPgpb
YWxzbyBidWlsZCB0ZXN0IEVSUk9SIG9uIGNoYXItbWlzYy9jaGFyLW1pc2MtdGVzdGluZyBzdGFn
aW5nL3N0YWdpbmctdGVzdGluZyBsaW51cy9tYXN0ZXIgdjUuNy1yYzcgbmV4dC0yMDIwMDUyNl08
YnI+CltpZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBwbGVh
c2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscDxicj4KaW1wcm92ZSB0aGUgc3lzdGVtLiBCVFcsIHdl
IGFsc28gc3VnZ2VzdCB0byB1c2UgJiMzOTstLWJhc2UmIzM5OyBvcHRpb24gdG8gc3BlY2lmeSB0
aGU8YnI+CmJhc2UgdHJlZSBpbiBnaXQgZm9ybWF0LXBhdGNoLCBwbGVhc2Ugc2VlIDxhIGhyZWY9
Imh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS8zNzQwNjk4MiIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS88d2JyPjM3NDA2OTgyPC9hPl08YnI+Cjxicj4KdXJs
OsKgIMKgIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMv
U2VyZ2UtU2VtaW4vYnVzLW1lbW9yeS1BZGQtQmFpa2FsLVQxLVNvQy1BUEItQVhJLUwyLWRyaXZl
cnMvMjAyMDA1MjYtMjEwODM3IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tLzBk
YXktY2kvPHdicj5saW51eC9jb21taXRzL1NlcmdlLVNlbWluL2J1cy08d2JyPm1lbW9yeS1BZGQt
QmFpa2FsLVQxLVNvQy1BUEItPHdicj5BWEktTDItZHJpdmVycy8yMDIwMDUyNi0yMTA4Mzc8L2E+
PGJyPgpiYXNlOsKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcm9iaC9saW51eC5naXQiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi88d2JyPnNjbS9saW51eC9rZXJuZWwvZ2l0L3JvYmgvPHdicj5saW51
eC5naXQ8L2E+IGZvci1uZXh0PGJyPgpjb25maWc6IGkzODYtYWxseWVzY29uZmlnIChhdHRhY2hl
ZCBhcyAuY29uZmlnKTxicj4KY29tcGlsZXI6IGdjYy05IChEZWJpYW4gOS4zLjAtMTMpIDkuMy4w
PGJyPgpyZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOjxicj4KwqAgwqAgwqAgwqAgIyBz
YXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1aWxkIHRyZWU8YnI+CsKgIMKgIMKg
IMKgIG1ha2UgVz0xIEFSQ0g9aTM4NiA8YnI+Cjxicj4KSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtp
bmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZTxicj4KUmVwb3J0ZWQtYnk6IGti
dWlsZCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSI+bGtwQGlu
dGVsLmNvbTwvYT4mZ3Q7PGJyPgo8YnI+CkFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5
ICZndDsmZ3Q7LCBvbGQgb25lcyBwcmVmaXhlZCBieSAmbHQ7Jmx0Oyk6PGJyPgo8YnI+CiZndDsm
Z3Q7IGRyaXZlcnMvYnVzL2J0MS1heGkuYzozMDE6MzQ6IGVycm9yOiBhcnJheSB0eXBlIGhhcyBp
bmNvbXBsZXRlIGVsZW1lbnQgdHlwZSAmIzM5O3N0cnVjdCBvZl9kZXZpY2VfaWQmIzM5Ozxicj4K
MzAxIHwgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYnQxX2F4aV9vZl9tYXRjaFtd
ID0gezxicj4KfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIF5+fn5+fn5+fn5+fn5+fn48YnI+CiZndDsmZ3Q7IGRyaXZlcnMvYnVzL2J0MS1heGkuYzoz
MDI6NDogZXJyb3I6IGZpZWxkIG5hbWUgbm90IGluIHJlY29yZCBvciB1bmlvbiBpbml0aWFsaXpl
cjxicj4KMzAyIHzCoCB7IC5jb21wYXRpYmxlID0gJnF1b3Q7YmFpa2FsLGJ0MS1heGkmcXVvdDsg
fSw8YnI+CnzCoCDCoCBePGJyPgpkcml2ZXJzL2J1cy9idDEtYXhpLmM6MzAyOjQ6IG5vdGU6IChu
ZWFyIGluaXRpYWxpemF0aW9uIGZvciAmIzM5O2J0MV9heGlfb2ZfbWF0Y2gmIzM5Oyk8YnI+CmRy
aXZlcnMvYnVzL2J0MS1heGkuYzozMDE6MzQ6IHdhcm5pbmc6ICYjMzk7YnQxX2F4aV9vZl9tYXRj
aCYjMzk7IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV08YnI+CjMwMSB8
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGJ0MV9heGlfb2ZfbWF0Y2hbXSA9IHs8
YnI+CnzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBe
fn5+fn5+fn5+fn5+fn5+PGJyPgo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+
SSB3aXNoIGtidWlsZCBib3QgYmUgaW50ZWxsaWdlbnQgZm9yIHN1Y2ggY2FzZXMgOyk8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PiNpbmNsdWRlICZsdDtsaW51eC9tb2RfZGV2aWNldGFibGUuaCZn
dDs8L2Rpdj48ZGl2PsKgd2lsbCBmaXggdGhpcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2tx
dW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXIt
bGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KdmltICszMDEgZHJpdmVycy9i
dXMvYnQxLWF4aS5jPGJyPgo8YnI+CsKgIMKgMzAwwqAgPGJyPgrCoCZndDsgMzAxwqAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYnQxX2F4aV9vZl9tYXRjaFtdID0gezxicj4KwqAm
Z3Q7IDMwMsKgIMKgIMKgIMKgIMKgIHsgLmNvbXBhdGlibGUgPSAmcXVvdDtiYWlrYWwsYnQxLWF4
aSZxdW90OyB9LDxicj4KwqAgwqAzMDPCoCDCoCDCoCDCoCDCoCB7IH08YnI+CsKgIMKgMzA0wqAg
fTs8YnI+CsKgIMKgMzA1wqAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYnQxX2F4aV9vZl9tYXRj
aCk7PGJyPgrCoCDCoDMwNsKgIDxicj4KPGJyPgotLS08YnI+CjAtREFZIENJIEtlcm5lbCBUZXN0
IFNlcnZpY2UsIEludGVsIENvcnBvcmF0aW9uPGJyPgo8YSBocmVmPSJodHRwczovL2xpc3RzLjAx
Lm9yZy9oeXBlcmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj5odHRwczovL2xpc3RzLjAxLm9yZy88d2JyPmh5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxs
QDx3YnI+bGlzdHMuMDEub3JnPC9hPjxicj4KPC9ibG9ja3F1b3RlPjxicj48YnI+LS0gPGJyPldp
dGggQmVzdCBSZWdhcmRzLDxicj5BbmR5IFNoZXZjaGVua288YnI+PGJyPjxicj4K

--===============4520030475955977435==--

