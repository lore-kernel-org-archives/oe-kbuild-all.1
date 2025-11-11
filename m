Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B180435CBD3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 22:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762901434; cv=none; b=fToYeqtHJd22Tj/BMW6JSwycQou8b7cC7DReW4tFujQ1f9xzHmfCEd/KRKGMTlN2F2v07YwcfiDWqfxK1NHEgmVb0NY2uHPBmbKqpY5WKz8cX8uNPIzFJSp4hG6lFFK5jjSWpd2rPASGQ7wWSVqSzymii2+aiJzal0kfbElifl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762901434; c=relaxed/simple;
	bh=kRrzZiDU2QR522qbIPiiN61GVramLRPF10yjTWDv8X8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mif45LodTKG2A8ldowrM1P6nB9xH9zUHqAq8sewTBRgXuTYNioiyi/IXydqE3eMaeOFJsMmqFgPd2oJW9oGA83/fJkyjHvmigN87RKlAoz2605XarIwDiIPo0zz6xnflud08ZAoA5nLTWcbo74DLhCNiFb3Rpo3Bic93REDtpII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+DlA2YL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+DlA2YL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762901433; x=1794437433;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kRrzZiDU2QR522qbIPiiN61GVramLRPF10yjTWDv8X8=;
  b=U+DlA2YLppu1DFICofLGAMQT/XOTd1jFOFiTPjPpE8ZoPrq5zdRlWJkA
   p3R1aCXFArENIJI5aJxFkfsGHScseeBQmBPkIjRRWkd7wd1cNcIXN55Ha
   n6u04Z6HjtNAJI7GvZAmaYU/YV/KRl95vOiQapmkGYm+ym3vCi9Si5gJ0
   TqI3BCGjSxzdV9c0d4fHvH/YtgOmNCXH6ialXySyCg+wJ9MlxIOXRv5xf
   zsfI6l3NzkabS81EASZi+tdZnRYXAF1jF9oFo0xo1H2EADBt78HzS3bRk
   Q7iS45MDzEhvoksBWTU8myAS/60BomQLn7WzQ1sqjYiXqFzjGeX5SDs9Z
   w==;
X-CSE-ConnectionGUID: E26awo6xSRiYhcQHi0xxFQ==
X-CSE-MsgGUID: mmVaB3oGQpiRNWIrLoYFCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75267099"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="75267099"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 14:50:32 -0800
X-CSE-ConnectionGUID: IfrW+PwrQ3qwdzYs7pxXOw==
X-CSE-MsgGUID: OUPvWW4hRVKnvfsPUhyKAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="193446626"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Nov 2025 14:50:32 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIxC1-0003dv-0M;
	Tue, 11 Nov 2025 22:50:29 +0000
Date: Wed, 12 Nov 2025 06:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 84/84] mm/page_alloc.c:297:20:
 warning: 'add_to_free_list' declared 'static' but never defined
Message-ID: <202511120606.QguNjb5u-lkp@intel.com>
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
head:   1a32855cad5877b51a20010b3de528011df9ba69
commit: dce9170c150f27ea23a2a52e539cc02b6957b595 [84/84] mm: page_alloc: batch vmstat updates in expand()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511120606.QguNjb5u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120606.QguNjb5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120606.QguNjb5u-lkp@intel.com/

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
