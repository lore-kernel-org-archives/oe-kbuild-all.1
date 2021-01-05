Content-Type: multipart/mixed; boundary="===============1604871355388709091=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/i3c/master/mipi-i3c-hci/core.c:780:21: warning: attribute declaration must precede definition
Date: Tue, 05 Jan 2021 11:37:55 -0800
Message-ID: <CAKwvOdn978FV_FmikQXjMwKYZi_OUXw_f3t56NnMXHiawXDOzw@mail.gmail.com>
In-Reply-To: <202012270950.HNbQuTpw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1604871355388709091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix already applied:
https://lore.kernel.org/lkml/160943653614.132002.12499200411415721355.b4-ty=
(a)bootlin.com/

On Sat, Dec 26, 2020 at 5:29 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Nicolas,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f838f8d2b694cf9d524dc4423e9dd2db13892f3f
> commit: 95393f3e07ab53855b91881692a4a5b52dcdc03c i3c/master/mipi-i3c-hci:=
 quiet maybe-unused variable warning
> date:   10 days ago
> config: arm-randconfig-r011-20201220 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project cee1=
e7d14f4628d6174b33640d502bff3b54ae45)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D95393f3e07ab53855b91881692a4a5b52dcdc03c
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 95393f3e07ab53855b91881692a4a5b52dcdc03c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/i3c/master/mipi-i3c-hci/core.c:780:21: warning: attribute decl=
aration must precede definition [-Wignored-attributes]
>    static const struct __maybe_unused of_device_id i3c_hci_of_match[] =3D=
 {
>                        ^
>    include/linux/compiler_attributes.h:267:56: note: expanded from macro =
'__maybe_unused'
>    #define __maybe_unused                  __attribute__((__unused__))
>                                                           ^
>    include/linux/mod_devicetable.h:262:8: note: previous definition is he=
re
>    struct of_device_id {
>           ^
>    drivers/i3c/master/mipi-i3c-hci/core.c:780:49: warning: unused variabl=
e 'i3c_hci_of_match' [-Wunused-const-variable]
>    static const struct __maybe_unused of_device_id i3c_hci_of_match[] =3D=
 {
>                                                    ^
>    2 warnings generated.
>
>
> vim +780 drivers/i3c/master/mipi-i3c-hci/core.c
>
>    779
>  > 780  static const struct __maybe_unused of_device_id i3c_hci_of_match[=
] =3D {
>    781          { .compatible =3D "mipi-i3c-hci", },
>    782          {},
>    783  };
>    784  MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
>    785
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
d/clang-built-linux/202012270950.HNbQuTpw-lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============1604871355388709091==--

