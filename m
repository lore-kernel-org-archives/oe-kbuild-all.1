Content-Type: multipart/mixed; boundary="===============1647119250883290090=="
MIME-Version: 1.0
From: Stafford Horne <shorne@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.4.y 665/2391] drivers/android/binder.c:3776: Error: unrecognized keyword/register name `l.lwz
Date: Fri, 16 Oct 2020 08:05:17 +0900
Message-ID: <CAAfxs77_h-DHOMFCJBWMuj1H5Rj8OiqC_U1Trs3A8gNCiPvo7w@mail.gmail.com>
In-Reply-To: <CAG48ez3VixjDrMnz6+7JjGW_ZLZCD4+dTYWUD_tNOcfEfpu1Bg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1647119250883290090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2020, 6:46 AM Jann Horn <jannh@google.com> wrote:

> +openrisc folks
>
> On Thu, Oct 15, 2020 at 11:28 PM kernel test robot <lkp@intel.com> wrot=
e:
> > tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> linux-5.4.y
> > head:   85b0841aab15c12948af951d477183ab3df7de14
> > commit: c5665cafbedd2e2a523fe933e452391a02d3adb3 [665/2391] binder:
> Prevent context manager from incrementing ref 0
> > config: openrisc-randconfig-r002-20201014 (attached as .config)
> > compiler: or1k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         #
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.gi=
t/commit/?id=3Dc5665cafbedd2e2a523fe933e452391a02d3adb3
> >         git remote add linux-stable-rc
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc linux-5.4.y
> >         git checkout c5665cafbedd2e2a523fe933e452391a02d3adb3
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss
> ARCH=3Dopenrisc
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/android/binder.c: Assembler messages:
> > >> drivers/android/binder.c:3776: Error: unrecognized keyword/register
> name `l.lwz ?ap,4(r25)'
> >    drivers/android/binder.c:3781: Error: unrecognized keyword/register
> name `l.addi ?ap,r0,0'
>
> binder is basically doing this:
>
> u64 data_ptr;
> if (get_user(data_ptr, (u64 __user *)ptr))
>   return -EFAULT;
>
> and GCC complains that that doesn't turn into valid assembly on
> openrisc, where get_user() of size 8 expands into this:
>
> #define __get_user_asm2(x, addr, err)                   \
> {                                                       \
>         unsigned long long __gu_tmp;                    \
>         __asm__ __volatile__(                           \
>                 "1:     l.lwz %1,0(%2)\n"               \
>                 "2:     l.lwz %H1,4(%2)\n"              \
>                 "3:\n"                                  \
>                 ".section .fixup,\"ax\"\n"              \
>                 "4:     l.addi %0,r0,%3\n"              \
>                 "       l.addi %1,r0,0\n"               \
>                 "       l.addi %H1,r0,0\n"              \
>                 "       l.j 3b\n"                       \
>                 "       l.nop\n"                        \
>                 ".previous\n"                           \
>                 ".section __ex_table,\"a\"\n"           \
>                 "       .align 2\n"                     \
>                 "       .long 1b,4b\n"                  \
>                 "       .long 2b,4b\n"                  \
>                 ".previous"                             \
>                 : "=3Dr"(err), "=3D&r"(__gu_tmp)            \
>                 : "r"(addr), "i"(-EFAULT), "0"(err));   \
>         (x) =3D (__typeof__(*(addr)))(                    \
>                 (__typeof__((x)-(x)))__gu_tmp);         \
> }
>
> and apparently the "l.lwz %H1,4(%2)" and "l.addi %H1,r0,0" don't turn
> into valid assembly when %H1 expands to "?ap"?
>
> I don't know anything about OpenRISC, but this seems like it's
> probably an issue in the get_user() implementation.
>

This is fixed in 5.9.  I think the patch can be cherry picked by itself.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/a=
rch/openrisc?h=3Dv5.9&id=3Dd877322bc1adcab9850732275670409e8bcca4c4

>

--===============1647119250883290090==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgT2N0IDE2LCAyMDIwLCA2OjQ2
IEFNIEphbm4gSG9ybiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmphbm5oQGdvb2dsZS5jb20iPmphbm5o
QGdvb2dsZS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mg
c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+K29wZW5yaXNjIGZvbGtzPGJyPgo8YnI+Ck9uIFRodSwg
T2N0IDE1LCAyMDIwIGF0IDExOjI4IFBNIGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJt
YWlsdG86bGtwQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+bGtw
QGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KJmd0OyB0cmVlOsKgIMKgPGEgaHJlZj0iaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4
LXN0YWJsZS1yYy5naXQiIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxl
L2xpbnV4LXN0YWJsZS1yYy5naXQ8L2E+IGxpbnV4LTUuNC55PGJyPgomZ3Q7IGhlYWQ6wqAgwqA4
NWIwODQxYWFiMTVjMTI5NDhhZjk1MWQ0NzcxODNhYjNkZjdkZTE0PGJyPgomZ3Q7IGNvbW1pdDog
YzU2NjVjYWZiZWRkMmUyYTUyM2ZlOTMzZTQ1MjM5MWEwMmQzYWRiMyBbNjY1LzIzOTFdIGJpbmRl
cjogUHJldmVudCBjb250ZXh0IG1hbmFnZXIgZnJvbSBpbmNyZW1lbnRpbmcgcmVmIDA8YnI+CiZn
dDsgY29uZmlnOiBvcGVucmlzYy1yYW5kY29uZmlnLXIwMDItMjAyMDEwMTQgKGF0dGFjaGVkIGFz
IC5jb25maWcpPGJyPgomZ3Q7IGNvbXBpbGVyOiBvcjFrLWxpbnV4LWdjYyAoR0NDKSA5LjMuMDxi
cj4KJmd0OyByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOjxicj4KJmd0O8KgIMKgIMKg
IMKgIMKgd2dldCA8YSBocmVmPSJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50
ZWwvbGtwLXRlc3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MiIHJlbD0ibm9yZWZlcnJlciBub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29t
L2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNyb3NzPC9hPiAtTyB+L2Jpbi9tYWtl
LmNyb3NzPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzPGJy
PgomZ3Q7wqAgwqAgwqAgwqAgwqAjIDxhIGhyZWY9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0L2NvbW1pdC8/
aWQ9YzU2NjVjYWZiZWRkMmUyYTUyM2ZlOTMzZTQ1MjM5MWEwMmQzYWRiMyIgcmVsPSJub3JlZmVy
cmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdC9jb21taXQv
P2lkPWM1NjY1Y2FmYmVkZDJlMmE1MjNmZTkzM2U0NTIzOTFhMDJkM2FkYjM8L2E+PGJyPgomZ3Q7
wqAgwqAgwqAgwqAgwqBnaXQgcmVtb3RlIGFkZCBsaW51eC1zdGFibGUtcmMgPGEgaHJlZj0iaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4
LXN0YWJsZS1yYy5naXQiIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxl
L2xpbnV4LXN0YWJsZS1yYy5naXQ8L2E+PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBnaXQgZmV0Y2gg
LS1uby10YWdzIGxpbnV4LXN0YWJsZS1yYyBsaW51eC01LjQueTxicj4KJmd0O8KgIMKgIMKgIMKg
IMKgZ2l0IGNoZWNrb3V0IGM1NjY1Y2FmYmVkZDJlMmE1MjNmZTkzM2U0NTIzOTFhMDJkM2FkYjM8
YnI+CiZndDvCoCDCoCDCoCDCoCDCoCMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51
eCBidWlsZCB0cmVlPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBDT01QSUxFUl9JTlNUQUxMX1BBVEg9
JEhPTUUvMGRheSBDT01QSUxFUj1nY2MtOS4zLjAgbWFrZS5jcm9zcyBBUkNIPW9wZW5yaXNjPGJy
PgomZ3Q7PGJyPgomZ3Q7IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2lu
ZyB0YWcgYXMgYXBwcm9wcmlhdGU8YnI+CiZndDsgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90ICZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJl
bD0ibm9yZWZlcnJlciI+bGtwQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7IEFs
bCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ICZndDsmZ3Q7KTo8YnI+CiZndDs8YnI+CiZn
dDvCoCDCoCBkcml2ZXJzL2FuZHJvaWQvYmluZGVyLmM6IEFzc2VtYmxlciBtZXNzYWdlczo8YnI+
CiZndDsgJmd0OyZndDsgZHJpdmVycy9hbmRyb2lkL2JpbmRlci5jOjM3NzY6IEVycm9yOiB1bnJl
Y29nbml6ZWQga2V5d29yZC9yZWdpc3RlciBuYW1lIGBsLmx3eiA/YXAsNChyMjUpJiMzOTs8YnI+
CiZndDvCoCDCoCBkcml2ZXJzL2FuZHJvaWQvYmluZGVyLmM6Mzc4MTogRXJyb3I6IHVucmVjb2du
aXplZCBrZXl3b3JkL3JlZ2lzdGVyIG5hbWUgYGwuYWRkaSA/YXAscjAsMCYjMzk7PGJyPgo8YnI+
CmJpbmRlciBpcyBiYXNpY2FsbHkgZG9pbmcgdGhpczo8YnI+Cjxicj4KdTY0IGRhdGFfcHRyOzxi
cj4KaWYgKGdldF91c2VyKGRhdGFfcHRyLCAodTY0IF9fdXNlciAqKXB0cikpPGJyPgrCoCByZXR1
cm4gLUVGQVVMVDs8YnI+Cjxicj4KYW5kIEdDQyBjb21wbGFpbnMgdGhhdCB0aGF0IGRvZXNuJiMz
OTt0IHR1cm4gaW50byB2YWxpZCBhc3NlbWJseSBvbjxicj4Kb3BlbnJpc2MsIHdoZXJlIGdldF91
c2VyKCkgb2Ygc2l6ZSA4IGV4cGFuZHMgaW50byB0aGlzOjxicj4KPGJyPgojZGVmaW5lIF9fZ2V0
X3VzZXJfYXNtMih4LCBhZGRyLCBlcnIpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJy
Pgp7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPgrCoCDCoCDCoCDCoCB1bnNpZ25lZCBs
b25nIGxvbmcgX19ndV90bXA7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4KwqAg
wqAgwqAgwqAgX19hc21fXyBfX3ZvbGF0aWxlX18owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBcPGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDsxOsKgIMKg
IMKgbC5sd3ogJTEsMCglMilcbiZxdW90O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7MjrCoCDCoCDCoGwubHd6ICVIMSw0KCUyKVxuJnF1
b3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1
b3Q7MzpcbiZxdW90O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFw8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90Oy5zZWN0aW9uIC5maXh1
cCxcJnF1b3Q7YXhcJnF1b3Q7XG4mcXVvdDvCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPgrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDs0OsKgIMKgIMKgbC5hZGRpICUwLHIwLCUzXG4mcXVv
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVv
dDvCoCDCoCDCoCDCoGwuYWRkaSAlMSxyMCwwXG4mcXVvdDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oFw8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90O8KgIMKgIMKgIMKgbC5hZGRpICVI
MSxyMCwwXG4mcXVvdDvCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPgrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmcXVvdDvCoCDCoCDCoCDCoGwuaiAzYlxuJnF1b3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBcPGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDvCoCDC
oCDCoCDCoGwubm9wXG4mcXVvdDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBc
PGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDsucHJldmlvdXNcbiZxdW90O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgJnF1b3Q7LnNlY3Rpb24gX19leF90YWJsZSxcJnF1b3Q7YVwmcXVvdDtcbiZxdW90
O8KgIMKgIMKgIMKgIMKgIMKgXDxicj4KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7wqAg
wqAgwqAgwqAuYWxpZ24gMlxuJnF1b3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBc
PGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDvCoCDCoCDCoCDCoC5sb25nIDFiLDRi
XG4mcXVvdDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPgrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmcXVvdDvCoCDCoCDCoCDCoC5sb25nIDJiLDRiXG4mcXVvdDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBcPGJyPgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDsucHJldmlv
dXMmcXVvdDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDogJnF1b3Q7PXImcXVvdDsoZXJyKSwgJnF1b3Q7PSZh
bXA7ciZxdW90OyhfX2d1X3RtcCnCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPgrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCA6ICZxdW90O3ImcXVvdDsoYWRkciksICZxdW90O2kmcXVvdDsoLUVGQVVMVCks
ICZxdW90OzAmcXVvdDsoZXJyKSk7wqAgwqBcPGJyPgrCoCDCoCDCoCDCoCAoeCkgPSAoX190eXBl
b2ZfXygqKGFkZHIpKSkowqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKF9fdHlwZW9mX18oKHgpLSh4KSkpX19ndV90bXApO8KgIMKgIMKg
IMKgIMKgXDxicj4KfTxicj4KPGJyPgphbmQgYXBwYXJlbnRseSB0aGUgJnF1b3Q7bC5sd3ogJUgx
LDQoJTIpJnF1b3Q7IGFuZCAmcXVvdDtsLmFkZGkgJUgxLHIwLDAmcXVvdDsgZG9uJiMzOTt0IHR1
cm48YnI+CmludG8gdmFsaWQgYXNzZW1ibHkgd2hlbiAlSDEgZXhwYW5kcyB0byAmcXVvdDs/YXAm
cXVvdDs/PGJyPgo8YnI+CkkgZG9uJiMzOTt0IGtub3cgYW55dGhpbmcgYWJvdXQgT3BlblJJU0Ms
IGJ1dCB0aGlzIHNlZW1zIGxpa2UgaXQmIzM5O3M8YnI+CnByb2JhYmx5IGFuIGlzc3VlIGluIHRo
ZSBnZXRfdXNlcigpIGltcGxlbWVudGF0aW9uLjxicj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+
PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+VGhpcyBpcyBmaXhlZCBp
biA1LjkuwqAgSSB0aGluayB0aGUgcGF0Y2ggY2FuIGJlIGNoZXJyeSBwaWNrZWQgYnkgaXRzZWxm
LjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxhIGhyZWY9
Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC9jb21taXQvYXJjaC9vcGVucmlzYz9oPXY1LjkmYW1wO2lkPWQ4NzczMjJiYzFh
ZGNhYjk4NTA3MzIyNzU2NzA0MDllOGJjY2E0YzQiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvYXJjaC9vcGVu
cmlzYz9oPXY1LjkmYW1wO2lkPWQ4NzczMjJiYzFhZGNhYjk4NTA3MzIyNzU2NzA0MDllOGJjY2E0
YzQ8L2E+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+CjwvYmxvY2txdW90
ZT48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============1647119250883290090==--

