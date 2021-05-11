Content-Type: multipart/mixed; boundary="===============5035963687327833563=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 1/1] gpiolib: Introduce for_each_gpio_desc() macro
Date: Tue, 11 May 2021 10:22:59 +0300
Message-ID: <YJow03/jdelIoywx@smile.fi.intel.com>
In-Reply-To: <202105110723.VQRv6lJT-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5035963687327833563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 07:36:58AM +0800, kernel test robot wrote:
> Hi Andy,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on gpio/for-next]
> [also build test WARNING on v5.13-rc1 next-20210510]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/gpiolib-=
Introduce-for_each_gpio_desc-macro/20210511-035305
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio=
.git for-next
> config: arm-randconfig-s031-20210510 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://github.com/0day-ci/linux/commit/ceaf41face19ca3a36b81b3=
b866c1708a90cb4e2
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-Introduc=
e-for_each_gpio_desc-macro/20210511-035305
>         git checkout ceaf41face19ca3a36b81b3b866c1708a90cb4e2
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Right, I missed OF part compilation, thanks for reminder, I'll fix my kernel
configuration and the patch in v2.


-- =

With Best Regards,
Andy Shevchenko


--===============5035963687327833563==--

