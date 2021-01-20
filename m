Content-Type: multipart/mixed; boundary="===============7703329560272779665=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/3] rtc: remove sirfsoc driver
Date: Wed, 20 Jan 2021 22:02:54 +0100
Message-ID: <CAK8P3a3+4Fne_5AqZxDXUQOrfrj5va-1H2kbPmiskz7DTVnLyw@mail.gmail.com>
In-Reply-To: <202101210459.p6Rxwrm5-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7703329560272779665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 9:36 PM kernel test robot <lkp@intel.com> wrote:
>
>
> url:    https://github.com/0day-ci/linux/commits/Arnd-Bergmann/rtc-remove=
-obsolete-drivers/20210120-235148
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.gi=
t rtc-next
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/ffcefa0774c608b57d5ea42=
9ad445201d2d2aea7
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Arnd-Bergmann/rtc-remove-obsolet=
e-drivers/20210120-235148
>         git checkout ffcefa0774c608b57d5ea429ad445201d2d2aea7
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/arm/mach-prima2/pm.c:17:10: fatal error: linux/rtc/sirfsoc_rtciob=
rg.h: No such file or directory
>       17 | #include <linux/rtc/sirfsoc_rtciobrg.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.

I was aware that removing this header would break some configurations,
as the three
files including it are removed in different maintainer trees.

As this breaks the 'defconfig' build, maybe I should remove the header
in the patch
that removes the platform rather than the rtc driver, as the other
drivers won't be
built without the platform (except for compile-testing).

        Arnd
--===============7703329560272779665==--

