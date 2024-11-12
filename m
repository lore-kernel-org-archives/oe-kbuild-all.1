Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDE82123D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406757; cv=none; b=oBgxXWkfBqn6I7RAO+Vnt3neCS3TWA4d7VxuWMVyvkf2CwRgKeNBvSm5FF6Sl4TVO9oByOGzPNphlfTcg3a9GXzSZwOnIRp7SAQ0QJgjYbu6jI2kvsVFMj+0gOPsO1td5Za14xbBIJcictw4BsbCSwgtLQAExe9POQ7rh/lScA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406757; c=relaxed/simple;
	bh=UzzxQMqvwgqpjBcMYTFglREsZv0V9QMTgYOdd9et0Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G9/L4dIOhLTk5QRZb0wh03pusepYMb//eCPAzw73+TY+55j8KX1tWTqQMGXSCtuNpdS9HQPWBUunBaEIrArA612L4DSh8NLOSKZ0ZLBsicDWBKDH3bODAN+tSxDiHCMuW0QV2zlNzo2YOHCqeWu1GcE7+sm4IAuWHzBtmwfm7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEF1KWpQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEF1KWpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731406755; x=1762942755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UzzxQMqvwgqpjBcMYTFglREsZv0V9QMTgYOdd9et0Lg=;
  b=TEF1KWpQUKrYsvCcuYq6kZSn5zFqmEaWcw8quUZIbDIq93XE74v4LI42
   cyM1kg/GzFLKLNz/7pYRlYpU8W9llkj2SENb3FeNpDjgagI6QvBSfeho7
   fS6Dc6t+iew9ilA63OZq6RplNU8RFknU/IrtgHiEp1Tci2DuHWElKuDNW
   uskuzND+8y1p4y5oe7KDFx7tNnRhz1KUJZp4vcJ2CYWyU7WSZINvHjfax
   XiYBUAyxfOQUMaCM6Tm8h4HLrWdzVUNWvYEI54emdFvYKLltqmPCRK8kL
   j7HXONzgHIBrg+gAqoBPXkSzZLHN2aPn3LlH4REu9ZKubk1kqIb/a+7EN
   w==;
X-CSE-ConnectionGUID: +o0ovRG1TiOD7vSOJSTZdw==
X-CSE-MsgGUID: EAogbF9gRB6UI1zW2KOYFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34099552"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="34099552"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:19:14 -0800
X-CSE-ConnectionGUID: S5QvCzCIR4yW0kFnJ7RaSQ==
X-CSE-MsgGUID: Cp0B4vv8Qqmfwdcc8XUyqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87749967"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 02:19:14 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnzL-0000hr-24;
	Tue, 12 Nov 2024 10:19:11 +0000
Date: Tue, 12 Nov 2024 18:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 38/245] mm/page_alloc.c:191:1: sparse:
 sparse: symbol 'restrict_cma_redirect' was not declared. Should it be
 static?
Message-ID: <202411121837.OPZQyFGD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b0e595da6a08d490a69939a0e547347f3ee333ba
commit: 1c8aebe4c072bf18409cc78fc84407e24a437302 [38/245] ANDROID: cma: redirect page allocation to CMA
config: x86_64-randconfig-121-20241112 (https://download.01.org/0day-ci/archive/20241112/202411121837.OPZQyFGD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121837.OPZQyFGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121837.OPZQyFGD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:191:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2507:9: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2590:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   mm/page_alloc.c:2816:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4484:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/restrict_cma_redirect +191 mm/page_alloc.c

   180	
   181	/*
   182	 * By default, when restrict_cma_redirect is false, all movable allocations
   183	 * are eligible for redirection to CMA region (i.e movable allocations are
   184	 * not restricted from CMA region), when there is sufficient space there.
   185	 * (see __rmqueue()).
   186	 *
   187	 * If restrict_cma_redirect is set to true, only MOVABLE allocations marked
   188	 * __GFP_CMA are eligible to be redirected to CMA region. These allocations
   189	 * are redirected if *any* free space is available in the CMA region.
   190	 */
 > 191	DEFINE_STATIC_KEY_FALSE(restrict_cma_redirect);
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
