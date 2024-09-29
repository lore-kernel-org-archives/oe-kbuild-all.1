Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68003AD51
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 03:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727582054; cv=none; b=alRNoV0vtIQ4gWOZRNiyrhnmzS0m9hoact5FmPsipDhx1vBgi367i/MN1GXAqe+0gT3zg9L0Z8zedHUQtRv7ghJoVjRDHK1H9oKB4tb+frcDIKJJ1iSM9U3Y9mqU6ny2yquab1z5qEDHO+P5KRq6hEVGvDCYjLUze+nJppLxZoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727582054; c=relaxed/simple;
	bh=G4vAtUEMTHBPleN38QhYhMfEi5fc0JxhQQURNilatdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Outkaqfgh95JiINHihqIb7V+uoOz1fsap6VO3AgrV19EAdyrG4YhX5UB2L7aFnIt9ANpOAcZ0ijsMecI+wyaeI+D3gtXHeixvb2arbaVBOLZSCv2ZIC2CqFXHuesNbBLIkzaN1/hsL1Dsa1/I5vYhb4WDMp4E0Eb2cJDAmTJXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/7+ZujW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/7+ZujW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727582052; x=1759118052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G4vAtUEMTHBPleN38QhYhMfEi5fc0JxhQQURNilatdg=;
  b=W/7+ZujWr44f25yYSshWzBz+ufWoOHRr5VZDtS+mdmTuhv4joPfN1gWQ
   rzOq8X6fVXMPw2MMImxfWDnxsQPGEhLJSFTIjeSoHIYAtVf5E6ZhiH904
   NIj39kAEbayVi/GHcKPGHnoQSONOOtELMTpoeLybOMttPxZSGxzJ4+Zsl
   VjbIfsxyoN5ksbef4FgotfDygMT3QJiDD46QlXWAR87GJSB0RDnf2w7W1
   yHZUO3h2f1vUAaGDlHvGT57NKvqNlmXQjTh8XgF7LCDoD/hZXsn7KqKRT
   AdkLZE0v+/HChbUF4stTq5Cqs6VjOS7b17XeQUkLn0I84bAuLTpzg5tqZ
   w==;
X-CSE-ConnectionGUID: 2gQOkq8SRvuNVTmj/8ojxQ==
X-CSE-MsgGUID: 2xIz2o+jRYyvlggDID/rXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37827280"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="37827280"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 20:54:11 -0700
X-CSE-ConnectionGUID: XpbRllHGQSW1oJgzurO+sQ==
X-CSE-MsgGUID: QXGY56UGQ8CtXjJ+WjfOXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73091911"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Sep 2024 20:54:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sul0a-000NsF-1l;
	Sun, 29 Sep 2024 03:54:08 +0000
Date: Sun, 29 Sep 2024 11:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2631/16788]
 drivers/i2c/busses/i2c-imx.c:1628:12: warning: 'i2c_imx_resume' defined but
 not used
Message-ID: <202409291109.gVaqKPhN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 66c0769b6ca8d3397c85672c9bc1ac97ff3004ff [2631/16788] MLK-11403: I2C: imx: restore pin setting for i2c
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291109.gVaqKPhN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291109.gVaqKPhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291109.gVaqKPhN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx.c:1628:12: warning: 'i2c_imx_resume' defined but not used [-Wunused-function]
    1628 | static int i2c_imx_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-imx.c:1622:12: warning: 'i2c_imx_suspend' defined but not used [-Wunused-function]
    1622 | static int i2c_imx_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/i2c_imx_resume +1628 drivers/i2c/busses/i2c-imx.c

  1621	
> 1622	static int i2c_imx_suspend(struct device *dev)
  1623	{
  1624		pinctrl_pm_select_sleep_state(dev);
  1625		return 0;
  1626	}
  1627	
> 1628	static int i2c_imx_resume(struct device *dev)
  1629	{
  1630		pinctrl_pm_select_default_state(dev);
  1631		return 0;
  1632	}
  1633	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
