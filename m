Content-Type: multipart/mixed; boundary="===============8900268637552552274=="
MIME-Version: 1.0
From: Stafford Horne <shorne@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/soc/litex/litex_soc_ctrl.c:143:34: warning: unused variable 'litex_soc_ctrl_of_match'
Date: Tue, 12 Jan 2021 06:14:52 +0900
Message-ID: <20210111211452.GB2002709@lianli.shorne-pla.net>
In-Reply-To: <20210111164334.GA1322395@ubuntu-m3-large-x86>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8900268637552552274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 09:43:34AM -0700, Nathan Chancellor wrote:
> On Mon, Jan 11, 2021 at 09:30:55PM +0900, Stafford Horne wrote:
> > On Thu, Jan 07, 2021 at 04:04:47AM +0800, kernel test robot wrote:
> > > Hi Pawel,
> > > =

> > > FYI, the error/warning still remains.
> > > =

> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> > > commit: 22447a99c97e353bde8f90c2353873f27681d57c drivers/soc/litex: a=
dd LiteX SoC Controller driver
> > > date:   8 weeks ago
> > > config: x86_64-randconfig-a001-20210107 (attached as .config)
> > > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project =
5c951623bc8965fa1e89660f2f5f4a2944e4981a)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install x86_64 cross compiling tool for clang build
> > >         # apt-get install binutils-x86-64-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3D22447a99c97e353bde8f90c2353873f27681d57c
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout 22447a99c97e353bde8f90c2353873f27681d57c
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s ARCH=3Dx86_64 =

> > > =

> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > =

> > > All warnings (new ones prefixed by >>):
> > > =

> > > >> drivers/soc/litex/litex_soc_ctrl.c:143:34: warning: unused variabl=
e 'litex_soc_ctrl_of_match' [-Wunused-const-variable]
> > >    static const struct of_device_id litex_soc_ctrl_of_match[] =3D {
> > >                                     ^
> > >    1 warning generated.
> > > =

> > > =

> > > vim +/litex_soc_ctrl_of_match +143 drivers/soc/litex/litex_soc_ctrl.c
> > > =

> > >    142	=

> > >  > 143	static const struct of_device_id litex_soc_ctrl_of_match[] =3D=
 {
> > >    144		{.compatible =3D "litex,soc-controller"},
> > >    145		{},
> > >    146	};
> > >    147	=

> > > =

> > =

> > I don't use clang but GCC, and I cannot reproduce this warning.
> > =

> > $ make drivers/soc/litex/litex_soc_ctrl.o =

> >   CALL    scripts/checksyscalls.sh
> >   CALL    scripts/atomic/check-atomics.sh
> >   DESCEND  objtool
> >   CC      drivers/soc/litex/litex_soc_ctrl.o
> > =

> > Also, I can see litex_soc_ctrl_of_match is used.  I am not sure what is=
 going on
> > here.
> > =

> > -Stafford
> > =

> =

> You need W=3D1
> =

> $ make -skj"$(nproc)" W=3D1 olddefconfig drivers/soc/litex/litex_soc_ctrl=
.o
> drivers/soc/litex/litex_soc_ctrl.c:143:34: warning: =E2=80=98litex_soc_ct=
rl_of_match=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>   143 | static const struct of_device_id litex_soc_ctrl_of_match[] =3D {
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~~
> =

> $ rg "CONFIG_OF|CONFIG_LITEX_SOC_CONTROLLER" .config
> 1124:# CONFIG_OF is not set
> 4673:CONFIG_LITEX_SOC_CONTROLLER=3Dy
> =

> This variable is used in two places in that file, in the
> MODULE_DEVICE_TABLE macro and the of_match_ptr macro. When CONFIG_OF is
> disabled, of_match_ptr evaluates to NULL. When the file is built into
> the kernel image, MODULE_DEVICE_TABLE evaluates to nothing, leaving this
> variable defined but unused in the final preprocessed source.
> =

> Hope that helps!

That helps, I noticed it was only used in those macros so that was fishy.  I
forgot to add W=3D1.

We will need to surround the definition in:

#if defined(CONFIG_OF)
#endif /* CONFIG_OF */
--===============8900268637552552274==--

