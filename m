Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F2142052
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 07:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733297868; cv=none; b=uo4mF6oU6QSEZsRaN+LoQTTwBjl9uwS54j9H3LIcbPcgB1rk/L4BFqSdgJYb86e5tRTgXXJTUBtz4mVzVR9kYm3VTg97VbdIxjzIJOi11zGuz/333lqVtTFD26Xw+eHRvERfoHub70VWVi/cqx7n4Vr7iYZ2Ouw3RcuEFDL8Bdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733297868; c=relaxed/simple;
	bh=ZekHrVG2IL/VJyVRo/4xAPFixUjOll1+f/j7hz32CzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ismHqEFFrVwesha/GK8G5bDLRd2Z8EdQPom2FSKzrb58YZTjyAw68ONkYk917NKrYcVrseg/3I0l2RX2Cs7e0L3c/6vtzbzmXdbIn8Bh5u8om8hmPADjUeJ4A4mwxvgimx6O2RKBJuLSh0p01AgLh7aC4aTXMlc8i13m5rqmiJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEBn5+72; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEBn5+72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733297867; x=1764833867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZekHrVG2IL/VJyVRo/4xAPFixUjOll1+f/j7hz32CzA=;
  b=jEBn5+72/UIoEFaRXNJp1SuoRQgsjB2ikaaCeQ1DI9sjTL1d+S1q4uvG
   8mA1YXP/VoO8dP4s1DJ1fYPjRXGMtnpCkfakMhtwMHSgjit951mWygtso
   M80SKDlUJDhIeaJrFo5Luugurx71yxEmKCHI8EoK8W0u9KmSWWaUwrFeS
   kfDGkhZUwCBNVHl90OZsfZ+H8lDUqcHOqV1fmUPu3DUdO/91pbI5Y8r9b
   SAMuJVdOYFv3cWe7nLjlwyKtfhowsJQj8lXk5YKAKHsUtusG6Lr00TKOv
   HxvLo1Es3r5aQ8lwAV7bMddFG7hrqLZBiw7bfrXf+2o710tqKa1ZqbdzC
   A==;
X-CSE-ConnectionGUID: bL7cq94hSdSncOw9Tafsfw==
X-CSE-MsgGUID: xQ2dO+giTf2Lndt+4hc3Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37208139"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="37208139"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:37:46 -0800
X-CSE-ConnectionGUID: CPFR7nHiQSuy9r2xcJ092A==
X-CSE-MsgGUID: EvIbz6gYSueXyGPM70Oz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94111827"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 23:37:45 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIjx8-0002iD-0k;
	Wed, 04 Dec 2024 07:37:42 +0000
Date: Wed, 4 Dec 2024 15:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1320/1320]
 drivers/nfc/st-nci/i2c.c:295:34: warning: 'of_st_nci_i2c_match' defined but
 not used
Message-ID: <202412041541.cTSYXphC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paulo,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   98beb6bc5000f977169e4f633e450f4e3e9d84d1
commit: 71e217e85c3dff8a9151707ed3afc7b4b054a2d4 [1320/1320] selinux: use kernel linux/socket.h for genheaders and mdp
config: x86_64-buildonly-randconfig-005 (https://download.01.org/0day-ci/archive/20241204/202412041541.cTSYXphC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041541.cTSYXphC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041541.cTSYXphC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nfc/st-nci/i2c.c:295:34: warning: 'of_st_nci_i2c_match' defined but not used [-Wunused-const-variable=]
     295 | static const struct of_device_id of_st_nci_i2c_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
   drivers/nfc/st-nci/i2c.c:288:36: warning: 'st_nci_i2c_acpi_match' defined but not used [-Wunused-const-variable=]
     288 | static const struct acpi_device_id st_nci_i2c_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~


vim +/of_st_nci_i2c_match +295 drivers/nfc/st-nci/i2c.c

ed6a2f3fb770ac drivers/nfc/st-nci/i2c.c   Christophe Ricard 2015-12-23  294  
ed06aeefdac348 drivers/nfc/st-nci/i2c.c   Christophe Ricard 2015-06-09 @295  static const struct of_device_id of_st_nci_i2c_match[] = {
1a94cb6025d49b drivers/nfc/st21nfcb/i2c.c Christophe Ricard 2014-12-08  296  	{ .compatible = "st,st21nfcb-i2c", },
35630df68d6030 drivers/nfc/st21nfcb/i2c.c Christophe Ricard 2014-05-25  297  	{ .compatible = "st,st21nfcb_i2c", },
ed06aeefdac348 drivers/nfc/st-nci/i2c.c   Christophe Ricard 2015-06-09  298  	{ .compatible = "st,st21nfcc-i2c", },
35630df68d6030 drivers/nfc/st21nfcb/i2c.c Christophe Ricard 2014-05-25  299  	{}
35630df68d6030 drivers/nfc/st21nfcb/i2c.c Christophe Ricard 2014-05-25  300  };
ed06aeefdac348 drivers/nfc/st-nci/i2c.c   Christophe Ricard 2015-06-09  301  MODULE_DEVICE_TABLE(of, of_st_nci_i2c_match);
35630df68d6030 drivers/nfc/st21nfcb/i2c.c Christophe Ricard 2014-05-25  302  

:::::: The code at line 295 was first introduced by commit
:::::: ed06aeefdac348cfb91a3db5fe1067e3202afd70 nfc: st-nci: Rename st21nfcb to st-nci

:::::: TO: Christophe Ricard <christophe.ricard@gmail.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
