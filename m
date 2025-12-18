Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F22EBBBC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766076135; cv=none; b=mLFMVS5EnzT4q5qdMhcTHIIqwdqEIt7rWEEohrK8jhs0T66RwVYpKmk4z4wUOmV0kYJ5jBROhjEDKsHo42YrLFZxD6x6K6oeun0l/YMqtjUQHsXwLDJP82VCgfkCr4/6VeuDDl28CTH5HmLP2HUYv/Bwa+9tr00yUmhcT3hiag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766076135; c=relaxed/simple;
	bh=foPi6dy7mbcpuuqf7OdQMbc174doQC+9TLmqU9R1hwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3byw9D2RULyVtBd+Y+ts8G/iE6cIfOZruURyXkUemR08nAvweWiDaG97XNMYS+Ey+b8wEVg+4/sQeA//NLTPdpkOOGXoOd1NWoai6avC+TfmA6NaKp0aayj51A1xzj9L10Dpi+UzX0bVRZsq517HvRM12FhnXeLLL5oiemsLtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moXOx5nB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moXOx5nB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766076134; x=1797612134;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=foPi6dy7mbcpuuqf7OdQMbc174doQC+9TLmqU9R1hwg=;
  b=moXOx5nBcDnRV2t6YvqHX8iuH/9WmyU2KH3x09t6QRBntmza1UZhAY/G
   Irlvf6I/pgmmDjDRyCTSkyRL7PlWlD7+4DLWd4z03bnx/BfAvFzlGPjjm
   37Fs+L+eSNnacds23k266KGLuUxAfedWkXOBc0xDCQurx9LuqURzg+FAI
   0bD2teAibY2o6A8Cx0ImVQCeCmDwzZbcXu8e2fHkw78Z5HzK4YRLpyGgW
   eQMzE+qlA8BJztlbiYjKQh5ylaA6LbiRywNYDPvsl0Pj23EnX23u+2cxX
   KI12aFjPgZ6P5KqpRGghB+qnjM8aWJm+SO3vQhp+XmsnWyWKvQYTUTk6S
   A==;
X-CSE-ConnectionGUID: iN0ZymKqRF+jL1f/NqzmDA==
X-CSE-MsgGUID: /NL1v+zITA+BACyIUiumfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68106928"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="68106928"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 08:42:13 -0800
X-CSE-ConnectionGUID: sS6lJcYfTMyTEMet01Yu2g==
X-CSE-MsgGUID: tPEq5MuTQnWFpQohom9b5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="198892063"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Dec 2025 08:42:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWH4s-0000000041A-122T;
	Thu, 18 Dec 2025 16:42:10 +0000
Date: Thu, 18 Dec 2025 17:41:46 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] mm/page_alloc.c:297:20:
 warning: 'add_to_free_list' declared 'static' but never defined
Message-ID: <202512181708.ld0vWJnL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5d719013902eb006756873427de3fc5cc5566531
commit: dce9170c150f27ea23a2a52e539cc02b6957b595 [50/50] mm: page_alloc: batch vmstat updates in expand()
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251218/202512181708.ld0vWJnL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181708.ld0vWJnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181708.ld0vWJnL-lkp@intel.com/

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
