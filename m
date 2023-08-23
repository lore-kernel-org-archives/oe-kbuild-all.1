Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA0C1F17F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 23:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692832755; x=1724368755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oqdLz16z5FUDJ+pOmvArCKaGaToUC+xviwqtDmQ4HOk=;
  b=kkRQTLp31VzeR2J649/QmYylrbhCfT0M0UorzdxeEYrsGxiGyexvOBrJ
   rQKnkhDMeU13jZV7tQAKEkEODhYIZL2j9bYpEHX2nP1amVx9P4P6mR8nC
   ztm2KYjGqS7ZF2ciDCZEwZU8XS8Z0w43fdxsuIMq2Yixra6cbJsPa3uLX
   1Q5mNz0s9cY95pHMUEHSorddRTiBEH96Nag2atlHJA+5MZcWmH3VW3R/w
   BtNEvGvCbuzVGX1uHAiJfPvOXH/bTMFwNV2WsgajzHELwMbXQ1fPdR1kO
   RsvmO6rb2v1BBzAvbn6c0/Bq4p9hhNaJPhVhmv39cs2eXRr/uWXyD7xT6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353842474"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="353842474"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 16:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="686645167"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="686645167"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Aug 2023 16:19:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYx7z-0001Zo-06;
	Wed, 23 Aug 2023 23:19:07 +0000
Date: Thu, 24 Aug 2023 07:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 336/382]
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1228:12: warning:
 'ti_csi2rx_resume' defined but not used
Message-ID: <202308240728.ZHlbEwXm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: ecd7c87edbb4d5100a3554580caa04d83bb639e8 [336/382] media: ti: j721e-csi2rx: Add system suspend/resume hooks
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230824/202308240728.ZHlbEwXm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240728.ZHlbEwXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240728.ZHlbEwXm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1228:12: warning: 'ti_csi2rx_resume' defined but not used [-Wunused-function]
    1228 | static int ti_csi2rx_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1212:12: warning: 'ti_csi2rx_suspend' defined but not used [-Wunused-function]
    1212 | static int ti_csi2rx_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1074:45: warning: 'ti_csi2rx_video_entity_ops' defined but not used [-Wunused-const-variable=]
    1074 | static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ti_csi2rx_resume +1228 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

  1210	
  1211	#ifdef CONFIG_PM
> 1212	static int ti_csi2rx_suspend(struct device *dev)
  1213	{
  1214		struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
  1215		int i;
  1216	
  1217		for (i = 0; i < csi->num_ctx; i++) {
  1218			/* Stop any on-going streams */
  1219			writel(0, csi->shim + SHIM_DMACNTX(csi->ctx[i].idx));
  1220		}
  1221	
  1222		/* Assert the pixel reset. */
  1223		writel(0, csi->shim + SHIM_CNTL);
  1224	
  1225		return 0;
  1226	}
  1227	
> 1228	static int ti_csi2rx_resume(struct device *dev)
  1229	{
  1230		struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
  1231		unsigned int reg;
  1232	
  1233		reg = SHIM_CNTL_PIX_RST;
  1234		writel(reg, csi->shim + SHIM_CNTL);
  1235	
  1236		return 0;
  1237	}
  1238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
