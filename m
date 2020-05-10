Content-Type: multipart/mixed; boundary="===============8123105509049552194=="
MIME-Version: 1.0
From: Leon Romanovsky <leon@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH for-next 2/2] RDMA/efa: Report host information to the device
Date: Sun, 10 May 2020 18:11:02 +0300
Message-ID: <20200510151102.GC199306@unreal>
In-Reply-To: <2b98035f-aa55-1b11-7012-fddca885ba4f@amazon.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8123105509049552194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2020 at 05:40:21PM +0300, Gal Pressman wrote:
> On 10/05/2020 16:42, kbuild test robot wrote:
> > Hi Gal,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on rdma/for-next]
> > [also build test ERROR on v5.7-rc4 next-20200508]
> > [if your patch is applied to the wrong git tree, please drop us a note =
to help
> > improve the system. BTW, we also suggest to use '--base' option to spec=
ify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/3=
7406982]
> >
> > url:    https://github.com/0day-ci/linux/commits/Gal-Pressman/EFA-host-=
information/20200510-200519
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git f=
or-next
> > config: riscv-allyesconfig (attached as .config)
> > compiler: riscv64-linux-gcc (GCC) 9.3.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cro=
ss ARCH=3Driscv
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/infiniband/hw/efa/efa_main.c: In function 'efa_set_host_info=
':
> >>> drivers/infiniband/hw/efa/efa_main.c:214:21: error: 'LINUX_VERSION_CO=
DE' undeclared (first use in this function)
> >      214 |  hinf->kernel_ver =3D LINUX_VERSION_CODE;
> >          |                     ^~~~~~~~~~~~~~~~~~
> >    drivers/infiniband/hw/efa/efa_main.c:214:21: note: each undeclared i=
dentifier is reported only once for each function it appears in
> >
> > vim +/LINUX_VERSION_CODE +214 drivers/infiniband/hw/efa/efa_main.c
> >
> >    190
> >    191	static void efa_set_host_info(struct efa_dev *dev)
> >    192	{
> >    193		struct efa_admin_set_feature_resp resp =3D {};
> >    194		struct efa_admin_set_feature_cmd cmd =3D {};
> >    195		struct efa_admin_host_info *hinf;
> >    196		u32 bufsz =3D sizeof(*hinf);
> >    197		dma_addr_t hinf_dma;
> >    198
> >    199		if (!efa_com_check_supported_feature_id(&dev->edev,
> >    200							EFA_ADMIN_HOST_INFO))
> >    201			return;
> >    202
> >    203		/* Failures in host info set shall not disturb probe */
> >    204		hinf =3D dma_alloc_coherent(&dev->pdev->dev, bufsz, &hinf_dma,
> >    205					  GFP_KERNEL);
> >    206		if (!hinf)
> >    207			return;
> >    208
> >    209		strlcpy(hinf->os_dist_str, utsname()->release,
> >    210			min(sizeof(hinf->os_dist_str), sizeof(utsname()->release)));
> >    211		hinf->os_type =3D EFA_ADMIN_OS_LINUX;
> >    212		strlcpy(hinf->kernel_ver_str, utsname()->version,
> >    213			min(sizeof(hinf->kernel_ver_str), sizeof(utsname()->version)));
> >  > 214		hinf->kernel_ver =3D LINUX_VERSION_CODE;
> >    215		EFA_SET(&hinf->bdf, EFA_ADMIN_HOST_INFO_BUS, dev->pdev->bus->nu=
mber);
> >    216		EFA_SET(&hinf->bdf, EFA_ADMIN_HOST_INFO_DEVICE,
> >    217			PCI_SLOT(dev->pdev->devfn));
> >    218		EFA_SET(&hinf->bdf, EFA_ADMIN_HOST_INFO_FUNCTION,
> >    219			PCI_FUNC(dev->pdev->devfn));
> >    220		EFA_SET(&hinf->spec_ver, EFA_ADMIN_HOST_INFO_SPEC_MAJOR,
> >    221			EFA_COMMON_SPEC_VERSION_MAJOR);
> >    222		EFA_SET(&hinf->spec_ver, EFA_ADMIN_HOST_INFO_SPEC_MINOR,
> >    223			EFA_COMMON_SPEC_VERSION_MINOR);
> >    224		EFA_SET(&hinf->flags, EFA_ADMIN_HOST_INFO_INTREE, 1);
> >    225
> >    226		efa_com_set_feature_ex(&dev->edev, &resp, &cmd, EFA_ADMIN_HOST_=
INFO,
> >    227				       hinf_dma, bufsz);
> >    228
> >    229		dma_free_coherent(&dev->pdev->dev, bufsz, hinf, hinf_dma);
> >    230	}
> >    231
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> >
>
> Thanks robot, I'm missing an #include <linux/version.h> in efa_main.c.

I'm not so sure that you can use that header.
You need to use "#include <generated/utsrelease.h>" instead of
LINUX_VERSION.

Thanks
--===============8123105509049552194==--

