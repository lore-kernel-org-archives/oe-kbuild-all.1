Content-Type: multipart/mixed; boundary="===============1301149752011310934=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/iommu/rockchip-iommu.c:839:43: error: 'struct dev_archdata' has no member named 'iommu'
Date: Mon, 18 May 2020 14:20:38 +0200
Message-ID: <CAJKOXPfL37pCgMRAv=2iOWjDtW0jeM20FTORvH0MaJRjaDYxVg@mail.gmail.com>
In-Reply-To: <202005160245.q5ILqcLs%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1301149752011310934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 15 May 2020 at 21:00, kbuild test robot <lkp@intel.com> wrote:
>
> Hi Krzysztof,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   051e6b7e34b9bd24f46725f74994a4d3a653966e
> commit: e93a1695d7fb551376b1c1220a267d032b6ad159 iommu: Enable compile te=
sting for some of drivers
> date:   2 months ago
> config: ia64-randconfig-r015-20200515 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout e93a1695d7fb551376b1c1220a267d032b6ad159
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross=
 ARCH=3Dia64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>

Hi all,

I fixed this and Exynos IOMMU compile-test error with the patch here:
https://lore.kernel.org/linux-iommu/20200518120855.27822-1-krzk(a)kernel.or=
g/T/#t

Best regards,
Krzysztof
--===============1301149752011310934==--

