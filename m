Content-Type: multipart/mixed; boundary="===============4539728246517444115=="
MIME-Version: 1.0
From: chenxiang (M) <chenxiang66@hisilicon.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] base:power:sysfs: Remove redundant attribute runtime_status in runtime_attrs
Date: Fri, 22 May 2020 11:18:23 +0800
Message-ID: <63c077bb-53a2-c41e-bd94-9dcbd224f39c@hisilicon.com>
In-Reply-To: <202005212049.sWN89Bjc%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4539728246517444115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

OK, please ignore the patch.

=E5=9C=A8 2020/5/21 21:05, kbuild test robot =E5=86=99=E9=81=93:
> Hi chenxiang,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on pm/linux-next]
> [also build test WARNING on pavel-linux-leds/for-next v5.7-rc6 next-20200=
519]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/chenxiang/base-power-sys=
fs-Remove-redundant-attribute-runtime_status-in-runtime_attrs/20200521-1731=
30
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it linux-next
> config: arm-eseries_pxa_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Darm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> In file included from drivers/base/power/sysfs.c:3:
> include/linux/device.h:132:26: warning: 'dev_attr_runtime_status' defined=
 but not used [-Wunused-variable]
> 132 |  struct device_attribute dev_attr_##_name =3D __ATTR_RO(_name)
> |                          ^~~~~~~~~
>>> drivers/base/power/sysfs.c:177:8: note: in expansion of macro 'DEVICE_A=
TTR_RO'
> 177 | static DEVICE_ATTR_RO(runtime_status);
> |        ^~~~~~~~~~~~~~
>
> vim +/DEVICE_ATTR_RO +177 drivers/base/power/sysfs.c
>
> 0fcb4eef829449 Alan Stern      2010-07-08  176
> 47acbd77e6e481 Andy Shevchenko 2017-11-10 @177  static DEVICE_ATTR_RO(run=
time_status);
> 15bcb91d7e607d Alan Stern      2010-09-25  178
>
> :::::: The code at line 177 was first introduced by commit
> :::::: 47acbd77e6e481abf2f41d3a99cb3762f296b2e6 PM / sysfs: Convert to us=
e DEVICE_ATTR_RO / DEVICE_ATTR_RW
>
> :::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> :::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============4539728246517444115==--

