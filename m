Content-Type: multipart/mixed; boundary="===============9100444308686762330=="
MIME-Version: 1.0
From: Murphy, Declan <declan.murphy@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [intel-linux-intel-lts:5.4/yocto 15/1142] drivers/crypto/keembay/keembay-ocs-hcu-core.c:218:31: sparse: sparse: Using plain integer as NULL pointer
Date: Tue, 13 Oct 2020 08:35:41 +0000
Message-ID: <DM6PR11MB368994F8EECBCB0497EA9ACDEB040@DM6PR11MB3689.namprd11.prod.outlook.com>
In-Reply-To: <202010131642.km5I6doA-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9100444308686762330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey,

@Alessandrelli, Daniele took over this submission. I'm temporarily on a dif=
ferent project now.

Regards,
Declan

-----Original Message-----
From: lkp <lkp@intel.com> =

Sent: Tuesday, October 13, 2020 9:29 AM
To: Murphy, Declan <declan.murphy@intel.com>
Cc: kbuild-all(a)lists.01.org; Li, Yifan2 <yifan2.li@intel.com>
Subject: [intel-linux-intel-lts:5.4/yocto 15/1142] drivers/crypto/keembay/k=
eembay-ocs-hcu-core.c:218:31: sparse: sparse: Using plain integer as NULL p=
ointer

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   eeb611e5394c56d45c5cc8f7dc484c9f19e93143
commit: 9b07a958f2eb496c88faf0bd749eb600357f4190 [15/1142] crypto: keembay:=
 Add Keem Bay OCS HCU
config: x86_64-randconfig-s021-20201013 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-rc1-dirty
        # https://github.com/intel/linux-intel-lts/commit/9b07a958f2eb496c8=
8faf0bd749eb600357f4190
        git remote add intel-linux-intel-lts https://github.com/intel/linux=
-intel-lts.git
        git fetch --no-tags intel-linux-intel-lts 5.4/yocto
        git checkout 9b07a958f2eb496c88faf0bd749eb600357f4190
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/crypto/keembay/keembay-ocs-hcu-core.c:218:31: sparse: sparse: =

>> Using plain integer as NULL pointer
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:219:31: sparse: sparse: Us=
ing plain integer as NULL pointer
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:749:31: sparse: sparse: Us=
ing plain integer as NULL pointer
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:750:31: sparse: sparse: Us=
ing plain integer as NULL pointer

vim +218 drivers/crypto/keembay/keembay-ocs-hcu-core.c

   202	=

   203	static void kmb_ocs_free_dma_list(struct ocs_hcu_rctx *rctx)
   204	{
   205		struct ocs_hcu_dev *hcu_dev =3D rctx->hcu_dev;
   206		struct device *dev =3D hcu_dev->dev;
   207	=

   208		if (!rctx->dma_list_head || !rctx->dma_list_tail)
   209			return;
   210	=

   211		if (rctx->sg_dma_nents > 0)
   212			dma_unmap_sg(dev, hcu_dev->req->src, rctx->sg_dma_nents,
   213				     DMA_TO_DEVICE);
   214	=

   215		dma_free_coherent(dev, rctx->dma_list_size, rctx->dma_list_head,
   216				  rctx->ll_dma_addr);
   217	=

 > 218		rctx->dma_list_head =3D 0;
   219		rctx->dma_list_tail =3D 0;
   220		rctx->ll_dma_addr =3D 0;
   221	}
   222	=


---
0-DAY CI Kernel Test Service, Intel Corporation https://lists.01.org/hyperk=
itty/list/kbuild-all(a)lists.01.org
--------------------------------------------------------------
Intel Research and Development Ireland Limited
Registered in Ireland
Registered Office: Collinstown Industrial Park, Leixlip, County Kildare
Registered Number: 308263


This e-mail and any attachments may contain confidential material for the s=
ole
use of the intended recipient(s). Any review or distribution by others is
strictly prohibited. If you are not the intended recipient, please contact =
the
sender and delete all copies.

--===============9100444308686762330==--

