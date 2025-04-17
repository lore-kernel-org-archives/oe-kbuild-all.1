Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E4E4502F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744915612; cv=none; b=bmuU3UMzl6KA2k5k5RUoqQeoOCbwGEOKsMFaznWeSXbK47d0XIrTpw5JqcFuPN1kuhyOYsj6e+i9IiQibbau2D5BwFDu7BKQ1fyjYwDSr6aWCevKY6jwQzgCSoWet1muIVMQDwGLC+KKMfFcpSnLDN6zGpqNkTDUT1lw0SODPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744915612; c=relaxed/simple;
	bh=zXPgf/wVYy0xQ7aLTsSwgOEOwa0undtAiLvTDJfRPEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MIwzkTjU1QUmxPm7wrvcFrv2dlnAKPHhH/vOgwG5nZzHNTrqIa5374yP/4LYTdXEPDMmnGVDSIJrzsYzoBmlS9IcQc3zdVjZMZxEJlgGHQcOoWx69XaqV2aAENiHvEEchx659NLf81z1Adv5odbJctGp5H0o3lW2hNGXoIYYBhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXCZjPgg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXCZjPgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744915610; x=1776451610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXPgf/wVYy0xQ7aLTsSwgOEOwa0undtAiLvTDJfRPEE=;
  b=IXCZjPggei6UsGPX3FWVyEUPWHRG5dBClfTefDpDkjc9nAOaxwlSig14
   GZIDhY4VFb/6aMXp6pdLzzE3C17t4FgXl49BNGvd6SbhWac2lM27voUjO
   ynlvfNTk5R/rt9fkbyCSjBa3giRLlnuOHXYda15Np7TYtwA6XafnFlHkt
   S58ungAbXWGxoGyewHtNphBW7z6Iwtg+ihJbYke4TxetwynzmpXT+CM+8
   197tXRErei0XN7EsV41JA1L+UPhhAf162G4C4FlRPUOrg/uh0npibnWwW
   rXmWDndY90qi1vcJbL8+SSqNFSBevsrypsiUAYjehonB3HI8wcln9Yln+
   g==;
X-CSE-ConnectionGUID: fnkm0rGnRaGdCSiVxpTT1Q==
X-CSE-MsgGUID: UQyUwZ+oTK2ydZXveezvdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46651935"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46651935"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:46:49 -0700
X-CSE-ConnectionGUID: MWdSEKc/TDWE5rWR54BW2w==
X-CSE-MsgGUID: xJ9a5LZqQdGJPpnJ2oNXBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131207887"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 11:46:48 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5UG6-0001eN-17;
	Thu, 17 Apr 2025 18:46:46 +0000
Date: Fri, 18 Apr 2025 02:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 drivers/dma-buf/sync_file.c:119:12: sparse: sparse: symbol
 'sync_fence_signaled_obj_name' was not declared. Should it be static?
Message-ID: <202504180230.blqsoXDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   b402a1d75befcddca1b54a72297785474d05a99d
commit: b402a1d75befcddca1b54a72297785474d05a99d [2/2] ANDROID: sync_file: Weakly paper over potential xe driver (and similar) races
config: i386-randconfig-r133-20250418 (https://download.01.org/0day-ci/archive/20250418/202504180230.blqsoXDM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180230.blqsoXDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180230.blqsoXDM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/sync_file.c:119:12: sparse: sparse: symbol 'sync_fence_signaled_obj_name' was not declared. Should it be static?
>> drivers/dma-buf/sync_file.c:120:12: sparse: sparse: symbol 'sync_fence_signaled_driver_name' was not declared. Should it be static?

vim +/sync_fence_signaled_obj_name +119 drivers/dma-buf/sync_file.c

   118	
 > 119	const char *sync_fence_signaled_obj_name = "signaled-timeline";
 > 120	const char *sync_fence_signaled_driver_name = "signaled-driver";
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
