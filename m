Content-Type: multipart/mixed; boundary="===============6201145286038436367=="
MIME-Version: 1.0
From: Hans de Goede <hdegoede@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-platform-drivers-x86:review-hans 37/38] drivers/platform/x86/firmware_attributes_class.c:16:5: warning: no previous prototype for function 'fw_attributes_class_get'
Date: Thu, 27 May 2021 19:31:59 +0200
Message-ID: <5072c1b5-e9a0-321b-fb7d-6c647643b86e@redhat.com>
In-Reply-To: <202105272347.ko0CMhYf-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6201145286038436367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On 5/27/21 5:44 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-dr=
ivers-x86.git review-hans
> head:   9972d91cd41540a1890435034b62653c98da4261
> commit: 8535b9dea34f00781758999285cea8ab82bb0a2f [37/38] platform/x86: de=
ll-wmi-sysman: Use firmware_attributes_class helper
> config: x86_64-randconfig-r032-20210527 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 6505=
c630407c5feec818f0bb1c284f9eeebf2071)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-=
drivers-x86.git/commit/?id=3D8535b9dea34f00781758999285cea8ab82bb0a2f
>         git remote add linux-platform-drivers-x86 https://git.kernel.org/=
pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>         git fetch --no-tags linux-platform-drivers-x86 review-hans
>         git checkout 8535b9dea34f00781758999285cea8ab82bb0a2f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>>> drivers/platform/x86/firmware_attributes_class.c:16:5: warning: no prev=
ious prototype for function 'fw_attributes_class_get' [-Wmissing-prototypes]
>    int fw_attributes_class_get(struct class **fw_attr_class)
>        ^
>    drivers/platform/x86/firmware_attributes_class.c:16:1: note: declare '=
static' if the function is not intended to be used outside of this translat=
ion unit
>    int fw_attributes_class_get(struct class **fw_attr_class)
>    ^
>    static =

>>> drivers/platform/x86/firmware_attributes_class.c:35:5: warning: no prev=
ious prototype for function 'fw_attributes_class_put' [-Wmissing-prototypes]
>    int fw_attributes_class_put(void)
>        ^
>    drivers/platform/x86/firmware_attributes_class.c:35:1: note: declare '=
static' if the function is not intended to be used outside of this translat=
ion unit
>    int fw_attributes_class_put(void)
>    ^
>    static =

>    2 warnings generated.


Let me decode these arcane warnings for you :)

These warnings are being issues because there is no previous prototype decl=
aration for these functions; and this is caused by drivers/platform/x86/fir=
mware_attributes_class.c missing an:

#include "firmware_attributes_class.h"

If you add that to the discussed v5 of this series then these warning shoul=
d go away.

Regards,

Hans

--===============6201145286038436367==--

