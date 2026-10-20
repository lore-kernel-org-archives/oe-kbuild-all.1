Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505579;
	b=ARcL7eRr8bUACEi6AXC0UDFqQhS51Ps+frl1mu88N9K89/ZXaHPW4YVKklkBIe7/1sgN
	 PLiyt8qtNLAKzeYDtVTo8NO9cEfmEXl5ywBkZXJjT1b59cVWNCLi9Zr+6B9lC/6sRUEUo
	 izh1T7yBPJdhC4eU5fHy4TBueo65MiyrdL1nZaHzOswjYxz/CoQo2A02ALerDQMI/abgB
	 InnnwVEdvAcgXiJqLEAgDX1135FQQy5sJ+g0midPX+Z6zxtaopS1ZWfwsRUBayTOKsbvh
	 p/9hukFLDcwXGeVHHzZ9eqH/HpeX4xbrdmz8fB/0Da2VT9EK3JmqraRu9MlGlywCTew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505579;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IBJ7xaxPlqXnt48urTSi8HIU8d5TGceVfsmmksIMnw4=;
	b=beQbkPdRcsnhAJRYlSnXoclyjRCBEynTd9n9lAO/WwlbgWh118Za7T6sazyY/TedSz9x
	 b6jKx8oUOCn1l4CgPFqJ2RIr9fV8Rkpv5i4D/B4jMO129MN70UbkBXfmO/TreU2iFspTc
	 10Hsg4rRMCYHt8wOpOb7o76zYlV2GJmZesB/evI2hQRdOrqgnirm2oscCJqiuQROOuN3/
	 me9tt41aa5gG6sPrng1XKZYgIcOkbOJPUiVc4sMdlQbEIVRGjCrmE6G/Z/bUIVn8Ap3GA
	 xYOncCg1MxABOVeOpFEse7Al2abS0mxCbkAFMy7xUgMYEjwdovzxlct5cYt2jxT6zuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NOma0dvU;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB871606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 14:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB871606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NOma0dvU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792505579; x=1824041579;
  h=date:from:to:cc:subject:message-id;
  bh=G/QzKde/7DZSoz/g/DlLeVRTBvNuTSo6LC8OEa5sV98=;
  b=NOma0dvUk/th/0sl2nNY5BzN6ipAZEiOMM2Tdoh1UCDpp7BH5VOoCDN3
   S8JSTiXkEi4yKjmWVwM/zSLOxhLcWRLpL2kmVGzmfKbPbps5V+uq/hUG8
   bDVgFBL+Amz1bM+fnfktGVUxqwBzC43IZsFHm3nXcwEaS2xaqD8oo6U3E
   w/eszt+pDDcSmlqNt7enPUcFnK2YGGq+z5etHi/DnFYKHuY03Ztpz2rz1
   YgGb4Bz57lMhb03LJ1sLqcAn1cNSVfuNiHi/4KnHjAgBAVQOnN/fhMXCb
   IQcwcGTZIkN6WCz0q2YLPy0478LGiKuC5nshLSkGyZ5RFlBgKmZzPJ/wo
   Q==;
X-CSE-ConnectionGUID: utSDF6BtR6KIGGQ6Vr6CnQ==
X-CSE-MsgGUID: fEfhwI8CTjuFG97mDwOH+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1092517"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1092517"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 07:12:59 -0700
X-CSE-ConnectionGUID: 9qkFWNuaSBuAV7O83dXbMA==
X-CSE-MsgGUID: JN6eFm0uRKKyzQmaiw/V5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2711336"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Oct 2026 07:12:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJAaF-00000000Nf8-0HxJ;
	Tue, 20 Oct 2026 14:12:55 +0000
Date: Tue, 20 Oct 2026 22:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 1/49]
 include/linux/stop_machine.h:182:9: error: too few arguments to function
 'stop_machine_cpuslocked'
Message-ID: <202610202200.8Dqdvfbf-lkp@intel.com>
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
config: xtensa-randconfig-1001-20261020 (https://download.01.org/0day-ci/archive/20261020/202610202200.8Dqdvfbf-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610202200.8Dqdvfbf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610202200.8Dqdvfbf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:63,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/stop_machine.h: In function 'stop_machine':
   include/linux/stop_machine.h:182:43: warning: passing argument 3 of 'stop_machine_cpuslocked' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     182 |  return stop_machine_cpuslocked(fn, data, cpus);
         |                                           ^~~~
   include/linux/stop_machine.h:167:16: note: expected 'void *' but argument is of type 'const struct cpumask *'
     167 |          void *data, const struct cpumask *cpus)
         |          ~~~~~~^~~~
>> include/linux/stop_machine.h:182:9: error: too few arguments to function 'stop_machine_cpuslocked'
     182 |  return stop_machine_cpuslocked(fn, data, cpus);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stop_machine.h:166:28: note: declared here
     166 | static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, cpu_stop_fn_t postfn,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1 shuffle=3696427084
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=3696427084
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3696427084
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3696427084
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
