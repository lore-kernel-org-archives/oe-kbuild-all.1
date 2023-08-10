Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCCE10E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 05:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691645891; x=1723181891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CayQrUa40nv0S04eOfmdWUzwQrCgmWzcl6VakcdccUI=;
  b=i70ps94zreSLiqe+LwdhGLSNDktbg4GW/9nPPbsR7B5kBcf0uzSPaX10
   dkvS2PhbUu0/aYShILLj2/WEEQdlAfm/TTyrdnjhoqhN6uMRPXYwKYkZ8
   Qw396uFoQJXcnU87mheEezMtRvjnyvmzH41tecVoVjJvmEX71OpEWEyjG
   WW5RHrtOa3zO6rSi2OdwAYBFdbkuidV7eeF9gyLcyVDqkSNyQCDFEhXQr
   KKb4fYQHtR66xfd/MgW0swkzv9U01gb6j5ec+LuF6M0KiIVkXiUxbndpC
   NfmdS13O17O+nNhAQVSu8XdyGtj5oM/VlyKIU6HUYbW8bNzivMJo8znyd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="371297174"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="371297174"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 22:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846235576"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="846235576"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 22:38:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTyMy-0006kq-09;
	Thu, 10 Aug 2023 05:38:00 +0000
Date: Thu, 10 Aug 2023 13:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	chenhuacai@kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/2] tick: Rename tick_do_update_jiffies64() and allow
 external usage
Message-ID: <202308101358.qLx84pmx-lkp@intel.com>
References: <20230810041347.3386770-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810041347.3386770-1-chenhuacai@loongson.cn>

Hi Huacai,

kernel test robot noticed the following build errors:

[auto build test ERROR on paulmck-rcu/dev]
[also build test ERROR on linus/master v6.5-rc5 next-20230809]
[cannot apply to tip/timers/nohz]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/rcu-Update-jiffies-in-rcu_cpu_stall_reset/20230810-121637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
patch link:    https://lore.kernel.org/r/20230810041347.3386770-1-chenhuacai%40loongson.cn
patch subject: [PATCH 1/2] tick: Rename tick_do_update_jiffies64() and allow external usage
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308101358.qLx84pmx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101358.qLx84pmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101358.qLx84pmx-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/tick-sched.c: In function 'tick_sched_do_timer':
>> kernel/time/tick-sched.c:114:25: error: implicit declaration of function 'tick_do_update_jiffies64'; did you mean 'do_update_jiffies_64'? [-Werror=implicit-function-declaration]
     114 |                         tick_do_update_jiffies64(now);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
         |                         do_update_jiffies_64
   cc1: some warnings being treated as errors


vim +114 kernel/time/tick-sched.c

5bb962269c29cb Frederic Weisbecker 2012-10-15  100  
5bb962269c29cb Frederic Weisbecker 2012-10-15  101  	/* Check, if the jiffies need an update */
5bb962269c29cb Frederic Weisbecker 2012-10-15  102  	if (tick_do_timer_cpu == cpu)
d0936236a70918 Huacai Chen         2023-08-10  103  		do_update_jiffies_64(now);
ff7de6203131e3 Rafael J. Wysocki   2018-04-06  104  
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  105  	/*
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  106  	 * If jiffies update stalled for too long (timekeeper in stop_machine()
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  107  	 * or VMEXIT'ed for several msecs), force an update.
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  108  	 */
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  109  	if (ts->last_tick_jiffies != jiffies) {
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  110  		ts->stalled_jiffies = 0;
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  111  		ts->last_tick_jiffies = READ_ONCE(jiffies);
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  112  	} else {
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  113  		if (++ts->stalled_jiffies == MAX_STALLED_JIFFIES) {
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02 @114  			tick_do_update_jiffies64(now);
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  115  			ts->stalled_jiffies = 0;
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  116  			ts->last_tick_jiffies = READ_ONCE(jiffies);
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  117  		}
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  118  	}
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  119  
ff7de6203131e3 Rafael J. Wysocki   2018-04-06  120  	if (ts->inidle)
ff7de6203131e3 Rafael J. Wysocki   2018-04-06  121  		ts->got_idle_tick = 1;
5bb962269c29cb Frederic Weisbecker 2012-10-15  122  }
5bb962269c29cb Frederic Weisbecker 2012-10-15  123  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
