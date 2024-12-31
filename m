Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1279F154C05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735630031; cv=none; b=W2HYeGCMjqXvuSlPTnOlNeNZDTfYPqKSCZ9mQ7x8vB0vZ3UYFTjQe8AcMmJVWH9+wvc+8Axo2yU5YqF6XLCb/zamCHo8X+XnsE4KWsQnnIbe3p0B8zaRZYnxnhFqhW0X4vj6VeeQnvtaKgYobrIqKIqR6ePbE898FMB8HlM9Z7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735630031; c=relaxed/simple;
	bh=xBKwWVm/vaHkJLCaGJoRfSEf4EDI9g/7VwgT0eaMbA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twhNo9ERz63Gm+zgfgx8NHiIZXKyPosyx5TTN+3G9VAMahwuJL6O5xU2fFX5eNVRxEzDrjD7LkCYvL4dWYu66I11Id4hYTOClCoszbGNxBaNb5pzAM7/88/6QLs0neJc2sQrYgCliWk+CTP73W5VLSPRyaoDnT4m4/zwlm5UE1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBIYsGxN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBIYsGxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735630030; x=1767166030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xBKwWVm/vaHkJLCaGJoRfSEf4EDI9g/7VwgT0eaMbA0=;
  b=gBIYsGxNWmO6X/GBKDS9pzOEbjWf7tEnxak7OpAUdLe4S6mkmjMVUSCv
   MySRZfm7CKKSViHGwpOdzaPIFE6H0J1OsfhksOEHn+GU+F2ztEh/N7Uy2
   DxA2cdX1qT/hDuc+jXD5ugUWopiE/N/V6SjxbUgdCta8xYQ00UEA5ptTz
   1H+imhbcfCCkygOh8frS4wxHXvWpjxFK+XEMb6qd1QgYN/UfPZE4B3rvX
   b/9qRw0J2gJK88A/JMLkna6pC/trgLtuvwXJSmA2h0syHfumZrnpmswMT
   v9GyKpnM/bVL6speR7NF0V6Dtf2wxNirczwz/zb9r5XBreg8W/RdKt6gy
   g==;
X-CSE-ConnectionGUID: nB4D5wg+TLK9uFZrgRZkBQ==
X-CSE-MsgGUID: sDE2zmrjSEWoPKbQhgeysQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46904891"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="46904891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 23:27:09 -0800
X-CSE-ConnectionGUID: PPhuXNwEQFC+nSYSf5x8dg==
X-CSE-MsgGUID: fYlAwu8nRuCF8J59bw2mTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106055456"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2024 23:27:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSWeg-0006ul-0Q;
	Tue, 31 Dec 2024 07:27:06 +0000
Date: Tue, 31 Dec 2024 15:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/12] x86/mm: enable broadcast TLB invalidation for
 multi-threaded processes
Message-ID: <202412311510.wS69Ab51-lkp@intel.com>
References: <20241230175550.4046587-10-riel@surriel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230175550.4046587-10-riel@surriel.com>

Hi Rik,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/mm]
[also build test ERROR on tip/master]
[cannot apply to tip/x86/core tip/auto-latest linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/x86-mm-make-MMU_GATHER_RCU_TABLE_FREE-unconditional/20241231-015909
base:   tip/x86/mm
patch link:    https://lore.kernel.org/r/20241230175550.4046587-10-riel%40surriel.com
patch subject: [PATCH 09/12] x86/mm: enable broadcast TLB invalidation for multi-threaded processes
config: x86_64-buildonly-randconfig-002-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311510.wS69Ab51-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311510.wS69Ab51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311510.wS69Ab51-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/tlb.c: In function 'flush_tlb_mm_range':
>> arch/x86/mm/tlb.c:1342:17: error: implicit declaration of function 'broadcast_tlb_flush'; did you mean 'trace_tlb_flush'? [-Werror=implicit-function-declaration]
    1342 |                 broadcast_tlb_flush(info);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 trace_tlb_flush
>> arch/x86/mm/tlb.c:1346:17: error: implicit declaration of function 'count_tlb_flush'; did you mean 'trace_tlb_flush'? [-Werror=implicit-function-declaration]
    1346 |                 count_tlb_flush(mm);
         |                 ^~~~~~~~~~~~~~~
         |                 trace_tlb_flush
   cc1: some warnings being treated as errors


vim +1342 arch/x86/mm/tlb.c

  1308	
  1309	void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
  1310					unsigned long end, unsigned int stride_shift,
  1311					bool freed_tables)
  1312	{
  1313		struct flush_tlb_info *info;
  1314		unsigned long threshold = tlb_single_page_flush_ceiling;
  1315		u64 new_tlb_gen;
  1316		int cpu;
  1317	
  1318		if (static_cpu_has(X86_FEATURE_INVLPGB))
  1319			threshold *= invlpgb_count_max;
  1320	
  1321		cpu = get_cpu();
  1322	
  1323		/* Should we flush just the requested range? */
  1324		if ((end == TLB_FLUSH_ALL) ||
  1325		    ((end - start) >> stride_shift) > threshold) {
  1326			start = 0;
  1327			end = TLB_FLUSH_ALL;
  1328		}
  1329	
  1330		/* This is also a barrier that synchronizes with switch_mm(). */
  1331		new_tlb_gen = inc_mm_tlb_gen(mm);
  1332	
  1333		info = get_flush_tlb_info(mm, start, end, stride_shift, freed_tables,
  1334					  new_tlb_gen);
  1335	
  1336		/*
  1337		 * flush_tlb_multi() is not optimized for the common case in which only
  1338		 * a local TLB flush is needed. Optimize this use-case by calling
  1339		 * flush_tlb_func_local() directly in this case.
  1340		 */
  1341		if (IS_ENABLED(CONFIG_CPU_SUP_AMD) && mm_broadcast_asid(mm)) {
> 1342			broadcast_tlb_flush(info);
  1343		} else if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
  1344			info->trim_cpumask = should_trim_cpumask(mm);
  1345			flush_tlb_multi(mm_cpumask(mm), info);
> 1346			count_tlb_flush(mm);
  1347		} else if (mm == this_cpu_read(cpu_tlbstate.loaded_mm)) {
  1348			lockdep_assert_irqs_enabled();
  1349			local_irq_disable();
  1350			flush_tlb_func(info);
  1351			local_irq_enable();
  1352		}
  1353	
  1354		put_flush_tlb_info();
  1355		put_cpu();
  1356		mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
  1357	}
  1358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
