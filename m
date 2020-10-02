Content-Type: multipart/mixed; boundary="===============8413084511424021781=="
MIME-Version: 1.0
From: Nicolas Boichat <drinkcat@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [chrome-os:chromeos-5.4 9/28] mtk_vcodec_fw.c:undefined reference to `scp_ipi_send'
Date: Fri, 02 Oct 2020 19:23:06 +0800
Message-ID: <CAHRZCZXGiOExCxeuAfXHxfB5vaeyy6Dww9G0cCOFgoFsGT1MDQ@mail.gmail.com>
In-Reply-To: <202010021814.NapfEnyz-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8413084511424021781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+Alexandre Courbot <acourbot@google.com> +Fritz Koenig <frkoenig@google=
.com> I
guess that's related to your recently merged patches.

On Fri, Oct 2, 2020, 18:45 kernel test robot <lkp@intel.com> wrote:

> tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel
> chromeos-5.4
> head:   1d3392f3ab6c29e5812a47f0a9c946cf0f6e03b8
> commit: 6c834e841e853771807acc664507158b9226102d [9/28] FROMGIT: media:
> mtk-vcodec: add SCP firmware ops
> config: i386-randconfig-a013-20201002 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>         git remote add chrome-os
> https://chromium.googlesource.com/chromiumos/third_party/kernel
>         git fetch --no-tags chrome-os chromeos-5.4
>         git checkout 6c834e841e853771807acc664507158b9226102d
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Di386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function
> `mtk_vcodec_scp_ipi_send':
> >> mtk_vcodec_fw.c:(.text+0x92): undefined reference to `scp_ipi_send'
>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function
> `mtk_vcodec_scp_set_ipi_register':
> >> mtk_vcodec_fw.c:(.text+0xaf): undefined reference to `scp_ipi_register'
>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function
> `mtk_vcodec_vpu_scp_dm_addr':
> >> mtk_vcodec_fw.c:(.text+0xcc): undefined reference to
> `scp_mapping_dm_addr'
>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function
> `mtk_vcodec_scp_get_venc_capa':
> >> mtk_vcodec_fw.c:(.text+0xec): undefined reference to
> `scp_get_venc_hw_capa'
>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function
> `mtk_vcodec_scp_get_vdec_capa':
> >> mtk_vcodec_fw.c:(.text+0x10c): undefined reference to
> `scp_get_vdec_hw_capa'
>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function
> `mtk_vcodec_scp_load_firmware':
> >> mtk_vcodec_fw.c:(.text+0x12c): undefined reference to `scp_get_rproc'
> >> ld: mtk_vcodec_fw.c:(.text+0x131): undefined reference to `rproc_boot'
>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function
> `mtk_vcodec_fw_select':
> >> mtk_vcodec_fw.c:(.text+0x294): undefined reference to `scp_get'
>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function
> `mtk_vcodec_fw_release':
> >> mtk_vcodec_fw.c:(.text+0x2d7): undefined reference to `scp_put'
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups
> "cros-kernel-buildreports" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to cros-kernel-buildreports+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/cros-kernel-buildreports/202010021814.N=
apfEnyz-lkp%40intel.com
> .
>

