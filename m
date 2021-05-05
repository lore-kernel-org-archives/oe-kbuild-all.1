Content-Type: multipart/mixed; boundary="===============1019044442449937579=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 5/6] drm/vmwgfx: Add basic support for SVGA3
Date: Wed, 05 May 2021 16:23:07 +0800
Message-ID: <202105051616.l8IfI5q2-lkp@intel.com>
In-Reply-To: <20210505035740.286923-6-zackr@vmware.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1019044442449937579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master next-20210505]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-=
drm/drm/tegra/for-next drm/drm-next v5.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zack-Rusin/drm-vmwgfx-SVGA=
-v3-and-arm64-support/20210505-120026
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-s021-20210505 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/4acf63c8eca79f6073ada0994=
b0e2a03c8fcfb71
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-vmwgfx-SVGA-v3-and-=
arm64-support/20210505-120026
        git checkout 4acf63c8eca79f6073ada0994b0e2a03c8fcfb71
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D=
1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:718:28: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected unsigned int [u=
sertype] *rmmio @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:718:28: sparse:     expected unsigne=
d int [usertype] *rmmio
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:718:28: sparse:     got void [nodere=
f] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c: note: in included file (through dri=
vers/gpu/drm/vmwgfx/vmwgfx_kms.h):
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_irq.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
--
>> drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:105:24: sparse: sparse: Using plain =
integer as NULL pointer
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:674:33: sparse: sparse: Using plain =
integer as NULL pointer
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c: note: in included file (through dri=
vers/gpu/drm/vmwgfx/vmwgfx_kms.h):
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_fence.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const [nod=
eref] __iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     expected void co=
nst [noderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:683:48: sparse:     got unsigned int=
 [usertype] *
--
   drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: note: in included file:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse: sparse: incorrect ty=
pe in argument 2 (different address spaces) @@     expected void [noderef] =
__iomem * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     expected void [n=
oderef] __iomem *
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:668:50: sparse:     got unsigned int=
 [usertype] *

vim +718 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c

   692	=

   693	static int vmw_setup_pci_resources(struct vmw_private *dev,
   694					   unsigned long pci_id)
   695	{
   696		resource_size_t rmmio_start;
   697		resource_size_t rmmio_size;
   698		resource_size_t fifo_start;
   699		resource_size_t fifo_size;
   700		int ret;
   701		struct pci_dev *pdev =3D to_pci_dev(dev->drm.dev);
   702	=

   703		pci_set_master(pdev);
   704	=

   705		ret =3D pci_request_regions(pdev, "vmwgfx probe");
   706		if (ret)
   707			return ret;
   708	=

   709		dev->pci_id =3D pci_id;
   710		if (pci_id =3D=3D VMWGFX_PCI_ID_SVGA3) {
   711			rmmio_start =3D pci_resource_start(pdev, 0);
   712			rmmio_size =3D pci_resource_len(pdev, 0);
   713			dev->vram_start =3D pci_resource_start(pdev, 2);
   714			dev->vram_size =3D pci_resource_len(pdev, 2);
   715	=

   716			DRM_INFO("Register MMIO at 0x%pa size is %llu kiB\n",
   717				 &rmmio_start, (uint64_t)rmmio_size / 1024);
 > 718			dev->rmmio =3D devm_ioremap(dev->drm.dev,
   719						  rmmio_start,
   720						  rmmio_size);
   721			if (IS_ERR(dev->rmmio)) {
   722				DRM_ERROR("Failed mapping registers mmio memory.\n");
   723				pci_release_regions(pdev);
   724				return PTR_ERR(dev->rmmio);
   725			}
   726		} else if (pci_id =3D=3D VMWGFX_PCI_ID_SVGA2) {
   727			dev->io_start =3D pci_resource_start(pdev, 0);
   728			dev->vram_start =3D pci_resource_start(pdev, 1);
   729			dev->vram_size =3D pci_resource_len(pdev, 1);
   730			fifo_start =3D pci_resource_start(pdev, 2);
   731			fifo_size =3D pci_resource_len(pdev, 2);
   732	=

   733			DRM_INFO("FIFO at %pa size is %llu kiB\n",
   734				 &fifo_start, (uint64_t)fifo_size / 1024);
   735			dev->fifo_mem =3D devm_memremap(dev->drm.dev,
   736						      fifo_start,
   737						      fifo_size,
   738						      MEMREMAP_WB);
   739	=

   740			if (IS_ERR(dev->fifo_mem)) {
   741				DRM_ERROR("Failed mapping FIFO memory.\n");
   742				pci_release_regions(pdev);
   743				return PTR_ERR(dev->fifo_mem);
   744			}
   745		} else {
   746			pci_release_regions(pdev);
   747			return -EINVAL;
   748		}
   749	=

   750		/*
   751		 * This is approximate size of the vram, the exact size will only
   752		 * be known after we read SVGA_REG_VRAM_SIZE. The PCI resource
   753		 * size will be equal to or bigger than the size reported by
   754		 * SVGA_REG_VRAM_SIZE.
   755		 */
   756		DRM_INFO("VRAM at %pa size is %llu kiB\n",
   757			 &dev->vram_start, (uint64_t)dev->vram_size / 1024);
   758	=

   759		return 0;
   760	}
   761	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1019044442449937579==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
NNvpzhBv/8Wr3sujxu62/wOwdmyg2isCAA==
--===============1019044442449937579==--

