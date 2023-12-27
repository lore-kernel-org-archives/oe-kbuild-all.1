Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734944392
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9QoEyjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703676698; x=1735212698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hs7Q6ZKzm+Pj21TpIt5IuK5PgHhk2phoj7Hd77XeK80=;
  b=i9QoEyjjPrq3yAjQ7YUtUqoqCboxrnftX30Vrfl5jrIynzFFaKSf5B7O
   pjowQVsDiyuoM0PIbdfW8GQMJk05sxDArRTpZOtWYrV0eVYVedDzrQxmK
   WATo2Jcve2w8RHQVOLY9o7iGFCPtupEXj/YJBur9B+gylj1uBfCkBR4E8
   dSmkAy5qUwDPQLxjXZ6fRJ8zDfZ4hJaHpFbmuzx2FYqcGUMSJ4IHwVTB4
   4sU4hcFwETqFU6negRslOJOeFnUUlP6RPc1pAQ5e1o9EveJculxrV8X6i
   ebwvFB0Z4vjzFXYW1jD47u5zY9e8Z3sGlj0wMTwkYRIr+khSw2yUFPJ4S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="3269770"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="3269770"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 03:31:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="901659229"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="901659229"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Dec 2023 03:31:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIS8M-000FKr-1a;
	Wed, 27 Dec 2023 11:31:34 +0000
Date: Wed, 27 Dec 2023 19:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 10/11] kernel/cpu.c:1404:9: error:
 implicit declaration of function 'tick_assert_timekeeping_handover'
Message-ID: <202312271944.Un7vt3Si-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   018d96d27486694a8496e3937ac2f7270442c7c3
commit: a8b61acc0092102926a2a5d8aa6c162d9d5762a3 [10/11] tick: Assume timekeeping is correctly handed over upon last offline idle call
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20231227/202312271944.Un7vt3Si-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312271944.Un7vt3Si-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312271944.Un7vt3Si-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched/isolation.h:6,
                    from kernel/cpu.c:13:
   include/linux/tick.h: In function 'tick_cpu_dying':
   include/linux/tick.h:29:1: warning: no return statement in function returning non-void [-Wreturn-type]
      29 | static inline int tick_cpu_dying(unsigned int cpu) { }
         | ^~~~~~
   kernel/cpu.c: In function 'cpuhp_report_idle_dead':
>> kernel/cpu.c:1404:9: error: implicit declaration of function 'tick_assert_timekeeping_handover' [-Werror=implicit-function-declaration]
    1404 |         tick_assert_timekeeping_handover();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/tick_assert_timekeeping_handover +1404 kernel/cpu.c

  1398	
  1399	void cpuhp_report_idle_dead(void)
  1400	{
  1401		struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
  1402	
  1403		BUG_ON(st->state != CPUHP_AP_OFFLINE);
> 1404		tick_assert_timekeeping_handover();
  1405		rcutree_report_cpu_dead();
  1406		st->state = CPUHP_AP_IDLE_DEAD;
  1407		/*
  1408		 * We cannot call complete after rcutree_report_cpu_dead() so we delegate it
  1409		 * to an online cpu.
  1410		 */
  1411		smp_call_function_single(cpumask_first(cpu_online_mask),
  1412					 cpuhp_complete_idle_dead, st, 0);
  1413	}
  1414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