--===============8413084511424021781==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPjxzcGFuIGNsYXNzPSJnbWFpbF9jaGlwIGdtYWlsX3BsdXNyZXBseSIg
ZGlyPSJhdXRvIj48YSBocmVmPSJtYWlsdG86YWNvdXJib3RAZ29vZ2xlLmNvbSIgc3R5bGU9ImNv
bG9yOiMxNWM7dGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZSI+K0FsZXhhbmRyZSBDb3VyYm90PC9h
Pjwvc3Bhbj48c3Bhbj7CoDxzcGFuIGNsYXNzPSJnbWFpbF9jaGlwIGdtYWlsX3BsdXNyZXBseSIg
ZGlyPSJhdXRvIj48YSBocmVmPSJtYWlsdG86ZnJrb2VuaWdAZ29vZ2xlLmNvbSIgc3R5bGU9ImNv
bG9yOiMxNWM7dGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZSI+K0ZyaXR6IEtvZW5pZzwvYT48L3Nw
YW4+PHNwYW4+wqBJIGd1ZXNzIHRoYXQmIzM5O3MgcmVsYXRlZCB0byB5b3VyIHJlY2VudGx5IG1l
cmdlZCBwYXRjaGVzLjwvc3Bhbj48L3NwYW4+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1
b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gRnJpLCBPY3QgMiwgMjAy
MCwgMTg6NDUga2VybmVsIHRlc3Qgcm9ib3QgJmx0OzxhIGhyZWY9Im1haWx0bzpsa3BAaW50ZWwu
Y29tIj5sa3BAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNs
YXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFw
eCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPnRyZWU6wqAgwqA8YSBocmVmPSJodHRwczov
L2Nocm9taXVtLmdvb2dsZXNvdXJjZS5jb20vY2hyb21pdW1vcy90aGlyZF9wYXJ0eS9rZXJuZWwi
IHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9jaHJv
bWl1bS5nb29nbGVzb3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsPC9hPiBj
aHJvbWVvcy01LjQ8YnI+CmhlYWQ6wqAgwqAxZDMzOTJmM2FiNmMyOWU1ODEyYTQ3ZjBhOWM5NDZj
ZjBmNmUwM2I4PGJyPgpjb21taXQ6IDZjODM0ZTg0MWU4NTM3NzE4MDdhY2M2NjQ1MDcxNThiOTIy
NjEwMmQgWzkvMjhdIEZST01HSVQ6IG1lZGlhOiBtdGstdmNvZGVjOiBhZGQgU0NQIGZpcm13YXJl
IG9wczxicj4KY29uZmlnOiBpMzg2LXJhbmRjb25maWctYTAxMy0yMDIwMTAwMiAoYXR0YWNoZWQg
YXMgLmNvbmZpZyk8YnI+CmNvbXBpbGVyOiBnY2MtOSAoRGViaWFuIDkuMy4wLTE1KSA5LjMuMDxi
cj4KcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKTo8YnI+CsKgIMKgIMKgIMKgIGdpdCBy
ZW1vdGUgYWRkIGNocm9tZS1vcyA8YSBocmVmPSJodHRwczovL2Nocm9taXVtLmdvb2dsZXNvdXJj
ZS5jb20vY2hyb21pdW1vcy90aGlyZF9wYXJ0eS9rZXJuZWwiIHJlbD0ibm9yZWZlcnJlciBub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29t
L2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsPC9hPjxicj4KwqAgwqAgwqAgwqAgZ2l0IGZl
dGNoIC0tbm8tdGFncyBjaHJvbWUtb3MgY2hyb21lb3MtNS40PGJyPgrCoCDCoCDCoCDCoCBnaXQg
Y2hlY2tvdXQgNmM4MzRlODQxZTg1Mzc3MTgwN2FjYzY2NDUwNzE1OGI5MjI2MTAyZDxicj4KwqAg
wqAgwqAgwqAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1aWxkIHRyZWU8
YnI+CsKgIMKgIMKgIMKgIG1ha2UgVz0xIEFSQ0g9aTM4NiA8YnI+Cjxicj4KSWYgeW91IGZpeCB0
aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZTxicj4KUmVw
b3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGludGVs
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+bGtwQGludGVsLmNvbTwvYT4m
Z3Q7PGJyPgo8YnI+CkFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ICZndDsmZ3Q7KTo8
YnI+Cjxicj4KwqAgwqBsZDogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192
Y29kZWNfZncubzogaW4gZnVuY3Rpb24gYG10a192Y29kZWNfc2NwX2lwaV9zZW5kJiMzOTs6PGJy
PgomZ3Q7Jmd0OyBtdGtfdmNvZGVjX2Z3LmM6KC50ZXh0KzB4OTIpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBzY3BfaXBpX3NlbmQmIzM5Ozxicj4KwqAgwqBsZDogZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZncubzogaW4gZnVuY3Rpb24gYG10a192Y29kZWNf
c2NwX3NldF9pcGlfcmVnaXN0ZXImIzM5Ozo8YnI+CiZndDsmZ3Q7IG10a192Y29kZWNfZncuYzoo
LnRleHQrMHhhZik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHNjcF9pcGlfcmVnaXN0ZXImIzM5
Ozxicj4KwqAgwqBsZDogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29k
ZWNfZncubzogaW4gZnVuY3Rpb24gYG10a192Y29kZWNfdnB1X3NjcF9kbV9hZGRyJiMzOTs6PGJy
PgomZ3Q7Jmd0OyBtdGtfdmNvZGVjX2Z3LmM6KC50ZXh0KzB4Y2MpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBzY3BfbWFwcGluZ19kbV9hZGRyJiMzOTs8YnI+CsKgIMKgbGQ6IGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Z3Lm86IGluIGZ1bmN0aW9uIGBtdGtf
dmNvZGVjX3NjcF9nZXRfdmVuY19jYXBhJiMzOTs6PGJyPgomZ3Q7Jmd0OyBtdGtfdmNvZGVjX2Z3
LmM6KC50ZXh0KzB4ZWMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBzY3BfZ2V0X3ZlbmNfaHdf
Y2FwYSYjMzk7PGJyPgrCoCDCoGxkOiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMv
bXRrX3Zjb2RlY19mdy5vOiBpbiBmdW5jdGlvbiBgbXRrX3Zjb2RlY19zY3BfZ2V0X3ZkZWNfY2Fw
YSYjMzk7Ojxicj4KJmd0OyZndDsgbXRrX3Zjb2RlY19mdy5jOigudGV4dCsweDEwYyk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYHNjcF9nZXRfdmRlY19od19jYXBhJiMzOTs8YnI+CsKgIMKgbGQ6
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Z3Lm86IGluIGZ1
bmN0aW9uIGBtdGtfdmNvZGVjX3NjcF9sb2FkX2Zpcm13YXJlJiMzOTs6PGJyPgomZ3Q7Jmd0OyBt
dGtfdmNvZGVjX2Z3LmM6KC50ZXh0KzB4MTJjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc2Nw
X2dldF9ycHJvYyYjMzk7PGJyPgomZ3Q7Jmd0OyBsZDogbXRrX3Zjb2RlY19mdy5jOigudGV4dCsw
eDEzMSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJwcm9jX2Jvb3QmIzM5Ozxicj4KwqAgwqBs
ZDogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZncubzogaW4g
ZnVuY3Rpb24gYG10a192Y29kZWNfZndfc2VsZWN0JiMzOTs6PGJyPgomZ3Q7Jmd0OyBtdGtfdmNv
ZGVjX2Z3LmM6KC50ZXh0KzB4Mjk0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc2NwX2dldCYj
Mzk7PGJyPgrCoCDCoGxkOiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zj
b2RlY19mdy5vOiBpbiBmdW5jdGlvbiBgbXRrX3Zjb2RlY19md19yZWxlYXNlJiMzOTs6PGJyPgom
Z3Q7Jmd0OyBtdGtfdmNvZGVjX2Z3LmM6KC50ZXh0KzB4MmQ3KTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgc2NwX3B1dCYjMzk7PGJyPgo8YnI+Ci0tLTxicj4KMC1EQVkgQ0kgS2VybmVsIFRlc3Qg
U2VydmljZSwgSW50ZWwgQ29ycG9yYXRpb248YnI+CjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEu
b3JnL2h5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxsQGxpc3RzLjAxLm9yZyIgcmVsPSJub3JlZmVy
cmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLjAxLm9yZy9oeXBl
cmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8YnI+Ci0tIDxicj4K
WW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0
aGUgR29vZ2xlIEdyb3VwcyAmcXVvdDtjcm9zLWtlcm5lbC1idWlsZHJlcG9ydHMmcXVvdDsgZ3Jv
dXAuPGJyPgpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5n
IGVtYWlscyBmcm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzpjcm9zLWtl
cm5lbC1idWlsZHJlcG9ydHMlMkJ1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIiB0YXJnZXQ9
Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5jcm9zLWtlcm5lbC1idWlsZHJlcG9ydHMrdW5zdWJz
Y3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4uPGJyPgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBv
biB0aGUgd2ViIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dp
ZC9jcm9zLWtlcm5lbC1idWlsZHJlcG9ydHMvMjAyMDEwMDIxODE0Lk5hcGZFbnl6LWxrcCU0MGlu
dGVsLmNvbSIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvY3Jvcy1rZXJuZWwtYnVpbGRyZXBvcnRzLzIw
MjAxMDAyMTgxNC5OYXBmRW55ei1sa3AlNDBpbnRlbC5jb208L2E+Ljxicj4KPC9ibG9ja3F1b3Rl
PjwvZGl2Pgo=

--===============8413084511424021781==--

