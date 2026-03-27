Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DA233FE36
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629771; cv=none; b=ZBKZazlDCVXByhcV8/Cn8WbbA573tuYCL0rV+sD61sO1vyb9wZgZ6R8w5unKyS6ob9Y9bLcxaUtimDyVtWYgwr0SkkrRlajnKGRt/sHWvRwkQ7iKc/Up6GLs0IF9isP6yEO8B4eQSjQvz+ZCjWE/SwLWEpC/Zji8HIAEiG5dzQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629771; c=relaxed/simple;
	bh=OFAGlTRt2sPoJe07ni3AccjaP+ORos+JRuN8VMOFZxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aqW8YxGzSIcF6BclQIqnGiXQwNKdft3Hoo205ny2m3+N2R2ZhSPugHYOp+9crJYQh7ZGJWkq/xaZZsXU4An/D77Gi85fDxyjIdotAwik5kr3wiNXRE9bkmYY5bBl1AC6ZnBHx1V/a0t2SOJLOIdaH2IUVwWVetxCK1riY9t0RCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cs5YEulM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cs5YEulM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774629769; x=1806165769;
  h=date:from:to:cc:subject:message-id;
  bh=OFAGlTRt2sPoJe07ni3AccjaP+ORos+JRuN8VMOFZxY=;
  b=Cs5YEulMUM8HzmTmjoWwI19wR9BU5QiWWgArjpY4YHXOTqr5OaHYuD0/
   HW3RAEcwXL4AYDqM1gl6lGDvkyUJWfthAQSo5F6Lf7w9+nQ0AV60PUNR0
   zBV+1z7aWoyZeammpxeQJbXvdb86/XiNeplV516eiyPOwKhw+kca8F9eP
   vTZpiGQ/7/tAkYAXl7ej9jNzZ5TOh055uIXsH1ltio8ocLlBpKczLQrX1
   YgKsjlIsZjWQQZWRUAwQ2GKY9rYPtQWKdmns+J27rn/Gk/3TNF9IM2WzD
   E0jvKKumRyJ1FTk+T6Ka784TOfzn6symCLCTwG5OqlarKpyV4r9x/FvA9
   g==;
X-CSE-ConnectionGUID: WAyfcSn9Rk6oNKfa5LEBGQ==
X-CSE-MsgGUID: z6Jy6qT5SYCcATy5eKhQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75420809"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75420809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 09:42:48 -0700
X-CSE-ConnectionGUID: ld8lEcgpQe6aRmlVI5eLsg==
X-CSE-MsgGUID: XJaJ9vHaRXqmpK1XSQk1WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="224409017"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Mar 2026 09:42:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6AGi-00000000ATt-2402;
	Fri, 27 Mar 2026 16:42:44 +0000
Date: Sat, 28 Mar 2026 00:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tsu 2/14]
 drivers/net/ethernet/cadence/macb_main.c:5710:12: error: use of undeclared
 identifier 'at91_default_usrio'
Message-ID: <202603280028.wQjUrIvv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   0121d200894912212bc77fe0019ff4d4d4887e61
commit: 325c27e385e16c0a7daf13baf5c3da8a057211c0 [2/14] net: macb: rename macb_default_usrio to at91_default_usrio as not all platforms have mii mode control in usrio
config: x86_64-randconfig-122-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280028.wQjUrIvv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280028.wQjUrIvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280028.wQjUrIvv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:5710:12: error: use of undeclared identifier 'at91_default_usrio'
    5710 |         .usrio = &at91_default_usrio,
         |                   ^
   1 error generated.


vim +/at91_default_usrio +5710 drivers/net/ethernet/cadence/macb_main.c

  5704	
  5705	static const struct macb_config default_gem_config = {
  5706		.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
  5707			MACB_CAPS_JUMBO |
  5708			MACB_CAPS_GEM_HAS_PTP,
  5709		.dma_burst_length = 16,
> 5710		.usrio = &at91_default_usrio,
  5711		.jumbo_max_len = 10240,
  5712	};
  5713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
