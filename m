Content-Type: multipart/mixed; boundary="===============1926374920812243955=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 5848/6711] drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils.o: warning: objtool: __llvm_gcov_writeout()+0x13: call without frame pointer save/setup
Date: Wed, 06 May 2020 09:43:04 +0800
Message-ID: <20200506014304.GA26365@intel.com>
In-Reply-To: <CAKwvOdnhzcFThaFp05f1urE9W7BDZ2VfETE7=pwnqhZhvt_K2w@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1926374920812243955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2020 at 05:59:17PM -0700, Nick Desaulniers wrote:
> Hi Philip,
> Can we please have this particular warning filtered to only our
> mailing list? It's another known issue that's emailing unrelated
> authors.  Sorry, and we'll get it fixed.
sure, and i just checked, it is one code issue at our side, it should
be sent to clang only, but we only judge the error output, and miss
the warning part. I will also fix this in our code.

> =

> On Tue, May 5, 2020 at 5:52 PM kbuild test robot <lkp@intel.com> wrote:
> >
> > Hi Dmitry,
> >
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   7def1ef0f72c3ebe3e42467d2f73c4e56153fa49
> > commit: c1be0bf092bd292ee617622c116f5981a34cce96 [5848/6711] net: atlan=
tic: common functions needed for basic A2 init/deinit hw_ops
> > config: x86_64-randconfig-d001-20200502 (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ff=
6a0b6a8ee74693e9711973028a8a327adf9cd5)
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         git checkout c1be0bf092bd292ee617622c116f5981a34cce96
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils.o: warn=
ing: objtool: __llvm_gcov_writeout()+0x13: call without frame pointer save/=
setup
> > >> drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils.o: warn=
ing: objtool: __llvm_gcov_flush()+0x0: call without frame pointer save/setup
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to clang-built-linux+unsubscribe(a)googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/ms=
gid/clang-built-linux/202005060844.QaKkh5m9%25lkp%40intel.com.
> =

> =

> =

> -- =

> Thanks,
> ~Nick Desaulniers
--===============1926374920812243955==--

