Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5139A9450
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 03:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734233397; cv=none; b=G2kzea6mN0ldqGdcZb/NJuyEM7hLGu0GiGn08kXJZ0GLSkWrMYuZbcoLxZAJ2W6n6JA/eUQULzbyiFOQF9cbI5yV1f9kAbE+Sahr7xIDsjc5NgMUqpe2W9s35OCTkRigaX3dE7FneV32W3yvPefqgNBLWohl2mlt8tlKbd9juMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734233397; c=relaxed/simple;
	bh=rwpSO30hbiwpG5YdAqv1Gm7/UuQIij+7PUMttT8zRTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWtavZygFD/qNEJxgfHFi/ycBwYh1HH/CLBi44I/mbsJ9NwyQID8ELIYWlziQ5xJorv0l1VDWqclUTm5jd1UpPP2EMH/3fqT/3+P/lpLH5LE2wHdV9nt1l67jMgWlR7VdIQRcSMbUIjc+K1llxhKx5GgFFKcarYzrO0xxCpj1SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUO4bF+n; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUO4bF+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734233396; x=1765769396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rwpSO30hbiwpG5YdAqv1Gm7/UuQIij+7PUMttT8zRTo=;
  b=BUO4bF+n1HXKhOiPvitsgXbBTHg2Zt0aPSFON7Pfrh3y4/zLhKLa47Y8
   zf+lzMTZD8zgnBvZh6IqxocP0vL3rZOFO1JcjLNynYSeBqRxxSYeiWUCf
   dGZKk8dSoc/ya8gMr2rwXpi0msyWO5FuB2bBM1RdZXI2am4E9nxNSquE6
   TQK6aD8j6+oes7XwNTZ4v+jB6I3BgEzfJNLDRjwbv2/W9PoFz1YuQcQq6
   m9OJ0xyae3X9LiFMQepciNh6w3+pDHcjvXWSniu06Bb4ggpg/+SzMfNOc
   LB2HJvd4pkQGIrxtNcE9Ifd3+wHLp3eeyF0EGqsnvrDFgcEVvZRHghHY+
   g==;
X-CSE-ConnectionGUID: xEHD1fQvT2mgub5rsPPcog==
X-CSE-MsgGUID: bXBmdv+1TSi9VnR23kQ5gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46040085"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46040085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 19:29:55 -0800
X-CSE-ConnectionGUID: PSk6BG4nSQGZAuz5Ex3nqg==
X-CSE-MsgGUID: CFMSxG1RToidHQu+BiczCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97679535"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Dec 2024 19:29:54 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMfKJ-000DP5-1b;
	Sun, 15 Dec 2024 03:29:51 +0000
Date: Sun, 15 Dec 2024 11:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7219/7241]
 kernel/sched/fair.c:1187:49: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202412151139.GrNIfcbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   39fc9c68b13a226d44263bb908cccf8783e34d6e
commit: 5a784e4a810809f3935441bae8f06d24e74b4ed7 [7219/7241] FROMLIST: sched: Fix runtime accounting w/ split exec & sched contexts
config: i386-randconfig-061-20241215 (https://download.01.org/0day-ci/archive/20241215/202412151139.GrNIfcbS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151139.GrNIfcbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412151139.GrNIfcbS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:1187:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1187:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1187:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1256:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1256:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1256:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1314:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1314:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1314:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12956:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12956:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12956:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6181:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6181:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6181:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6911:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6911:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6911:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:7120:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7120:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7120:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8516:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8516:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8516:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8729:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8729:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8729:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8874:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8874:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8874:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8910:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8910:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8910:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9129:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9129:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9129:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10122:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10122:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10122:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10744:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10744:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10744:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12175:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12175:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12175:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11824:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11824:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11824:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12289:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12289:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12289:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2506:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2506:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2506:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *

vim +1187 kernel/sched/fair.c

  1175	
  1176	static s64 update_curr_se(struct rq *rq, struct sched_entity *se)
  1177	{
  1178		u64 now = rq_clock_task(rq);
  1179		s64 delta_exec;
  1180	
  1181		delta_exec = now - se->exec_start;
  1182		if (unlikely(delta_exec <= 0))
  1183			return delta_exec;
  1184	
  1185		se->exec_start = now;
  1186		if (entity_is_task(se)) {
> 1187			struct task_struct *running = rq->curr;
  1188			/*
  1189			 * If se is a task, we account the time against the running
  1190			 * task, as w/ proxy-exec they may not be the same.
  1191			 */
  1192			running->se.exec_start = now;
  1193			running->se.sum_exec_runtime += delta_exec;
  1194		} else {
  1195			/* If not task, account the time against se */
  1196			se->sum_exec_runtime += delta_exec;
  1197		}
  1198	
  1199		if (schedstat_enabled()) {
  1200			struct sched_statistics *stats;
  1201	
  1202			stats = __schedstats_from_se(se);
  1203			__schedstat_set(stats->exec_max,
  1204					max(delta_exec, stats->exec_max));
  1205		}
  1206	
  1207		return delta_exec;
  1208	}
  1209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
