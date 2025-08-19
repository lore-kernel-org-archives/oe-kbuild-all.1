Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D993054E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755642017; cv=none; b=VyWuDuvhFwqzxDUZTtVMaj3OoElo67HzktLDQLN8X1gTkdec51yAsn3gXbf148y1dsZBVQnoOFDuU0PIOh9YV9KPNH9HB5mvAkDeu9eRdtEyAYOLnPr3gSGJ7jTQF6H2/+YMjIVe+iUIbaU3rD9NqBFkGhDH0VK281z+tmCeJvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755642017; c=relaxed/simple;
	bh=ake1IfeJD0E2u3mq9Ad6psVAdzJKUHclD4oKkMUnFus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XC8hJ/x+mWjdEfA94eOIcNzG20cEm9SsQTk7t/Emjt6uqVp+HWP97moNGgSfzM9YipRDydSfkgY4M6ZwzDy1FLOpFSbrXgLPYff4OCNVpGveNO1awNuwnfqJPkY7iEIXmwd2ae8GPDYEX5DO1LE0JfpT/VwW5hmbbW0xHr3buRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDsmVsth; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDsmVsth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755642015; x=1787178015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ake1IfeJD0E2u3mq9Ad6psVAdzJKUHclD4oKkMUnFus=;
  b=kDsmVsthI3FYz7v/jJxCAL9anZU5hyNg/cO90G37T7HJLMrzbdYEsgVb
   EIKX/deF5mg5lFvfHY3e/vTEvWdnyYcs5H0OisuBqWo7rBYf2YtmAyElf
   lZcuBWOsDd04y1r+uiJy2Xci/Z/kksLBauBg9e26PQKWRG9BWUwbBqVqw
   VY7mUB7vNTTbWw0uPiV5vVVJDBDG6UK2tk7SSaR+aZjAGrCaX1jM5Y3PW
   RumdtlOEta1+/SLLLx7K9z+tAppYsAxWy/VOyZIiJ+Vo+/OTI83FCtZHf
   Qf/S73sbA+Qxifw5dJWXMiJ8KdyEnDQFQGs/OQx6ZuSfFyTjgcoF1+G1k
   w==;
X-CSE-ConnectionGUID: VdN1qjbSTk6QBdkL7aQ/lA==
X-CSE-MsgGUID: T9O7xFh7SfaLXkX72fSPCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="56928173"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="56928173"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 15:20:15 -0700
X-CSE-ConnectionGUID: adWyrbNMSFumFaRM7v+vqg==
X-CSE-MsgGUID: HUPPe13XRNquNPaoEeskMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="198959864"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 19 Aug 2025 15:20:14 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoUgd-0001N9-2Z;
	Tue, 19 Aug 2025 22:20:11 +0000
Date: Wed, 20 Aug 2025 00:19:43 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2695/2695]
 drivers/i2c/busses/i2c-zhaoxin.c:526:12: warning: 'zxi2c_resume' defined but
 not used
Message-ID: <202508200026.Fmho995C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   41dcfa1c2607635577b73ad0317ad80729e58c1e
commit: 7d6424d8bc9f404652b44c12a5c0b6f52521d514 [2695/2695] Add support for Zhaoxin I2C controller
config: x86_64-randconfig-2003-20250819 (https://download.01.org/0day-ci/archive/20250820/202508200026.Fmho995C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508200026.Fmho995C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508200026.Fmho995C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-zhaoxin.c:526:12: warning: 'zxi2c_resume' defined but not used [-Wunused-function]
     526 | static int zxi2c_resume(struct device *dev)
         |            ^~~~~~~~~~~~


vim +/zxi2c_resume +526 drivers/i2c/busses/i2c-zhaoxin.c

   525	
 > 526	static int zxi2c_resume(struct device *dev)
   527	{
   528		struct zxi2c *i2c = dev_get_drvdata(dev);
   529	
   530		iowrite8(ZXI2C_CR_MST_RST, i2c->base + ZXI2C_REG_CR);
   531		zxi2c_set_bus_speed(i2c);
   532	
   533		return 0;
   534	}
   535	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
