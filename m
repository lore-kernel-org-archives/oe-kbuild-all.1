Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CBB29AAE0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 03:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746503779; cv=none; b=inD0ozaoToHQKXDMra+WTHaWFExs9UmAfbobdTHnAMq9Au7rIdNOlxeLGKsgml9wRUuMUbX71QgK3LdwvMoJQDGH4ecUbr7bPweoBDKF4yBjXoFWYe8JXMbaig2GXtWZmeBrVUt0GJagrMkrL1jC3nf20FErT2Pe1eltCNFx5qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746503779; c=relaxed/simple;
	bh=ikuFpNq+ZemhSvAi86IFW1x3dqvwj03Iz3Ylp/SEufQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pRt2ZKdAFRyIwga3/48P4NAbUXdZ5tfyWnrehXeO5D8w1lVYA3pECEzVLysb1fZNMppWba/3qJ/mIN8EfQ++YLUsydd7Zm2EmY4WM3k24xdgRrlLUhJEohy1MqQnHipJ+u3gnR6slAO0MM1zcCGOfe8u1VseOdFzrWeuRugyb6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYWigtCD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYWigtCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746503777; x=1778039777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ikuFpNq+ZemhSvAi86IFW1x3dqvwj03Iz3Ylp/SEufQ=;
  b=IYWigtCDfwbTG8XPdvigz4hOsXurGopavUbWDITO3q2S8UOsPQnIvfzY
   uH+qUVdk7nFt9v/lKG5se8X6kkqke/H8dMxTkuqPjgFHwl4glov4RtYmj
   36/6Irc9QMG+GjUwVEEs1zZiY7vHmBdm4wZ2bW8zeZVxFJYy6D36yx3n+
   EcpVyiefVQt+kyjy26HRGkj9/Gun8ZlsAhoObr6U1Kwh1DKIRdMSJcdYy
   meDDCS5bOgxb+MkrGZHVoPVv5i9GDZiIfx6hwCDb/i77Dlbfq3Z6kWTHe
   +c92PQPRGskCOtqbwp1Q4QL+q0zWMQhoZXeUYMceIwfU9pyl5WZJrofKV
   Q==;
X-CSE-ConnectionGUID: +JVujZYoSWO2sBg2SbXnsA==
X-CSE-MsgGUID: en1f98TcRLylzXlCy2Ko+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48157816"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48157816"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:56:16 -0700
X-CSE-ConnectionGUID: pF/+EThjRk++wGSF46kM4Q==
X-CSE-MsgGUID: AasyCNEBRx6d37cSfr7luA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="135471688"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 May 2025 20:56:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC9Ph-0006Ed-0i;
	Tue, 06 May 2025 03:56:13 +0000
Date: Tue, 6 May 2025 11:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-05 0/1] mm/page_alloc.c:6308:23:
 warning: no previous prototype for 'arch_memmap_init'
Message-ID: <202505061124.sHuihFdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-05
head:   b97c62c4e7d1e80fb6a2cb0cb381f03bbcd26a4e
commit: ce6ee46e0f39ed97e23ebf7b5a565e0266a8a1a3 [0/1] mm/page_alloc: fix memory map initialization for descending nodes
config: x86_64-randconfig-123-20250506 (https://download.01.org/0day-ci/archive/20250506/202505061124.sHuihFdf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061124.sHuihFdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061124.sHuihFdf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_alloc.c:2602:5: warning: no previous prototype for 'find_suitable_fallback' [-Wmissing-prototypes]
    2602 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3563:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3563 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6270:20: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
    6270 | void __init __weak memmap_init(void)
         |                    ^~~~~~~~~~~
>> mm/page_alloc.c:6308:23: warning: no previous prototype for 'arch_memmap_init' [-Wmissing-prototypes]
    6308 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7676:9: note: in expansion of macro 'adj_init_size'
    7676 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7676:9: note: in expansion of macro 'adj_init_size'
    7676 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7676:9: note: in expansion of macro 'adj_init_size'
    7676 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7676:9: note: in expansion of macro 'adj_init_size'
    7676 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7678:9: note: in expansion of macro 'adj_init_size'
    7678 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7678:9: note: in expansion of macro 'adj_init_size'
    7678 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7678:9: note: in expansion of macro 'adj_init_size'
    7678 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7678:9: note: in expansion of macro 'adj_init_size'
    7678 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7679:9: note: in expansion of macro 'adj_init_size'
    7679 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7679:9: note: in expansion of macro 'adj_init_size'
    7679 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7679:9: note: in expansion of macro 'adj_init_size'
    7679 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7679:9: note: in expansion of macro 'adj_init_size'
    7679 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7680:9: note: in expansion of macro 'adj_init_size'
    7680 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7680:9: note: in expansion of macro 'adj_init_size'
    7680 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7680:9: note: in expansion of macro 'adj_init_size'
    7680 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7680:9: note: in expansion of macro 'adj_init_size'
    7680 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]


vim +/arch_memmap_init +6308 mm/page_alloc.c

  6306	
  6307	/* A stub for backwards compatibility with custom implementatin on IA-64 */
> 6308	void __meminit __weak arch_memmap_init(unsigned long size, int nid,
  6309					       unsigned long zone,
  6310					       unsigned long range_start_pfn)
  6311	{
  6312	}
  6313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
