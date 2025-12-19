Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1B27405A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 04:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118591; cv=none; b=G+sETkAMqDASINlhA7SQe8vwA9AMexU77UQCZ9aSJJd585UJfMi2RoMr5DScH0k+4tc3tyq7xuB1lv6TO55pu7w0RIgf0rmlJkweakldfjmnM3a3xteYI1D2VlgwovoR7Gs3ZlaOcieWr0w3+lZK1Tq2rncTmOzYaLcDX9GSwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118591; c=relaxed/simple;
	bh=V2U0B9b0ArWvtRZOExEcSX6zGTp9fYaT4+4R8Se30Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YdhZAWE/65rmIpyQm3Fxz1RVwbx9t7jaLzKdEGyZ81Y/VCa6INbwj5ZOK126mramPai+f0ZgcloW+DN5IlFqxnzQ3fKAEur+vm0zUslW32Yml9xOMVosA4kbga+DljiqZWWDwtXy0cZOR3gB05yxt8OPF6S8eZ5xO60ZnMuVM5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlZ8PFYA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlZ8PFYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766118590; x=1797654590;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V2U0B9b0ArWvtRZOExEcSX6zGTp9fYaT4+4R8Se30Y4=;
  b=AlZ8PFYAIiHoI0msnK9Qzhxm4jhAgEBMtXURz4NMQfop3vD2ftwFGgJ7
   HYapqXZzWVZlNbpNl1WrCSIcqeFTu5AA9Y21cwFY2NM5wGA/lJ8LJvjGE
   pmQ9wBWyZ1RZmBxuIebrH4xT1HXdq9k9tjnf38hB1RcYO58fn/v/ZYNy3
   XfzPC0Mf7yC5FEH+HkZKH5Atq3w9GQb53eXwjEBiIlLsnKn25VsZtSvov
   sbLxy+zXkxJOuOdzhLLcXQkF6nsy560gVEazrTPXuvWJxYjIZ/ic1tOTU
   JGVNwEL3lMXdAx6lh81IX2F2Hmc+i7soSwcoi+KbFMqcbQwFZMavUy9ii
   Q==;
X-CSE-ConnectionGUID: +RPPBfS9SJ6qpwIvJJY5uw==
X-CSE-MsgGUID: DSt6CsAuTIezzWhNFZNgrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78793294"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78793294"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 20:29:49 -0800
X-CSE-ConnectionGUID: xu29lmxrSvuRM8aXuZ4bgA==
X-CSE-MsgGUID: iQy51I96T2yo4j/h2CjOUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229802995"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Dec 2025 20:29:48 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWS7e-0000000030P-0G0r;
	Fri, 19 Dec 2025 04:29:46 +0000
Date: Fri, 19 Dec 2025 12:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-numa-sched-domain-ANBZ26672 3/3]
 mm/page_alloc.c:297:20: warning: 'add_to_free_list' declared 'static' but
 never defined
Message-ID: <202512191232.C0sgoMb8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-numa-sched-domain-ANBZ26672
head:   7937ef3c1b34894ed22447a9af04c96f5f50cff6
commit: dce9170c150f27ea23a2a52e539cc02b6957b595 [3/3] mm: page_alloc: batch vmstat updates in expand()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251219/202512191232.C0sgoMb8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191232.C0sgoMb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191232.C0sgoMb8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:297:20: warning: 'add_to_free_list' declared 'static' but never defined [-Wunused-function]
     297 | static inline void add_to_free_list(struct page *page, struct zone *zone,
         |                    ^~~~~~~~~~~~~~~~


vim +297 mm/page_alloc.c

418508c13222dd Miklos Szeredi     2007-05-23  292  
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  293  static bool page_contains_unaccepted(struct page *page, unsigned int order);
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  294  static void accept_page(struct page *page, unsigned int order);
b77471c6760a22 Kirill A. Shutemov 2024-08-09  295  static bool cond_accept_memory(struct zone *zone, unsigned int order);
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  296  static bool __free_unaccepted(struct page *page);
8c8774fcbaf476 Johannes Weiner    2024-03-20 @297  static inline void add_to_free_list(struct page *page, struct zone *zone,
8c8774fcbaf476 Johannes Weiner    2024-03-20  298                                      unsigned int order, int migratetype,
8c8774fcbaf476 Johannes Weiner    2024-03-20  299                                      bool tail);
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  300  

:::::: The code at line 297 was first introduced by commit
:::::: 8c8774fcbaf47634f07ee957e9cd9403f5e0ce2c mm: page_alloc: consolidate free page accounting

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: 小龙 <wenqing.ly@alibaba-inc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
