Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093157;
	b=14ULY02wRWQtRemvvtI0vxHYDMt7AU4HHLzW5WBf0T3xEJNfT96cLqBvZjWYdsPTGMiI
	 EsyrTBOmWrMZGBxwiPUW1zHolPz5GSXGLNd0Q6HJqsQYDmVF9LcEU04T4qmh2Xk6mxjjT
	 00n1aohkwNLreNzkTDR4esvJRimlI5s8QybfkWWGIcGTBPMzYCUgrmZUztsKA0nbIyVaS
	 MSd7h7uE27q9JnAnkivecJZlZgV8jlEgf4xRDk5p4QtGswM2ZMrxfPvJms3AfZLF8E71q
	 ghRuJWrDNE5Xf2+GzAzpqtRY4iamMDaUw+HX++IIWBEiMetvU3JdgQbB4qq+wINCSEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093157;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NXNhZZdMSKI17nE/BFQP6d6Ezxht/wcMtIfUsgqfS7c=;
	b=SKkBx5kdnCx6IVTnlGznEvO2Hwj309BUbJq0A/ejUsKkVMTjo6WphCBhyL+/pXJCJ5t4
	 741yHLoJlhULnxGb4LiqzWjpOkCrE74z6TMfx1RBuAtQ3ROw6exRyO29MXCZJPiyCYy+6
	 igRRFx2o9HOc5SrAQoDwyF/gTd3ss+q2x7O4liURQOZsfGynyP4BMcVsG7afS5no1qF+f
	 KjeWEoQCzHLFfrnmq8kp3FViS/T3fzOQQbAWF455U8UzjV/qSr2GlAwooNtZ+smDvGN3B
	 39Jjw1F9XYn10SHv460x/jvT9N+8fTcafviNlHFj727OG461hgd3rP9tsh9MWjtSz6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aEv6xDKg;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B24606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 09:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aEv6xDKg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793093156; x=1824629156;
  h=date:from:to:cc:subject:message-id;
  bh=OT2HHrMempbS78Cvcvwk9iMiAloHsTBGccdidDQWNhA=;
  b=aEv6xDKgcbOrM3DxEPA4U+iuIlKZOCnguQ5dzfYjI+pCqazdz2vHmC/2
   l6DHysVaZvWMk1evHbDXCaSd+sTlKLkVQDm/jO995UW+ZYAB0LsaFdJXN
   NdxQW48fRz3Vbupnw+8leCecBRSOc4d0dwappSnXHtGYrwIjUaIf/GD+3
   QSwfwMqrz+ezvSqqmxsBregN1KIf/G8bpDvu06fLTn21qcZ/DaZy4MaIP
   y3Qih+TUgx3395ZyastDlkGbAh6S8uwXM1yHb1Aw0OzdGhrmwZuH5xMyF
   mnKDmdmgmiDjXOwxZ3GJzD45XDZ/0WKzbAoofubODN7cksM6SzIvX4Kkx
   Q==;
X-CSE-ConnectionGUID: z3FUHQVISwO+E/uAnWy01g==
X-CSE-MsgGUID: p+ftStH+QH6d9rTLtpmW2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1664777"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1664777"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 02:25:56 -0700
X-CSE-ConnectionGUID: jrwx/tRjTY+vBnvcdkf/uw==
X-CSE-MsgGUID: REpwnq+8SrGxGVA2Cg/Daw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4495174"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2026 02:25:54 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLdRH-000000004Sd-2s1d;
	Tue, 27 Oct 2026 09:25:51 +0000
Date: Tue, 27 Oct 2026 10:25:27 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 608/608]
 arch/x86/kernel/cpu/proc.c:113:9: warning: 'total' is used uninitialized
Message-ID: <202610271000.AO08hBry-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   e8129feece4324195ea94555f0d752df963558bf
commit: da4c1b079fbce0a30e6d4e7a8577ed7726933d97 [608/608] cpumask: Switch from inline to __always_inline
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271000.AO08hBry-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271000.AO08hBry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271000.AO08hBry-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/proc.c: In function 'show_cpuinfo':
>> arch/x86/kernel/cpu/proc.c:113:9: warning: 'total' is used uninitialized [-Wuninitialized]
     113 |         show_cpuinfo_core(m, c, cpu, index, rich_container, total);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/proc.c:74:34: note: 'total' was declared here
      74 |         unsigned int cpu, index, total;
         |                                  ^~~~~


vim +/total +113 arch/x86/kernel/cpu/proc.c

