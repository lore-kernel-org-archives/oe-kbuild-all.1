Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE97210EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN0do5Or"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697454567; x=1728990567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGfhBly6a/9fvK4Yg/XdknymXT3zCojde5lhCbocZoI=;
  b=QN0do5OrCJiJiTUZb7S9eoAsFesHRZhGLULQqLCnrz1PBUtWFEtuk2Wa
   pGjUG7IJ6rNxlt3v4rJ0xUxsdlRcK6mmDCgU6f/r/2o05g1esMV1VL+Ez
   g0UTF8SIi2SK3mwPlnUiWw4QPd3xRBKGLMN31ub9qaVF79MYJcCa3Lkci
   dz43M7cnAc6tSFvMQQoa2tvlM8TbxKV7IHwBPNWsWbtq0NaDGOfp8ZAs0
   sgLBiDSqVHssQtynjl4yJVP9ipk5xs/avWxs7irI+LFdLIywJJYnLYhNA
   XXDL756u4lKVgEKeQGoTcBZT5xefTOJnPSt+yoWjt1tnl/9NWBbmXnimj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364853970"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="364853970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 04:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3585536"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2023 04:09:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsLTP-0008Jb-1d;
	Mon, 16 Oct 2023 11:09:23 +0000
Date: Mon, 16 Oct 2023 19:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 7474/30000]
 drivers/spi/spi-nxp-fspi.c:1153:5: warning: no previous declaration for
 'nxp_fspi_runtime_suspend'
Message-ID: <202310161924.QzaLBtZG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 2c4cf9ce2fcf9581d6625025b76ae73f77dde922 [7474/30000] MLK-23644: spi: spi-nxp-fspi: enable runtime pm for fspi
config: i386-buildonly-randconfig-001-20231016 (https://download.01.org/0day-ci/archive/20231016/202310161924.QzaLBtZG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161924.QzaLBtZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161924.QzaLBtZG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-nxp-fspi.c:1153:5: warning: no previous declaration for 'nxp_fspi_runtime_suspend' [-Wmissing-declarations]
    int nxp_fspi_runtime_suspend(struct device *dev)
        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-nxp-fspi.c:1162:5: warning: no previous declaration for 'nxp_fspi_runtime_resume' [-Wmissing-declarations]
    int nxp_fspi_runtime_resume(struct device *dev)
        ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INPUT_POLLDEV
   Depends on [n]: !UML && INPUT [=n]
   Selected by [m]:
   - MXC_MMA8451 [=m] && HWMON [=m] && I2C [=y]


vim +/nxp_fspi_runtime_suspend +1153 drivers/spi/spi-nxp-fspi.c

  1151	
  1152	
> 1153	int nxp_fspi_runtime_suspend(struct device *dev)
  1154	{
  1155		struct nxp_fspi *f = dev_get_drvdata(dev);
  1156	
  1157		nxp_fspi_clk_disable_unprep(f);
  1158	
  1159		return 0;
  1160	}
  1161	
> 1162	int nxp_fspi_runtime_resume(struct device *dev)
  1163	{
  1164		struct nxp_fspi *f = dev_get_drvdata(dev);
  1165	
  1166		nxp_fspi_clk_prep_enable(f);
  1167	
  1168		if (nxp_fspi_initialized(f) && nxp_fspi_need_reinit(f))
  1169			nxp_fspi_default_setup(f);
  1170	
  1171		return 0;
  1172	}
  1173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
