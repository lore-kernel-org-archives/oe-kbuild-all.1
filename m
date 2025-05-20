Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61705248895
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753143; cv=none; b=WQ6SAuwLkqptjkI9tlNEub4PTP3cjegfYsUnkhJ1BLI6W4bZO487yVseh1nxnJyzEa6PBcDdl+mTbftvEkMerX0TmMCXgJBaM2zXIpMVLP/+3D2LGo0M/UaN1+zlHNi0FYRp2MZtqpsvrquIjycDczmlDS2uTlzoALW7XH2BFaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753143; c=relaxed/simple;
	bh=ay5rUhrzzhr/SAFMfXtUg0+5Mac/9NSFfdvRQ9o9/eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFE/1ZpkCbOPS4FuG1Sv+judcP1BmUA/fgKfieBKp7ZaZGO6twANhESlbaQFq8Qq/Ud+BhYJlBB7Zz9iPgNG81Tuv71toGSgjxG5zJJzz98ZnWoxG3ocg5GVLUyT7XnX5+k4UQsNmGdNO6sgTnjxHk/0jvOJDTliO/lyEh4hqac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evgJshG0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evgJshG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747753142; x=1779289142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ay5rUhrzzhr/SAFMfXtUg0+5Mac/9NSFfdvRQ9o9/eM=;
  b=evgJshG07G+JRJdCtE1GVjgitaSFL1zVHrCIgQonluFgV5SdbvIddz0I
   Z0sG86b4UmS/pCLkiCHnr8DqX7SYzfORKrzxNClGv+i6K9al2Y21u+V8p
   0x5Ta+N/HEgBVTyzhUVMi2EbZr4PFLhLzFCUTsAuDL0RzmpAEDSywBXw0
   6giQ1U00GalGjpH0uL0rTdvTUa6kX8dJYvHnc03VHs+kdemdDMsvfKiMC
   qzMJpjrP78viYDtzUC+VEBRE9eqXe26Zp9uq52VEU7IlCr0mXrZLvz6Kl
   ofR34dCWKsHMuE7NexsMhLz1FmB2mWcfBwNMFWi6c+Fmlzm6wDEwJxnUG
   Q==;
X-CSE-ConnectionGUID: ywYGEhMWS3Oe6ya5PeHL7Q==
X-CSE-MsgGUID: GteemrQETYqj4Vyfh7NwAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52318847"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52318847"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:59:01 -0700
X-CSE-ConnectionGUID: XvFLjzxKRlyIBP6MBaKg8g==
X-CSE-MsgGUID: WQ89ExR1Rf+xjb0A1AFxGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140131768"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2025 07:59:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHOQj-000NGl-2p;
	Tue, 20 May 2025 14:58:57 +0000
Date: Tue, 20 May 2025 22:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
Message-ID: <202505202234.iwMSJRin-lkp@intel.com>
References: <20250520010350.1740223-8-riel@surriel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520010350.1740223-8-riel@surriel.com>

Hi Rik,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on linus/master v6.15-rc7 next-20250516]
[cannot apply to tip/x86/core tip/x86/mm tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/x86-mm-Introduce-MSR_IA32_CORE_CAPABILITIES/20250520-090600
base:   tip/master
patch link:    https://lore.kernel.org/r/20250520010350.1740223-8-riel%40surriel.com
patch subject: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
config: x86_64-buildonly-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505202234.iwMSJRin-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202234.iwMSJRin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505202234.iwMSJRin-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/rar.c: In function 'smp_call_rar_many':
>> arch/x86/mm/rar.c:167:17: error: implicit declaration of function 'arch_send_rar_single_ipi' [-Werror=implicit-function-declaration]
     167 |                 arch_send_rar_single_ipi(cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/mm/rar.c:188:9: error: implicit declaration of function 'arch_send_rar_ipi_mask' [-Werror=implicit-function-declaration]
     188 |         arch_send_rar_ipi_mask(dest_mask);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/arch_send_rar_single_ipi +167 arch/x86/mm/rar.c

   123	
   124	/*
   125	 * This is a modified version of smp_call_function_many() of kernel/smp.c,
   126	 * without a function pointer, because the RAR handler is the ucode.
   127	 */
   128	void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
   129			       unsigned long start, unsigned long end)
   130	{
   131		unsigned long pages = (end - start + PAGE_SIZE) / PAGE_SIZE;
   132		int cpu, next_cpu, this_cpu = smp_processor_id();
   133		cpumask_t *dest_mask;
   134		unsigned long idx;
   135	
   136		if (pages > RAR_INVLPG_MAX_PAGES || end == TLB_FLUSH_ALL)
   137			pages = RAR_INVLPG_MAX_PAGES;
   138	
   139		/*
   140		 * Can deadlock when called with interrupts disabled.
   141		 * We allow cpu's that are not yet online though, as no one else can
   142		 * send smp call function interrupt to this cpu and as such deadlocks
   143		 * can't happen.
   144		 */
   145		WARN_ON_ONCE(cpu_online(this_cpu) && irqs_disabled()
   146			     && !oops_in_progress && !early_boot_irqs_disabled);
   147	
   148		/* Try to fastpath.  So, what's a CPU they want?  Ignoring this one. */
   149		cpu = cpumask_first_and(mask, cpu_online_mask);
   150		if (cpu == this_cpu)
   151			cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
   152	
   153		/* No online cpus?  We're done. */
   154		if (cpu >= nr_cpu_ids)
   155			return;
   156	
   157		/* Do we have another CPU which isn't us? */
   158		next_cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
   159		if (next_cpu == this_cpu)
   160			next_cpu = cpumask_next_and(next_cpu, mask, cpu_online_mask);
   161	
   162		/* Fastpath: do that cpu by itself. */
   163		if (next_cpu >= nr_cpu_ids) {
   164			idx = get_payload();
   165			set_payload(idx, pcid, start, pages);
   166			set_action_entry(idx, cpu);
 > 167			arch_send_rar_single_ipi(cpu);
   168			wait_for_done(idx, cpu);
   169			free_payload(idx);
   170			return;
   171		}
   172	
   173		dest_mask = this_cpu_ptr(&rar_cpu_mask);
   174		cpumask_and(dest_mask, mask, cpu_online_mask);
   175		cpumask_clear_cpu(this_cpu, dest_mask);
   176	
   177		/* Some callers race with other cpus changing the passed mask */
   178		if (unlikely(!cpumask_weight(dest_mask)))
   179			return;
   180	
   181		idx = get_payload();
   182		set_payload(idx, pcid, start, pages);
   183	
   184		for_each_cpu(cpu, dest_mask)
   185			set_action_entry(idx, cpu);
   186	
   187		/* Send a message to all CPUs in the map */
 > 188		arch_send_rar_ipi_mask(dest_mask);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
