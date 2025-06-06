Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1C219317
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199542; cv=none; b=NbfE8gW/IUeKY3SbQs++a6hKEwdDPpnGtAQR+DEGXBoZRcCiiAwclRclwqcqupLeMmdjawaM/KSMgA6jqZlad9cd4tn4iqRldiF4G3UkAyULPGTy3E1g8AC5cm6ePSfqnt5/OPjaJiOpfwPCReNxFYPkAi4ZmkczjYL+DWNoga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199542; c=relaxed/simple;
	bh=/1Bd88PPnSyAXEAZnpCX7Tq8YrKkCqtGyP0vqRBjR7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7dHHjeJmL/uSlQYHwJlH/EouRcBCAUkIX+/rDSZ/j87ygjICxrWu7xFoQdXVwFp3ER6J0HbGz0WPwGVszjiqoA51QpaNv6NViMxOynyA2S01eGgJhcNuScLrqDQSyBfD5R9YFihSyJlWNH7hq8Za2455yarIsXEqIR7hrZUO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Km+UJV4L; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km+UJV4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749199540; x=1780735540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1Bd88PPnSyAXEAZnpCX7Tq8YrKkCqtGyP0vqRBjR7Y=;
  b=Km+UJV4LWD8J/7ak4YWoDe9w0ojok6H7wQVUFJ0W3o7Y1FcydaroQ8Bh
   AX5ZKOPBn+FyIDAzAeHRS6BDB4a2+GVr9PxXicsmBTwJSVvr5hPIqjXhT
   lI8lW4vhq6eMvtbDu2D+380jmeVtz3hdkHEaPckGr11suf9w21draaNiX
   E6jeGT4A+crXC7yLOW2+pNx4Xm4L+Z/OxD6JBGbqd9xQI1GgavU0XC8dT
   vGEbo4s3MHLCgcYFlI9l3YW/I7Fmrh1aY/kZkVc1rFDu3N42iHL6FmAk3
   k0S/Bdju+1VXMAyYP9DtxACBc+kOB9QHjOE+HUDP3d6vqZc5M1l17AIXL
   w==;
X-CSE-ConnectionGUID: aS4CgvW6T8yyaAVbQKo7cA==
X-CSE-MsgGUID: /xM961ThTrmlbBFVFWDo6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38977894"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="38977894"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 01:45:31 -0700
X-CSE-ConnectionGUID: SaNHqNkXT/qpcvp5OEBRow==
X-CSE-MsgGUID: xSCoEpsVRX2WjpgGgIwIbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="146357831"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2025 01:45:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNSha-0004rO-0e;
	Fri, 06 Jun 2025 08:45:26 +0000
Date: Fri, 6 Jun 2025 16:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1659/1659] mm/memory.c:4491:3: warning:
 cast from 'int (*)(unsigned long, unsigned long, struct cgp_args *)' to
 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to
 incompatible function type
Message-ID: <202506061637.CVNqsEqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   89f3a2595f2e3f14f976811d203bd8f55ff4eada
commit: ae0cd4d46ced733c522f2cc6da2d380d69123fc4 [1659/1659] mm: parallelize clear_gigantic_page
config: x86_64-buildonly-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061637.CVNqsEqf-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061637.CVNqsEqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061637.CVNqsEqf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:4491:3: warning: cast from 'int (*)(unsigned long, unsigned long, struct cgp_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to incompatible function type [-Wcast-function-type-mismatch]
    4491 |                 DEFINE_KTASK_CTL(ctl, clear_gigantic_page_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4492 |                                  KTASK_MEM_CHUNK);
         |                                  ~~~~~~~~~~~~~~~~
   include/linux/ktask.h:139:3: note: expanded from macro 'DEFINE_KTASK_CTL'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:123:21: note: expanded from macro 'KTASK_CTL_INITIALIZER'
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +4491 mm/memory.c

  4480	
  4481	void clear_huge_page(struct page *page,
  4482			     unsigned long addr_hint, unsigned int pages_per_huge_page)
  4483	{
  4484		unsigned long addr = addr_hint &
  4485			~(((unsigned long)pages_per_huge_page << PAGE_SHIFT) - 1);
  4486	
  4487		if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
  4488			struct cgp_args args = {page, addr};
  4489			struct ktask_node node = {0, pages_per_huge_page,
  4490						  page_to_nid(page)};
> 4491			DEFINE_KTASK_CTL(ctl, clear_gigantic_page_chunk, &args,
  4492					 KTASK_MEM_CHUNK);
  4493	
  4494			ktask_run_numa(&node, 1, &ctl);
  4495			return;
  4496		}
  4497	
  4498		process_huge_page(addr_hint, pages_per_huge_page, clear_subpage, page);
  4499	}
  4500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
