Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189D1DA61B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741022481; cv=none; b=B9VSYmxM9KEaZaAaQGFmPxtyAn9eCVHBm6H1v1mEI9GO+0g+S6MYEbDw+jBZxq8VUjNjjc6oYu52b9r7+3LasC22j2LxqfsctYth8SBi20KSA+G/3oAVzgJRVdj51IAQHQnuWfxRet6wvecUpEdcYN5KsceIyNwATayUJFDpsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741022481; c=relaxed/simple;
	bh=4LgqAewOhzP903G36iiZrEpFqkBOe8ciCUUcZsWmje4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOFDfSwKS7fr8klx3vIk8IggkNrES8Kt8sZg2OyECAZyKTovnC4wJpAz6pjCfByrqQr0bqCEERDuVHkw479atv2+tGe4F+ElFcX8Z4kRoHDOfxgLQNNgVnl9oasjVoUFtZma8OzIvol6jccCifNn924n51MfiovCR3fbNWr+IfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htxJ1qVC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htxJ1qVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741022479; x=1772558479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4LgqAewOhzP903G36iiZrEpFqkBOe8ciCUUcZsWmje4=;
  b=htxJ1qVCfb/sd4k6JzM2nZoTddoATVsSyigK+67TTjGuIi97/Zxhk9SB
   Q8Hx6gBcmFYk58CwT6AZD2kutzWrXSAhdc/8oVs2sI4XhuCIz9IuWm9sL
   ImQEFOUdXnmPYtiTdXW1Y2efVOIXY/tJdpU2opy9TG5jQiT7912suM38M
   MN4b+O4c0epzzrrop4YD6pGypv4+20fGyGrx5uORNP7bo2gsnMrFcF6zx
   2F7KC0T+VrMbArDcy4PCjPO7Mw2AC8UpwSwqwnbPRHwR0zbL716sTFGMG
   AwM/w8Hi3PXAw2tfjyuRCea4nGgQ+EMvX3JzZm0bWXADUvkBt85Btyi1P
   g==;
X-CSE-ConnectionGUID: wO1jZUUuQkOvEa78BMD9AA==
X-CSE-MsgGUID: boM6uLMPRr2QIe9YLIjihw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45559097"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="45559097"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 09:20:55 -0800
X-CSE-ConnectionGUID: rUh/F0BxTEmwEHjcsyNv1Q==
X-CSE-MsgGUID: X7Da9GlOQ7eVTO1FMn9jIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118586339"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2025 09:20:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp9T8-000Il7-0N;
	Mon, 03 Mar 2025 17:20:43 +0000
Date: Tue, 4 Mar 2025 01:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Borislav Petkov (AMD)" <bp@alien8.de>,
	Nadav Amit <nadav.amit@gmail.com>
Subject: [bp:tip-x86-cpu-tlbi 15/18] arch/x86/mm/tlb.c:492:9: error: implicit
 declaration of function 'mm_clear_asid_transition'; did you mean
 'mm_in_asid_transition'?
Message-ID: <202503040152.dseREtIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git tip-x86-cpu-tlbi
head:   8dce44810022279f97780a5eadda766a6f4017a3
commit: a05a1e35e67bfe03704633c51ca9b03e16fffd06 [15/18] x86/mm: Enable broadcast TLB invalidation for multi-threaded processes
config: i386-buildonly-randconfig-004-20250303 (https://download.01.org/0day-ci/archive/20250304/202503040152.dseREtIX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040152.dseREtIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040152.dseREtIX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/tlb.c: In function 'finish_asid_transition':
>> arch/x86/mm/tlb.c:492:9: error: implicit declaration of function 'mm_clear_asid_transition'; did you mean 'mm_in_asid_transition'? [-Werror=implicit-function-declaration]
     492 |         mm_clear_asid_transition(mm);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         mm_in_asid_transition
   cc1: some warnings being treated as errors


vim +492 arch/x86/mm/tlb.c

   455	
   456	static void finish_asid_transition(struct flush_tlb_info *info)
   457	{
   458		struct mm_struct *mm = info->mm;
   459		int bc_asid = mm_global_asid(mm);
   460		int cpu;
   461	
   462		if (!mm_in_asid_transition(mm))
   463			return;
   464	
   465		for_each_cpu(cpu, mm_cpumask(mm)) {
   466			/*
   467			 * The remote CPU is context switching. Wait for that to
   468			 * finish, to catch the unlikely case of it switching to
   469			 * the target mm with an out of date ASID.
   470			 */
   471			while (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm, cpu)) == LOADED_MM_SWITCHING)
   472				cpu_relax();
   473	
   474			if (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm, cpu)) != mm)
   475				continue;
   476	
   477			/*
   478			 * If at least one CPU is not using the global ASID yet,
   479			 * send a TLB flush IPI. The IPI should cause stragglers
   480			 * to transition soon.
   481			 *
   482			 * This can race with the CPU switching to another task;
   483			 * that results in a (harmless) extra IPI.
   484			 */
   485			if (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm_asid, cpu)) != bc_asid) {
   486				flush_tlb_multi(mm_cpumask(info->mm), info);
   487				return;
   488			}
   489		}
   490	
   491		/* All the CPUs running this process are using the global ASID. */
 > 492		mm_clear_asid_transition(mm);
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
