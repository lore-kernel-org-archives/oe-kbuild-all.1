Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D3367B67
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783896822; cv=none; b=bS80a/RGYC4l8XVG8IUNqFJ57ZS552MFvlGxvJMXY4oOMKLtHOMqb13szuvL3vtjdwArqKSdrKkUHqcSDbk5Y25i0r/lQVeD6EhfxyGlligZN1jVyut0vLluJLKCwtNSM/vNwd1hee2s+iDvNr7ymVJLrzU5qNnxw/0WvJRjilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783896822; c=relaxed/simple;
	bh=sX3h3FDOjb6ixgMJ2VFNk68+UYTow8SnZvZWly0mdFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sh7fG3+7fwEyVeT8M6OEg9tEtgKRz5gW6eaz6GKegeCWwWEzemGQ8BnoF8fzB1gjNNGY9BWtt9JAEzXMeCdmJY/Fd93VGziNMW26K9jnEYg2gAOZfCDsmWEmgtkZHvxHjGSK+/H+nqM3gh0SP6EOanzrQaQU/YIj9bBlk5GIhP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h972Gy79; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h972Gy79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783896821; x=1815432821;
  h=date:from:to:cc:subject:message-id;
  bh=sX3h3FDOjb6ixgMJ2VFNk68+UYTow8SnZvZWly0mdFY=;
  b=h972Gy79ah/aF8QYDcdGiQ9G/F8GWVSAa44ZZwr70UL1vLA4IQxtOhF1
   fMRtWRSMmFlslPlOAKWIq6E0yvDUzp2VeIP8PQTGtK/ZUD+K/8vr7hnpG
   aUo/exhDZ3IWjDApz0V7ykTI0oPR+n0ALTp7CZzq7CVTG8DweDppiJ4+s
   YALiCRX3gy4htPtBRadDzZSjrgfV5yVqo2XPxo7Fs0xIqhroxZthBsydh
   ZNuCfCSuOdX/5lF51vB3pmP8k1KxoAV4RV8t7/0zzhQ+pi3g9RobFoK3R
   VlXR1vf5LRwb8SJaMZmoLzy+KwEINr4sUx1Z2M++ZADLq/e263aoA7/vb
   w==;
X-CSE-ConnectionGUID: 35dVhDDbSbG9vc48+0um1Q==
X-CSE-MsgGUID: ownirUT6R1GwIrQyHzNSig==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95109650"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95109650"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 15:53:40 -0700
X-CSE-ConnectionGUID: GJcn7CBSQDS6+r/WkE2BkQ==
X-CSE-MsgGUID: l5V2tafPRGWAIDLTfqjepA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250980740"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2026 15:53:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj33I-00000000LBY-18Bl;
	Sun, 12 Jul 2026 22:53:36 +0000
Date: Mon, 13 Jul 2026 06:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 3/59]
 arch/powerpc/kernel/process.c:2409:23: error: implicit declaration of
 function 'get_random_u32_below'
Message-ID: <202607130641.PNb1jQvL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 7685fb5c8fe1aebd1a2202b2267a79d5b6775fd2 [3/59] nodemask: Include find.h instead of random.h
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260713/202607130641.PNb1jQvL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130641.PNb1jQvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130641.PNb1jQvL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/process.c: In function 'arch_align_stack':
>> arch/powerpc/kernel/process.c:2409:23: error: implicit declaration of function 'get_random_u32_below' [-Wimplicit-function-declaration]
    2409 |                 sp -= get_random_u32_below(PAGE_SIZE);
         |                       ^~~~~~~~~~~~~~~~~~~~


vim +/get_random_u32_below +2409 arch/powerpc/kernel/process.c

f6a616800e68b6 Benjamin Herrenschmidt 2008-04-18  2405  
d839088caec689 Anton Blanchard        2009-02-22  2406  unsigned long arch_align_stack(unsigned long sp)
d839088caec689 Anton Blanchard        2009-02-22  2407  {
d839088caec689 Anton Blanchard        2009-02-22  2408  	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
8032bf1233a746 Jason A. Donenfeld     2022-10-09 @2409  		sp -= get_random_u32_below(PAGE_SIZE);

:::::: The code at line 2409 was first introduced by commit
:::::: 8032bf1233a74627ce69b803608e650f3f35971c treewide: use get_random_u32_below() instead of deprecated function

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
