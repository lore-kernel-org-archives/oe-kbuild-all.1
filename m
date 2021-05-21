Content-Type: multipart/mixed; boundary="===============7008817338907626653=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.10.y 3189/5262] drivers/usb/dwc2/hcd.c:3835:6: warning: stack frame size of 1032 bytes in function 'dwc2_hcd_dump_state'
Date: Fri, 21 May 2021 08:57:24 +0800
Message-ID: <20210521005724.GA3353474@pl-dbox>
In-Reply-To: <9df0d465-d671-d970-4b45-61af014749c9@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7008817338907626653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 05:56:35PM +0800, Rong Chen wrote:
> =

> =

> On 5/20/21 5:27 PM, Arnd Bergmann wrote:
> > On Thu, May 20, 2021 at 11:22 AM Rong Chen <rong.a.chen@intel.com> wr=
ote:
> > > On 5/20/21 4:28 AM, Arnd Bergmann wrote:
> > > > On Wed, May 19, 2021 at 9:48 PM kernel test robot <lkp@intel.com>=
 wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/li=
nux-stable-rc.git linux-5.10.y
> > > > > head:   689e89aee55c565fe90fcdf8a7e53f2f976c5946
> > > > > commit: 5f2f616343b1d62d26f24316fbfc107ecf0983a9 [3189/5262] linu=
x/compiler-clang.h: define HAVE_BUILTIN_BSWAP*
> > > > > config: mips-randconfig-r015-20210519 (attached as .config)
> > > > > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-proj=
ect 8e93d10633d751a3e9169bf9fa68326925ffa097)
> > > > > reproduce (this is a W=3D1 build):
> > > > >           wget https://raw.githubusercontent.com/intel/lkp-tests/=
master/sbin/make.cross -O ~/bin/make.cross
> > > > >           chmod +x ~/bin/make.cross
> > > > >           # install mips cross compiling tool for clang build
> > > > >           # apt-get install binutils-mips-linux-gnu
> > > > >           # https://git.kernel.org/pub/scm/linux/kernel/git/stabl=
e/linux-stable-rc.git/commit/?id=3D5f2f616343b1d62d26f24316fbfc107ecf0983a9
> > > > >           git remote add linux-stable-rc https://git.kernel.org/p=
ub/scm/linux/kernel/git/stable/linux-stable-rc.git
> > > > >           git fetch --no-tags linux-stable-rc linux-5.10.y
> > > > >           git checkout 5f2f616343b1d62d26f24316fbfc107ecf0983a9
> > > > >           # save the attached .config to linux build tree
> > > > >           COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang mak=
e.cross ARCH=3Dmips
> > > > > =

> > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > =

> > > > > All warnings (new ones prefixed by >>):
> > > > > =

> > > > I analyzed another bug like this today, and I think this is again j=
ust
> > > > CONFIG_UBSAN_ALIGNMENT=3Dy
> > > > on mips/clang causing tons of these warnings.
> > > > =

> > > > I don't think this should be considered a regression, but we may wa=
nt
> > > > to change either the
> > > > kernel or the 0day bot from test building this combination of optio=
ns.
> > > > =

> > > >          Arnd
> > > > =

> > > Hi Arnd,
> > > =

> > > We have disabled CONFIG_UBSAN_ALIGNMENT for mips/clang in our kconfigs
> > > to avoid reporting such warnings again.
> > Thanks a lot, that helps.
> > =

> > Have you considered always enforcing CONFIG_COMPILE_TEST=3Dy for any
> > randconfig build? That would address this issue along with a number of =
similar
Hi Arnd, thanks for feedback, we have talked about this internally. We use =
randconfig
to cover different combination, some randconfig would have CONFIG_COMPILE_T=
EST=3Dy, some
is not. For now, we also want to check the kernel build status when COMPILE=
_TEST is
not set (as if this is a valid kconfig combination). Thus we may not always=
 enforcing
the y here, but keep it as random as possible.

> > ones. I have sent a number of patches to add COMPILE_TEST dependencies
> > for things that otherwise break in randconfig builds but could still be=
 useful
> > in more specific cases when users know better.
> > =

> >         Arnd
> =

> Hi Arnd,
> =

> Thanks for the advice, we'll consider it in the near future
> after assessing the existing configures.
> =

> Best Regards,
> Rong Chen
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============7008817338907626653==--

