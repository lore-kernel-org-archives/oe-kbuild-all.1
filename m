Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9022F2F84F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 23:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788131175; cv=none; b=GUYf9BCtUcu7TTaoFQj4464cII4IIGwMq3Ih1TyAFR7lVxuGV6JXE0Y6/q+xFGsP4EKcWrCSMnDkBeZ7wF5a9LvXwagoz1pKdGgXuCFAWSdIMbv5AIn8b1JsZvi8MPxVJFPl2D+yqPb+mg+FSU7gurZfex+TFffh+o/buiWbejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788131175; c=relaxed/simple;
	bh=XJ+HPAT+aJKhguxQQhG07rkPQLwPlVdQ03Bf/YSM59A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP4wvvbwTep0pMdbdznw9Cp2qOK48ZaBaRB4aBJrA+Rg/e0GSvs1QF9qjWO/W8G7ZDUVNfPX8IwsDJCMLNyN8OGsA82dQL5k8Y3ABFdMiqOgaQvaYWWPf0xv/53/4x5AILa4sUKqoC6dhOFrIEC4gHFPb9JSiTBGiv6HACD3Pgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsDrq83Y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsDrq83Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788131173; x=1819667173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XJ+HPAT+aJKhguxQQhG07rkPQLwPlVdQ03Bf/YSM59A=;
  b=DsDrq83YtzY2SqgMm5IA1J4N12a+TriJyPePfcyI3Cf5EddDGF80xDdF
   dao/47hoQV6aysOlrKb+WCPVIh8KdY/VjSvVzCNynZOuOszUjZojQJBug
   w3LPNy+J0VepboTJmswZlfLy1J0JhzucNcrCdmO015Lnb66238M1mEKrG
   o8VkoxYqsZVkOYgkn8ax/pp+t9hf1urTbIIdYT9mCdvEEmXljxD54LVQO
   59SaM7GwmjNdNTzoQXvv6l2TqOMiEb1ak8UF3oWbHgnsR9fYhuDfB5sq3
   0sdPocYCNfWyP0t2PGadAU/gDNVFd420eB58kY5ytxsO67D5qZqYjQL9i
   Q==;
X-CSE-ConnectionGUID: 7v8r/dTVS12i1n1ANNNvSQ==
X-CSE-MsgGUID: BnCQaddvRnaOYcIIPakl8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88462596"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88462596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 16:06:12 -0700
X-CSE-ConnectionGUID: 6VyEF96pSsqaCTiwZF1Hfg==
X-CSE-MsgGUID: R7JbQwJfQNCpYW3yG3lB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="293455585"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Aug 2026 16:06:11 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0obJ-000000000Gl-15F6;
	Sun, 30 Aug 2026 23:06:09 +0000
Date: Mon, 31 Aug 2026 01:05:46 +0200
From: kernel test robot <lkp@intel.com>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] mm: adjust free_pages to make
 __zone_watermark_ok() mTHP-aware
Message-ID: <202608310029.Jjv3T2aV-lkp@intel.com>
References: <20260825043833.2659350-5-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825043833.2659350-5-zhangbo56@xiaomi.com>

Hi Bo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Zhang/mm-compaction-make-proactive-compaction-mTHP-aware/20260825-123830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260825043833.2659350-5-zhangbo56%40xiaomi.com
patch subject: [RFC PATCH 4/4] mm: adjust free_pages to make __zone_watermark_ok() mTHP-aware
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260831/202608310029.Jjv3T2aV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310029.Jjv3T2aV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310029.Jjv3T2aV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/compaction.c: In function 'compact_hpage_order':
>> mm/compaction.c:87:42: error: 'huge_anon_orders_always' undeclared (first use in this function)
      87 |         unsigned long orders = READ_ONCE(huge_anon_orders_always);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:87:32: note: in expansion of macro 'READ_ONCE'
      87 |         unsigned long orders = READ_ONCE(huge_anon_orders_always);
         |                                ^~~~~~~~~
   mm/compaction.c:87:42: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:87:32: note: in expansion of macro 'READ_ONCE'
      87 |         unsigned long orders = READ_ONCE(huge_anon_orders_always);
         |                                ^~~~~~~~~


vim +/huge_anon_orders_always +87 mm/compaction.c

    84	
    85	static inline int compact_hpage_order(void)
    86	{
  > 87		unsigned long orders = READ_ONCE(huge_anon_orders_always);
    88	
    89		if (orders)
    90			return __ffs(orders);
    91		return COMPACTION_HPAGE_ORDER;
    92	}
    93	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
