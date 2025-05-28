Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A93A243956
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748415023; cv=none; b=kU2mdg8ZECB4paAbQGtCP2Mvp3xzfCkXwBRTyw+7mx6s4SmxOwWjjEoXbWhkM/BeieQAd9mGOxshi3yB1wnEr19R3J0gnYTTY6scQvqxjudRtAPvSQ+wEdnXQ7EbgfPhZZd40mSj8FEx6Qpt6huBD+P6nKyTEsJ67Yz5IXpRnpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748415023; c=relaxed/simple;
	bh=lqLucUq5tGw1nGzcylZqL4RJqr4d0Okuv2d2S4JgJqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gckShf9Ih4iu5r49QzC208Z+75D8s2zcxp2C07Qezb14QWWxY74DK3K5GR4b5CHYNIJ5SGC25PyMvnGMAO1vgcfLy6CNPdGJ63wYSnobBUflupiKvJjv+QrBdXIMXcScAtpTp1ApDK4bIVp4ZvZwu9rNtKpAmg8DxdAt1ETVm40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSy0SnFQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSy0SnFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748415021; x=1779951021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqLucUq5tGw1nGzcylZqL4RJqr4d0Okuv2d2S4JgJqI=;
  b=dSy0SnFQazZx8Y1S0h5c+CMIndDGkfDfdxR/mKyPf+Upwvh7B8bwsBy0
   ujV7KF40UdUERHBpnwq5NWjCff/0bL2+btLwfGTPR+XrhOTWKALocHu5H
   IQV5HOoVAm4dXDaPoxr7UYNAtiEcPjEGUujHjYhZBm25oKXi3vMuyWj2n
   vVsDHS/zFW867nHbXP18pJ6dCJ4kZyp+yr51etPHC5HrIpIKJ1DfByLZ4
   KDEI7c+LhvdWJ+L6kj9k0rD4oISgPiWDeRrjWhN/gKTXtyP/QebaSF0Rl
   FoSXaMxKi+1NScJEtM/GHrNxuI6E8B2sXz552l30Q7CSG8RKW58Zdpv5g
   A==;
X-CSE-ConnectionGUID: ixhuRM3tSBiqNvAm1LUrpA==
X-CSE-MsgGUID: IJQx/ArPQnyWx8bHHL4oGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50312106"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50312106"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 23:50:19 -0700
X-CSE-ConnectionGUID: qhPjeXoBQcKLTXleTk+gOw==
X-CSE-MsgGUID: 9q3OVa8xSKO4L6mBc9wsbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="174039290"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2025 23:50:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKAcB-000VLX-2c;
	Wed, 28 May 2025 06:50:15 +0000
Date: Wed, 28 May 2025 14:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2320/2320] arch/x86/kernel/cpu/proc.c:63:5:
 warning: no previous prototype for function 'show_cpuinfo'
Message-ID: <202505281457.ZzTKocMO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9a55d4a78730623072ee5a82518e7c094296b8b6
commit: 9d3b0e8891b8b3450a7cd6d1367946a1c69e4eb9 [2320/2320] bpf: Add cpuinfo_x86 iterator target
config: x86_64-buildonly-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505281457.ZzTKocMO-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281457.ZzTKocMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281457.ZzTKocMO-lkp@intel.com/

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
