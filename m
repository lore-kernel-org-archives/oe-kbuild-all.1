Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633EC257D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693492439; x=1725028439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LI40EcHEKmvtuyfZdYKoSFh6H+UrQu6ItxApUaJI4ig=;
  b=h+lqpFsUuWhGqJfskIgIIK9KCgSrKdlfg7NhuS14affw9/m+58VxeK6F
   BZtZkchMaPE+VKhQbuQMyo+3gkGmg4t/L4/GjVoL/y0e+mPY2yZjOBWML
   lAyX4v3cbHnhFYCJI5podppl7PvY0x5/K8mXh4kP1MD966tFQNsLC7nON
   Co7/ziYl0xgcBRvxDSrCCM4RMRYOJV+QBLc0CGylqL3pPY7Qx22seh3mL
   JoJC/00D11p1XX0LgFJtL8f12ATjAWko/m9TwyMbxMm4oJb1aM62FtZgj
   qcWWhwnw8zB6Eu+8BraktcPXJTgHnRUwLO9POd9PKOQC1wCpD+OtsgoEi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356274417"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="356274417"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854308004"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="854308004"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2023 07:33:52 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbik2-0000FB-2T;
	Thu, 31 Aug 2023 14:33:50 +0000
Date: Thu, 31 Aug 2023 22:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4145/24604]
 drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for function
 'imx_rpmsg_restore'
Message-ID: <202308312242.f395cuQO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robin,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: dc5690015984c6ba85503e5ead1938de078d38a4 [4145/24604] rpmsg: imx_rpmsg: add partition reset notify
config: riscv-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312242.f395cuQO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312242.f395cuQO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312242.f395cuQO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rpmsg/imx_rpmsg.c:163:9: error: implicit declaration of function 'kmalloc' [-Werror,-Wimplicit-function-declaration]
     163 |         rpvq = kmalloc(sizeof(*rpvq), GFP_KERNEL);
         |                ^
   drivers/rpmsg/imx_rpmsg.c:163:7: error: incompatible integer to pointer conversion assigning to 'struct imx_rpmsg_vq_info *' from 'int' [-Wint-conversion]
     163 |         rpvq = kmalloc(sizeof(*rpvq), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/imx_rpmsg.c:168:32: error: implicit declaration of function 'ioremap_nocache' [-Werror,-Wimplicit-function-declaration]
     168 |         rpvq->addr = (__force void *) ioremap_nocache(virdev->vring[index],
         |                                       ^
   drivers/rpmsg/imx_rpmsg.c:203:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
     203 |         kfree(rpvq);
         |         ^
   drivers/rpmsg/imx_rpmsg.c:216:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
     216 |                 kfree(rpvq);
         |                 ^
   drivers/rpmsg/imx_rpmsg.c:307:22: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
     307 |                         rpdev->ivdev[i] = kzalloc(sizeof(struct imx_virdev),
         |                                           ^
   drivers/rpmsg/imx_rpmsg.c:307:20: error: incompatible integer to pointer conversion assigning to 'struct imx_virdev *' from 'int' [-Wint-conversion]
     307 |                         rpdev->ivdev[i] = kzalloc(sizeof(struct imx_virdev),
         |                                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     308 |                                                         GFP_KERNEL);
         |                                                         ~~~~~~~~~~~
   drivers/rpmsg/imx_rpmsg.c:378:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
     378 |                 kfree(rpdev->ivdev[i]);
         |                 ^
>> drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for function 'imx_rpmsg_restore' [-Wmissing-prototypes]
     371 | void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
         |      ^
   drivers/rpmsg/imx_rpmsg.c:371:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     371 | void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
         | ^
         | static 
   1 warning and 8 errors generated.


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
