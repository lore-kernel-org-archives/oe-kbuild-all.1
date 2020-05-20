Content-Type: multipart/mixed; boundary="===============7956353088612582231=="
MIME-Version: 1.0
From: Daniel Campello <campello@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 521/10701] drivers/iio/proximity/sx9310.c:1040:34: warning: unused variable 'sx9310_of_match'
Date: Tue, 19 May 2020 22:31:13 -0600
Message-ID: <CAHcu+VYFDCVWrqtwSZz5_5EPXXh6V7iKpsS1vBZMEZN0O4budA@mail.gmail.com>
In-Reply-To: <202005200339.79I5oOMv%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7956353088612582231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 1:33 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: 72ad02b15d6367f9897db62313cc69fb0a20ee1f [521/10701] iio: Add SEM=
TECH SX9310/9311 sensor driver
> config: x86_64-randconfig-r023-20200519 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 135b=
877874fae96b4372c8a3fbfaa8ff44ff86e3)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 72ad02b15d6367f9897db62313cc69fb0a20ee1f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/iio/proximity/sx9310.c:1040:34: warning: unused variable 'sx93=
10_of_match' [-Wunused-const-variable]
> static const struct of_device_id sx9310_of_match[] =3D {
> ^
> 1 warning generated.
>
> vim +/sx9310_of_match +1040 drivers/iio/proximity/sx9310.c
>
>   1039
> > 1040  static const struct of_device_id sx9310_of_match[] =3D {
>   1041          { .compatible =3D "semtech,sx9310" },
>   1042          { .compatible =3D "semtech,sx9311" },
>   1043          {},
>   1044  };
>   1045  MODULE_DEVICE_TABLE(of, sx9310_of_match);
>   1046
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

Hi Jonathan,

It seems that the version merged was v8 instead of v10. This should be
fixed on the latest version.

Regards,
Daniel
--===============7956353088612582231==--

