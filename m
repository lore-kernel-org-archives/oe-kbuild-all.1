Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4E18E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 02:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689734128; x=1721270128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u68GUkPAi+Uu+zScdE+LfrMbiJxj3lf44E+17MIlR84=;
  b=YllpatqJTTURNQFpNoRAfTujnybDpqh6iRfhbwX94fwZRCMN4ssUR6Td
   VlV8jW2l3pO3Du/ykzvNT2RcM8GUAF4THnDyhxg83r6SHzQN5bssHk88L
   OyCSMqSV3OPFKYYAsdFNRJZvhQ0N9WDRbqutvZt1AjB3KULVKGeeAJRkn
   VN5QW8Mmz23LgjiUj3hkJUzovy2vxHCpNEczsmbsHi9u3hfAeZfsw5ioz
   DbcBESWEWy5lgsDJtmxVV807RHUc/mqAPXAmpd70FKwmMUnfKqPgFlgrM
   Pzi6VzSOPKZGDV2KW6AlJ91Igb2mvqpAkWxkI5eSqytlnoC4/HvOChKfX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="363814781"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="363814781"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 19:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847904711"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="847904711"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 19:35:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLx24-00044P-1w;
	Wed, 19 Jul 2023 02:35:20 +0000
Date: Wed, 19 Jul 2023 10:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 1/2] kernel/sched/pelt.c:476:9: error:
 unknown type name 'sched_avg'; use 'struct' keyword to refer to the type
Message-ID: <202307191002.LOUDaHij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux remove-margins
head:   f49a0141f6fa8e9f6dd3b8cacae3531f90c74343
commit: 88a5e45c9556977f198d903b4c19ec50d91ade9f [1/2] sched/pelt: Add a new function to approximate the future util_avg value
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230719/202307191002.LOUDaHij-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191002.LOUDaHij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191002.LOUDaHij-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:49:
>> kernel/sched/pelt.c:474:15: warning: no previous prototype for 'approximate_util_avg' [-Wmissing-prototypes]
     474 | unsigned long approximate_util_avg(unsigned long util, u64 delta)
         |               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c: In function 'approximate_util_avg':
>> kernel/sched/pelt.c:476:9: error: unknown type name 'sched_avg'; use 'struct' keyword to refer to the type
     476 |         sched_avg sa = {};
         |         ^~~~~~~~~
         |         struct 
>> kernel/sched/pelt.c:476:24: error: empty scalar initializer
     476 |         sched_avg sa = {};
         |                        ^
   kernel/sched/pelt.c:476:24: note: (near initialization for 'sa')
>> kernel/sched/pelt.c:478:24: error: 'runtime' undeclared (first use in this function); did you mean 'rdtime'?
     478 |         accumulate_sum(runtime, &sa, 0, 0, 1);
         |                        ^~~~~~~
         |                        rdtime
   kernel/sched/pelt.c:478:24: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/sched/pelt.c:478:33: error: passing argument 2 of 'accumulate_sum' from incompatible pointer type [-Werror=incompatible-pointer-types]
     478 |         accumulate_sum(runtime, &sa, 0, 0, 1);
         |                                 ^~~
         |                                 |
         |                                 int *
   kernel/sched/pelt.c:102:45: note: expected 'struct sched_avg *' but argument is of type 'int *'
     102 | accumulate_sum(u64 delta, struct sched_avg *sa,
         |                           ~~~~~~~~~~~~~~~~~~^~
>> kernel/sched/pelt.c:479:28: error: passing argument 1 of '___update_load_avg' from incompatible pointer type [-Werror=incompatible-pointer-types]
     479 |         ___update_load_avg(&sa);
         |                            ^~~
         |                            |
         |                            int *
   kernel/sched/pelt.c:257:38: note: expected 'struct sched_avg *' but argument is of type 'int *'
     257 | ___update_load_avg(struct sched_avg *sa, unsigned long load)
         |                    ~~~~~~~~~~~~~~~~~~^~
>> kernel/sched/pelt.c:479:9: error: too few arguments to function '___update_load_avg'
     479 |         ___update_load_avg(&sa);
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c:257:1: note: declared here
     257 | ___update_load_avg(struct sched_avg *sa, unsigned long load)
         | ^~~~~~~~~~~~~~~~~~
>> kernel/sched/pelt.c:481:18: error: request for member 'util_avg' in something not a structure or union
     481 |         return sa.util_avg;
         |                  ^
   kernel/sched/pelt.c:482:1: error: control reaches end of non-void function [-Werror=return-type]
     482 | }
         | ^
   cc1: some warnings being treated as errors


vim +476 kernel/sched/pelt.c

   469	
   470	/*
   471	 * Approximate the new util_avg value assuming an entity has continued to run
   472	 * for @delta ns.
   473	 */
 > 474	unsigned long approximate_util_avg(unsigned long util, u64 delta)
   475	{
 > 476		sched_avg sa = {};
   477	
 > 478		accumulate_sum(runtime, &sa, 0, 0, 1);
 > 479		___update_load_avg(&sa);
   480	
 > 481		return sa.util_avg;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
