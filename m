Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E14A1845
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 04:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DALge2CU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702787721; x=1734323721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pIACoxFzaMg84Z4Zq/um3BDR46c447Ue/060gyijJrQ=;
  b=DALge2CUJRY7B9tbVrvs36fzYKSRxueFZ/BObBZpaGc9uhXkgdkjgM11
   c+/IivbU7KjaBZcHhEef546233X3xo2SdNP09QkY/db3zCY6Iv2hJ2tS3
   4g/xufPOVh0SumQWbYJA8zRqDTqdv/AAxbwybTkj0u3EZ0Ui9L8Ow1iD4
   bhX5t+bVeMIJOpE0hG2cxbp/KWgksydp8Qi43A6KQy50ok1p8rayLAdGc
   lnrBZRKpLvFPDgJI4joebvpymEONQYzl7P+DpBoHpoSs9h8KNIZuj3EbQ
   RLerfWRrmtuEtHzYHff1rZE+cL75Lbnht0t2/3npvFZX/+vbAZHzNf+6X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="398186546"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="398186546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:35:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="23320653"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2023 20:35:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEis1-0002e0-0l;
	Sun, 17 Dec 2023 04:35:17 +0000
Date: Sun, 17 Dec 2023 12:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3711/16025]
 drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for function
 'imx_rpmsg_restore'
Message-ID: <202312171245.sDsJZmZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: db5db070c122a704997c0bc8468cee33a8c9fca5 [3711/16025] rpmsg: imx_rpmsg: add partition reset notify
config: i386-buildonly-randconfig-004-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171245.sDsJZmZu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171245.sDsJZmZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171245.sDsJZmZu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rpmsg/imx_rpmsg.c:168:32: error: call to undeclared function 'ioremap_nocache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           rpvq->addr = (__force void *) ioremap_nocache(virdev->vring[index],
                                         ^
   drivers/rpmsg/imx_rpmsg.c:168:32: note: did you mean 'ioremap_cache'?
   arch/x86/include/asm/io.h:178:22: note: 'ioremap_cache' declared here
   extern void __iomem *ioremap_cache(resource_size_t offset, unsigned long size);
                        ^
>> drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for function 'imx_rpmsg_restore' [-Wmissing-prototypes]
   void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
        ^
   drivers/rpmsg/imx_rpmsg.c:371:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
   ^
   static 
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +/imx_rpmsg_restore +371 drivers/rpmsg/imx_rpmsg.c

   369	
   370	#ifdef CONFIG_IMX_SCU
 > 371	void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
   372	{
   373		int i;
   374		int vdev_nums = rpdev->vdev_nums;
   375	
   376		for (i = 0; i < vdev_nums; i++) {
   377			unregister_virtio_device(&rpdev->ivdev[i]->vdev);
   378			kfree(rpdev->ivdev[i]);
   379		}
   380	
   381		/* Make a double check that remote processor is ready or not */
   382		for (i = 0; i < REMOTE_READY_WAIT_MAX_RETRIES; i++) {
   383			if (rpdev->flags & REMOTE_IS_READY)
   384				break;
   385			udelay(100);
   386		}
   387		if (unlikely((rpdev->flags & REMOTE_IS_READY) == 0)) {
   388			pr_err("Wait for remote ready timeout, assume it's dead.\n");
   389			/*
   390			 * In order to make the codes to be robust and back compatible.
   391			 * When wait remote ready timeout, use the MU_SendMessageTimeout
   392			 * to send the first kick-off message when register the vdev.
   393			 */
   394			rpdev->first_notify = rpdev->vdev_nums;
   395		}
   396	
   397		/* Allocate and setup ivdev again to register virtio devices */
   398		if (set_vring_phy_buf(rpdev->pdev, rpdev, rpdev->vdev_nums))
   399			pr_err("No vring buffer.\n");
   400	
   401		for (i = 0; i < vdev_nums; i++) {
   402			rpdev->ivdev[i]->vdev.id.device = VIRTIO_ID_RPMSG;
   403			rpdev->ivdev[i]->vdev.config = &imx_rpmsg_config_ops;
   404			rpdev->ivdev[i]->vdev.dev.parent = &rpdev->pdev->dev;
   405			rpdev->ivdev[i]->vdev.dev.release = imx_rpmsg_vproc_release;
   406			rpdev->ivdev[i]->base_vq_id = i * 2;
   407			rpdev->ivdev[i]->rpdev = rpdev;
   408	
   409			if (register_virtio_device(&rpdev->ivdev[i]->vdev))
   410				pr_err("%s failed to register rpdev.\n", __func__);
   411		}
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
