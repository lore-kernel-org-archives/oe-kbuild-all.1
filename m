Content-Type: multipart/mixed; boundary="===============6419659743475236217=="
MIME-Version: 1.0
From: Alex Williamson <alex.williamson@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.4.y 5600/6105] drivers/vfio/vfio_iommu_type1.c:366:22: error: implicit declaration of function 'pte_write'
Date: Thu, 06 May 2021 14:17:18 -0600
Message-ID: <20210506141718.705147be@redhat.com>
In-Reply-To: <20210506141221.75f293de@redhat.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6419659743475236217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 6 May 2021 14:12:21 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Thu, 6 May 2021 23:51:51 +0800
> kernel test robot <lkp@intel.com> wrote:
> =

> > Hi Jason,
> > =

> > First bad commit (maybe !=3D root cause):
> > =

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git linux-5.4.y
> > head:   73e74400c797af9bc645d41cfd350b15e3e52d2c
> > commit: 3c57ea09365f4a6b32568b8ba6b98ae7d238cb0d [5600/6105] vfio: IOMM=
U_API should be selected
> > config: arm-randconfig-r014-20210506 (attached as .config)
> > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f=
5a2a5836cc8e4c1def2bdeb022e7b496623439)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-rc.git/commit/?id=3D3c57ea09365f4a6b32568b8ba6b98ae7d238cb0d
> >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/l=
inux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc linux-5.4.y
> >         git checkout 3c57ea09365f4a6b32568b8ba6b98ae7d238cb0d
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 ARCH=3Darm =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>):
> >   =

> > >> drivers/vfio/vfio_iommu_type1.c:366:22: error: implicit declaration =
of function 'pte_write' [-Werror,-Wimplicit-function-declaration]    =

> >            if (write_fault && !pte_write(*ptep))
> >                                ^  =

> > >> drivers/vfio/vfio_iommu_type1.c:369:10: error: implicit declaration =
of function 'pte_pfn' [-Werror,-Wimplicit-function-declaration]    =

> >                    *pfn =3D pte_pfn(*ptep);
> >                           ^
> >    drivers/vfio/vfio_iommu_type1.c:369:10: note: did you mean 'put_pfn'?
> >    drivers/vfio/vfio_iommu_type1.c:327:12: note: 'put_pfn' declared here
> >    static int put_pfn(unsigned long pfn, int prot)
> >               ^  =

> > >> drivers/vfio/vfio_iommu_type1.c:371:2: error: implicit declaration o=
f function 'pte_unmap' [-Werror,-Wimplicit-function-declaration]    =

> >            pte_unmap_unlock(ptep, ptl);
> >            ^
> >    include/linux/mm.h:1988:2: note: expanded from macro 'pte_unmap_unlo=
ck'
> >            pte_unmap(pte);                                 \
> >            ^
> >    3 errors generated.  =

> =

> =

> We need to fit in an MMU dependency for VFIO_IOMMU_TYPE1.  The IOMMU_API
> dependency for vfio itself is real.  We could just turn everything off
> for MMU (who really cares?) but theoretically VFIO_NOIOMMU support
> could be used in some weird way with !MMU.  If VFIO tries to select
> something whose dependency isn't met we get Kconfig errors, so I think
> the right answer is:
> =

> diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
> index 9dc95024afae..2c3baeabf094 100644
> --- a/drivers/vfio/Kconfig
> +++ b/drivers/vfio/Kconfig
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VFIO_IOMMU_TYPE1
>  	tristate
> -	depends on VFIO
> -	default n
> +	depends on VFIO && MMU
> +	default VFIO if (X86 || S390 || ARM || ARM64)
>  =

>  config VFIO_IOMMU_SPAPR_TCE
>  	tristate
> @@ -22,7 +22,6 @@ config VFIO_VIRQFD
>  menuconfig VFIO
>  	tristate "VFIO Non-Privileged userspace driver framework"
>  	select IOMMU_API
> -	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM || ARM64)
>  	help
>  	  VFIO provides a framework for secure userspace device drivers.
>  	  See Documentation/driver-api/vfio.rst for more details.
> =

> Better options?  Thanks,

D'oh, we already fixed this in b2b12db53507 ("vfio: Depend on MMU").  I
sort of like the above better, but I'll forward the existing commit to
stable.  Thanks,

Alex

--===============6419659743475236217==--

