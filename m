Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700CCA93D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715480560; cv=none; b=TzTHRGaSV70FvthaxBlBRBgZfdJncpfuwR6paxoUlj5z5wLSVo3YRJlqDvjttmd7PhgqQM9L3szjNUnzCvkc8WLdhttGxRrEBXon7CCrtrxNaWIAssMAvWwdPDcShBw3p79F0skByqnRNIfZ1Lawbf4Qb8+R5n7RfkpYzX2Vad0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715480560; c=relaxed/simple;
	bh=hbioi7V1f1cZXo2yMQSfPzaaf4jKs+4bV23oY9X2zb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoU1owgdhKESgDss3OYF14OCCVLXU1RJ1WYwcuuPfcreiCopAKtoSGKbWTuvvyQJiYKa1YW+aOWUhrgK1MroEYID5Bi9Ygf3BTKDZrMPK3H5lyM9LvyHMpoFUF+eVVLYK6bCFr34/YAOj6a0TeRLTNQcX6Nsn98BwQw6/bJSCUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEjL8pgh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEjL8pgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715480558; x=1747016558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hbioi7V1f1cZXo2yMQSfPzaaf4jKs+4bV23oY9X2zb4=;
  b=eEjL8pghd9SAIuH/R/xlYiQmoKyU117n3/IiC5qkD/b2Oo3A1NBhH/s5
   O/PCVcyAED+CQWLgYLXjNuqyE7Nhs9gLppmxg+95FJ/n03dkTgnsjmUDn
   gheBR8CIuJP283/YYFYQQCaxkDvPmVKziiW+IsGBi5aO3QwCLkL5+/l1i
   wcXFiW1jzN1wy/2invwBMBRQAMLlmyKJYwWUWePkH6GzFfYZhjlk2zhvV
   DnjFH3SUTcQ6U/GL9/1LAYDPYJjsgKZMAWOs0K1zTd3yt+2I3bJNeWfKa
   Sgq9ISCOVcj1WfXZF8CZRMMvZ4DSM/VqkiK5Xon+GnbfyJ0C/oVnEUNMv
   g==;
X-CSE-ConnectionGUID: aukrGGT3TBORpz6CcmRkBQ==
X-CSE-MsgGUID: WjuQASvaQmyIZk55mGqGWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11485869"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11485869"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 19:22:35 -0700
X-CSE-ConnectionGUID: dUm2vO+XTl2OKDpjlv/KbA==
X-CSE-MsgGUID: h833Yx6DRkCYmhL9HkX1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="34541891"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2024 19:22:33 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5yr9-00084F-0a;
	Sun, 12 May 2024 02:22:31 +0000
Date: Sun, 12 May 2024 10:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Anjali K <anjalik@linux.ibm.com>, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, anjalik@linux.ibm.com,
	kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
	maddy@linux.ibm.com
Subject: Re: [PATCH] powerpc/perf: set cpumode flags using sample address in
 the PPMU_ARCH_31 case
Message-ID: <202405121056.KfeNJMXV-lkp@intel.com>
References: <20240511075344.1393631-1-anjalik@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511075344.1393631-1-anjalik@linux.ibm.com>

Hi Anjali,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dd5a440a31fae6e459c0d6271dddd62825505361]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjali-K/powerpc-perf-set-cpumode-flags-using-sample-address-in-the-PPMU_ARCH_31-case/20240511-202416
base:   dd5a440a31fae6e459c0d6271dddd62825505361
patch link:    https://lore.kernel.org/r/20240511075344.1393631-1-anjalik%40linux.ibm.com
patch subject: [PATCH] powerpc/perf: set cpumode flags using sample address in the PPMU_ARCH_31 case
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121056.KfeNJMXV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/perf/core-book3s.c: In function 'perf_get_misc_flags':
>> arch/powerpc/perf/core-book3s.c:270:13: warning: unused variable 'marked' [-Wunused-variable]
     270 |         int marked = mmcra & MMCRA_SAMPLE_ENABLE;
         |             ^~~~~~


vim +/marked +270 arch/powerpc/perf/core-book3s.c

1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  265  
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  266  static inline u32 perf_get_misc_flags(struct pt_regs *regs)
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  267  {
33904054b40832 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-04-25  268  	bool use_siar = regs_use_siar(regs);
d9f7088dd6d885 arch/powerpc/perf/core-book3s.c    Athira Rajeev          2020-10-21  269  	unsigned long mmcra = regs->dsisr;
d9f7088dd6d885 arch/powerpc/perf/core-book3s.c    Athira Rajeev          2020-10-21 @270  	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  271  	unsigned long siar = mfspr(SPRN_SIAR);
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  272  	unsigned long addr;
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  273  
75382aa72f0682 arch/powerpc/perf/core-book3s.c    Anton Blanchard        2012-06-26  274  	if (!use_siar)
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  275  		return perf_flags_from_msr(regs);
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  276  
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  277  	/*
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  278  	 * If we don't have flags in MMCRA, rather than using
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  279  	 * the MSR, we intuit the flags from the address in
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  280  	 * SIAR which should give slightly more reliable
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  281  	 * results
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  282  	 */
cbda6aa10bd2d9 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-05-15  283  	if (ppmu->flags & PPMU_NO_SIPR) {
a2391b35f1d9d5 arch/powerpc/perf/core-book3s.c    Madhavan Srinivasan    2016-12-24  284  		if (is_kernel_addr(siar))
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  285  			return PERF_RECORD_MISC_KERNEL;
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  286  		return PERF_RECORD_MISC_USER;
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  287  	}
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  288  
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  289  	/* PR has priority over HV, so order below is important */
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  290  	if (regs_sipr(regs)) {
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  291  		if (!(ppmu->flags & PPMU_ARCH_31))
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  292  			return PERF_RECORD_MISC_USER;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  293  	} else if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
cdd6c482c9ff9c arch/powerpc/kernel/perf_event.c   Ingo Molnar            2009-09-21  294  		return PERF_RECORD_MISC_HYPERVISOR;
5682c460264149 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-04-25  295  
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  296  	/*
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  297  	 * Check the address in SIAR to identify the
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  298  	 * privilege levels since the SIER[MSR_HV, MSR_PR]
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  299  	 * bits are not set correctly in power10 sometimes
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  300  	 */
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  301  	if (ppmu->flags & PPMU_ARCH_31) {
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  302  		addr = siar ? siar : regs->nip;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  303  		if (!is_kernel_addr(addr))
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  304  			return PERF_RECORD_MISC_USER;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  305  	}
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  306  
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  307  	return PERF_RECORD_MISC_KERNEL;
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  308  }
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  309  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
