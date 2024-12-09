Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360C215623A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718012; cv=none; b=tkqnqlJ9xangSBX/2CAJ9jm4rX79SZ4QbhtWm4QkVu5VBwoGESIkfC9rFGKayubWLww61DLhkzN6+C3rlx5K6GEjqlziyKcPO+wYRnTuOvLHCqF7/f5jVn72V5uP9wJdFrhg3ilyOhgxk0Ov/hKVq6hiIlgYyUbDISXTJ5V1kcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718012; c=relaxed/simple;
	bh=wttf89jDd1j/BtWvjWQGWkvENgrG9qO8BnUNEb61O3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EafbJDiRDRv5A87bLtQKCekyYEB6dTOUQsQ/tOGvtRQ+vQAlGCCNIsllUzZAl+91Bu3ywdeT4Kf/YchMG8DopMMLaJ3TehPdxgs+2RF11exq6LK1Y5zqMeaGiIFx+C8E9dSLtdWcmwkwRsyyszKN4r38ztpoXPW5+GyRsoHVBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlipT41Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlipT41Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718010; x=1765254010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wttf89jDd1j/BtWvjWQGWkvENgrG9qO8BnUNEb61O3A=;
  b=FlipT41Y+m+ENNYRpX0Bzfu+WqL4s/KtOq45/se1y6MScMDz9sanbJGP
   s16pRVYz9w0x9dMacQI+6vaho3ToGZJxWVv25zZoHFuuAZGUk1gN0i+57
   A9lzHp1QAOymZW/16ZjINRAesRoK9detMj78vDUMkdm66E3txnzM7id26
   iT1dvE2PLrgD9HMb4O04pyCvg7yIwtEi8ir12a6loaDX0u0r6+KCp9OIG
   o56aG/J0tKqu4ghhC7cxkqwEA/Ig8dfGygWudJx6JoSevx6/3zK/kgS57
   G/P1QC+OizDa5CkVSC4f/TDrWcRGAjKJIWjdzli67Dwsql8tfTat7z6dW
   A==;
X-CSE-ConnectionGUID: WIj4pudHQzyqfc0aS0fixw==
X-CSE-MsgGUID: V8PTi8DRRZiK2Mpzo44ebg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33915900"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33915900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:20:10 -0800
X-CSE-ConnectionGUID: WGE8l+nJRS2vca0i+t8ImQ==
X-CSE-MsgGUID: C8JT3FztTkqHquIRNWk+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95300252"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 20:20:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVFe-0003pd-2V;
	Mon, 09 Dec 2024 04:20:06 +0000
Date: Mon, 9 Dec 2024 12:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/6] mm: move per-vma lock into vm_area_struct
Message-ID: <202412072055.sFS0pY7N-lkp@intel.com>
References: <20241206225204.4008261-3-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206225204.4008261-3-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-introduce-vma_start_read_locked-_nested-helpers/20241207-065517
base:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
patch link:    https://lore.kernel.org/r/20241206225204.4008261-3-surenb%40google.com
patch subject: [PATCH v5 2/6] mm: move per-vma lock into vm_area_struct
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241207/202412072055.sFS0pY7N-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072055.sFS0pY7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072055.sFS0pY7N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/vaddr.c:736:
   mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vmas':
>> mm/damon/tests/vaddr-kunit.h:92:1: warning: the frame size of 3424 bytes is larger than 2048 bytes [-Wframe-larger-than=]
      92 | }
         | ^


vim +92 mm/damon/tests/vaddr-kunit.h

17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  38  
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  39  /*
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  40   * Test __damon_va_three_regions() function
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  41   *
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  42   * In case of virtual memory address spaces monitoring, DAMON converts the
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  43   * complex and dynamic memory mappings of each target task to three
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  44   * discontiguous regions which cover every mapped areas.  However, the three
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  45   * regions should not include the two biggest unmapped areas in the original
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  46   * mapping, because the two biggest areas are normally the areas between 1)
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  47   * heap and the mmap()-ed regions, and 2) the mmap()-ed regions and stack.
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  48   * Because these two unmapped areas are very huge but obviously never accessed,
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  49   * covering the region is just a waste.
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  50   *
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  51   * '__damon_va_three_regions() receives an address space of a process.  It
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  52   * first identifies the start of mappings, end of mappings, and the two biggest
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  53   * unmapped areas.  After that, based on the information, it constructs the
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  54   * three regions and returns.  For more detail, refer to the comment of
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  55   * 'damon_init_regions_of()' function definition in 'mm/damon.c' file.
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  56   *
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  57   * For example, suppose virtual address ranges of 10-20, 20-25, 200-210,
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  58   * 210-220, 300-305, and 307-330 (Other comments represent this mappings in
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  59   * more short form: 10-20-25, 200-210-220, 300-305, 307-330) of a process are
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  60   * mapped.  To cover every mappings, the three regions should start with 10,
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  61   * and end with 305.  The process also has three unmapped areas, 25-200,
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  62   * 220-300, and 305-307.  Among those, 25-200 and 220-300 are the biggest two
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  63   * unmapped areas, and thus it should be converted to three regions of 10-25,
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  64   * 200-220, and 300-330.
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  65   */
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  66  static void damon_test_three_regions_in_vmas(struct kunit *test)
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  67  {
d0cf3dd47f0d5d3 mm/damon/vaddr-test.h        Liam R. Howlett 2022-09-06  68  	static struct mm_struct mm;
ba7196e566516f7 mm/damon/tests/vaddr-kunit.h Leo Stone       2024-09-22  69  	struct damon_addr_range regions[3] = {0};
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  70  	/* 10-20-25, 200-210-220, 300-305, 307-330 */
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  71  	struct vm_area_struct vmas[] = {
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  72  		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  73  		(struct vm_area_struct) {.vm_start = 20, .vm_end = 25},
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  74  		(struct vm_area_struct) {.vm_start = 200, .vm_end = 210},
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  75  		(struct vm_area_struct) {.vm_start = 210, .vm_end = 220},
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  76  		(struct vm_area_struct) {.vm_start = 300, .vm_end = 305},
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  77  		(struct vm_area_struct) {.vm_start = 307, .vm_end = 330},
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  78  	};
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  79  
f0679f9e6d88ae9 mm/damon/tests/vaddr-kunit.h SeongJae Park   2024-09-04  80  	mt_init_flags(&mm.mm_mt, MT_FLAGS_ALLOC_RANGE | MT_FLAGS_USE_RCU);
34403fa579514a6 mm/damon/vaddr-test.h        Liam R. Howlett 2023-01-20  81  	if (__link_vmas(&mm.mm_mt, vmas, ARRAY_SIZE(vmas)))
34403fa579514a6 mm/damon/vaddr-test.h        Liam R. Howlett 2023-01-20  82  		kunit_skip(test, "Failed to create VMA tree");
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  83  
d0cf3dd47f0d5d3 mm/damon/vaddr-test.h        Liam R. Howlett 2022-09-06  84  	__damon_va_three_regions(&mm, regions);
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  85  
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  86  	KUNIT_EXPECT_EQ(test, 10ul, regions[0].start);
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  87  	KUNIT_EXPECT_EQ(test, 25ul, regions[0].end);
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  88  	KUNIT_EXPECT_EQ(test, 200ul, regions[1].start);
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  89  	KUNIT_EXPECT_EQ(test, 220ul, regions[1].end);
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  90  	KUNIT_EXPECT_EQ(test, 300ul, regions[2].start);
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  91  	KUNIT_EXPECT_EQ(test, 330ul, regions[2].end);
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07 @92  }
17ccae8bb5c9289 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  93  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
