Content-Type: multipart/mixed; boundary="===============3938841973533773696=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 12268/12330] ld.lld: warning: drivers/built-in.a(hwtracing/coresight/coresight-core.o):(.ARM.extab) is being placed in '.ARM.extab'
Date: Fri, 02 Oct 2020 13:38:10 +0800
Message-ID: <20201002053809.GC30771@intel.com>
In-Reply-To: <20201001171259.GA2468854@ubuntu-m3-large-x86>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3938841973533773696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 10:12:59AM -0700, Nathan Chancellor wrote:
> On Thu, Oct 01, 2020 at 04:00:25PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   de69ee6df1cfbf3c67787d8504fd21b59da39572
> > commit: ad32dae3950bd32340f4b7c9ee05f0633d9e8e32 [12268/12330] Merge re=
mote-tracking branch 'char-misc/char-misc-next' into master
> > config: arm-randconfig-r011-20200930 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bc=
d05599d0e53977a963799d6ee4f6e0bc21331b)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3Dad32dae3950bd32340f4b7c9ee05f0633d9e8e32
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout ad32dae3950bd32340f4b7c9ee05f0633d9e8e32
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Darm =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All warnings (new ones prefixed by >>):
> > =

> >    ld.lld: warning: drivers/built-in.a(crypto/ccree/cc_hash.o):(.ARM.ex=
tab) is being placed in '.ARM.extab'
> >    ld.lld: warning: drivers/built-in.a(crypto/ccree/cc_aead.o):(.ARM.ex=
tab) is being placed in '.ARM.extab'
> >    ld.lld: warning: drivers/built-in.a(crypto/ccree/cc_sram_mgr.o):(.AR=
M.extab) is being placed in '.ARM.extab'
> =

> Should be fixed with
> https://lore.kernel.org/r/20200928224854.3224862-1-natechancellor(a)gmail=
.com/,
> obviously not caused by anything in that merge. Still waiting for review
thanks, we will look into this to avoid false positive.

> and acceptance.
let me disable this warning for a while to reduce duplicated (and wrong bad=
 commit)
reports.

> =

> Cheers,
> Nathan
>=20
--===============3938841973533773696==--

