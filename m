Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD242AA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 16:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739638514; cv=none; b=Ox/BN9H49j0vpDvXkTgjCR3TleppWReMcEsN+UYvSzLLmJ5k0YfDs5QR+VFDszg6nR1WpIozjVDCAooMW/JHVaaOBAYiX1s9F3skYOcwzr4CtBnKsTPOG+obvD0sGsO7T93kg+R2EKNBpBxp1hYHhPoQP3CFIlczLdmhYAQ9Gc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739638514; c=relaxed/simple;
	bh=Hj5GrYaA4Y3pXk9qtf6QXQptx7dLeL6RqSbL2+NQc7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvCvEpe01hx5d1d8pBclybhaZg4v4JNJ7bboll26w1SkKJEWtcKv7lB+TLBXiUDAZoBe21DTqAQMJjKGs7sdDp2MRgIz1nrbwXurcr+/hOy1qkFO7mLq/NoD2obn8RE6dzEs5yEvC2hApC+JIB7sNHLFEnzQEzaDt1gVfOEQIq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQoUf22X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQoUf22X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739638513; x=1771174513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hj5GrYaA4Y3pXk9qtf6QXQptx7dLeL6RqSbL2+NQc7Q=;
  b=JQoUf22X8ASvmOJ4V2gvQTxLXAZXtO7v8nlOhdsqxIBaMSuiLuKP4XHn
   0ZEP5Sb57IYTYtC20yUbpherYDkX9tOjkiV6unbgY5oRWPrM6OP/6Ko3t
   GX/HBP76qoHjtlHJNFoPtIWmkXuz/abbGfbn9WIPBq0qf5ppP/LUZNJpW
   wBxb4AdZMFAcOswOY2p0vxktdC9jxYK691+yrfQ6AcgAfQuGe9PEzM8hs
   ypGHUsCeBoRQS3ZLwrin1WOH11Nc7Vgg6N+mUeCgbEHHCdtbiTOxayPxm
   zPn9SMfX0CoQvBrA/ML2K8iX3ZURDxfn28656IglZKEodyFoi1zFhnk6t
   g==;
X-CSE-ConnectionGUID: 7SjJHvvjSH6JL8RJ9YJ62g==
X-CSE-MsgGUID: 7/8rjFtpQ9+1NEBlO7ItNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40498646"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="40498646"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 08:55:12 -0800
X-CSE-ConnectionGUID: F9EE5cSNSpqUiVco1sAkBw==
X-CSE-MsgGUID: mXEs2OP5T0O/u16zJRzJgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136952523"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2025 08:55:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjLRa-001B0x-0Z;
	Sat, 15 Feb 2025 16:55:06 +0000
Date: Sun, 16 Feb 2025 00:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Li <chrisl@kernel.org>, Barry Song <v-songbaohua@oppo.com>,
	Hugh Dickins <hughd@google.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Kalesh Singh <kaleshsingh@google.com>, linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 7/7] mm, swap: simplify folio swap allocation
Message-ID: <202502160040.5ULBvBsP-lkp@intel.com>
References: <20250214175709.76029-8-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214175709.76029-8-ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-avoid-reclaiming-irrelevant-swap-cache/20250215-020239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250214175709.76029-8-ryncsn%40gmail.com
patch subject: [PATCH 7/7] mm, swap: simplify folio swap allocation
config: x86_64-buildonly-randconfig-001-20250215 (https://download.01.org/0day-ci/archive/20250216/202502160040.5ULBvBsP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160040.5ULBvBsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160040.5ULBvBsP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> include/linux/swap.h:591:1: error: expected identifier or '(' before '{' token
     591 | {
         | ^
>> include/linux/swap.h:590:13: warning: 'folio_alloc_swap' declared 'static' but never defined [-Wunused-function]
     590 | static bool folio_alloc_swap(struct folio *folio, gfp_t gfp_mask);
         |             ^~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2631350961
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=2631350961
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2631350961
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2631350961
   make: Target 'prepare' not remade because of errors.


vim +591 include/linux/swap.h

8334b96221ff0d Minchan Kim    2015-09-08  589  
f8d9ff0d052908 Kairui Song    2025-02-15 @590  static bool folio_alloc_swap(struct folio *folio, gfp_t gfp_mask);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @591  {
f8d9ff0d052908 Kairui Song    2025-02-15  592  	return false;
^1da177e4c3f41 Linus Torvalds 2005-04-16  593  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  594  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
