Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D88322B72
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 23:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767138026; cv=none; b=MaOh7wBJyh4QXIJTJiFATJ5X0I9BUhoxvCQwZtTy9qNJjswwBfXJMmMXjzLABWDCTkteVZAJN1qHow80MXhQd1LiQgo+s/4jpMAN0an8TvQubrS4NRUMF1W51ZE4XUIEIdhTJBnhCvn41ogeC6ciyQu0vkpz0Vv4oZutBMntsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767138026; c=relaxed/simple;
	bh=eeE4pCp8IdgOQh57f8OQwA0NwEH3l6lslu3J8ZzwI9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcbBm1VaxkmedkTDRGQdzPVe6iP+znzkmBIZSwM/CjDQ50GmriSEQZiaU6KGYPpP/DFtpsI61MQLDYE6nk8tuS+oYB7D/h8MMgSmnOmqvMfN/2bpSf6xZy8tiE7JN3C+yVgS7bRTaVMGNfMyuTQW4bHmCPmaawvqy5sdI/OKOPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+xmcILw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+xmcILw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767138025; x=1798674025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eeE4pCp8IdgOQh57f8OQwA0NwEH3l6lslu3J8ZzwI9o=;
  b=M+xmcILwPEqMhLThdJUDZyYaSotnkkPmoDCLyNMskLQhN0zmAyrMiVkc
   g5WBbUG+uGYtsV9/nVawZDgmVjkWsZjMe2D28wIn1MOg8yual/CaB8xi0
   9TP0EaoDU9qg6RYWnp3sHcO02UAgOq0FTSzV06Dnz0u+cgp/UZOVUpS0W
   hp73Q934k5GMbJ2WvUu/vPe1pBbOdZkVcWBE7WA/I5VQwXlM0hsOhggID
   /wZfMi0aSMultF2nmlQ/2IPHQmcMcwlJ39ZEaK9Qr5xNjiFE1RKHfU6K2
   4ugRTTI+7UJ31n6OpRcQK4prGwwwpFmEL+Dq9gowcN/IIb7sQZT+bP3Lz
   Q==;
X-CSE-ConnectionGUID: taNLy4tmSYGI//azCD9QuA==
X-CSE-MsgGUID: t3KEFfogQkebv+Jr25bWfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="80096934"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="80096934"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 15:40:19 -0800
X-CSE-ConnectionGUID: aJJV3zvzSyaRzC4VxLsLjQ==
X-CSE-MsgGUID: 6MYYM73RRW6yetXpnhqlJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="201776752"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Dec 2025 15:40:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vajK3-0000000082e-3BL1;
	Tue, 30 Dec 2025 23:40:15 +0000
Date: Wed, 31 Dec 2025 00:39:42 +0100
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] device/dax: Allow MCE recovery when accessing PFN
 metadata
Message-ID: <202512310049.R86iwUtl-lkp@intel.com>
References: <20251230075951.85252-1-tianruidong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230075951.85252-1-tianruidong@linux.alibaba.com>

Hi Ruidong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on linus/master v6.19-rc3 next-20251219]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/device-dax-Allow-MCE-recovery-when-accessing-PFN-metadata/20251230-160432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20251230075951.85252-1-tianruidong%40linux.alibaba.com
patch subject: [RFC PATCH] device/dax: Allow MCE recovery when accessing PFN metadata
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251231/202512310049.R86iwUtl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310049.R86iwUtl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310049.R86iwUtl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dax/super.c:16:
>> drivers/dax/dax-private.h:158:2: error: #endif without #if
     158 | #endif
         |  ^~~~~
--
   In file included from drivers/dax/device.c:13:
>> drivers/dax/dax-private.h:158:2: error: #endif without #if
     158 | #endif
         |  ^~~~~
   In file included from include/linux/mmzone.h:23,
                    from include/linux/memremap.h:5,
                    from drivers/dax/device.c:3:
   drivers/dax/device.c: In function 'dax_set_mapping':
