Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763F5E571
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760770940; cv=none; b=NL20CBsljQp8Zzyx3+WRQBJFzD2kjg5/v8/HQ0IuvQWDkYsFn7hq77TheDMy8JnQaY32Dm3kD/g3gXIV4AqP335CGDal7NGf8qC5umsP3nTw5YonfvxoE8uqFRubFgVuzswiGH7GOeT82SU7TBb54fFVfRjaabHyYPZqnSyXVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760770940; c=relaxed/simple;
	bh=WESifl7zPxvaC6UcP2FWyoJXD3fGaoQX/tdHjKPxAOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFKRG4jCaXb3g4kE92SQg0LUVtMCkcKCmenV5rg/JHXfDDsCH26s4NSuA2CD9nCTkFa4SkVZPBcHkpAOEaCE0yRiMgzgO1f8pgW/SlQUX/cREupJCufznPcsIn00lpjWVJGuuEQroBCVMOefz+JJ4Uc0eNKaK/t5fw8cXn2urEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laHpR8sT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laHpR8sT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760770938; x=1792306938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WESifl7zPxvaC6UcP2FWyoJXD3fGaoQX/tdHjKPxAOw=;
  b=laHpR8sT2zfhblqKnL8rR97O1sqk28N85179PShvqDdgPAL37FGtHKZl
   +Nyz+lpgDRfNnRBCyPnT85sbg0ANKK/6PqWVRdeuwNK1q85c/rs+ph3cB
   VW5fSr3yR/X0V/E41Zui3RhaPIPWQXAkV0HxhPfVpOMW/HycTgSY0fw54
   r8G6Zfo7OB+Qs6+PUQB0FPgSjsenNCBKx5dNwaMNVof4/4VdXl45hIm9b
   /4HPoQbr6YYvLREfr+9xyRTiynCiXJ2afb0p+YGKI1BXc2yKIUekXpPs9
   7+Iwu3Uap3nuJHJGhx7IQHuJNA+arY9Tj01pinF/TXsyI7OqpfUyBj8Kw
   Q==;
X-CSE-ConnectionGUID: J1xsEMyDTU6W7WH2/rt7TA==
X-CSE-MsgGUID: dhaHcKYcSkiv4R0I7UR5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62014540"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="62014540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 00:02:17 -0700
X-CSE-ConnectionGUID: HgXk5hVaSkS9Li+FO8pfLg==
X-CSE-MsgGUID: Ncjv65c9R0W9VJfaGXRmHw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2025 00:02:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA0xB-000881-1a;
	Sat, 18 Oct 2025 07:02:13 +0000
Date: Sat, 18 Oct 2025 15:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740]
 include/linux/mem_reliable.h:41:15: sparse: sparse: restricted gfp_t
 degrades to integer
Message-ID: <202510181428.zUMwm8BB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fa8b6133306cb8ffc12abaab905aada1ef1a56fe
commit: 33d1f46ad98ea3a13752a6360d97732ab4e119b9 [1740/1740] mm: Introduce memory reliable
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251018/202510181428.zUMwm8BB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181428.zUMwm8BB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181428.zUMwm8BB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:140:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
>> include/linux/mem_reliable.h:41:15: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:4572:13: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:4573:27: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4573:27: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4573:27: sparse:    right side has type unsigned int
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 20-      |                           ^~
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 26-      |                           ^~
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 32-      |                                         ^
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 38-      |                                         ^
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 44-      |                           ^~
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 50-      |                           ^~
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 56-      |                                         ^
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 62-      |                                         ^
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 68-      |                           ^~
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 74-      |                           ^~
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 80-      |                                         ^
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 86-      |                                         ^
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 92-      |                           ^~
   mm/page_alloc.c:7381:9: note: in expansion of macro 'adj_init_size'
    7381 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 98-      |                           ^~
   mm/page_alloc.c:7381:9: note: in expansion of macro 'adj_init_size'
    7381 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 104-      |                                         ^
   mm/page_alloc.c:7381:9: note: in expansion of macro 'adj_init_size'
    7381 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);

vim +41 include/linux/mem_reliable.h

    31	
    32	static inline bool skip_none_movable_zone(gfp_t gfp, struct zoneref *z)
    33	{
    34		if (!mem_reliable_is_enabled())
    35			return false;
    36	
    37		if (!current->mm || (current->flags & PF_KTHREAD))
    38			return false;
    39	
    40		/* user tasks can only alloc memory from non-mirrored region */
  > 41		if (!(gfp & ___GFP_RELIABILITY) && (gfp & __GFP_HIGHMEM) &&
    42		    (gfp & __GFP_MOVABLE)) {
    43			if (zonelist_zone_idx(z) < ZONE_MOVABLE)
    44				return true;
    45		}
    46	
    47		return false;
    48	}
    49	#else
    50	#define reliable_enabled 0
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
