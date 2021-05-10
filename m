Content-Type: multipart/mixed; boundary="===============5110036426162928961=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 05/10] regulator: IRQ based event/error notification helpers
Date: Mon, 10 May 2021 23:20:17 +0300
Message-ID: <CAHp75Vfw+5R-qN+iGC4hYSbL6phOoSZ7nuNsyroQPODxEmMaNA@mail.gmail.com>
In-Reply-To: <202105110342.Oembupaq-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5110036426162928961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:46 PM kernel test robot <lkp@intel.com> wrote:
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
> config: i386-randconfig-s002-20210510 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://github.com/0day-ci/linux/commit/904edb46fa37ac86bc1e7a1=
629141e037f45ebed
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Matti-Vaittinen/Extend-regulator=
-notification-support/20210510-203125
>         git checkout 904edb46fa37ac86bc1e7a1629141e037f45ebed
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=
=3D1 ARCH=3Di386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/kernel.h:12,
>                     from arch/x86/include/asm/percpu.h:27,
>                     from arch/x86/include/asm/current.h:6,
>                     from include/linux/sched.h:12,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from drivers/regulator/irq_helpers.c:10:
>    drivers/regulator/irq_helpers.c: In function 'regulator_notifier_isr':
>    include/linux/bitops.h:35:2: warning: this 'for' clause does not guard=
... [-Wmisleading-indentation]
>       35 |  for ((bit) =3D find_first_bit((addr), (size));  \
>          |  ^~~
>    drivers/regulator/irq_helpers.c:242:3: note: in expansion of macro 'fo=
r_each_set_bit'
>      242 |   for_each_set_bit(j, &stat->notifs, BITS_PER_TYPE(stat->notif=
s))
>          |   ^~~~~~~~~~~~~~~~
>    drivers/regulator/irq_helpers.c:244:4: note: ...this statement, but th=
e latter is misleadingly indented as if it were guarded by the 'for'


Seems like missed {}

Matti, there is a serious question: how had you tested this...
(besides obvious compilation error)
Perhaps you have to fix your process somewhere to avoid missing important s=
teps?

-- =

With Best Regards,
Andy Shevchenko
--===============5110036426162928961==--

