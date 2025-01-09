Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A55218ADA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431440; cv=none; b=jLH74F5EepAJyoEMDaQGUGya5oLcz0FhMOqGEW/pc9hGBuIy/C7MIqay60NoF//Tm3uFObMkzwemVOjVFvm9CDzK8X/TZWxS89miwMEV+FEDPE9yJjjyxuYlLk9Q9ye+Ca5yqzaysBVcyFaxq6whZmK6g6T6AkPOYbbaMxDWlZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431440; c=relaxed/simple;
	bh=BWV1WTF/ifCd9oEFOcs2VR1x3kRaZVia0ikTWu/gvLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wd0Nh/gp7k5a7p8Msrdv6MrG8nIQ+pgLTjwUFm5azeqWJ7SMWdD1fd5dFIemcpxFwGx9uhvKtt80xJgXy9mFVwkCM67fOv85SJoO4BQdgzyYI75g8kdMGg0A7o4lVEAeeVBYIZ2oq9g7wQWe6dKc58J7fJ3Ok7EtpAkMOuUI5g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tjxn39VU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tjxn39VU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736431439; x=1767967439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BWV1WTF/ifCd9oEFOcs2VR1x3kRaZVia0ikTWu/gvLI=;
  b=Tjxn39VUJF7cNoD1yAue3scvNLFh/BdRkEjCn6fHw8YYViwxHyQXLmWj
   4VFekztnWeG6ol0Qg+3wQwMcKOWu5WQZ7QEQuZM7BOYlYhlXFmS9Vl9+X
   QRaxBs61UpWUuXDo/Vz+akYRcPq3vxyR3rObqiQGnJDBnWg7oYg6eA7xa
   7HhQEjcsYs+O9NG8oQ+lkA/3OCr63nUXfRORyV5tJXII9zvoPJTGPVeef
   vhvCOTssHZuNPd4WySrjwsyhSJEuUjw7pIGOjhD1Zdcsy2SzwblzAc2E+
   Iq9O73ZEjAlLVrLGLX+lQLDpuCLbdCJAIy5kZAb3bPleC3o6iABZR/R3c
   g==;
X-CSE-ConnectionGUID: bsN6N43jRxCdPqJ3f6y5VQ==
X-CSE-MsgGUID: bL8jROWVRcKqIYGTaJ4XJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40458711"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40458711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:03:58 -0800
X-CSE-ConnectionGUID: 04uivOU6Sv6u3hhRdVHm1w==
X-CSE-MsgGUID: nB5f4kv1TO6zGTKfCGEaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126707404"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 06:03:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVt8c-000Hdd-0d;
	Thu, 09 Jan 2025 14:03:54 +0000
Date: Thu, 9 Jan 2025 22:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Subject: Re: [PATCH v3] riscv: Call secondary mmu notifier when flushing the
 tlb
Message-ID: <202501092121.lZ2DY62V-lkp@intel.com>
References: <20250108154907.132863-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108154907.132863-1-alexghiti@rivosinc.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Call-secondary-mmu-notifier-when-flushing-the-tlb/20250108-235624
base:   linus/master
patch link:    https://lore.kernel.org/r/20250108154907.132863-1-alexghiti%40rivosinc.com
patch subject: [PATCH v3] riscv: Call secondary mmu notifier when flushing the tlb
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20250109/202501092121.lZ2DY62V-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092121.lZ2DY62V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092121.lZ2DY62V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/mm/tlbflush.c: In function '__flush_tlb_range':
>> arch/riscv/mm/tlbflush.c:94:14: warning: unused variable 'broadcast' [-Wunused-variable]
      94 |         bool broadcast;
         |              ^~~~~~~~~
>> arch/riscv/mm/tlbflush.c:92:37: warning: unused variable 'ftd' [-Wunused-variable]
      92 |         struct flush_tlb_range_data ftd;
         |                                     ^~~


vim +/broadcast +94 arch/riscv/mm/tlbflush.c

    86	
    87	static void __flush_tlb_range(struct mm_struct *mm,
    88				      const struct cpumask *cmask,
    89				      unsigned long start, unsigned long size,
    90				      unsigned long stride)
    91	{
  > 92		struct flush_tlb_range_data ftd;
    93		unsigned long asid = get_mm_asid(mm);
  > 94		bool broadcast;
    95		unsigned int cpu;
    96	
    97		if (cpumask_empty(cmask))
    98			return;
    99	
   100		cpu = get_cpu();
   101	
   102		/* Check if the TLB flush needs to be sent to other CPUs. */
   103		if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
   104			local_flush_tlb_range_asid(start, size, stride, asid);
   105		} else if (riscv_use_sbi_for_rfence()) {
   106			sbi_remote_sfence_vma_asid(cmask, start, size, asid);
   107		} else {
   108			struct flush_tlb_range_data ftd;
   109	
   110			ftd.asid = asid;
   111			ftd.start = start;
   112			ftd.size = size;
   113			ftd.stride = stride;
   114			on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
   115		}
   116	
   117		put_cpu();
   118	
   119		if (mm)
   120			mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + size);
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
