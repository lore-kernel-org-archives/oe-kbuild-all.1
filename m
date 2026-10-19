Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431242;
	b=WQmT2Jjs6nisSXgLTfQX1YoCfuTbAmP8sHXraAETBvKfENWz01IKfkMsmF/tjz75luOR
	 V8Ye6P+/Qp7QIjsxPoSo+G2QFTbaD31IKQYs/Sv2MUgvnTrC5pLhKXQXrhVz2anU0kTEx
	 4kmXZqDvAPVG3OCvIFUEzxdq9j66e9VPmJFjYW7ZgLAD0dKa3kYLUIEKsPbhsXjlvobO0
	 dCnm0aBsXtIYSI5/n4X6ODe/cQpRubICjgvDMTX0kNMeC1m/uOhUFWvTK7qR+yJZi/Nas
	 BMRFyzchJkvAYkI6RfOx5wtN/046toVjvQMX2TRv+rzhnJ5zqh/tx4fqQ2/aeWGHQtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431242;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mocL/vygYOPN85wTlxaUtSXh386rxRdO1dNqJeni4T8=;
	b=vOHC64estTg0epTYn6F5gwS3WhiHT5uS+uijBuQ3YdJNn0fR0scxxEeP29wMWqLlTAtO
	 U0SRh1FgLLxm6+pa6ysYHgpnnh5qQV+XLleGyZpsaR9zZWgiGqx81gZnYPbazOOmOwMce
	 tvyhrZhAvKkGdaWrupQNd30xuIyxkYLF0xlP/CGwffPrHQc+SkBAFWEaaUYiU8T/n8WqT
	 BnSsKE8pwDxvWIrrCgJrN7BfO7Fd/elW9i0MVBptUth1DNgGMLigzl0taZqg6VnDrhCKB
	 i1QwXV7AMT3PfsJyo9q/1Ck/KJxo0yyOyEwdIAW4sXI0+jczHF76FDx6Pv/QL5xY7qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="O8rhpm/X";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140E2606A31B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 17:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 140E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O8rhpm/X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792431242; x=1823967242;
  h=date:from:to:cc:subject:message-id;
  bh=UuXfzNlg+83sP9C3PEmqlOFpHmAdCwZ53PV1viE4sxU=;
  b=O8rhpm/XFEAZJ8Xxvd9dRvwXrKneBXBXphpusJEsLhKVVb4E7vBAFEO9
   iDm/52dh5D/0q9hV2nUIoqOfW+ebbCzM4eBLHTiZCCIJf9Cl3NCLekbqA
   8lFAWtz92UWL10V0REGcUZ3hSZ7xy7wXqSmA8fOUZ7KWzWlE3f7VRWLxD
   7HUm3VNYLQLH+pdkCb/QgKjk5TBzOpmen5SpAJyu2dMoK4UJWhBPvFrNF
   5NLpnct/F66t1PoNFbSUL8M1vMua7IemcfushcwmjzQFhMTbem7UOok04
   NzROiyzC0xM03vMyaW42WhY2XI0nV+uCA6I2BHH+YS9GgWOmUbzBs58+e
   Q==;
X-CSE-ConnectionGUID: zHgFOV/YTSKoW5OmuhsTIA==
X-CSE-MsgGUID: 21wLUVMuRgWG5byMzYhekw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1150303"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1150303"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 10:34:01 -0700
X-CSE-ConnectionGUID: 14MbCPtdS8S84CVN7r/HeQ==
X-CSE-MsgGUID: b+Fy9nTMRs63Nmaq6Jhd9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2557774"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Oct 2026 10:34:00 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIrFF-000000005jz-3qqW;
	Mon, 19 Oct 2026 17:33:57 +0000
Date: Mon, 19 Oct 2026 19:33:52 +0200
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 1/49]
 include/linux/stop_machine.h:182:9: error: too few arguments to function
 'stop_machine_cpuslocked'
Message-ID: <202610191939.Rp89zh4J-lkp@intel.com>
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
config: arc-randconfig-2001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191939.Rp89zh4J-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191939.Rp89zh4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191939.Rp89zh4J-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:63,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/stop_machine.h: In function 'stop_machine':
>> include/linux/stop_machine.h:182:43: warning: passing argument 3 of 'stop_machine_cpuslocked' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return stop_machine_cpuslocked(fn, data, cpus);
                                              ^~~~
   include/linux/stop_machine.h:167:16: note: expected 'void *' but argument is of type 'const struct cpumask *'
             void *data, const struct cpumask *cpus)
             ~~~~~~^~~~
>> include/linux/stop_machine.h:182:9: error: too few arguments to function 'stop_machine_cpuslocked'
     return stop_machine_cpuslocked(fn, data, cpus);
            ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stop_machine.h:166:28: note: declared here
    static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, cpu_stop_fn_t postfn,
                               ^~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1 shuffle=649157078
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=649157078
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=649157078
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=649157078
   make: Target 'prepare' not remade because of errors.


vim +/stop_machine_cpuslocked +182 include/linux/stop_machine.h

9ea09af3bd3090 Heiko Carstens            2008-12-22  178  
cbf78d85079cee Arnd Bergmann             2021-03-12  179  static __always_inline int
cbf78d85079cee Arnd Bergmann             2021-03-12  180  stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus)
fe5595c074005b Sebastian Andrzej Siewior 2017-05-24  181  {
fe5595c074005b Sebastian Andrzej Siewior 2017-05-24 @182  	return stop_machine_cpuslocked(fn, data, cpus);
fe5595c074005b Sebastian Andrzej Siewior 2017-05-24  183  }
fe5595c074005b Sebastian Andrzej Siewior 2017-05-24  184  

:::::: The code at line 182 was first introduced by commit
:::::: fe5595c074005bd94f0c7d1644175941149f6768 stop_machine: Provide stop_machine_cpuslocked()

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
