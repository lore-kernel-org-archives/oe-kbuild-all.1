Content-Type: multipart/mixed; boundary="===============8087873564313623302=="
MIME-Version: 1.0
From: Leon Romanovsky <leonro@nvidia.com>
To: kbuild-all@lists.01.org
Subject: Re: [rdma-rdma:for-next 180/181] drivers/infiniband/core/device.c:1191:14: error: 'struct device' has no member named 'dma_ops'
Date: Sun, 11 Oct 2020 10:19:51 +0300
Message-ID: <20201011071951.GA122054@unreal>
In-Reply-To: <202010110456.X3CeARv9-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8087873564313623302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2020 at 04:14:59AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for=
-next
> head:   b2b6b3d6aeaa7b4d0ab0d6ba0346d1130addcfab
> commit: 6749e64ca932b2ae48495fe63a015e7829b2393b [180/181] RDMA: Explicit=
ly pass in the dma_device to ib_register_device
> config: m68k-randconfig-r001-20201011 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/c=
ommit/?id=3D6749e64ca932b2ae48495fe63a015e7829b2393b
>         git remote add rdma-rdma https://git.kernel.org/pub/scm/linux/ker=
nel/git/rdma/rdma.git
>         git fetch --no-tags rdma-rdma for-next
>         git checkout 6749e64ca932b2ae48495fe63a015e7829b2393b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/infiniband/core/device.c: In function 'setup_dma_device':
> >> drivers/infiniband/core/device.c:1191:14: error: 'struct device' has n=
o member named 'dma_ops'
>     1191 |   device->dev.dma_ops =3D &dma_virt_ops;
>          |              ^
>
> vim +1191 drivers/infiniband/core/device.c
>
>   1179
>   1180	static void setup_dma_device(struct ib_device *device,
>   1181				     struct device *dma_device)
>   1182	{
>   1183		WARN_ON(!IS_ENABLED(CONFIG_DMA_VIRT_OPS) && !dma_device);
>   1184		if (IS_ENABLED(CONFIG_DMA_VIRT_OPS) && !dma_device) {

CONFIG_DMA_VIRT_OPS is not enabled in this .config, so unless this compiler
doesn't understand if ( 0 && !dma_device) construction, it won't possible.
                        const && dynamic

Thanks

>   1185			/*
>   1186			 * If the caller does not provide a DMA capable device then the
>   1187			 * IB device will be used. In this case the caller should fully
>   1188			 * setup the ibdev for DMA. This usually means using
>   1189			 * dma_virt_ops.
>   1190			 */
> > 1191			device->dev.dma_ops =3D &dma_virt_ops;
>   1192			dma_device =3D &device->dev;
>   1193		}
>   1194		device->dma_device =3D dma_device;
>   1195		WARN_ON(!device->dma_device->dma_parms);
>   1196	}
>   1197
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============8087873564313623302==--

