Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9242131A94
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713102094; cv=none; b=sL5RjtmbEOeEepXtEP1YfYgZLq4ZldjYEl0ITltize34+Z4GCmMh/Je9ULoGmqgGlxtN7/OfpUFAaUOewOtO+MwjA6JRftRp8JWWM2eDtnNwG5+H0h4m9ilnOx87UAw5hG0CqImQtFsrifii8kzxBEg/A/ufXRM3h70e2QERO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713102094; c=relaxed/simple;
	bh=V6SuNjxDvzVI6Vz2E2CyX8+MWgSbGWe2t/G4WAOapyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8fujLw4gSTSt0mhDyT92mXTYeXOkEfnTd/OehmIosfVQm1jB7NOvwGzriwRm3Hc1f5pbQve7ck6mF9pAJoMIcChmazpRJdmsZrXNrr7CYmfUUc0zLFSxtkRulT7Ewe2EcfcIVmXTWWhLPtR/KvzYLqFJCeG8yPxcoqZ5KwZOMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V65f9ALF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V65f9ALF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713102092; x=1744638092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V6SuNjxDvzVI6Vz2E2CyX8+MWgSbGWe2t/G4WAOapyA=;
  b=V65f9ALFkEmd24AAjjfPlVUxSP6i5SBWJPZmcq5gaGYhmgO833csgjJr
   zjdT41ggi8jCliYBxPluxg7zv1xtcHUc/s3UmcrRBGm6zzhg1flsYtLMz
   Sh8dXD04aDFCYKLZx81sGGVgkk40iAVVNGP6k3Z/h3y+V7parCXdMiO3I
   H1cOTWBB4i/QkMMiHam+XEUigN5wkadOm3WCTtoERBMwU9a/8gHBegjOr
   VKva/pmwEj2uon6REYRVnfnnpuU1GBB3s7Dabct2t53mEY+fwZiDIdP5h
   85X8Q0ELfDYo3MDQzHeKiB1pizirQMkBNAefN8f5q0j8idhnmdP6Of/FI
   Q==;
X-CSE-ConnectionGUID: Y+n0ZldRRh+DFXHKW125Nw==
X-CSE-MsgGUID: SkEEG5CEQfiryfdyfwkTHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="12341529"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="12341529"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 06:41:31 -0700
X-CSE-ConnectionGUID: 80S6buD5T4uBAC+fef/jig==
X-CSE-MsgGUID: uqTlUHYcQoGi32p7J9ULhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="26084753"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2024 06:41:29 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rw06o-0003cq-2J;
	Sun, 14 Apr 2024 13:41:26 +0000
Date: Sun, 14 Apr 2024 21:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Duanqiang Wen <duanqiangwen@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18207/30000]
 drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2877: multiple definition of
 `fmgr_cmd_op';
 drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_type.h:3165:
 first defined here
Message-ID: <202404142149.v0MRewcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4134526a9cfd552230ec7a66a1738a9066d9a0c6
commit: 3ddd74dceeba1f4ea8b20db59276ea3c6eded3d5 [18207/30000] openeuler: net: txgbe: Fix some known bugs, merge net-swift txgbe-1.2.3 out-of-tree
config: x86_64-randconfig-123-20240414 (https://download.01.org/0day-ci/archive/20240414/202404142149.v0MRewcl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404142149.v0MRewcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404142149.v0MRewcl-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `wr32':
>> drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2877: multiple definition of `fmgr_cmd_op'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_type.h:3165: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `wr32':
>> drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2877: multiple definition of `fmgr_usr_cmd_op'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_type.h:3165: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `wr32':
>> drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2877: multiple definition of `flash_erase_chip'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_type.h:3165: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `flash_erase_sector':
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2377: multiple definition of `flash_erase_sector'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2891: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `wr32':
>> drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2877: multiple definition of `flash_write_dword'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_type.h:3165: first defined here


vim +2877 drivers/net/ethernet/netswift/ngbe/ngbe_type.h

a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2873  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2874  static inline void
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2875  wr32(struct ngbe_hw *hw, u32 reg, u32 val)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2876  {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01 @2877  	u8 __iomem *base = READ_ONCE(hw->hw_addr);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2878  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2879  	if (unlikely(!base))
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2880  		return;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2881  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2882  	ngbe_wr32(base + reg, val);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2883  }
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2884  

:::::: The code at line 2877 was first introduced by commit
:::::: a5961b4bc6ce09a70902686ecc848a47493a9251 openeuler: net: ngbe: add ngbe module support

:::::: TO: Duanqiang Wen <duanqiangwen@net-swift.com>
:::::: CC: Duanqiang Wen <duanqiangwen@net-swift.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
