Content-Type: multipart/mixed; boundary="===============3026395786687960630=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 4/4] gpio: dwapb: Remove unneeded has_irq member in struct dwapb_port_property
Date: Wed, 13 May 2020 13:22:46 +0300
Message-ID: <20200513102246.GL185537@smile.fi.intel.com>
In-Reply-To: <202005130651.mJCyUboB%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3026395786687960630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 06:53:09AM +0800, kbuild test robot wrote:
> Hi Andy,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on gpio/for-next]
> [also build test ERROR on next-20200512]
> [cannot apply to linus/master v5.7-rc5]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/gpio-dwa=
pb-avoid-error-message-for-optional-IRQ/20200513-025227
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio=
.git for-next
> config: x86_64-randconfig-a003-20200512 (attached as .config)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> drivers/mfd/intel_quark_i2c_gpio.c: In function 'intel_quark_gpio_setup':
> >> drivers/mfd/intel_quark_i2c_gpio.c:219:19: error: 'struct dwapb_port_p=
roperty' has no member named 'has_irq'
> pdata->properties->has_irq =3D true;
> ^~

Indeed. I have that removed by other WIP patch in my tree.
Thanks!

-- =

With Best Regards,
Andy Shevchenko


--===============3026395786687960630==--

