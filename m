Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964A1FB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675509046; x=1707045046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CL0Zmt/Uzkvx5lfLFxnaVwpEjAI9x7OL/4zDDw2GPvU=;
  b=c1i90F0ZhyKVevJo6018oSt+FOPocTR4RdxJUFXbPbFS3w7OqhEP1EG3
   VgTiLoLbeyoHfM0jSvuUczwp6e4O8walfTXz+GmciRdHtWlk/X3u19YAQ
   g5xcXGs+2Cwn7CGF9+G6evvurS+iWi5MD9TVTqDNzU6XCcs3rAz+0LWRd
   5tcP+svXyZyEZIvSgqqUvMBsVNUf/xNlGO0zwI8J8Bl1Bvs+Os4XiMNuZ
   QKuV2FWW6XlaZGza+t656klKlWyfdudFQ9r6p8k8dvxNTzHMUc7ifWj/u
   T6m7DixsWSDiApEH++DxLH4Tn/hSTrfipVka57WekE5nttSvWkcvS4FbV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="331065234"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="331065234"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 03:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789964839"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="789964839"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2023 03:10:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOGRN-0001G4-0i;
	Sat, 04 Feb 2023 11:10:41 +0000
Date: Sat, 4 Feb 2023 19:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Leonardo <leobras@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, cgroups@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/isolation: Add cpu_is_isolated() API
Message-ID: <202302041801.0Xt5eNbS-lkp@intel.com>
References: <20230203232409.163847-3-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203232409.163847-3-frederic@kernel.org>

Hi Frederic,

I love your patch! Yet something to improve:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on horms-ipvs-next/master horms-ipvs/master linus/master v6.2-rc6 next-20230203]
[cannot apply to paulmck-rcu/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frederic-Weisbecker/sched-isolation-Merge-individual-nohz_full-features-into-a-common-housekeeping-flag/20230204-072510
patch link:    https://lore.kernel.org/r/20230203232409.163847-3-frederic%40kernel.org
patch subject: [PATCH 2/2] sched/isolation: Add cpu_is_isolated() API
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230204/202302041801.0Xt5eNbS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/89596a035dc10e00cb66d4e75e49d69b75413807
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frederic-Weisbecker/sched-isolation-Merge-individual-nohz_full-features-into-a-common-housekeeping-flag/20230204-072510
        git checkout 89596a035dc10e00cb66d4e75e49d69b75413807
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/char/random.c:56:
   include/linux/sched/isolation.h: In function 'cpu_is_isolated':
>> include/linux/sched/isolation.h:58:17: error: implicit declaration of function 'housekeeping_test_cpu'; did you mean 'housekeeping_any_cpu'? [-Werror=implicit-function-declaration]
      58 |         return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 housekeeping_any_cpu
   cc1: some warnings being treated as errors
--
   In file included from init/main.c:56:
   include/linux/sched/isolation.h: In function 'cpu_is_isolated':
>> include/linux/sched/isolation.h:58:17: error: implicit declaration of function 'housekeeping_test_cpu'; did you mean 'housekeeping_any_cpu'? [-Werror=implicit-function-declaration]
      58 |         return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 housekeeping_any_cpu
   init/main.c: At top level:
   init/main.c:775:20: warning: no previous prototype for 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
     775 | void __init __weak arch_post_acpi_subsys_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   init/main.c:787:20: warning: no previous prototype for 'mem_encrypt_init' [-Wmissing-prototypes]
     787 | void __init __weak mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~
   init/main.c:789:20: warning: no previous prototype for 'poking_init' [-Wmissing-prototypes]
     789 | void __init __weak poking_init(void) { }
         |                    ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/sched/fair.c:38:
   include/linux/sched/isolation.h: In function 'cpu_is_isolated':
>> include/linux/sched/isolation.h:58:17: error: implicit declaration of function 'housekeeping_test_cpu'; did you mean 'housekeeping_any_cpu'? [-Werror=implicit-function-declaration]
      58 |         return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 housekeeping_any_cpu
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:688:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     688 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6067:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6067 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12493:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   12493 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12495:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   12495 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12500:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   12500 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12502:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   12502 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +58 include/linux/sched/isolation.h

    55	
    56	static inline bool cpu_is_isolated(int cpu)
    57	{
  > 58		return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
    59			 !housekeeping_test_cpu(cpu, HK_TYPE_KERNEL_NOISE);
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
