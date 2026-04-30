Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147C92571C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554639; cv=none; b=FAyuV+ASZFrugI9Bq/QLIQqlguWgmJUo3mB24fbyWQqjFCABJaAGDk0tZqiLtw0M0S8FCvTPRERggnfUmHw+KTzX4e5c1tsDOIWL36QZ6ugB+py95EM7qZnAL6mFsUhsbZeic0MZUmk7CxEQly5OntCFmWw7ejJ2WcCC8McIemc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554639; c=relaxed/simple;
	bh=TCSgwk/WfLddypSiiqQpy/8kBvzx3BaUVUh9NbghgiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M48J0cfRFHxtpWOKjXDsQJhRZFPQbsNKoAPqtLtqWDBcgy6qWepBWX5F4Y1EeCMMioZrMH5uxDNjndy13fi7VUILCXiFIFbWRpEVuQpC10/UEA2n+Z4TO1Z+XbCQJFM+ft3xlZRtvujteZQAFAp/XF3UnLQ4vmNoSBByvw0eKgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mr1Yv5fw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mr1Yv5fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777554638; x=1809090638;
  h=date:from:to:cc:subject:message-id;
  bh=TCSgwk/WfLddypSiiqQpy/8kBvzx3BaUVUh9NbghgiM=;
  b=Mr1Yv5fwwhZRVvlfboY6sOTfowH6ATl9mSY5gWO/IvbpO/rIS2QRXvs4
   9bVSQTdfL+Qm1IE80SNT/kd/KMYAKXgwrcJZ3kHxZN9R9E9fFXGdbos+T
   rxFTQMqI7LL4DmmWs3Gx3vQ/co4K60707zZWe3QYoeShZ80A2Rgk777N0
   7IMth89ibBqVnWgRAPYrCfDD10LEIFCsaKZguojobVr5NNR+G9N5WiTSg
   I9ztjcLtcrl9WY0MAlyrfJbrStC2StHCucv8UNLumWpTizzNm/jfeq6yJ
   nyAQcDWl6aD4TjovugqiL2Yx/oEsKcIWDWJu83MJGm2HACBCqLnmkw9mH
   Q==;
X-CSE-ConnectionGUID: WGqomN8WTwOlKN9qzfzMJg==
X-CSE-MsgGUID: V10auWbTS2O2h9V2ILaECg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78397400"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78397400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:10:38 -0700
X-CSE-ConnectionGUID: 5Nm00DwOTtCYSlIpjOLedw==
X-CSE-MsgGUID: d89QyM/ASK6VSiijJNNhlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234845306"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Apr 2026 06:10:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIRA2-000000004pN-10ib;
	Thu, 30 Apr 2026 13:10:34 +0000
Date: Thu, 30 Apr 2026 15:10:12 +0200
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/percpu.c:3284:46: error: 'percpu_pgd' undeclared; did you
 mean 'percpu_ref'?
Message-ID: <202604301503.Thhnmdrr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-mm-enable-percpu-kernel-page-table/20260430-122920
head:   7e0c701a28a9dc36bcaf857ae2a956b4f3131bf2
commit: 55d66d9a4b96d8a09cf37d61a3280d71f57438a5 arm64: mm: map local percpu first chunk
date:   9 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260430/202604301503.Thhnmdrr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301503.Thhnmdrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301503.Thhnmdrr-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/percpu.c: In function 'pcpu_page_first_chunk':
>> mm/percpu.c:3284:46: error: 'percpu_pgd' undeclared (first use in this function); did you mean 'percpu_ref'?
    3284 |                 map_local_percpu_first_chunk(percpu_pgd[unit], (unsigned long)pcpu_vm.addr,
         |                                              ^~~~~~~~~~
         |                                              percpu_ref
   mm/percpu.c:3284:46: note: each undeclared identifier is reported only once for each function it appears in


vim +3284 mm/percpu.c

  3260	
  3261		for (unit = 0; unit < num_possible_cpus(); unit++) {
  3262			unsigned long unit_addr =
  3263				(unsigned long)vm.addr + unit * ai->unit_size;
  3264	
  3265			for (i = 0; i < unit_pages; i++)
  3266				pcpu_populate_pte(unit_addr + (i << PAGE_SHIFT));
  3267	
  3268			/* pte already populated, the following shouldn't fail */
  3269			rc = __pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
  3270					      unit_pages);
  3271			if (rc < 0)
  3272				panic("failed to map percpu area, err=%d\n", rc);
  3273	
  3274			flush_cache_vmap_early(unit_addr, unit_addr + ai->unit_size);
  3275	
  3276			/* copy static data */
  3277			memcpy((void *)unit_addr, __per_cpu_start, ai->static_size);
  3278	
  3279			/*
  3280			 * Map percpu data to PERCPU map.
  3281			 *
  3282			 * PCPU_FC_EMBED can't support it.
  3283			 */
> 3284			map_local_percpu_first_chunk(percpu_pgd[unit], (unsigned long)pcpu_vm.addr,
  3285					&pages[unit * unit_pages], unit_pages);
  3286		}
  3287	
  3288		/* we're ready, commit */
  3289		pr_info("%d %s pages/cpu s%zu r%zu d%zu\n",
  3290			unit_pages, psize_str, ai->static_size,
  3291			ai->reserved_size, ai->dyn_size);
  3292	
  3293		pcpu_setup_first_chunk(ai, vm.addr);
  3294		goto out_free_ar;
  3295	
  3296	enomem:
  3297		while (--j >= 0)
  3298			pcpu_fc_free(page_address(pages[j]), PAGE_SIZE);
  3299		rc = -ENOMEM;
  3300	out_free_ar:
  3301		memblock_free(pages, pages_size);
  3302		pcpu_free_alloc_info(ai);
  3303		return rc;
  3304	}
  3305	#endif /* BUILD_PAGE_FIRST_CHUNK */
  3306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
