Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4303199934
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742647321; cv=none; b=do5gjeB+ogS+LCbq0iK8R9QCAbnpfz5qp20gFSXK/WMVRSg1J9E9mBOg7W887x8+8Ac98y9lg8YqpJKgGE24yt4uVfqg5YXOBFEMNJGZbzM+TKJMMtgXghaFc3GLC7Pqm7C48r6K6dMDROKYOgtEcgtJNBPXq6mKy3S+Atf25Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742647321; c=relaxed/simple;
	bh=GV0A9ffuq/PZvmqS/0Y46rEztZyu+YWqdAvWb2b2/9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pplyWf3NEWlL+kymAq7P/ndUYRrKlDSBUz4kJwWcKd7Sy2ifJmHU6tEJ4JKikpR3mJGW13cXfc2WtcjM0z3mKbd/dtKU+kO1OU1HdrHTjf8/5NQ590DKvZZzjT1N+5htiIXGhL7AkquG/SRZab7Nagz+NINxckYNgHoBN8cclp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAlMCaXD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAlMCaXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742647319; x=1774183319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GV0A9ffuq/PZvmqS/0Y46rEztZyu+YWqdAvWb2b2/9Y=;
  b=BAlMCaXD2e1uVxbiNVzf0b22IBkMffTTTNuDNW8vYT98lpYNcySuvXEJ
   F6/k7+bewIq5HQBTGiqLWxDV6otzHwnLKNg93kHBIABj3jo6JuKBnHe2W
   AA+CsxJAL4vd/ISxtFuXrBsMqYNBSiXHF3o0ZVvMVTmNNF985IfhSAg1W
   OMG+LSNLEUUrazqOW4iP/kHI0yMor8EEWz4An3ogEZ0FmQwvDRnbw50J8
   QSgH3oKHwLrM0TF69iaeSw6ExdNXKs9kzyEScCcf8bkzpwEBUwuJA58/w
   ftQu20KeFegkV2JYKsVWE8+hM7Cjt4syNVHkyfy7DMzs8QrxfGN7S058t
   A==;
X-CSE-ConnectionGUID: 8M9XNkuXSzyQYoHI0IoU0g==
X-CSE-MsgGUID: l9fZ95nLQBe3LG15V3Sb7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="46647213"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="46647213"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 05:41:58 -0700
X-CSE-ConnectionGUID: xMRjLYwvSqmFGQ9HV08Xmw==
X-CSE-MsgGUID: R8YxFz3AQ0e3BHyqKEQb4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="124410475"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Mar 2025 05:41:55 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvyAk-000291-1v;
	Sat, 22 Mar 2025 12:41:54 +0000
Date: Sat, 22 Mar 2025 20:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510] mm/page_alloc.c:4648:27:
 sparse: sparse: invalid assignment: &=
