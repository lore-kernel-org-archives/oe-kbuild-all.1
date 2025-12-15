Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC6028CF5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 05:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765775175; cv=none; b=Mjp3HIOLsgxGVXtragtIw54jZ+CYnGvUbbE9bI12QBSEs/oeKU/bsBfdOV3b0x0l2YKT/VRB+qVP+202N6tAUAW2Kp+BlrGc8UFXloSHmBhbFU7cPfd1womrmrQ/AlPhROG1b1WFq8NLsdaqXoQZG+MrpuqL6by9yxjvGfRzuyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765775175; c=relaxed/simple;
	bh=zosrx5I0dSOJO5P4SpwrG05KDYj/RfIOkaG9EmF8iPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XaxJMdvdtVvn5mR85oJyQk4iB3YmpyEYTNNAl7whb/zd4KPLh5C9lmOixyFO2fDikGX7+vqjql8E65+fmBDVQNvrpDijrLGzLGIhcXnox/94OH4nhFtk8cSgc6J1QQ97Io2VPH5c1usaUhjfpiI30LH+CDsHcxvxNd4IZSfyoqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTSnWAxA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTSnWAxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765775174; x=1797311174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zosrx5I0dSOJO5P4SpwrG05KDYj/RfIOkaG9EmF8iPE=;
  b=BTSnWAxAZznldg0n9qhyMBRoR4Hs2FwCZkHq3MWP4G4rN9DnN0M680Gl
   J7dO0i1WTjMzPTtRUmmpRtiFW3FIi5w9Y+Vm0UHDSZt3WcitbXRg883YR
   Yl9ZZpy1EMz/26WYnhEXuVqs2szD6uK3gnIJx/yMsx6SpL7dKKKj1GE6r
   SF4Ytl2Nv5jCyjpHDALywWz1ZQYukGzljYnO8UGRpHgswnccU1fvJj3Ka
   +bdK0NKPvvuHX0yLNRn9Ryl8O7hIM2wuCsSF27o7y5sbSCHisTA03oeNc
   MXF+jmKG0AOW7a5vY+gRzX7+YY+GsfZ+P2Z5JOsgCvT0UF50fAj7oVlTe
   A==;
X-CSE-ConnectionGUID: 5jTTFNPZSaqAmN95pyvUlA==
X-CSE-MsgGUID: m96BFgyrQlGYf97Q3pAeWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67710155"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67710155"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 21:06:13 -0800
X-CSE-ConnectionGUID: 4vhMHzEOTvWaPhIbUhlT9g==
X-CSE-MsgGUID: J+eDwsGvRo2uh06Duri4Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="198141284"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2025 21:06:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV0mf-000000009oP-0wi5;
	Mon, 15 Dec 2025 05:06:09 +0000
Date: Mon, 15 Dec 2025 13:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542] arch/x86/kernel/cpu/proc.c:63:5:
 warning: no previous prototype for function 'show_cpuinfo'
Message-ID: <202512151347.pYQgm67P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   549c32bcd16ff65ec78f30270d68abe28dfddcc8
commit: 9d3b0e8891b8b3450a7cd6d1367946a1c69e4eb9 [3542/3542] bpf: Add cpuinfo_x86 iterator target
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251215/202512151347.pYQgm67P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151347.pYQgm67P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151347.pYQgm67P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/proc.c:63:5: warning: no previous prototype for function 'show_cpuinfo' [-Wmissing-prototypes]
      63 | int show_cpuinfo(struct seq_file *m, void *v)
         |     ^
   arch/x86/kernel/cpu/proc.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | int show_cpuinfo(struct seq_file *m, void *v)
         | ^
         | static 
   1 warning generated.


vim +/show_cpuinfo +63 arch/x86/kernel/cpu/proc.c

    62	
  > 63	int show_cpuinfo(struct seq_file *m, void *v)
    64	{
    65		struct cpuinfo_x86 *c = v;
    66		unsigned int cpu;
    67		int i;
    68	
    69		cpu = c->cpu_index;
    70		seq_printf(m, "processor\t: %u\n"
    71			   "vendor_id\t: %s\n"
    72			   "cpu family\t: %d\n"
    73			   "model\t\t: %u\n"
    74			   "model name\t: %s\n",
    75			   cpu,
    76			   c->x86_vendor_id[0] ? c->x86_vendor_id : "unknown",
    77			   c->x86,
    78			   c->x86_model,
    79			   c->x86_model_id[0] ? c->x86_model_id : "unknown");
    80	
    81		if (c->x86_stepping || c->cpuid_level >= 0)
    82			seq_printf(m, "stepping\t: %d\n", c->x86_stepping);
    83		else
    84			seq_puts(m, "stepping\t: unknown\n");
    85		if (c->microcode)
    86			seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
    87	
    88		if (cpu_has(c, X86_FEATURE_TSC)) {
    89			unsigned int freq = arch_freq_get_on_cpu(cpu);
    90	
    91			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
    92		}
    93	
    94		/* Cache size */
    95		if (c->x86_cache_size)
    96			seq_printf(m, "cache size\t: %u KB\n", c->x86_cache_size);
    97	
    98		show_cpuinfo_core(m, c, cpu);
    99		show_cpuinfo_misc(m, c);
   100	
   101		seq_puts(m, "flags\t\t:");
   102		for (i = 0; i < 32*NCAPINTS; i++)
   103			if (cpu_has(c, i) && x86_cap_flags[i] != NULL) {
   104				if (c->x86_vendor == X86_VENDOR_HYGON)
   105					seq_printf(m, " %s", i == X86_FEATURE_SEV ? "csv" :
   106						   (i == X86_FEATURE_SEV_ES ? "csv2" :
   107						    x86_cap_flags[i]));
   108				else
   109					seq_printf(m, " %s", x86_cap_flags[i]);
   110			}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
