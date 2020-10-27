Content-Type: multipart/mixed; boundary="===============4052773674329793528=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:rcu/test 76/76] drivers/dax/super.c:21:1: error: use of undeclared identifier '___srcu_struct_ptrs'
Date: Mon, 26 Oct 2020 20:26:49 -0700
Message-ID: <20201027032649.GW3249@paulmck-ThinkPad-P72>
In-Reply-To: <20201027015334.GA842991@ubuntu-m3-large-x86>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4052773674329793528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 06:53:34PM -0700, Nathan Chancellor wrote:
> Hi Paul,
> =

> On Tue, Oct 27, 2020 at 08:50:52AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-r=
cu.git rcu/test
> > head:   784a6343c3660446ae62db13628b20e9f876100f
> > commit: 784a6343c3660446ae62db13628b20e9f876100f [76/76] Merge commit '=
3650b22' into rcu/test
> > config: arm-randconfig-r026-20201026 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f2=
c25c70791de95d2466e09b5b58fc37f6ccd7a4)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux=
-rcu.git/commit/?id=3D784a6343c3660446ae62db13628b20e9f876100f
> >         git remote add rcu https://git.kernel.org/pub/scm/linux/kernel/=
git/paulmck/linux-rcu.git
> >         git fetch --no-tags rcu rcu/test
> >         git checkout 784a6343c3660446ae62db13628b20e9f876100f
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Darm =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>):
> > =

> > >> drivers/dax/super.c:21:1: error: use of undeclared identifier '___sr=
cu_struct_ptrs'
> >    DEFINE_STATIC_SRCU(dax_srcu);
> >    ^
> >    include/linux/srcutree.h:135:34: note: expanded from macro 'DEFINE_S=
TATIC_SRCU'
> >    #define DEFINE_STATIC_SRCU(name)        __DEFINE_SRCU(name, static)
> >                                            ^
> >    include/linux/srcutree.h:127:13: note: expanded from macro '__DEFINE=
_SRCU'
> >                    __section(___srcu_struct_ptrs) =3D &name
> >                              ^
> >    drivers/dax/super.c:70:6: warning: no previous prototype for functio=
n '__generic_fsdax_supported' [-Wmissing-prototypes]
> >    bool __generic_fsdax_supported(struct dax_device *dax_dev,
> >         ^
> >    drivers/dax/super.c:70:1: note: declare 'static' if the function is =
not intended to be used outside of this translation unit
> >    bool __generic_fsdax_supported(struct dax_device *dax_dev,
> >    ^
> >    static =

> >    drivers/dax/super.c:168:6: warning: no previous prototype for functi=
on '__bdev_dax_supported' [-Wmissing-prototypes]
> >    bool __bdev_dax_supported(struct block_device *bdev, int blocksize)
> >         ^
> >    drivers/dax/super.c:168:1: note: declare 'static' if the function is=
 not intended to be used outside of this translation unit
> >    bool __bdev_dax_supported(struct block_device *bdev, int blocksize)
> >    ^
> >    static =

> >    drivers/dax/super.c:452:6: warning: no previous prototype for functi=
on 'run_dax' [-Wmissing-prototypes]
> >    void run_dax(struct dax_device *dax_dev)
> >         ^
> >    drivers/dax/super.c:452:1: note: declare 'static' if the function is=
 not intended to be used outside of this translation unit
> >    void run_dax(struct dax_device *dax_dev)
> >    ^
> >    static =

> >    3 warnings and 1 error generated.
> =

> Please drop commit c1370c128cf4 ("srcu: Avoid escaped section names"),
> it has been fixed in a different way as of v5.10-rc1, in
> commit 33def8498fdd ("treewide: Convert macro and uses of __section(foo)
> to __section("foo")").

Thank you, and will do!

							Thanx, Paul
--===============4052773674329793528==--

