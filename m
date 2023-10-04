Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C60E1BDC8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696437716; x=1727973716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bns2GSaejbPHa7Wg7qdT/TRcc1LLeAifaR0loykceoo=;
  b=i7l6E1xArE00gK8B80IlD84WsYG7aCna6XcqncVdd0r7VQ9Jd/x8tfZI
   uIbIENB6SOWPlAnEyZbVj1spQSlhbhjmG29sjJYPVDYDfaExtwHfUhDMP
   NrfHR8eJgAvY2QoF/xGe399Xh0tVldWpueJcS0wO0xN6/Lb7x/XHd4CcP
   Od5nlxcenVVyCMeL5PZWu2Jga5M0EAMVC83pS3sZDs9yaIKwKn20PHgcU
   WoZy70q45BH62iORtSFjk/lx18L5AiGzg80AVtqgiLBBXiFW1ZtBESHrU
   VgURvhEyP9YWszP6SSMt/xwSc4sXh/uIzrtBGbqWt4PWC3YWnVxpk47a6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386054594"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="386054594"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 09:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867467957"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="867467957"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Oct 2023 09:39:46 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo4u6-000KPc-36;
	Wed, 04 Oct 2023 16:39:26 +0000
Date: Thu, 5 Oct 2023 00:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hongyan Xia <Hongyan.Xia2@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/6] sched/uclamp: Track uclamped util_avg in
 sched_avg
Message-ID: <202310050002.oZtZAQCx-lkp@intel.com>
References: <5564fc23d5e6425d069c36b4cef48edbe77fe64d.1696345700.git.Hongyan.Xia2@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5564fc23d5e6425d069c36b4cef48edbe77fe64d.1696345700.git.Hongyan.Xia2@arm.com>

Hi Hongyan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master tip/auto-latest v6.6-rc4 next-20231004]
[cannot apply to tip/sched/core tip/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongyan-Xia/sched-uclamp-Track-uclamped-util_avg-in-sched_avg/20231004-170733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/5564fc23d5e6425d069c36b4cef48edbe77fe64d.1696345700.git.Hongyan.Xia2%40arm.com
patch subject: [RFC PATCH 1/6] sched/uclamp: Track uclamped util_avg in sched_avg
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310050002.oZtZAQCx-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050002.oZtZAQCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050002.oZtZAQCx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:49:
>> kernel/sched/pelt.c:271:6: warning: no previous prototype for '___update_util_avg_uclamp' [-Wmissing-prototypes]
     271 | void ___update_util_avg_uclamp(struct sched_avg *avg, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/___update_util_avg_uclamp +271 kernel/sched/pelt.c

   268	
   269	#ifdef CONFIG_UCLAMP_TASK
   270	/* avg must belong to the queue this se is on. */
 > 271	void ___update_util_avg_uclamp(struct sched_avg *avg, struct sched_entity *se)
   272	{
   273		unsigned int util;
   274		int delta;
   275	
   276		if (entity_is_task(se)) {
   277			unsigned int uclamp_min, uclamp_max;
   278	
   279			if (!se->on_rq)
   280				return;
   281	
   282			util = READ_ONCE(se->avg.util_avg);
   283			uclamp_min = uclamp_eff_value(task_of(se), UCLAMP_MIN);
   284			uclamp_max = uclamp_eff_value(task_of(se), UCLAMP_MAX);
   285			util = clamp(util, uclamp_min, uclamp_max);
   286		} else {
   287			util = READ_ONCE(group_cfs_rq(se)->avg.util_avg_uclamp);
   288	
   289			if (!se->on_rq) {
   290				WRITE_ONCE(se->avg.util_avg_uclamp, util);
   291				return;
   292			}
   293		}
   294	
   295		delta = util - READ_ONCE(se->avg.util_avg_uclamp);
   296		if (delta == 0)
   297			return;
   298	
   299		WRITE_ONCE(se->avg.util_avg_uclamp, util);
   300		util = READ_ONCE(avg->util_avg_uclamp);
   301		util += delta;
   302		WRITE_ONCE(avg->util_avg_uclamp, util);
   303	}
   304	#else /* !CONFIG_UCLAMP_TASK */
   305	static void
   306	___update_util_avg_uclamp(struct sched_avg *avg, struct sched_entity *se)
   307	{
   308	}
   309	#endif
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
