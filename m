Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA2321FF55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680235; cv=none; b=TsNKvkqReyB8DAHwjlW+yN0b72gT6EYykF/qHb+A6XloNB8jXqA4pOXQI2BVLipCNsA2msrDP66S16eQ9oNYCNTF/tVYmRB5vh7NSCjtQ9pzg5+d5go4JNMNalkT4j95sU/8ZLvaQIpvYTqo1gyqxDmKMaCibSEVpLZH839fLC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680235; c=relaxed/simple;
	bh=HwaM7JW3C3ro7lhwVlO+6PFixJD64PLrOO9N8ywINGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVA+yyTBCndrkwP0jwvFHZ10B2U7N+lx94ehx8LJ4hluPrBbyUmRenKAedISBzTsT+Bn17n4dfXR6Y22/XQTw3rmNm86R3foBc+nTmdcy3V2vBP+Vp0dS5wwYAlhxPp6eiR3yTbrVl4DgN4SsbF2V2pSg7xlW/Nz4kEbZi1hdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEunaaHi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEunaaHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763680234; x=1795216234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HwaM7JW3C3ro7lhwVlO+6PFixJD64PLrOO9N8ywINGo=;
  b=XEunaaHiV5OjvZfTfbMikzYqmU0GgS/zIBtwi2FQ3sWmLRoIN8C1hlM2
   yQV9xS2C4QJrZgXxobev+bMKLwesJZ78yqN+VvXgdBxBV4O/xqR0fX6UR
   Z8s2RVJYvaiiT3XICAMTjDRgFAxuQOKPt87I6IvM9nqHZ18oZKSNOZzOo
   SpE03hVquo4hzlVOHWQriy/bzk6ACHBGwGWBjnyqB8yTLdrEIetxmW7LF
   4er22CmT034TDD+/lMeNbAWLSDjYMMpWWgtel/iCW1JSVM13lXjwSvzrP
   svh9u7mNPFWSn4JUOl+xz3ezI2UWgdSKuqcjTmBAghRsN6nv8f2fn2qos
   g==;
X-CSE-ConnectionGUID: cL2zyX2dRJ+7WZBE8etdOw==
X-CSE-MsgGUID: 6PGKOPHvRPGZWFy7q53ANA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65798643"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65798643"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 15:10:34 -0800
X-CSE-ConnectionGUID: Yhm0iZujRjueCt7BcpJFBQ==
X-CSE-MsgGUID: Bf2JzKTGSAClDBRmhm1/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="196652625"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Nov 2025 15:10:33 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMDnK-0004gB-0N;
	Thu, 20 Nov 2025 23:10:30 +0000
Date: Fri, 21 Nov 2025 07:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 04/16] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <202511210643.7QWOPc0o-lkp@intel.com>
References: <20251120214616.14386-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120214616.14386-5-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e5d330e13f67d574f683c052c9a342814fd8fa39]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Introduce-HARDIRQ_DISABLE_BITS/20251121-055548
base:   e5d330e13f67d574f683c052c9a342814fd8fa39
patch link:    https://lore.kernel.org/r/20251120214616.14386-5-lyude%40redhat.com
patch subject: [PATCH v14 04/16] irq & spin_lock: Add counted interrupt disabling/enabling
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251121/202511210643.7QWOPc0o-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210643.7QWOPc0o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210643.7QWOPc0o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:64,
                    from include/linux/sched.h:37,
                    from arch/openrisc/kernel/asm-offsets.c:24:
>> include/linux/smp.h:198:9: warning: 'raw_smp_processor_id' redefined
     198 | #define raw_smp_processor_id()                  0
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/interrupt_rc.h:16,
                    from include/linux/spinlock.h:60:
   arch/openrisc/include/asm/smp.h:15:9: note: this is the location of the previous definition
      15 | #define raw_smp_processor_id()  (current_thread_info()->cpu)
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/interrupt_rc.h:16,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from init/main.c:18:
>> arch/openrisc/include/asm/smp.h:21:59: warning: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration
      21 | extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
         |                                                           ^~~~~~~
   arch/openrisc/include/asm/smp.h:23:54: warning: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration
      23 | extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));
         |                                                      ^~~~~~~
   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:64:
>> include/linux/smp.h:198:9: warning: 'raw_smp_processor_id' redefined
     198 | #define raw_smp_processor_id()                  0
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/smp.h:15:9: note: this is the location of the previous definition
      15 | #define raw_smp_processor_id()  (current_thread_info()->cpu)
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/interrupt_rc.h:16,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:37,
                    from include/linux/percpu.h:12,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from kernel/panic.c:14:
>> arch/openrisc/include/asm/smp.h:15:9: warning: 'raw_smp_processor_id' redefined
      15 | #define raw_smp_processor_id()  (current_thread_info()->cpu)
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/alloc_tag.h:14,
                    from include/linux/percpu.h:5:
   include/linux/smp.h:198:9: note: this is the location of the previous definition
     198 | #define raw_smp_processor_id()                  0
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:64,
                    from include/linux/sched.h:37,
                    from arch/openrisc/kernel/asm-offsets.c:24:
>> include/linux/smp.h:198:9: warning: 'raw_smp_processor_id' redefined
     198 | #define raw_smp_processor_id()                  0
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/interrupt_rc.h:16,
                    from include/linux/spinlock.h:60:
   arch/openrisc/include/asm/smp.h:15:9: note: this is the location of the previous definition
      15 | #define raw_smp_processor_id()  (current_thread_info()->cpu)
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:64,
                    from include/linux/sched.h:37,
                    from include/linux/sched/affinity.h:1,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/smp.h:198:9: warning: 'raw_smp_processor_id' redefined
     198 | #define raw_smp_processor_id()                  0
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/interrupt_rc.h:16,
                    from include/linux/spinlock.h:60:
   arch/openrisc/include/asm/smp.h:15:9: note: this is the location of the previous definition
      15 | #define raw_smp_processor_id()  (current_thread_info()->cpu)
         |         ^~~~~~~~~~~~~~~~~~~~


vim +/raw_smp_processor_id +198 include/linux/smp.h

d1dedb52acd98b Ingo Molnar    2009-03-13  194  
^1da177e4c3f41 Linus Torvalds 2005-04-16  195  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  196   *	These macros fold the SMP functionality into a single CPU system
^1da177e4c3f41 Linus Torvalds 2005-04-16  197   */
39c715b71740c4 Ingo Molnar    2005-06-21 @198  #define raw_smp_processor_id()			0
caa759323c7367 Nadav Amit     2019-06-12  199  static inline void up_smp_call_function(smp_call_func_t func, void *info)
3c30b06df404c8 Con Kolivas    2006-03-26  200  {
3c30b06df404c8 Con Kolivas    2006-03-26  201  }
8691e5a8f691cc Jens Axboe     2008-06-06  202  #define smp_call_function(func, info, wait) \
a5fbb6d1064be8 Ingo Molnar    2007-11-09  203  			(up_smp_call_function(func, info))
3b8967d713d742 Andrew Morton  2013-09-11  204  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
