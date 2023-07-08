Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D7879FA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688833353; x=1720369353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTDA+59CeMchFfUY5SdwBcrP1FopXJOFs5VsfZXVFe0=;
  b=e9xwkLOMdLtMIw83dIpQ3qACzg3EbF2ol19Ks9RaAF0kqlUL7GC9EPUt
   pV5H0Ucfv6DvVX5RC1O5yEvh11gGWqv8qA1gfLMg8MUyEHfcENlJ65XfM
   IpV7CBHRXee7RTUPd9gv1U674SA/ciBS41QiRb+nGKmMyEzuLwnjOt7Tn
   uLJOkVqBAwLrktWo+OjEP0qbZgzJfnNw82O2s2l7kMYsxvqYeA5co37lz
   cpZuDDsYdlK5BbJTelRmzq4dzJL8jFzoBn+kAWN7v8ad3R9mSCDJS8f7y
   EwPEUmJq8leH/TzUL2Mrg7qH1kXhhPxQujWuah87jBC3wOBGn/MVlVQ7m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="344407894"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="344407894"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 09:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="670460104"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="670460104"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Jul 2023 09:22:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIAha-0002nQ-0U;
	Sat, 08 Jul 2023 16:22:30 +0000
Date: Sun, 9 Jul 2023 00:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/eevdf-runtime 15/24] kernel/sched/fair.c:721:6:
 sparse: sparse: symbol 'update_entity_lag' was not declared. Should it be
 static?
Message-ID: <202307090042.dyNAig2S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf-runtime
head:   4b03b4e708197d55de7a3a16fd071e6e9d6e2a40
commit: 67e6cafbc7860c02ee1c37eaa8906dd655a32297 [15/24] sched/fair: Add lag based placement
config: x86_64-randconfig-r073-20230708 (https://download.01.org/0day-ci/archive/20230709/202307090042.dyNAig2S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090042.dyNAig2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307090042.dyNAig2S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:721:6: sparse: sparse: symbol 'update_entity_lag' was not declared. Should it be static?
   kernel/sched/fair.c:1065:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1065:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1065:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:8167:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8167:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8167:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8465:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8465:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8465:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:6402:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2279:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2279:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2279:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2117:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2117:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2117:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2117:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2117:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2117:25: sparse:    struct task_struct *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
