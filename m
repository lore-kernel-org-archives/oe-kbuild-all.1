Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1B1FDA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=StM+AJr8e/u6WgUneqmlwIjFymSl/HfRJQbVaxG0BfE=;
  b=qvnbf+pS5xYloxdUPPgWyQTVuTpgdK0BMRvh4eIuzS6ZI8Y2DFMEd8aB
   wRFEDV/C59bwnyoAEhH4V1li7F7fhHFj4Pi4qe9lzLYUWTDNkXFqSdO3N
   YrYAVbXcgxgLTcdQqdJpAoJWZefN3WZ/euKuKiDixDb4gvS8dJJMaaJcI
   I=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,244,1684792800"; 
   d="scan'208";a="62673276"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 09:15:29 +0200
Date: Mon, 31 Jul 2023 09:15:27 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Chen Yu <yu.c.chen@intel.com>
cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/7] sched/fair: Calculate the scan depth for idle
 balance based on system utilization (fwd)
Message-ID: <fb27b69c-3321-64c1-48ee-55a83cca982@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check on the types involved in the division on line 10303.

julia

---------- Forwarded message ----------
Date: Mon, 31 Jul 2023 05:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH 4/7] sched/fair: Calculate the scan depth for idle
    balance based on system utilization

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen@intel.com>
References: <61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen@intel.com>
TO: Chen Yu <yu.c.chen@intel.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.5-rc4]
[cannot apply to next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu/sched-topology-Assign-sd_share-for-all-non-NUMA-sched-domains/20230727-144634
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen%40intel.com
patch subject: [RFC PATCH 4/7] sched/fair: Calculate the scan depth for idle balance based on system utilization
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: m68k-randconfig-r052-20230730 (https://download.01.org/0day-ci/archive/20230731/202307310545.yIIAUNvV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310545.yIIAUNvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307310545.yIIAUNvV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:10303:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

vim +10303 kernel/sched/fair.c

68d8d6c49d1ef0 Chen Yu 2023-07-27  10279
f3d2a482eb6ae1 Chen Yu 2023-07-27  10280  static void update_ilb_group_scan(struct lb_env *env,
f3d2a482eb6ae1 Chen Yu 2023-07-27  10281  				  unsigned long sum_util,
f3d2a482eb6ae1 Chen Yu 2023-07-27  10282  				  struct sched_domain_shared *sd_share)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10283  {
f3d2a482eb6ae1 Chen Yu 2023-07-27  10284  	u64 tmp, nr_scan;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10285
f3d2a482eb6ae1 Chen Yu 2023-07-27  10286  	if (!sched_feat(ILB_UTIL))
f3d2a482eb6ae1 Chen Yu 2023-07-27  10287  		return;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10288
f3d2a482eb6ae1 Chen Yu 2023-07-27  10289  	if (!sd_share)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10290  		return;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10291
f3d2a482eb6ae1 Chen Yu 2023-07-27  10292  	if (env->idle == CPU_NEWLY_IDLE)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10293  		return;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10294
f3d2a482eb6ae1 Chen Yu 2023-07-27  10295  	/*
f3d2a482eb6ae1 Chen Yu 2023-07-27  10296  	 * Limit the newidle balance scan depth based on overall system
f3d2a482eb6ae1 Chen Yu 2023-07-27  10297  	 * utilization:
f3d2a482eb6ae1 Chen Yu 2023-07-27  10298  	 * nr_groups_scan = nr_groups * (1 - util_ratio)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10299  	 * and util_ratio = sum_util / (sd_weight * SCHED_CAPACITY_SCALE)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10300  	 */
f3d2a482eb6ae1 Chen Yu 2023-07-27  10301  	nr_scan = env->sd->nr_groups * sum_util;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10302  	tmp = env->sd->span_weight * SCHED_CAPACITY_SCALE;
f3d2a482eb6ae1 Chen Yu 2023-07-27 @10303  	do_div(nr_scan, tmp);
f3d2a482eb6ae1 Chen Yu 2023-07-27  10304  	nr_scan = env->sd->nr_groups - nr_scan;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10305  	if ((int)nr_scan != sd_share->nr_sg_scan)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10306  		WRITE_ONCE(sd_share->nr_sg_scan, (int)nr_scan);
f3d2a482eb6ae1 Chen Yu 2023-07-27  10307  }
f3d2a482eb6ae1 Chen Yu 2023-07-27  10308

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
