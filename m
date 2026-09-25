Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4BB48FF7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331951; cv=none; b=pFlYDfnFLCflCuUysa/9Q65HKFwy81a+mPMLYFuLM1CS3ws8EijVHQo1bSkyd2a3UmI89jXn0TN8Gl4IkHB2NIJS7FanPDiFwI/gzhvau2rdFskx6uDPeSUAzc7wYvw3sS1z1CFpemCa4Phxsnnl73ChmBMLhPTJzWNtK429yjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331951; c=relaxed/simple;
	bh=TrLhgZSAq/v1iNB5KTB+NKckWqO4n0BNvmQjjopYTaA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JLu/QTKL/wDhGuUU+6JsfXufPSKnzlLGBDcO162nwd2nE5sl0agA/Y2c0NCovv49KOHAiVeekIMKEkc27Vu7wkiX92LA8HVftZs5NeILmigG9B6/HwuEmS3h3dtZYELxE6yVtt0ZpiFM+kThf4w+VF46ZnR2VynNZdF1BirHkPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRO8jA13; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRO8jA13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790331950; x=1821867950;
  h=date:from:to:cc:subject:message-id;
  bh=TrLhgZSAq/v1iNB5KTB+NKckWqO4n0BNvmQjjopYTaA=;
  b=hRO8jA13HCjPi6kCncy4LKZhalHQkJqgZ9UXuBiUkHeTkNJ5LSr9bbiW
   RXqJB2N/NY1HsKo+HvyDuUqqj7yd8P+akGXs6Rpp46dHhs7JINSfB0PnA
   +odnJ0OBiFh1Uvz11Z9KlMStnbnzpzs9sCC0Motplwyg2ip3z0vKH3mjw
   jLOWIrC6ZKnbPguhLHZaxlqjUbZqvWrDy+FpJ0/07JcDTr0pW4nBs/iHu
   fG1xjGoQGzLSpmGnTYpvD48VFG6P4TKQh432U1vkOC+TNgwzL/08Ed659
   rJcq+Q5H678ReGtJQUYVm/WmOEuEGo9JDK2M7rdU/II8wqwBjqR0qZmTD
   g==;
X-CSE-ConnectionGUID: Yg5KcSQ+SwG8gGmyFghOdA==
X-CSE-MsgGUID: vzrxesE3Qgq3/7E0EUZLDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90074073"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90074073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:25:50 -0700
X-CSE-ConnectionGUID: 7piKVM1PRvWizcJ2FL/zHQ==
X-CSE-MsgGUID: s45Lm6CJTDieFNfen4qivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273533432"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2026 03:25:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA37h-00000000KSE-1Wtf;
	Fri, 25 Sep 2026 10:25:45 +0000
Date: Fri, 25 Sep 2026 18:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 245/673]
 arch/arc/kernel/setup.c:588:9: warning: format not a string literal and no
 format arguments
Message-ID: <202609251833.SPhnmXte-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: e05b65be2284afdfc5b431631b5b86878c530488 [245/673] treewide: address -Wformat-security warnings
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609251833.SPhnmXte-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251833.SPhnmXte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251833.SPhnmXte-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arc/kernel/setup.c: In function 'show_cpuinfo':
>> arch/arc/kernel/setup.c:588:9: warning: format not a string literal and no format arguments [-Wformat-security]
     588 |         seq_printf(m, arc_cpu_mumbojumbo(cpu_id, &info, str, PAGE_SIZE));
         |         ^~~~~~~~~~
   arch/arc/kernel/setup.c:606:9: warning: format not a string literal and no format arguments [-Wformat-security]
     606 |         seq_printf(m, arc_platform_smp_cpuinfo());
         |         ^~~~~~~~~~


vim +588 arch/arc/kernel/setup.c

