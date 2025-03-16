Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2E21A01D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742135054; cv=none; b=aEtXtoAqDMtdO7qL0MQNve7jmFl/RHpinhUyJe1C9TOW1nLX8rLNnIQM03zgExxbqqMUMJetZuiwawLeB+6KJoqc56lJ0OPPe/vxe2r18U1P/YrhiNJsxsMEXSOSWMEmb7lXlbUTG0ITcFN8xvNqP0N4PIJ62gR7A+qmR9LrtFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742135054; c=relaxed/simple;
	bh=u3G4ULdupRXzimAN0BJ9I7lPIuNbuu/MqV6zfWZJCwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO8PGuhTA1JdxJtokiFtRza5kvzm2A+BJ80QSh8swFU42ZsQtP7LKvGl25iD990GZxN7MpKIblcn/7X/KBAdM2LWRIB5iSkn7ZR0kUIEeNDHBEJFMYz/Be/v338hqKWBxZMUGzaiG6Qn2jce/Bc4PY9Dm6zdC1Jpx6SWV6xKDfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGINjB7D; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGINjB7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742135052; x=1773671052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3G4ULdupRXzimAN0BJ9I7lPIuNbuu/MqV6zfWZJCwI=;
  b=UGINjB7DSHBUT9D1ZprxeDzl2fa0fLcfajRCMEbjhT09nCNsscPTwXP3
   /zVGZdIvid+laFLBPTQrG47Bt6pYgoSG2IAdnapNXPbmchnj7UdQxrvzy
   n48PfBhWinPq3snZqlDxWAnBRf5rsMc7tKW0pzkm7z8YtKvNopyX+4/bO
   ZATx2QHP5KcpDEhSnQ7LBFihB2TagtJnjgskpuXd8H0QaLoZg06O9eI+p
   y+ApHsx9JOLJ93oeyVUTtpf25nUTVeSLhxUogq/1vkf/jdZL/z47YmRkg
   xwN6HzsfT4u6KiAODu0Ub+pg8keHjqZQguvkh3UakvtXxGYWShywbvBOK
   A==;
X-CSE-ConnectionGUID: nQNpNS+JRKqGR+y4xSgQiQ==
X-CSE-MsgGUID: Xvf0ApIJTKCqY0vyX0jrsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="65698317"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="65698317"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 07:24:11 -0700
X-CSE-ConnectionGUID: by0WQ1yHTPGkQROS4bbrAA==
X-CSE-MsgGUID: fiq2IAbQQNSL/oenhX0x4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="122194127"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2025 07:24:09 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttouN-000C1z-1d;
	Sun, 16 Mar 2025 14:24:07 +0000
Date: Sun, 16 Mar 2025 22:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 139/160]
 include/linux/random.h:104 get_random_u64_below() warn: always true
 condition '(ceil <= (~0)) => (0-u32max <= u32max)'
Message-ID: <202503162234.iyijTkoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   6d7f54c162635934218ea0cede09f68e40e3bc2f
commit: 3ebf48025118a2db43fab6b283ceda9bd7998937 [139/160] bcachefs: kill bch2_get_random_u64_below()
config: i386-randconfig-141-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162234.iyijTkoU-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503162234.iyijTkoU-lkp@intel.com/

smatch warnings:
include/linux/random.h:104 get_random_u64_below() warn: always true condition '(ceil <= (~0)) => (0-u32max <= u32max)'

vim +104 include/linux/random.h

a83003c2e557d2a Kent Overstreet 2025-03-13   95  
a83003c2e557d2a Kent Overstreet 2025-03-13   96  static inline u64 get_random_u64_below(u32 ceil)
a83003c2e557d2a Kent Overstreet 2025-03-13   97  {
a83003c2e557d2a Kent Overstreet 2025-03-13   98  	if (!__builtin_constant_p(ceil))
a83003c2e557d2a Kent Overstreet 2025-03-13   99  		return __get_random_u64_below(ceil);
a83003c2e557d2a Kent Overstreet 2025-03-13  100  
a83003c2e557d2a Kent Overstreet 2025-03-13  101  	BUILD_BUG_ON_MSG(!ceil, "get_random_u64_below() must take ceil > 0");
a83003c2e557d2a Kent Overstreet 2025-03-13  102  	if (ceil <= 1)
a83003c2e557d2a Kent Overstreet 2025-03-13  103  		return 0;
a83003c2e557d2a Kent Overstreet 2025-03-13 @104  	if (ceil <= U32_MAX)
a83003c2e557d2a Kent Overstreet 2025-03-13  105  		return get_random_u32_below(ceil);
a83003c2e557d2a Kent Overstreet 2025-03-13  106  
a83003c2e557d2a Kent Overstreet 2025-03-13  107  	for (;;) {
a83003c2e557d2a Kent Overstreet 2025-03-13  108  		u64 rand = get_random_u64();
a83003c2e557d2a Kent Overstreet 2025-03-13  109  		u64 mult = ceil * rand;
a83003c2e557d2a Kent Overstreet 2025-03-13  110  		if (likely(mult >= -ceil % ceil))
a83003c2e557d2a Kent Overstreet 2025-03-13  111  			return mul_u64_u64_shr(ceil, rand, 64);
a83003c2e557d2a Kent Overstreet 2025-03-13  112  	}
a83003c2e557d2a Kent Overstreet 2025-03-13  113  }
a83003c2e557d2a Kent Overstreet 2025-03-13  114  

:::::: The code at line 104 was first introduced by commit
:::::: a83003c2e557d2aa65561df407a61cb44900d481 random: get_random_u64_below()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
