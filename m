Content-Type: multipart/mixed; boundary="===============6957306235533531813=="
MIME-Version: 1.0
From: Alex Williamson <alex.williamson@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [vfio:next 19/27] drivers/vfio/fsl-mc/vfio_fsl_mc.c:189:36: error: 'FSL_MC_REGION_CACHEABLE' undeclared
Date: Mon, 12 Oct 2020 16:21:57 -0600
Message-ID: <20201012162157.532edd5f@w520.home>
In-Reply-To: <202010130507.H3A1OKjq-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6957306235533531813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


While I'm a little surprise to see an i386 build pulling in
vfio_fsl_mc, I see that CONFIG_FSL_MC_BUS does enable compile testing
on various other archs.  I assume therefore that this is just the lack
of the necessary fsl-bus series to enable the vfio_fsl_mc driver.
Both should be present in the next linux-next tree and I'm aware to
send my pull request after GregKH's to get the ordering of these
correct in mainline.  Please let me know if there are any other
concerns from anyone.  Thanks,

Alex


On Tue, 13 Oct 2020 05:59:09 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://github.com/awilliam/linux-vfio.git next
> head:   2099363255f123f6c9abcfa8531bbec65a8f1820
> commit: 67247289688d49a610a956c23c4ff032f0281845 [19/27] vfio/fsl-mc: All=
ow userspace to MMAP fsl-mc device MMIO regions
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/awilliam/linux-vfio/commit/67247289688d49a61=
0a956c23c4ff032f0281845
>         git remote add vfio https://github.com/awilliam/linux-vfio.git
>         git fetch --no-tags vfio next
>         git checkout 67247289688d49a610a956c23c4ff032f0281845
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
> >> drivers/vfio/fsl-mc/vfio_fsl_mc.c:189:36: error: 'FSL_MC_REGION_CACHEA=
BLE' undeclared (first use in this function)  =

>      189 |  region_cacheable =3D (region.type & FSL_MC_REGION_CACHEABLE) =
&&
>          |                                    ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c:189:36: note: each undeclared identi=
fier is reported only once for each function it appears in
> >> drivers/vfio/fsl-mc/vfio_fsl_mc.c:190:22: error: 'FSL_MC_REGION_SHAREA=
BLE' undeclared (first use in this function)  =

>      190 |       (region.type & FSL_MC_REGION_SHAREABLE);
>          |                      ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_bus_notifi=
er':
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c:256:9: error: 'struct fsl_mc_device'=
 has no member named 'driver_override'
>      256 |   mc_dev->driver_override =3D kasprintf(GFP_KERNEL, "%s",
>          |         ^~
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c:258:14: error: 'struct fsl_mc_device=
' has no member named 'driver_override'
>      258 |   if (!mc_dev->driver_override)
>          |              ^~
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_init_devic=
e':
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c:295:8: error: implicit declaration o=
f function 'dprc_setup' [-Werror=3Dimplicit-function-declaration]
>      295 |  ret =3D dprc_setup(mc_dev);
>          |        ^~~~~~~~~~
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c:301:8: error: implicit declaration o=
f function 'dprc_scan_container' [-Werror=3Dimplicit-function-declaration]
>      301 |  ret =3D dprc_scan_container(mc_dev, false);
>          |        ^~~~~~~~~~~~~~~~~~~
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c:310:2: error: implicit declaration o=
f function 'dprc_remove_devices' [-Werror=3Dimplicit-function-declaration]
>      310 |  dprc_remove_devices(mc_dev, NULL, 0);
>          |  ^~~~~~~~~~~~~~~~~~~
>    drivers/vfio/fsl-mc/vfio_fsl_mc.c:311:2: error: implicit declaration o=
f function 'dprc_cleanup' [-Werror=3Dimplicit-function-declaration]
>      311 |  dprc_cleanup(mc_dev);
>          |  ^~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> =

> vim +/FSL_MC_REGION_CACHEABLE +189 drivers/vfio/fsl-mc/vfio_fsl_mc.c
> =

>    174	=

>    175	static int vfio_fsl_mc_mmap_mmio(struct vfio_fsl_mc_region region,
>    176					 struct vm_area_struct *vma)
>    177	{
>    178		u64 size =3D vma->vm_end - vma->vm_start;
>    179		u64 pgoff, base;
>    180		u8 region_cacheable;
>    181	=

>    182		pgoff =3D vma->vm_pgoff &
>    183			((1U << (VFIO_FSL_MC_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
>    184		base =3D pgoff << PAGE_SHIFT;
>    185	=

>    186		if (region.size < PAGE_SIZE || base + size > region.size)
>    187			return -EINVAL;
>    188	=

>  > 189		region_cacheable =3D (region.type & FSL_MC_REGION_CACHEABLE) &&
>  > 190				   (region.type & FSL_MC_REGION_SHAREABLE);  =

>    191		if (!region_cacheable)
>    192			vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
>    193	=

>    194		vma->vm_pgoff =3D (region.addr >> PAGE_SHIFT) + pgoff;
>    195	=

>    196		return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
>    197				       size, vma->vm_page_prot);
>    198	}
>    199	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6957306235533531813==--

