Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE24101F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyhBVUHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697229281; x=1728765281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CyJ78mKeVK3n6tU678ytDb/6VjTwyq3Mnd7Y8wamQ+o=;
  b=MyhBVUHnJRU41C3m3q2QdJlg19GopGAxg3MB9cMD9iA668lpzUplm5T1
   UX5NVRrhNQitIxsXDlfZZNiDlKvWFKNpOjNAgpo2rQHq9WLkEtl2Tc40o
   W4q7XLFZJnYtrwofoYWY9l18lKcpS4sxGa+eZTDz9nRyPKXBHwA4qRpy7
   3LJlduGA2eSw/Vw734wO8kJxwyYQMbbXMgzIhfTS0Z4xR+QnkPvQMmX/H
   lCBazsKzgG0GC9sPeuH9qZ+HOkOw+fJwwHDJeohL4GBr1CLGLEKgd7oGM
   Mwt6EeqjwOwkmRE2RzMD1Z+0N6vk3H93F4ndyLPJXRN1P8+B26sSxqCqc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364622743"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364622743"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 13:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825188228"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="825188228"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2023 13:34:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrOrh-0005MH-01;
	Fri, 13 Oct 2023 20:34:33 +0000
Date: Sat, 14 Oct 2023 04:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 1380/24603]
 drivers/gpu/drm/imx/mhdp/cdns-mhdp-imxdrv.c:218:12: warning:
 'cdns_mhdp_imx_resume' defined but not used
Message-ID: <202310140456.T3l3hByr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandor,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: f6fe76f7a0b9359ddc6649608339f0fd2d40eb8f [1380/24603] drm: imx: Add mhdp dp/hdmi driver for imx8x platform
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140456.T3l3hByr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140456.T3l3hByr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140456.T3l3hByr-lkp@intel.com/

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
