Content-Type: multipart/mixed; boundary="===============2952254297790327770=="
MIME-Version: 1.0
From: Cpp Code <cpp.code.lv@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] net-next: openvswitch: IPv6: Add IPv6 extension header support
Date: Thu, 06 May 2021 08:41:32 -0700
Message-ID: <CAASuNyWVR_1-SROamrPNGq85hR5RV22seM+v6s9FoKyD8=_amw@mail.gmail.com>
In-Reply-To: <202105060934.AXpcx9gB-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2952254297790327770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

sorry, wrong git tree.

On Wed, May 5, 2021 at 7:03 PM kernel test robot <lkp@intel.com> wrote:

> Hi Toms,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on net/master]
> [also build test WARNING on ipsec/master ipvs/master net-next/master
> linus/master v5.12 next-20210505]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:
> https://github.com/0day-ci/linux/commits/Toms-Atteka/net-next-openvswitch=
-IPv6-Add-IPv6-extension-header-support/20210506-021045
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git
> 4c7a94286ef7ac7301d633f17519fb1bb89d7550
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> cocci warnings: (new ones prefixed by >>)
> >> net/openvswitch/flow.c:378:2-3: Unneeded semicolon
>
> Please review and possibly fold the followup patch.
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>

--===============2952254297790327770==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+c29ycnksIHdyb25nIGdpdCB0cmVlLjwvZGl2Pjxicj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwg
TWF5IDUsIDIwMjEgYXQgNzowMyBQTSBrZXJuZWwgdGVzdCByb2JvdCAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmxrcEBpbnRlbC5jb20iPmxrcEBpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPkhpIFRvbXMsPGJyPgo8YnI+ClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoISBQZXJoYXBz
IHNvbWV0aGluZyB0byBpbXByb3ZlOjxicj4KPGJyPgpbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcg
b24gbmV0L21hc3Rlcl08YnI+ClthbHNvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBpcHNlYy9tYXN0
ZXIgaXB2cy9tYXN0ZXIgbmV0LW5leHQvbWFzdGVyIGxpbnVzL21hc3RlciB2NS4xMiBuZXh0LTIw
MjEwNTA1XTxicj4KW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRy
ZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS48YnI+CkFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gs
IHdlIHN1Z2dlc3QgdG8gdXNlICYjMzk7LS1iYXNlJiMzOTsgYXMgZG9jdW1lbnRlZCBpbjxicj4K
PGEgaHJlZj0iaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2giIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQt
Zm9ybWF0LXBhdGNoPC9hPl08YnI+Cjxicj4KdXJsOsKgIMKgIDxhIGhyZWY9Imh0dHBzOi8vZ2l0
aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvVG9tcy1BdHRla2EvbmV0LW5leHQtb3BlbnZz
d2l0Y2gtSVB2Ni1BZGQtSVB2Ni1leHRlbnNpb24taGVhZGVyLXN1cHBvcnQvMjAyMTA1MDYtMDIx
MDQ1IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20v
MGRheS1jaS9saW51eC9jb21taXRzL1RvbXMtQXR0ZWthL25ldC1uZXh0LW9wZW52c3dpdGNoLUlQ
djYtQWRkLUlQdjYtZXh0ZW5zaW9uLWhlYWRlci1zdXBwb3J0LzIwMjEwNTA2LTAyMTA0NTwvYT48
YnI+CmJhc2U6wqAgwqA8YSBocmVmPSJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9kYXZlbS9uZXQuZ2l0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9kYXZl
bS9uZXQuZ2l0PC9hPiA0YzdhOTQyODZlZjdhYzczMDFkNjMzZjE3NTE5ZmIxYmI4OWQ3NTUwPGJy
Pgpjb25maWc6IHg4Nl82NC1hbGx5ZXNjb25maWcgKGF0dGFjaGVkIGFzIC5jb25maWcpPGJyPgpj
b21waWxlcjogZ2NjLTkgKERlYmlhbiA5LjMuMC0yMikgOS4zLjA8YnI+Cjxicj4KSWYgeW91IGZp
eCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZTxicj4K
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmxrcEBpbnRlbC5jb208L2E+Jmd0Ozxicj4KPGJyPgo8
YnI+CmNvY2NpIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgJmd0OyZndDspPGJyPgom
Z3Q7Jmd0OyBuZXQvb3BlbnZzd2l0Y2gvZmxvdy5jOjM3ODoyLTM6IFVubmVlZGVkIHNlbWljb2xv
bjxicj4KPGJyPgpQbGVhc2UgcmV2aWV3IGFuZCBwb3NzaWJseSBmb2xkIHRoZSBmb2xsb3d1cCBw
YXRjaC48YnI+Cjxicj4KLS0tPGJyPgowLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlLCBJbnRl
bCBDb3Jwb3JhdGlvbjxicj4KPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0
eS9saXN0L2tidWlsZC1hbGxAbGlzdHMuMDEub3JnIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2xpc3RzLjAxLm9yZy9oeXBlcmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBs
aXN0cy4wMS5vcmc8L2E+PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============2952254297790327770==--

