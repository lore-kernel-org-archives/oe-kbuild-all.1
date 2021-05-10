Content-Type: multipart/mixed; boundary="===============3917235560363733882=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 05/10] regulator: IRQ based event/error notification helpers
Date: Mon, 10 May 2021 23:15:29 +0300
Message-ID: <CAHp75VfS4=X9mW9oM+ySQeq-bd+btxD7c9gjSZCztvkvJTpbXQ@mail.gmail.com>
In-Reply-To: <202105110116.2KVffy45-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3917235560363733882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 8:35 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Matti,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on 6efb943b8616ec53a5e444193dccf1af9ad627b5]
>
> url:    https://github.com/0day-ci/linux/commits/Matti-Vaittinen/Extend-r=
egulator-notification-support/20210510-203125
> base:   6efb943b8616ec53a5e444193dccf1af9ad627b5
> config: x86_64-randconfig-a015-20210510 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 4921=
73d42b32cb91d5d0d72d5ed84fcab80d059a)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/904edb46fa37ac86bc1e7a1=
629141e037f45ebed
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Matti-Vaittinen/Extend-regulator=
-notification-support/20210510-203125
>         git checkout 904edb46fa37ac86bc1e7a1629141e037f45ebed
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/regulator/irq_helpers.c:244:4: error: implicit declaration of =
function 'pr_dbg' [-Werror,-Wimplicit-function-declaration]
>                            pr_dbg("Sending regulator notification EVT 0x%=
lx\r\n",
>                            ^
>    1 error generated.

I believe it has to be pr_debug()

-- =

With Best Regards,
Andy Shevchenko
--===============3917235560363733882==--

