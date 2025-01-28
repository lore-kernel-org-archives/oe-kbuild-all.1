Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467F819CC05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738060289; cv=none; b=suxYfLThom2DZ2HbZst9JkcSbLzkOrIP36fMnpNtmFe1473VwY2oF+zcB4AyCN1wJ48eW0B9GYnFuOLfrkT63Z0643V9RY1fRtHI89fjOXaC87y8Sdbm8744GYO8RmK8PrnZ6274wTBVdBuAGdBBX+8O3QyZHUaLilfaz89Iu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738060289; c=relaxed/simple;
	bh=So8GXP99DdAbU40kc22TDuMd1PaAadSCbJy0AHRK3sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JV+z8ZGVilVizoabD+/Jm5ZAd7VcdJhSsfouiDezoQhKc1RztbmWGBStFBeSK9aCGsrEJSWrcfMB5+4DQYnakiTFQW8ZiJ4dX2ie0PQM4iyz8qDn1pOn1k1ugsggbEfIc4+AqQYtPuVNPnO9vE8fdkTkSsYM1ldzXQ/irh1/SWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8Nx6aTP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8Nx6aTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738060287; x=1769596287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=So8GXP99DdAbU40kc22TDuMd1PaAadSCbJy0AHRK3sY=;
  b=X8Nx6aTPYaVAJBjNicEbeK0UDT+8AjA0wAPFmzvgNvJxkcw/tLiwjKLm
   AwZMhUVtifVBRNGbLqgvSiiZzdy0es/cTYPVWvJXg+nhZfbCTMHEuz/uF
   NQx620yrVY2LH37JPkHybwiJHBCc8yENcmHhDKBnk9G2LQuTmv+z7a98C
   Fbw/hjdVYhVECBBqGC0z9zpffCTldLvChhGCCoaeZP3acZUgsJ55+TQjQ
   SASYU7LMLRU6RDEMJ3jfKRxm0qWo4i5YVyspehzMUsFw3FoYnJxlyCjsq
   13MZtg+1EFbpRSaqnQ3YP4LyLVqW20GiPhfNVWhhNhjVjD2wC1XPki5r4
   A==;
X-CSE-ConnectionGUID: kMw6g/F3TFGuGPlTfR6tfA==
X-CSE-MsgGUID: qBqCTO/GREyr+v7Z3ONdTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37741865"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="37741865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 02:31:27 -0800
X-CSE-ConnectionGUID: c2wV0cyRQDmjV5+DbwfKpQ==
X-CSE-MsgGUID: FbAnicASRQCom+5MeR4v0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113828084"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Jan 2025 02:31:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcisN-000hfr-1E;
	Tue, 28 Jan 2025 10:31:23 +0000
Date: Tue, 28 Jan 2025 18:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/110-smc 34/34]
 drivers/platform/apple/smc_rtkit.c:339:20: error: initialization of 'void
 (*)(void *)' from incompatible pointer type 'void (*)(void *, const void *,
 size_t)' {aka 'void (*)(void *, const void *, long unsigned int)'}
Message-ID: <202501281839.eYxxaddy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   0ed7dc5d1ba9b369d2c62f651704f71e8bf91a3c
commit: 0ed7dc5d1ba9b369d2c62f651704f71e8bf91a3c [34/34] fixup! platform/apple: Add new Apple Mac SMC driver
config: arm64-randconfig-003-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281839.eYxxaddy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281839.eYxxaddy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281839.eYxxaddy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/apple/smc_rtkit.c:339:20: error: initialization of 'void (*)(void *)' from incompatible pointer type 'void (*)(void *, const void *, size_t)' {aka 'void (*)(void *, const void *, long unsigned int)'} [-Wincompatible-pointer-types]
     339 |         .crashed = apple_smc_rtkit_crashed,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/apple/smc_rtkit.c:339:20: note: (near initialization for 'apple_smc_rtkit_ops.crashed')


vim +339 drivers/platform/apple/smc_rtkit.c

51cafaac94efd3 Hector Martin 2022-02-04  337  
51cafaac94efd3 Hector Martin 2022-02-04  338  static const struct apple_rtkit_ops apple_smc_rtkit_ops = {
51cafaac94efd3 Hector Martin 2022-02-04 @339  	.crashed = apple_smc_rtkit_crashed,
51cafaac94efd3 Hector Martin 2022-02-04  340  	.recv_message = apple_smc_rtkit_recv,
51cafaac94efd3 Hector Martin 2022-02-04  341  	.recv_message_early = apple_smc_rtkit_recv_early,
51cafaac94efd3 Hector Martin 2022-02-04  342  	.shmem_setup = apple_smc_rtkit_shmem_setup,
51cafaac94efd3 Hector Martin 2022-02-04  343  	.shmem_destroy = apple_smc_rtkit_shmem_destroy,
51cafaac94efd3 Hector Martin 2022-02-04  344  };
51cafaac94efd3 Hector Martin 2022-02-04  345  

:::::: The code at line 339 was first introduced by commit
:::::: 51cafaac94efd3a30a996fc192d3b471899323d8 platform/apple: Add new Apple Mac SMC driver

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