c121c5063c0674f Vineet Gupta   2013-01-18  569  
c121c5063c0674f Vineet Gupta   2013-01-18  570  static int show_cpuinfo(struct seq_file *m, void *v)
c121c5063c0674f Vineet Gupta   2013-01-18  571  {
c121c5063c0674f Vineet Gupta   2013-01-18  572  	char *str;
c121c5063c0674f Vineet Gupta   2013-01-18  573  	int cpu_id = ptr_to_cpu(v);
7f35144cea21910 Vlad Zakharov  2017-03-03  574  	struct device *cpu_dev = get_cpu_device(cpu_id);
fad84e39f116035 Vineet Gupta   2020-06-11  575  	struct cpuinfo_arc info;
7f35144cea21910 Vlad Zakharov  2017-03-03  576  	struct clk *cpu_clk;
7f35144cea21910 Vlad Zakharov  2017-03-03  577  	unsigned long freq = 0;
c121c5063c0674f Vineet Gupta   2013-01-18  578  
4c86231c14a8a1e Vineet Gupta   2014-12-12  579  	if (!cpu_online(cpu_id)) {
4c86231c14a8a1e Vineet Gupta   2014-12-12  580  		seq_printf(m, "processor [%d]\t: Offline\n", cpu_id);
4c86231c14a8a1e Vineet Gupta   2014-12-12  581  		goto done;
4c86231c14a8a1e Vineet Gupta   2014-12-12  582  	}
4c86231c14a8a1e Vineet Gupta   2014-12-12  583  
0ee931c4e31a5ef Michal Hocko   2017-09-13  584  	str = (char *)__get_free_page(GFP_KERNEL);
c121c5063c0674f Vineet Gupta   2013-01-18  585  	if (!str)
c121c5063c0674f Vineet Gupta   2013-01-18  586  		goto done;
c121c5063c0674f Vineet Gupta   2013-01-18  587  
fad84e39f116035 Vineet Gupta   2020-06-11 @588  	seq_printf(m, arc_cpu_mumbojumbo(cpu_id, &info, str, PAGE_SIZE));
c121c5063c0674f Vineet Gupta   2013-01-18  589  
7f35144cea21910 Vlad Zakharov  2017-03-03  590  	cpu_clk = clk_get(cpu_dev, NULL);
7f35144cea21910 Vlad Zakharov  2017-03-03  591  	if (IS_ERR(cpu_clk)) {
7f35144cea21910 Vlad Zakharov  2017-03-03  592  		seq_printf(m, "CPU speed \t: Cannot get clock for processor [%d]\n",
7f35144cea21910 Vlad Zakharov  2017-03-03  593  			   cpu_id);
7f35144cea21910 Vlad Zakharov  2017-03-03  594  	} else {
7f35144cea21910 Vlad Zakharov  2017-03-03  595  		freq = clk_get_rate(cpu_clk);
d12c6a6f0c8fd5b blaze          2026-09-09  596  		clk_put(cpu_clk);
7f35144cea21910 Vlad Zakharov  2017-03-03  597  	}
20c7dbbdbe12db7 Alexey Brodkin 2016-02-01  598  	if (freq)
7f35144cea21910 Vlad Zakharov  2017-03-03  599  		seq_printf(m, "CPU speed\t: %lu.%02lu Mhz\n",
20c7dbbdbe12db7 Alexey Brodkin 2016-02-01  600  			   freq / 1000000, (freq / 10000) % 100);
20c7dbbdbe12db7 Alexey Brodkin 2016-02-01  601  
56372082533afb8 Vineet Gupta   2014-09-25  602  	seq_printf(m, "Bogo MIPS\t: %lu.%02lu\n",
c121c5063c0674f Vineet Gupta   2013-01-18  603  		   loops_per_jiffy / (500000 / HZ),
c121c5063c0674f Vineet Gupta   2013-01-18  604  		   (loops_per_jiffy / (5000 / HZ)) % 100);
c121c5063c0674f Vineet Gupta   2013-01-18  605  
af61742813aa9dd Vineet Gupta   2013-01-18  606  	seq_printf(m, arc_platform_smp_cpuinfo());
af61742813aa9dd Vineet Gupta   2013-01-18  607  
c121c5063c0674f Vineet Gupta   2013-01-18  608  	free_page((unsigned long)str);
c121c5063c0674f Vineet Gupta   2013-01-18  609  done:
4c86231c14a8a1e Vineet Gupta   2014-12-12  610  	seq_printf(m, "\n");
c121c5063c0674f Vineet Gupta   2013-01-18  611  
c121c5063c0674f Vineet Gupta   2013-01-18  612  	return 0;
c121c5063c0674f Vineet Gupta   2013-01-18  613  }
c121c5063c0674f Vineet Gupta   2013-01-18  614  

:::::: The code at line 588 was first introduced by commit
:::::: fad84e39f116035ae8d550c6020107b8ac113b45 ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA

:::::: TO: Vineet Gupta <vgupta@kernel.org>
:::::: CC: Vineet Gupta <vgupta@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
