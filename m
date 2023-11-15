Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881D3DB8F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ze3ks1v6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700078963; x=1731614963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ZFlts/+vUZYgxhJ1dfBTq8f0q062xi2NCn+RuYvQoE=;
  b=Ze3ks1v6g9+jt48kuqVJJc0SVDIWYygCryn4gQRabm9COUw6Beq8P2XP
   Cx9Wjqjcfh3dtboXtn0eJdejg+Pl7FOD4/TQQn095ol/KBGiNReHU29ny
   OU2G7LdiOdqfiJpH3yWRqP2LHW7cHfP+wq5q4LUxuIPsugeklmpkZKOeD
   VXQPv21AdchpW6pMJiLBUTy2GJkNRk5fEEZCwM+R00v/rTHysqnMA9eXT
   GOFgJ28CHYX5WprnqRVmne0uuehrN9ohLkqVY8nhLBZx2zPFBeLr0wxOv
   WKFZu9xqmtbbK7cMHXidWdgUffBXdKPPYhxxm92MdEvrblOG9x/R8RGJa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388110076"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="388110076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 12:09:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="6499930"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Nov 2023 12:09:20 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3MCL-0000mS-1u;
	Wed, 15 Nov 2023 20:09:17 +0000
Date: Thu, 16 Nov 2023 04:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Cruz Zhao <CruzZhao@linux.alibaba.com>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	joel@joelfernandes.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] sched/core: introduce core to struct cfs_rq
Message-ID: <202311160433.4Jcpw1My-lkp@intel.com>
References: <20231115113341.13261-3-CruzZhao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115113341.13261-3-CruzZhao@linux.alibaba.com>

Hi Cruz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc1 next-20231115]
[cannot apply to tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cruz-Zhao/sched-core-introduce-core_id-to-struct-rq/20231115-193559
base:   linus/master
patch link:    https://lore.kernel.org/r/20231115113341.13261-3-CruzZhao%40linux.alibaba.com
patch subject: [PATCH 2/4] sched/core: introduce core to struct cfs_rq
config: x86_64-buildonly-randconfig-003-20231116 (https://download.01.org/0day-ci/archive/20231116/202311160433.4Jcpw1My-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160433.4Jcpw1My-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160433.4Jcpw1My-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:12423:6: warning: no previous prototype for 'sched_core_init_cfs_rq' [-Wmissing-prototypes]
   12423 | void sched_core_init_cfs_rq(struct task_group *tg, struct cfs_rq *cfs_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/sched_core_init_cfs_rq +12423 kernel/sched/fair.c

 12422	
 12423	void sched_core_init_cfs_rq(struct task_group *tg, struct cfs_rq *cfs_rq)
 12424	{
 12425	#ifdef CONFIG_FAIR_GROUP_SCHED
 12426		struct rq *rq = rq_of(cfs_rq);
 12427		int core_id = rq->core_id;
 12428	
 12429		cfs_rq->core = tg->cfs_rq[core_id];
 12430	#endif
 12431	}
 12432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
