Content-Type: multipart/mixed; boundary="===============6571619947830829394=="
MIME-Version: 1.0
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 3/4] nvmem: increase the reference count of a gpio passed over config
Date: Sun, 23 Feb 2020 21:22:18 +0100
Message-ID: <CAMpxmJVmp-=WiNQXu-dQzP+9D5ipv6muSd-auwzeZSV0e9+jgA@mail.gmail.com>
In-Reply-To: <202002221921.euxJGwes%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6571619947830829394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

sob., 22 lut 2020 o 12:54 kbuild test robot <lkp@intel.com> napisa=C5=82(=
a):
>
> Hi Bartosz,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on next-20200221]
> [also build test ERROR on v5.6-rc2]
> [cannot apply to gpio/for-next linus/master v5.6-rc2 v5.6-rc1 v5.5]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/nvme=
m-gpio-fix-resource-management/20200222-054341
> base:    bee46b309a13ca158c99c325d0408fb2f0db207f
> config: sparc-defconfig (attached as .config)
> compiler: sparc-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsparc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/nvmem/core.c: In function 'nvmem_register':
> >> drivers/nvmem/core.c:352:20: error: implicit declaration of function '=
gpiod_ref'; did you mean 'gpiod_get'? [-Werror=3Dimplicit-function-declarat=
ion]
>       nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
>                        ^~~~~~~~~
>                        gpiod_get
>    drivers/nvmem/core.c:352:18: warning: assignment makes pointer from in=
teger without a cast [-Wint-conversion]
>       nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
>                      ^
>    cc1: some warnings being treated as errors
>
> vim +352 drivers/nvmem/core.c
>

Of course I forgot to add the stub...

Will fix in next iteration.

Bart
--===============6571619947830829394==--

