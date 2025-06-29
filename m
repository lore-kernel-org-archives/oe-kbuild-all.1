Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2408DBA45
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751171638; cv=none; b=MMVSY35BRgZDVwskUUA0YDCAcX3tMuNMyCfKSLzJL/qPIM50hoMeuIPcnxeIkpdV8J9Kdg5kYXNRkV90g/QJazH4Ptl3CgHzNpJ1SqdDYvQY3rhTHMqk9qvJrgTlCbqZQt3/H9BcVlYEAd77vtzGbTYUCLfaUUxv1jeAd0N4GYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751171638; c=relaxed/simple;
	bh=/2wqXfgX/FWfcw3PtfX5/kp9Aiep4LeVLF7PvogSFlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ueDxVvHALBUPDwWRVO6O+uH+KOsdRMEac8xf9PpAWQAYyezN3Jjfq++wGNnipQEyYDyAh1nY98a9XdMI6AqDtqSoZ/lhLy+SLSS5vioDXwQfw1zb1WC1IUi1sNJXmC0W0kN9473A1tzWdVmw5kt6f2UzDcwETS2ILJ/m8AYYs30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPHlmzSb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPHlmzSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751171636; x=1782707636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2wqXfgX/FWfcw3PtfX5/kp9Aiep4LeVLF7PvogSFlM=;
  b=aPHlmzSb2CdFqHhL5ZTXcCv2KwsjVuelc/GtQNwGRAtyEoBPhEwgn1Kl
   2UYNpx5Spd3huSE6tqWyZ8tMLj+agy8v972+gmCeH5oDedCiMhISPR6hV
   Fk/KhnySjXAkdFeJtgjWW04pzZTJp/jbWiAaXLlqtdDTuKhZRcjv065nm
   QuLY4N1znoQJAyw6O2jfLy2OHmuqdsOFSX2BWC5ePKBRzfY0u37kq3RNl
   scaIAOskLCEukPqA37AJfblnffCJcU3VIC/Y6NLW0lbtFVzL7vbLUNZIF
   GZd+RfA3S0DOf+YemYpq9asihlwObZIczswH5TzsJ0CNcsLV+JdwkDomy
   g==;
X-CSE-ConnectionGUID: PXUyojfWRGm/IztHVFxoQw==
X-CSE-MsgGUID: XZNETpRxR3CaO2cfmbcPhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64120603"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="64120603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 21:33:55 -0700
X-CSE-ConnectionGUID: A/wLGLioRdWp0k8XweA1Qg==
X-CSE-MsgGUID: 2XJaosLIQR2PezR4kOuMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="153446800"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2025 21:33:53 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVjjh-0000rX-2N;
	Sun, 29 Jun 2025 04:33:49 +0000
Date: Sun, 29 Jun 2025 06:33:43 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2411/2411] arch/x86/kernel/cpu/proc.c:63:5:
 warning: no previous prototype for function 'show_cpuinfo'
Message-ID: <202506290625.yOv5HOMH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 9d3b0e8891b8b3450a7cd6d1367946a1c69e4eb9 [2411/2411] bpf: Add cpuinfo_x86 iterator target
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506290625.yOv5HOMH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290625.yOv5HOMH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290625.yOv5HOMH-lkp@intel.com/

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
