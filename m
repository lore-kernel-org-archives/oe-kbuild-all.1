Content-Type: multipart/mixed; boundary="===============8548332746070960432=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 5848/6711] drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils.o: warning: objtool: __llvm_gcov_writeout()+0x13: call without frame pointer save/setup
Date: Tue, 05 May 2020 17:59:17 -0700
Message-ID: <CAKwvOdnhzcFThaFp05f1urE9W7BDZ2VfETE7=pwnqhZhvt_K2w@mail.gmail.com>
In-Reply-To: <202005060844.QaKkh5m9%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8548332746070960432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,
Can we please have this particular warning filtered to only our
mailing list? It's another known issue that's emailing unrelated
authors.  Sorry, and we'll get it fixed.

On Tue, May 5, 2020 at 5:52 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Dmitry,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   7def1ef0f72c3ebe3e42467d2f73c4e56153fa49
> commit: c1be0bf092bd292ee617622c116f5981a34cce96 [5848/6711] net: atlanti=
c: common functions needed for basic A2 init/deinit hw_ops
> config: x86_64-randconfig-d001-20200502 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ff6a=
0b6a8ee74693e9711973028a8a327adf9cd5)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout c1be0bf092bd292ee617622c116f5981a34cce96
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils.o: warnin=
g: objtool: __llvm_gcov_writeout()+0x13: call without frame pointer save/se=
tup
> >> drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils.o: warnin=
g: objtool: __llvm_gcov_flush()+0x0: call without frame pointer save/setup
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202005060844.QaKkh5m9%25lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============8548332746070960432==--

