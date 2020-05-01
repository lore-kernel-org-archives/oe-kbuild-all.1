Content-Type: multipart/mixed; boundary="===============8320812131832099347=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/4] counter: Internalize sysfs interface code
Date: Fri, 01 May 2020 16:20:57 +0800
Message-ID: <202005011619.Tn2f4rMl%lkp@intel.com>
In-Reply-To: <d84f0bb3258d1664e90da64d75f787829c50a9bd.1588176662.git.vilhelm.gray@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8320812131832099347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi William,

I love your patch! Perhaps something to improve:

[auto build test WARNING on stm32/stm32-next]
[cannot apply to linus/master linux/master v5.7-rc3 next-20200430]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/William-Breathitt-Gray/Int=
roduce-the-Counter-character-device-interface/20200430-051734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git s=
tm32-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/counter/104-quad-8.c:700:56: sparse: sparse: mixing different en=
um types:
>> drivers/counter/104-quad-8.c:700:56: sparse:    unsigned int enum counte=
r_count_function
>> drivers/counter/104-quad-8.c:700:56: sparse:    unsigned int enum quad8_=
count_function
--
>> drivers/counter/stm32-lptimer-cnt.c:573:24: sparse: sparse: mixing diffe=
rent enum types:
>> drivers/counter/stm32-lptimer-cnt.c:573:24: sparse:    unsigned int enum=
 counter_count_function
>> drivers/counter/stm32-lptimer-cnt.c:573:24: sparse:    unsigned int enum=
 stm32_lptim_cnt_function

vim +700 drivers/counter/104-quad-8.c

   693	=

   694	static int quad8_function_write(struct counter_device *counter,
   695					struct counter_count *count,
   696					enum counter_count_function function)
   697	{
   698		struct quad8_iio *const priv =3D counter->priv;
   699		const int id =3D count->id;
 > 700		const enum quad8_count_function cnt_function =3D function;
   701		unsigned int *const quadrature_mode =3D priv->quadrature_mode + id;
   702		unsigned int *const scale =3D priv->quadrature_scale + id;
   703		unsigned int mode_cfg =3D priv->count_mode[id] << 1;
   704		unsigned int *const synchronous_mode =3D priv->synchronous_mode + i=
d;
   705		const unsigned int idr_cfg =3D priv->index_polarity[id] << 1;
   706		const int base_offset =3D priv->base + 2 * id + 1;
   707	=

   708		if (cnt_function =3D=3D QUAD8_COUNT_FUNCTION_PULSE_DIRECTION) {
   709			*quadrature_mode =3D 0;
   710	=

   711			/* Quadrature scaling only available in quadrature mode */
   712			*scale =3D 0;
   713	=

   714			/* Synchronous function not supported in non-quadrature mode */
   715			if (*synchronous_mode) {
   716				*synchronous_mode =3D 0;
   717				/* Disable synchronous function mode */
   718				outb(QUAD8_CTR_IDR | idr_cfg, base_offset);
   719			}
   720		} else {
   721			*quadrature_mode =3D 1;
   722	=

   723			switch (cnt_function) {
   724			case QUAD8_COUNT_FUNCTION_QUADRATURE_X1:
   725				*scale =3D 0;
   726				mode_cfg |=3D QUAD8_CMR_QUADRATURE_X1;
   727				break;
   728			case QUAD8_COUNT_FUNCTION_QUADRATURE_X2:
   729				*scale =3D 1;
   730				mode_cfg |=3D QUAD8_CMR_QUADRATURE_X2;
   731				break;
   732			case QUAD8_COUNT_FUNCTION_QUADRATURE_X4:
   733				*scale =3D 2;
   734				mode_cfg |=3D QUAD8_CMR_QUADRATURE_X4;
   735				break;
   736			default: return -EINVAL;
   737			}
   738		}
   739	=

   740		/* Load mode configuration to Counter Mode Register */
   741		outb(QUAD8_CTR_CMR | mode_cfg, base_offset);
   742	=

   743		return 0;
   744	}
   745	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8320812131832099347==--

