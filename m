Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504815;
	b=2JxIA0Wks8M7Vm/Z09u/D9HI8/RPhFW6rBxBvB0EkyScyq3hS6VMS9DWBX39vnxxMMOf
	 hsdNcSI0cfl6y2uhVQjzIMembBSiBbM0J2pWvWDUdJoQweAOJ2wdiFollmgDqPiCLWOvL
	 aI/k6ykpVjQnhRBW3sqOvlv487wCeFdGATsopcy24dtekVVcGceK6S2cdr3alnxvRglov
	 rrmGl/OY4MOq1hB/D0JI3EikLyEYIjuNqZtdKphep9iQhvP+BMlK2PdzhnV3slniPT/rW
	 DLT3w3ng8m23KE+NEx0cDhwrOD0ANwlJL8asA4h/FopfCW5R9lmSyGlQbhdZhdjNA5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504815;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vLINjB+C1T4ogs4YT3kCQJbZv1eG0u0LTz8KrKcwiOQ=;
	b=xgxAsTHf+Mr0gKIxieronETUXy6SOVisUTEBHhEF63GVb2Vl1GU22jgp9Ukm8oweHFDH
	 d0iCbQvCq+el/BGzLulA1tTneecv3aqHckxrbHW2ftUyebO6u65riNOySuEmRQx0JPhKk
	 +9UYBSemy7PNMI365fXrK4jtWJ+Sbom7RdDiQ5ARnp8PPwrI6xNl+68mwuRph38Q/7S5N
	 hWFfJaWL9O8XWr3zdGjB+9TeVkQqX8tNu8VAKSVJCod8FLvopcvkcABBVQIiSaC+A44+G
	 pKItIq9FBx/sy9d8rRQAzW/xxlSN/4IJpgbgggDDxpILyUJMhDTeBN0+mataR/+jzlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bs3lVSjE;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F360A261B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 14:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1F360A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bs3lVSjE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792504815; x=1824040815;
  h=date:from:to:cc:subject:message-id;
  bh=ONC9D4jLiVPaTFWprHMOXprPRs7gppw3qXrbVDJzKo0=;
  b=bs3lVSjE3sy9NYSXcV35d0MsGLHluQr3LrGeSovV0sly1k8Tr/EO2D9P
   fIG9ynxa47OaIvfMjHFaqBoI/KsbQCIPkOx9XX6K1rB5/u0xyx3PBYk5k
   61eeJtYuNaAqe7sgLHagAX8HIV+PclZOONU/XxvVMjGcCTTUBLKripkXM
   CvlsZULuC+lhbRXQ8nMGJT/guDghYXJzdbKBGwlMTR9TcxcTyTqkDWanI
   scZ2lHY1YNU947FRzpejIPEdfwOft2U/JEFD9fJpZ/HTIVohSmOkdSvuV
   Yj+ab1dxO5SbR6sseic+oqbm6dpwABS6dqORsmrOCRiyppU1LzPKEcnvC
   Q==;
X-CSE-ConnectionGUID: L7IsfJv1RCaD9+qmSnV6LQ==
X-CSE-MsgGUID: v3AXLKrkSNenRObykZiQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1242702"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1242702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 07:00:14 -0700
X-CSE-ConnectionGUID: yktrSWkWQDOZDPYMjtfT9Q==
X-CSE-MsgGUID: kC1ttiCLRgazOOUgWunP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2814128"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2026 07:00:12 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJANt-00000000Nby-3vhW;
	Tue, 20 Oct 2026 14:00:09 +0000
Date: Tue, 20 Oct 2026 21:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 1/49]
 include/linux/stop_machine.h:182:16: error: too few arguments to function
 'stop_machine_cpuslocked'; expected 4, have 3
Message-ID: <202610202133.Ffm0fNUn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   8ff5f866a7c2825213c6aa525a88840cbccf1211
commit: c7da79bd2c65b3817e4a2ce25fbdcc3bb8c9262f [1/49] stop_machine: Add post function to execute while other CPUs can exit
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20261020/202610202133.Ffm0fNUn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610202133.Ffm0fNUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610202133.Ffm0fNUn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:63,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/stop_machine.h: In function 'stop_machine':
>> include/linux/stop_machine.h:182:50: warning: passing argument 3 of 'stop_machine_cpuslocked' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     182 |         return stop_machine_cpuslocked(fn, data, cpus);
         |                                                  ^~~~
   include/linux/stop_machine.h:167:58: note: expected 'void *' but argument is of type 'const struct cpumask *'
     167 |                                                    void *data, const struct cpumask *cpus)
         |                                                    ~~~~~~^~~~
>> include/linux/stop_machine.h:182:16: error: too few arguments to function 'stop_machine_cpuslocked'; expected 4, have 3
     182 |         return stop_machine_cpuslocked(fn, data, cpus);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stop_machine.h:166:28: note: declared here
     166 | static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, cpu_stop_fn_t postfn,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/stop_machine_cpuslocked +182 include/linux/stop_machine.h

9ea09af3bd3090e Heiko Carstens            2008-12-22  178  
cbf78d85079cee6 Arnd Bergmann             2021-03-12  179  static __always_inline int
cbf78d85079cee6 Arnd Bergmann             2021-03-12  180  stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus)
fe5595c074005bd Sebastian Andrzej Siewior 2017-05-24  181  {
fe5595c074005bd Sebastian Andrzej Siewior 2017-05-24 @182  	return stop_machine_cpuslocked(fn, data, cpus);
fe5595c074005bd Sebastian Andrzej Siewior 2017-05-24  183  }
fe5595c074005bd Sebastian Andrzej Siewior 2017-05-24  184  

:::::: The code at line 182 was first introduced by commit
:::::: fe5595c074005bd94f0c7d1644175941149f6768 stop_machine: Provide stop_machine_cpuslocked()

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
