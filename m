Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9532614D444
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 23:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739834145; cv=none; b=txgzV4GhqPyPDLzWDciPa8c4ndB9BXIrolrl0EPJUW71LOhOGikQnbfq4vF7nzZMYep5nd+XJI7DzVln/pls5nYU+qSUToobT387FJLFBy5hBY1TOoW7a/CpK2Ewp+o8IwGtMRzZRp2FmW9cFmH4hxdwybS+l2iV436Zkmx2lV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739834145; c=relaxed/simple;
	bh=IncK4zWNukW6v8Jz9Av1Txset5cjZcjvUqnT9/F89u4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GBUD1YU+7Zb5X1nFpCATw+IwfLEulEDHfBbrTYSz1g1qKkwv2R6j2SlLsn8b137wH0lj69PPxACGVhJ2qQ/Gqqrne5ZCRKek/VJP7hgsih9+1UbXLGUQmYqgwKrEkGoVJLAr5Z8ttenCfWkC4X4gasAElL1VwKq1pt81TTE0v1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtfYRY/P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtfYRY/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739834144; x=1771370144;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IncK4zWNukW6v8Jz9Av1Txset5cjZcjvUqnT9/F89u4=;
  b=OtfYRY/PhyLF4mKCmTKiKBQ/Cqogj69dS7sjJlAWtSNF+0qr+ayYhXwN
   02+O2M2rHHUk36ROviCq1vT+vzDs3CbUuSF3Xwp+6k2DvABmSv1nUrIv7
   y8UOBE0+QcAFxyqr+Le4xzrWeH36a2SUHbQjqN0fD4EzehKU4bZU/2wam
   6vyHghabA7CkL0IMv/34EuVMGsR3kSouqAQXW1J0W5orYLGujkDUbAN2C
   wkLhWdiUElF7dr7gcMmW66R8ozuuZPVEohatD5bbTSib93v7wGflnrxV2
   RusIjRTwM5T4ijviaA8m6WilvKcx2kvJrBAtftZD5tIGy4uuP2T9hc3bJ
   g==;
X-CSE-ConnectionGUID: B2JdPpdATOWgvGiFYD/Qhw==
X-CSE-MsgGUID: K6LAC1/2ReOAmOLRUlisxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43350873"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="43350873"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 15:15:42 -0800
X-CSE-ConnectionGUID: pfJphXbMSk2/fz7YmMOMrQ==
X-CSE-MsgGUID: vDt4bD9EQr6H/GYyMzGyWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151422933"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2025 15:15:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkAKw-001Dfn-1e
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 23:15:38 +0000
Date: Tue, 18 Feb 2025 07:15:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/phy/ti/phy-am654-serdes.c:249:13:
 warning: no previous prototype for 'serdes_am654_xlate'
Message-ID: <202502180705.i5BaiMtP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 71e2f5c5c2249db05dd26b787b56c45f2a890740 [1/1] phy: ti: Add a new SERDES driver for TI's AM654x SoC
config: x86_64-buildonly-randconfig-005-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180705.i5BaiMtP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180705.i5BaiMtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180705.i5BaiMtP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/ti/phy-am654-serdes.c:249:13: warning: no previous prototype for 'serdes_am654_xlate' [-Wmissing-prototypes]
     249 | struct phy *serdes_am654_xlate(struct device *dev, struct of_phandle_args
         |             ^~~~~~~~~~~~~~~~~~


vim +/serdes_am654_xlate +249 drivers/phy/ti/phy-am654-serdes.c

   248	
 > 249	struct phy *serdes_am654_xlate(struct device *dev, struct of_phandle_args
   250					 *args)
   251	{
   252		struct serdes_am654 *am654_phy;
   253		struct phy *phy;
   254		int ret;
   255	
   256		phy = of_phy_simple_xlate(dev, args);
   257		if (IS_ERR(phy))
   258			return phy;
   259	
   260		am654_phy = phy_get_drvdata(phy);
   261		if (am654_phy->busy)
   262			return ERR_PTR(-EBUSY);
   263	
   264		ret = mux_control_select(am654_phy->control, args->args[1]);
   265		if (ret) {
   266			dev_err(dev, "Failed to select SERDES Lane Function\n");
   267			return ERR_PTR(ret);
   268		}
   269	
   270		am654_phy->busy = true;
   271		am654_phy->type = args->args[0];
   272	
   273		return phy;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
