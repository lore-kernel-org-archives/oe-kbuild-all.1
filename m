Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8A130100E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009607; cv=none; b=G9QVIXTV3g6RJ/WY+jhl1eUWROL2suRYC6I2NA8JCFyN9PB0W4ei/M2vfRMrHoVfeKAeAK5nr0I8YMvr5Ns3MmcECaBu5zlp7sPbgJq4Q63SvqAoQbDqVMjl1XCPuFnPiK4yGKAUmDOR+FbDAMcY5OEGvy2OorZQ0RN/iVGXSXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009607; c=relaxed/simple;
	bh=sy4erEONdByWN2zJUcQ/vtQonJnrdCdFe/tj/YGRwos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I19fwLrrD2PaK9InZ404qWaDDQFB99K6tjsIoP/c+QYG6/yWlapJbzFk+brOQLcDLrgCJ1Z+nORGCqZMSLj5IO0SJLjTrSgnTTgHFWMDG+oxTOlHpxPS+3BLLEAcGigCJyNwF2NOMHXgwEuyVPVxPa0bD5fZboKuMsDy/SsChyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UW4Ad0Xa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UW4Ad0Xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009606; x=1794545606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sy4erEONdByWN2zJUcQ/vtQonJnrdCdFe/tj/YGRwos=;
  b=UW4Ad0Xa6r1MAurlRdJ2cg3yfbkDWOMgqa7MqwU7gVZhM4lvtYHh3CtD
   rsT6GSu6z8UauRel3Rt0C+j7cUqOyrrjp+kXM61EUIiYVCv5n70RweZio
   p1xag8W3uq+ychRM9L1OuU5Rhom9Ff5tcMU3X4xphE5Fljuw/fCH4Qfk/
   QN9bL/boVmaui/tnLzFCAUafgDKXGxmEA4Jcfd0RLT1FvKYOSgxGtIwRR
   zaeh6xUAFblvHWB47eKuRZ6xDpQTvWVY9v0l8+2zWUCzZSTfF0wSjMs4i
   AB+SHtpXIqXw4mYaMsX/KjWBpt5UM72+e9BN9zkBJ4rE1TaC4IOUAmVaV
   A==;
X-CSE-ConnectionGUID: 1hC86c1ORIy24C4wal7A7g==
X-CSE-MsgGUID: sbb66LzdQOWm8yTWOvulIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65175895"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65175895"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:23 -0800
X-CSE-ConnectionGUID: WSt68eEpT0qqQ+B6QRqyLA==
X-CSE-MsgGUID: mq5hpr+cQc2TAriwiwOvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="190138863"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2025 20:53:23 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004uA-1b;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:total_cpus 1/2] include/linux/smp.h:71:55: error:
 'cpu_online_mask' undeclared
Message-ID: <202511131053.G7qDiuM3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux total_cpus
head:   57f6e7cf466e27e510bbc03cc2a5b067622f9673
commit: 3a8c8f12c46acd1541dbea31afaa96e8c4bf8177 [1/2] smp: include cpumask_types.h
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131053.G7qDiuM3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131053.G7qDiuM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131053.G7qDiuM3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/m68k/kernel/asm-offsets.c:16:
   include/linux/smp.h: In function 'on_each_cpu':
>> include/linux/smp.h:71:55: error: 'cpu_online_mask' undeclared (first use in this function)
      71 |         on_each_cpu_cond_mask(NULL, func, info, wait, cpu_online_mask);
         |                                                       ^~~~~~~~~~~~~~~
   include/linux/smp.h:71:55: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/smp.h: In function 'on_each_cpu_cond':
   include/linux/smp.h:105:60: error: 'cpu_online_mask' undeclared (first use in this function)
     105 |         on_each_cpu_cond_mask(cond_func, func, info, wait, cpu_online_mask);
         |                                                            ^~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/m68k/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1302: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cpu_online_mask +71 include/linux/smp.h

6f1f942cd5fbbe3 He Ying     2021-05-06  65  
bff2dc42bcafdd7 David Daney 2013-09-11  66  /*
bff2dc42bcafdd7 David Daney 2013-09-11  67   * Call a function on all processors
bff2dc42bcafdd7 David Daney 2013-09-11  68   */
a5aa5ce30059722 Nadav Amit  2021-02-20  69  static inline void on_each_cpu(smp_call_func_t func, void *info, int wait)
a5aa5ce30059722 Nadav Amit  2021-02-20  70  {
a5aa5ce30059722 Nadav Amit  2021-02-20 @71  	on_each_cpu_cond_mask(NULL, func, info, wait, cpu_online_mask);
a5aa5ce30059722 Nadav Amit  2021-02-20  72  }
a5aa5ce30059722 Nadav Amit  2021-02-20  73  

:::::: The code at line 71 was first introduced by commit
:::::: a5aa5ce300597224ec76dacc8e63ba3ad7a18bbd smp: Inline on_each_cpu_cond() and on_each_cpu()

:::::: TO: Nadav Amit <namit@vmware.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