>> include/linux/page-flags.h:308:33: error: passing argument 1 of 'dax_test_page_mc' from incompatible pointer type [-Wincompatible-pointer-types]
     306 | #define page_folio(p)           (_Generic((p),                          \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     307 |         const struct page *:    (const struct folio *)_compound_head(p), \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     308 |         struct page *:          (struct folio *)_compound_head(p)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 struct folio *
   drivers/dax/device.c:93:61: note: in expansion of macro 'page_folio'
      93 |                 if (dax_test_page_mc(p) || dax_test_page_mc(page_folio(p)))
         |                                                             ^~~~~~~~~~
   drivers/dax/dax-private.h:144:55: note: expected 'const struct page *' but argument is of type 'struct folio *'
     144 | static inline int dax_test_page_mc(const struct page *page)
         |                                    ~~~~~~~~~~~~~~~~~~~^~~~
--
   In file included from device.c:13:
   dax-private.h:158:2: error: #endif without #if
     158 | #endif
         |  ^~~~~
   In file included from include/linux/mmzone.h:23,
                    from include/linux/memremap.h:5,
                    from device.c:3:
   device.c: In function 'dax_set_mapping':
>> include/linux/page-flags.h:308:33: error: passing argument 1 of 'dax_test_page_mc' from incompatible pointer type [-Wincompatible-pointer-types]
     306 | #define page_folio(p)           (_Generic((p),                          \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     307 |         const struct page *:    (const struct folio *)_compound_head(p), \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     308 |         struct page *:          (struct folio *)_compound_head(p)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 struct folio *
   device.c:93:61: note: in expansion of macro 'page_folio'
      93 |                 if (dax_test_page_mc(p) || dax_test_page_mc(page_folio(p)))
         |                                                             ^~~~~~~~~~
   dax-private.h:144:55: note: expected 'const struct page *' but argument is of type 'struct folio *'
     144 | static inline int dax_test_page_mc(const struct page *page)
         |                                    ~~~~~~~~~~~~~~~~~~~^~~~


vim +158 drivers/dax/dax-private.h

b2485f92a36cf3 Ruidong Tian 2025-12-30  132  
b2485f92a36cf3 Ruidong Tian 2025-12-30  133  #ifndef copy_mc_to_kernel
b2485f92a36cf3 Ruidong Tian 2025-12-30  134  static inline int dax_test_page_mc(const struct page *page)
b2485f92a36cf3 Ruidong Tian 2025-12-30  135  {
b2485f92a36cf3 Ruidong Tian 2025-12-30  136  	return 0;
b2485f92a36cf3 Ruidong Tian 2025-12-30  137  }
b2485f92a36cf3 Ruidong Tian 2025-12-30  138  static inline int dax_test_folio_mc(const struct folio *page)
b2485f92a36cf3 Ruidong Tian 2025-12-30  139  {
b2485f92a36cf3 Ruidong Tian 2025-12-30  140  	return 0;
b2485f92a36cf3 Ruidong Tian 2025-12-30  141  }
b2485f92a36cf3 Ruidong Tian 2025-12-30  142  #else
b2485f92a36cf3 Ruidong Tian 2025-12-30  143  #include <linux/uaccess.h>
b2485f92a36cf3 Ruidong Tian 2025-12-30  144  static inline int dax_test_page_mc(const struct page *page)
b2485f92a36cf3 Ruidong Tian 2025-12-30  145  {
b2485f92a36cf3 Ruidong Tian 2025-12-30  146  	struct page _p;
b2485f92a36cf3 Ruidong Tian 2025-12-30  147  
b2485f92a36cf3 Ruidong Tian 2025-12-30  148  	return copy_mc_to_kernel(&_p, page, sizeof(struct page));
b2485f92a36cf3 Ruidong Tian 2025-12-30  149  }
b2485f92a36cf3 Ruidong Tian 2025-12-30  150  static inline int dax_test_folio_mc(const struct folio *folio)
b2485f92a36cf3 Ruidong Tian 2025-12-30  151  {
b2485f92a36cf3 Ruidong Tian 2025-12-30  152  	struct folio _f;
b2485f92a36cf3 Ruidong Tian 2025-12-30  153  
b2485f92a36cf3 Ruidong Tian 2025-12-30  154  	return copy_mc_to_kernel(&_f, folio, sizeof(struct folio));
b2485f92a36cf3 Ruidong Tian 2025-12-30  155  }
b2485f92a36cf3 Ruidong Tian 2025-12-30  156  #endif
b2485f92a36cf3 Ruidong Tian 2025-12-30  157  #endif
efebc711180f7f Dave Jiang   2017-04-07 @158  #endif

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
