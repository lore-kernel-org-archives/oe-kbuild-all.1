Content-Type: multipart/mixed; boundary="===============0687180917219859487=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.10.y 3189/5262] drivers/usb/dwc2/hcd.c:3835:6: warning: stack frame size of 1032 bytes in function 'dwc2_hcd_dump_state'
Date: Fri, 21 May 2021 10:09:54 +0200
Message-ID: <CAK8P3a3e4zygAJ6cwWAtZey_G_NL8-+BFwB21GxMA-zT_rtGgw@mail.gmail.com>
In-Reply-To: <20210521005724.GA3353474@pl-dbox>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0687180917219859487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 3:00 AM Philip Li <philip.li@intel.com> wrote:
> On Thu, May 20, 2021 at 05:56:35PM +0800, Rong Chen wrote:
> > On 5/20/21 5:27 PM, Arnd Bergmann wrote:
> > > On Thu, May 20, 2021 at 11:22 AM Rong Chen <rong.a.chen@intel.com> =
wrote:
> > > >
> > > > We have disabled CONFIG_UBSAN_ALIGNMENT for mips/clang in our kconf=
igs
> > > > to avoid reporting such warnings again.
> > > Thanks a lot, that helps.
> > >
> > > Have you considered always enforcing CONFIG_COMPILE_TEST=3Dy for any
> > > randconfig build? That would address this issue along with a number o=
f similar
>
> Hi Arnd, thanks for feedback, we have talked about this internally. We us=
e randconfig
> to cover different combination, some randconfig would have CONFIG_COMPILE=
_TEST=3Dy, some
> is not. For now, we also want to check the kernel build status when COMPI=
LE_TEST is
> not set (as if this is a valid kconfig combination). Thus we may not alwa=
ys enforcing
> the y here, but keep it as random as possible.

Ok, I see.

(Adding Masahiro Yamada)

I think there was a patch in the past would let Kconfig detect whether
a kernel is built using
'make randconfig', and add further dependencies based on this, to
detect combinations
that we want to avoid testing in such environments. Maybe we should
revisit that and
replace the 'depends on !COMPILE_TEST' checks.

        Arnd
--===============0687180917219859487==--