Message-ID: <202503222010.7VOhhbEu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   abf385ef625e6aeb4923da42fef9ebce788f4ecf
commit: 875ffd41499ee5a3512da409cbd4c2ffd32b3cfa [1510/1510] mm: Do limit checking after memory allocation for memory reliable
config: arm64-randconfig-r132-20250322 (https://download.01.org/0day-ci/archive/20250322/202503222010.7VOhhbEu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250322/202503222010.7VOhhbEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503222010.7VOhhbEu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:140:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:4648:27: sparse: sparse: invalid assignment: &=
   mm/page_alloc.c:4648:27: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4648:27: sparse:    right side has type int
   mm/page_alloc.c:1489:6: warning: no previous prototype for 'set_zone_contiguous' [-Wmissing-prototypes]
    1489 | void set_zone_contiguous(struct zone *zone)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1511:6: warning: no previous prototype for 'clear_zone_contiguous' [-Wmissing-prototypes]
    1511 | void clear_zone_contiguous(struct zone *zone)
         |      ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7470:27: warning: comparison between two arrays [-Warray-compare]
    7470 |                 if (start <= pos && pos < end && size > adj) 23-      |                           ^~
   mm/page_alloc.c:7474:9: note: in expansion of macro 'adj_init_size'
    7474 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7470 |                 if (start <= pos && pos < end && size > adj) 29-      |                           ^~
   mm/page_alloc.c:7474:9: note: in expansion of macro 'adj_init_size'
    7474 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:41: warning: comparison between two arrays [-Warray-compare]
    7470 |                 if (start <= pos && pos < end && size > adj) 35-      |                                         ^
   mm/page_alloc.c:7474:9: note: in expansion of macro 'adj_init_size'
    7474 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7470 |                 if (start <= pos && pos < end && size > adj) 41-      |                                         ^
   mm/page_alloc.c:7474:9: note: in expansion of macro 'adj_init_size'
    7474 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:27: warning: comparison between two arrays [-Warray-compare]
    7470 |                 if (start <= pos && pos < end && size > adj) 47-      |                           ^~
   mm/page_alloc.c:7476:9: note: in expansion of macro 'adj_init_size'
    7476 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7470 |                 if (start <= pos && pos < end && size > adj) 53-      |                           ^~
   mm/page_alloc.c:7476:9: note: in expansion of macro 'adj_init_size'
    7476 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:41: warning: comparison between two arrays [-Warray-compare]
    7470 |                 if (start <= pos && pos < end && size > adj) 59-      |                                         ^
   mm/page_alloc.c:7476:9: note: in expansion of macro 'adj_init_size'
    7476 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7470 |                 if (start <= pos && pos < end && size > adj) 65-      |                                         ^
   mm/page_alloc.c:7476:9: note: in expansion of macro 'adj_init_size'
    7476 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:27: warning: comparison between two arrays [-Warray-compare]
    7470 |                 if (start <= pos && pos < end && size > adj) 71-      |                           ^~
   mm/page_alloc.c:7477:9: note: in expansion of macro 'adj_init_size'
    7477 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7470 |                 if (start <= pos && pos < end && size > adj) 77-      |                           ^~
   mm/page_alloc.c:7477:9: note: in expansion of macro 'adj_init_size'
    7477 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:41: warning: comparison between two arrays [-Warray-compare]
    7470 |                 if (start <= pos && pos < end && size > adj) 83-      |                                         ^
   mm/page_alloc.c:7477:9: note: in expansion of macro 'adj_init_size'
    7477 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7470 |                 if (start <= pos && pos < end && size > adj) 89-      |                                         ^
   mm/page_alloc.c:7477:9: note: in expansion of macro 'adj_init_size'
    7477 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:27: warning: comparison between two arrays [-Warray-compare]
    7470 |                 if (start <= pos && pos < end && size > adj) 95-      |                           ^~
   mm/page_alloc.c:7478:9: note: in expansion of macro 'adj_init_size'
    7478 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7470 |                 if (start <= pos && pos < end && size > adj) 101-      |                           ^~
   mm/page_alloc.c:7478:9: note: in expansion of macro 'adj_init_size'
    7478 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:41: warning: comparison between two arrays [-Warray-compare]
    7470 |                 if (start <= pos && pos < end && size > adj) 107-      |                                         ^
   mm/page_alloc.c:7478:9: note: in expansion of macro 'adj_init_size'
    7478 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7470:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses

vim +4648 mm/page_alloc.c

  4606	
  4607	/*
  4608	 * return true means memory allocation need retry and flag ___GFP_RELIABILITY
  4609	 * must be cleared.
  4610	 */
  4611	static inline bool check_after_alloc(gfp_t *gfp_mask, unsigned int order,
  4612					     int preferred_nid, nodemask_t *nodemask,
  4613					     struct page **_page)
  4614	{
  4615		if (!mem_reliable_is_enabled())
  4616			return false;
  4617	
  4618		if (!(*gfp_mask & ___GFP_RELIABILITY))
  4619			return false;
  4620	
  4621		if (!*_page)
  4622			goto out_retry;
  4623	
  4624		if (*gfp_mask & __GFP_NOFAIL)
  4625			goto out;
  4626	
  4627		/* check water mark, reserver mirrored mem for kernel */
  4628		if (!mem_reliable_watermark_ok(1 << order))
  4629			goto out_free_page;
  4630	
  4631		/* percpu counter is not initialized, ignore limit check */
  4632		if (!mem_reliable_counter_initialized())
  4633			goto out;
  4634	
  4635		/* spcial user task, systemd is limited by task_reliable_limit */
  4636		if (((current->flags & PF_RELIABLE) || is_global_init(current)) &&
  4637		    !reliable_mem_limit_check(1 << order))
  4638			goto out_free_page;
  4639	
  4640		goto out;
  4641	
  4642	out_free_page:
  4643		__free_pages(*_page, order);
  4644		*_page = NULL;
  4645	
  4646	out_retry:
  4647		if (reliable_allow_fb_enabled() || is_global_init(current)) {
> 4648			*gfp_mask &= ~___GFP_RELIABILITY;
  4649			return true;
  4650		}
  4651	
  4652		if (*gfp_mask & (__GFP_NORETRY | __GFP_RETRY_MAYFAIL | __GFP_THISNODE))
  4653			goto out;
  4654	
  4655		/* Coredumps can quickly deplete all memory reserves */
  4656		if (current->flags & PF_DUMPCORE)
  4657			goto out;
  4658		/* The OOM killer will not help higher order allocs */
  4659		if (order > PAGE_ALLOC_COSTLY_ORDER)
  4660			goto out;
  4661	
  4662		/* oom here */
  4663		mem_reliable_out_of_memory(*gfp_mask, order, preferred_nid,
  4664					nodemask);
  4665	out:
  4666		return false;
  4667	}
  4668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
