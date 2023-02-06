Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD6E3D92
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675689538; x=1707225538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HohpGFXpd8sqInaQETeKQSNL49fQ19iDzetHQBlu5+U=;
  b=LHKMqzSUlZ4heQS4UdNBpDpjmOGvlljW6fYNU0FVVlmVE+KoqtZa158Z
   FRCXKmUE3i7yONMKchM7pes7+y7U22t9AFxtCwBsq0ivppN/JO/wEbcVe
   peXjPK8Bdz2c0jlFHNcvEdELltj5bnt08H3rxY91Js3KWPDuupaxtbnK1
   yIun8Tf4z7WH3yczyRuak0OetBcxNdKUggVYDHBGc8P0foRKQFDk/kUNy
   Z580RFy9vUKSxMCY8GrVKSb9Arxw8JeK6ISyoL/xal7yLyd9XQzLfx0e0
   D16Sk4tZHImH31Wi5+10/9zwc2vCCMLeugiW6p5tTC666By46zyGk+xOy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="327834904"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327834904"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 05:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="735120751"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="735120751"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2023 05:18:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP1Oa-0002YO-2N;
	Mon, 06 Feb 2023 13:18:56 +0000
Date: Mon, 6 Feb 2023 21:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 4145/20208] drivers/rpmsg/imx_rpmsg.c:371:6:
 warning: no previous prototype for 'imx_rpmsg_restore'
Message-ID: <202302062121.R2rKxyt9-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: dc5690015984c6ba85503e5ead1938de078d38a4 [4145/20208] rpmsg: imx_rpmsg: add partition reset notify
config: arm-randconfig-r046-20230205 (https://download.01.org/0day-ci/archive/20230206/202302062121.R2rKxyt9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/dc5690015984c6ba85503e5ead1938de078d38a4
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout dc5690015984c6ba85503e5ead1938de078d38a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-imx/ drivers/firmware/imx/ drivers/rpmsg/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/rpmsg/imx_rpmsg.c: In function 'rp_find_vq':
   drivers/rpmsg/imx_rpmsg.c:168:39: error: implicit declaration of function 'ioremap_nocache'; did you mean 'ioremap_cache'? [-Werror=implicit-function-declaration]
     168 |         rpvq->addr = (__force void *) ioremap_nocache(virdev->vring[index],
         |                                       ^~~~~~~~~~~~~~~
         |                                       ioremap_cache
   drivers/rpmsg/imx_rpmsg.c: At top level:
>> drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for 'imx_rpmsg_restore' [-Wmissing-prototypes]
     371 | void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
         |      ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
https://github.com/intel/lkp-tests