a967ceac01cd384 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20   70  
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   71  static int show_cpuinfo(struct seq_file *m, void *v)
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   72  {
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   73  	struct cpuinfo_x86 *c = v;
2f68182fc99aca0 arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   74  	unsigned int cpu, index, total;
a967ceac01cd384 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20   75  	int i;
2f68182fc99aca0 arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   76  	bool rich_container = false;
2f68182fc99aca0 arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   77  
2f68182fc99aca0 arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   78  	index = cpu = c->cpu_index;
2f68182fc99aca0 arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   79  	if (check_rich_container(cpu, &index, &rich_container, &total))
2f68182fc99aca0 arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   80  		return 0;
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   81  
a967ceac01cd384 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20   82  	seq_printf(m, "processor\t: %u\n"
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   83  		   "vendor_id\t: %s\n"
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   84  		   "cpu family\t: %d\n"
a967ceac01cd384 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20   85  		   "model\t\t: %u\n"
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   86  		   "model name\t: %s\n",
2f68182fc99aca0 arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   87  		   index,
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   88  		   c->x86_vendor_id[0] ? c->x86_vendor_id : "unknown",
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   89  		   c->x86,
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   90  		   c->x86_model,
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   91  		   c->x86_model_id[0] ? c->x86_model_id : "unknown");
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   92  
b399151cb48db30 arch/x86/kernel/cpu/proc.c  Jia Zhang           2018-01-01   93  	if (c->x86_stepping || c->cpuid_level >= 0)
b399151cb48db30 arch/x86/kernel/cpu/proc.c  Jia Zhang           2018-01-01   94  		seq_printf(m, "stepping\t: %d\n", c->x86_stepping);
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   95  	else
3736708f034ae1e arch/x86/kernel/cpu/proc.c  Rasmus Villemoes    2014-11-28   96  		seq_puts(m, "stepping\t: unknown\n");
506ed6b53e00ba3 arch/x86/kernel/cpu/proc.c  Andi Kleen          2011-10-12   97  	if (c->microcode)
881e23e56764808 arch/x86/kernel/cpu/proc.c  Borislav Petkov     2011-10-17   98  		seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   99  
890da9cf098364b arch/x86/kernel/cpu/proc.c  Linus Torvalds      2017-11-02  100  	if (cpu_has(c, X86_FEATURE_TSC)) {
6f181c2c1bfc198 arch/x86/kernel/cpu/proc.c  Beata Michalska     2025-01-31  101  		int freq = arch_freq_get_on_cpu(cpu);
890da9cf098364b arch/x86/kernel/cpu/proc.c  Linus Torvalds      2017-11-02  102  
6f181c2c1bfc198 arch/x86/kernel/cpu/proc.c  Beata Michalska     2025-01-31  103  		if (freq < 0)
6f181c2c1bfc198 arch/x86/kernel/cpu/proc.c  Beata Michalska     2025-01-31  104  			seq_puts(m, "cpu MHz\t\t: Unknown\n");
6f181c2c1bfc198 arch/x86/kernel/cpu/proc.c  Beata Michalska     2025-01-31  105  		else
fb4c77c21aba036 arch/x86/kernel/cpu/proc.c  Thomas Gleixner     2022-04-25  106  			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
890da9cf098364b arch/x86/kernel/cpu/proc.c  Linus Torvalds      2017-11-02  107  	}
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  108  
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  109  	/* Cache size */
24dbc6000f4b9b0 arch/x86/kernel/cpu/proc.c  Gustavo A. R. Silva 2018-02-13  110  	if (c->x86_cache_size)
24dbc6000f4b9b0 arch/x86/kernel/cpu/proc.c  Gustavo A. R. Silva 2018-02-13  111  		seq_printf(m, "cache size\t: %u KB\n", c->x86_cache_size);
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  112  
2f68182fc99aca0 arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04 @113  	show_cpuinfo_core(m, c, cpu, index, rich_container, total);
a967ceac01cd384 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20  114  	show_cpuinfo_misc(m, c);
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  115  
3736708f034ae1e arch/x86/kernel/cpu/proc.c  Rasmus Villemoes    2014-11-28  116  	seq_puts(m, "flags\t\t:");
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  117  	for (i = 0; i < 32*NCAPINTS; i++)
48894cdb70531ca arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  118  		if (cpu_has(c, i) && x86_cap_flags[i] != NULL) {
48894cdb70531ca arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  119  			if (c->x86_vendor == X86_VENDOR_HYGON)
48894cdb70531ca arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  120  				seq_printf(m, " %s", i == X86_FEATURE_SEV ? "csv" :
48894cdb70531ca arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  121  					   (i == X86_FEATURE_SEV_ES ? "csv2" :
48894cdb70531ca arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  122  					    x86_cap_flags[i]));
48894cdb70531ca arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  123  			else
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  124  				seq_printf(m, " %s", x86_cap_flags[i]);
48894cdb70531ca arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  125  		}
^1da177e4c3f415 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  126  

:::::: The code at line 113 was first introduced by commit
:::::: 2f68182fc99aca08e0002998ef5825e3338d468b anolis: x86: cpuinfo: Add cpuinfo support for rich container

:::::: TO: Xunlei Pang <xlpang@linux.alibaba.com>
:::::: CC: Yinan Liu <yinan@linux.alibaba.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
