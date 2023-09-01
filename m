Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DC5AD27
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693580204; x=1725116204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKg29T6gU7vQHHd5pfl+zmQk/nbpNqHhwwQUplxNNjk=;
  b=FwZOttJJeNM4223ZdeO7Xpwxf/Aafzqno/A5TEnFDl4MJ5Pxc9GBcSZS
   CJ8qYQ5Iar8uRFjKfxMiNW5RlR7gK7uSmTTF8Ro+zrpxdqkNhH7TDhRA0
   Kdx/wFt6BqeKqq+capF/32FESuU/wOZUfzJp2S/QSBAtHxk7K6C6eDG5E
   voLBcdivm9dqPylkprWfIp5iaW2WprR5CZ6rXshKKfIf3HjT4xt87LSmU
   JutZoZvlGb2CSZXI73RIY9rf7w2XRWTeajsV+rcEUDhuJOj2H9SckZuRz
   JW9uUTYcIGPhE1qjMMxFsHR6gYIQNmAbB9WgMQ/qrNvE3AdRi6yHF1gxI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442634829"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="442634829"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 07:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070774389"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="1070774389"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2023 07:56:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc5Zg-0001Nx-1Y;
	Fri, 01 Sep 2023 14:56:40 +0000
Date: Fri, 1 Sep 2023 22:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 1380/24603]
 drivers/gpu/drm/imx/mhdp/cdns-mhdp-imxdrv.c:218:12: warning:
 'cdns_mhdp_imx_resume' defined but not used
Message-ID: <202309012208.2YNv1Z4X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: f6fe76f7a0b9359ddc6649608339f0fd2d40eb8f [1380/24603] drm: imx: Add mhdp dp/hdmi driver for imx8x platform
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309012208.2YNv1Z4X-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012208.2YNv1Z4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012208.2YNv1Z4X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/mhdp/cdns-mhdp-imxdrv.c:218:12: warning: 'cdns_mhdp_imx_resume' defined but not used [-Wunused-function]
     218 | static int cdns_mhdp_imx_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/mhdp/cdns-mhdp-imxdrv.c:209:12: warning: 'cdns_mhdp_imx_suspend' defined but not used [-Wunused-function]
     209 | static int cdns_mhdp_imx_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/cdns_mhdp_imx_resume +218 drivers/gpu/drm/imx/mhdp/cdns-mhdp-imxdrv.c

   208	
 > 209	static int cdns_mhdp_imx_suspend(struct device *dev)
   210	{
   211		struct imx_mhdp_device *imx_mhdp = dev_get_drvdata(dev);
   212	
   213		cdns_mhdp_plat_call(&imx_mhdp->mhdp, suspend);
   214	
   215		return 0;
   216	}
   217	
 > 218	static int cdns_mhdp_imx_resume(struct device *dev)
   219	{
   220		struct imx_mhdp_device *imx_mhdp = dev_get_drvdata(dev);
   221	
   222		cdns_mhdp_plat_call(&imx_mhdp->mhdp, resume);
   223	
   224		return 0;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
