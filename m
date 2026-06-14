Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E74430BF4E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 23:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781478341; cv=none; b=bTskG3Q/nlgLXaUm8Tv4saE8wgZQ0nMjgc194h1UONW5lOv8VttYXpZNUPxKEgrrupSBE4KqEBCsfc7cRSu+SP3Nfj3MhxQ05L0/W02CP/2dvFYJQD0mVjVOVMyyGo3SVYcdS6WmU9Ufp/Hkrab2uk5wbzTQdfUArcBqiZTsmfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781478341; c=relaxed/simple;
	bh=Z6AGCYUSL8KT79dPHKFFnaVSSdbcQbsX+r/FlYuPIPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=We5ltSIO+eFNTTF8bZ2g3Cdjz3uBsh3HinbHmFdrixmCJe8CJSEHgnX4hB2BOZP7WkJ8CTU8MQsRDaowEUguwF7iI+rMemdB9McF/97SOJFPz/dJ6k1PvMgQujjHZGkEhpTBGN4LtUVjg97PPm40TjX/KWK8a9iFED7T/JARWCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzj4G4dl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzj4G4dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781478340; x=1813014340;
  h=date:from:to:cc:subject:message-id;
  bh=Z6AGCYUSL8KT79dPHKFFnaVSSdbcQbsX+r/FlYuPIPc=;
  b=fzj4G4dl0Bt4nOrqWPq1oNtjo2CTBTpfA/gEEK3UHDukiD1ALi+yTbEs
   zK7S0DFaVPGL3QkThe8R8znzB4O2GPceMgA8qplcX08pT2iquLmIEKSzP
   3XX0tAgXUA57ThejXE0x6mhkM8Fpe5r2hs5OUbeGAlNA7llvAU3RTAKtk
   5Glk6fdqTRvviIGiraknPU5SKlTmm7dfUJnlQ01wckdIbO8qtL7+aYLTu
   77rfEWK0FHlIGgkJlhgLfgbLnKF9wc7hHHm6KX8V0ry7pZYltjhnD6fQ8
   +UJE3FhvPVsaJWo72vCq26uYYQKwaoYG2MGQaiEYABw9xvhzMNwJt8Imh
   Q==;
X-CSE-ConnectionGUID: ugsb4wbkRD6PW8KMfsl5Jw==
X-CSE-MsgGUID: Em7ZX1hAQ2awOHaVNMmN5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82255588"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82255588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 16:05:39 -0700
X-CSE-ConnectionGUID: FPP5VyzvTciHcjiAE4lbwQ==
X-CSE-MsgGUID: bHSxzY58TCy1/PzWDnx6Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="251587941"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2026 16:05:37 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYttX-000000004m1-0cmH;
	Sun, 14 Jun 2026 23:05:35 +0000
Date: Mon, 15 Jun 2026 01:04:56 +0200
From: kernel test robot <lkp@intel.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/acpi/processor_idle.c:699:39: warning: suggest
 braces around empty body in an 'if' statement
Message-ID: <202606150127.ut0iFPwm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ashwin-Gundarapu/x86-acpi-remove-unused-ACPI_FLUSH_CPU_CACHE-macro/20260614-224607
head:   651c474aa81fd5a23e9392b8bdb69a6b55412111
commit: 651c474aa81fd5a23e9392b8bdb69a6b55412111 x86/acpi: remove unused ACPI_FLUSH_CPU_CACHE macro
date:   8 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260615/202606150127.ut0iFPwm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150127.ut0iFPwm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150127.ut0iFPwm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/processor_idle.c: In function 'acpi_idle_enter':
>> drivers/acpi/processor_idle.c:699:39: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     699 |                 ACPI_FLUSH_CPU_CACHE();
         |                                       ^


vim +/if +699 drivers/acpi/processor_idle.c

6491bc0c616969f Rafael J. Wysocki    2015-02-03  676  
409dfdcaffb266a Guilherme G. Piccoli 2022-06-07  677  static int __cpuidle acpi_idle_enter(struct cpuidle_device *dev,
6491bc0c616969f Rafael J. Wysocki    2015-02-03  678  			   struct cpuidle_driver *drv, int index)
6491bc0c616969f Rafael J. Wysocki    2015-02-03  679  {
6491bc0c616969f Rafael J. Wysocki    2015-02-03  680  	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
6491bc0c616969f Rafael J. Wysocki    2015-02-03  681  	struct acpi_processor *pr;
6491bc0c616969f Rafael J. Wysocki    2015-02-03  682  
6491bc0c616969f Rafael J. Wysocki    2015-02-03  683  	pr = __this_cpu_read(processors);
6491bc0c616969f Rafael J. Wysocki    2015-02-03  684  	if (unlikely(!pr))
6491bc0c616969f Rafael J. Wysocki    2015-02-03  685  		return -EINVAL;
6491bc0c616969f Rafael J. Wysocki    2015-02-03  686  
6491bc0c616969f Rafael J. Wysocki    2015-02-03  687  	if (cx->type != ACPI_STATE_C1) {
1fecfdbb7acc662 Peter Zijlstra       2020-09-15  688  		if (cx->type == ACPI_STATE_C3 && pr->flags.bm_check)
1fecfdbb7acc662 Peter Zijlstra       2020-09-15  689  			return acpi_idle_enter_bm(drv, pr, cx, index);
1fecfdbb7acc662 Peter Zijlstra       2020-09-15  690  
1fecfdbb7acc662 Peter Zijlstra       2020-09-15  691  		/* C2 to C1 demotion. */
5f5081852038d9a Rafael J. Wysocki    2015-02-11  692  		if (acpi_idle_fallback_to_c1(pr) && num_online_cpus() > 1) {
dc2251bf98c66db Rafael J. Wysocki    2017-08-23  693  			index = ACPI_IDLE_STATE_START;
6491bc0c616969f Rafael J. Wysocki    2015-02-03  694  			cx = per_cpu(acpi_cstate[index], dev->cpu);
6491bc0c616969f Rafael J. Wysocki    2015-02-03  695  		}
6491bc0c616969f Rafael J. Wysocki    2015-02-03  696  	}
6491bc0c616969f Rafael J. Wysocki    2015-02-03  697  
6491bc0c616969f Rafael J. Wysocki    2015-02-03  698  	if (cx->type == ACPI_STATE_C3)
6491bc0c616969f Rafael J. Wysocki    2015-02-03 @699  		ACPI_FLUSH_CPU_CACHE();
6491bc0c616969f Rafael J. Wysocki    2015-02-03  700  
6491bc0c616969f Rafael J. Wysocki    2015-02-03  701  	acpi_idle_do_entry(cx);
6491bc0c616969f Rafael J. Wysocki    2015-02-03  702  
e978aa7d7d57d04 Deepthi Dharwar      2011-10-28  703  	return index;
4f86d3a8e297205 Len Brown            2007-10-03  704  }
4f86d3a8e297205 Len Brown            2007-10-03  705  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
