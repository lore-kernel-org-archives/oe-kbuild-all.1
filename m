Content-Type: multipart/mixed; boundary="===============1144117231032396516=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/mux/adgs1408.c:112:34: warning: unused variable 'adgs1408_of_match'
Date: Wed, 20 May 2020 15:03:26 +0300
Message-ID: <CAHp75VcwekGU3bQDWkaTmLE8SPU7NZoUY6Es9Fy8oG5E=LT81A@mail.gmail.com>
In-Reply-To: <202005201042.yjSO10j2%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1144117231032396516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 5:23 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Chris,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   115a54162a6c0d0ef2aef25ebd0b61fc5e179ebe
> commit: e9e40543ad5b38b848879768359fd13650529961 spi: Add generic SPI mul=
tiplexer
> date:   3 months ago
> config: x86_64-randconfig-r022-20200519 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 135b=
877874fae96b4372c8a3fbfaa8ff44ff86e3)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout e9e40543ad5b38b848879768359fd13650529961
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>

Fix has been submitted:
https://lore.kernel.org/lkml/20200520120122.67528-1-andriy.shevchenko(a)lin=
ux.intel.com/T/#u

-- =

With Best Regards,
Andy Shevchenko
--===============1144117231032396516==--

