Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE5610B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 02:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQyPWdOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699411937; x=1730947937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ic2PifihHMw92O/FRVfICjOpNVYui/Aoj90HmnbW4YI=;
  b=WQyPWdOGTiYHBVXm9Fc9s3RtZS0W8qGNKbvi2Xzr6wMDPdYwTWKw80mW
   pEjX5vuutLrMzebr64vR+zkn9PbjpVoTagzCksZDjvyKk+IbIcBtYUQ0h
   DIVIWJHpldaznsOX4KxB6hkia4Lef+fTZX1hyKA5dJRO0AQavF/l/5qja
   5jtlMQc69A5zvx8s/t3fI925YU8037uwpuCOqdLwns0Elaj3fDr6J91fN
   Vv73yBcsZkNS1gupQg9m8i2uiosR+iPJnYVD7Bqihe4kPMaYChGq04buf
   y1EE2c5Rgw6ZTw7KfXN9xiH8xIVcytJn9T077npWdtOPy5ijwV7MhAphL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475905407"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="475905407"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 18:52:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="756409496"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="756409496"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Nov 2023 18:52:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Yfo-0007bG-0o;
	Wed, 08 Nov 2023 02:52:08 +0000
Date: Wed, 8 Nov 2023 10:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, John Stultz <jstultz@google.com>,
	Joel Fernandes <joelaf@google.com>,
	Qais Yousef <qyousef@google.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>,
	Youssef Esmat <youssefesmat@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>, kernel-team@android.com
Subject: Re: [PATCH v6 15/20] sched: Add proxy deactivate helper
Message-ID: <202311081028.yDLmCWgr-lkp@intel.com>
References: <20231106193524.866104-16-jstultz@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106193524.866104-16-jstultz@google.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on v6.6]
[cannot apply to tip/sched/core tip/master linus/master tip/auto-latest next-20231107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/sched-Unify-runtime-accounting-across-classes/20231107-033946
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20231106193524.866104-16-jstultz%40google.com
patch subject: [PATCH v6 15/20] sched: Add proxy deactivate helper
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311081028.yDLmCWgr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081028.yDLmCWgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081028.yDLmCWgr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:6616:6: warning: no previous prototype for 'proxy_deactivate' [-Wmissing-prototypes]
    6616 | bool proxy_deactivate(struct rq *rq, struct task_struct *next)
         |      ^~~~~~~~~~~~~~~~


vim +/proxy_deactivate +6616 kernel/sched/core.c

  6615	
> 6616	bool proxy_deactivate(struct rq *rq, struct task_struct *next)
  6617	{
  6618		unsigned long state = READ_ONCE(next->__state);
  6619	
  6620		/* Don't deactivate if the state has been changed to TASK_RUNNING */
  6621		if (!state)
  6622			return false;
  6623		if (!try_to_deactivate_task(rq, next, state, true))
  6624			return false;
  6625		put_prev_task(rq, next);
  6626		rq_set_selected(rq, rq->idle);
  6627		resched_curr(rq);
  6628		return true;
  6629	}
  6630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
