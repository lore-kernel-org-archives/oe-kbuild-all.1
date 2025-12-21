Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B7248F5A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766343190; cv=none; b=BJddPnQVE+DzoV6T5sM+43po4DDd4KaUXeyGtWE5hylODaabxJbeVJdPbWiieWqHuWznfEuB+DL8qs482TrSNn+3LPuHmGfM7IEbS4leQnQxIQInZ+VFKPfkVxDV5npqBQzIYKmN3aF2BDdMjYR0KFGY5FvlixSbaeuTS5Mw5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766343190; c=relaxed/simple;
	bh=zQgpACxuHnu1RpxnO7hzbc57IWMwAv8B345tqX/VREs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrlxFBtVDOqoIJku1dNFmwGFZT4CYrnDH3LY2NZ2mU8UqmwfDjT52mqTCQmJLZKplGzj67WuMD/jLPTFAr3RaO4Y1w9rtogaPDUduZHWYKZQNuIGz2LYrlSEXhpPoACj2Hgz5yliGnsce3iUp56raaSfvCWWHgpOdqKENDC940I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+gtpZH8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+gtpZH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766343188; x=1797879188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zQgpACxuHnu1RpxnO7hzbc57IWMwAv8B345tqX/VREs=;
  b=V+gtpZH8/h6PqEaxpyovizcr/gABaIe4btJSqE+RqOmhqEjBBBDm4764
   9gYpiO96V9ilUn9v2jWG3ujGMmAl1+72QR78ovcQbSD7P/LW2K3ERNRgP
   9rhzxIVHfXdSn8WNBnWUNhB2sva3b9XXOpMg4Rqej41mBNDbpSd5I876H
   0gbx3xOkeIhD0CO/qZDH68rI/6kfHV7GaoCN2p7fwPIrxf5a7JwVGzR56
   TwgeojBjjPuAcWB7WMBYfwog7CAlXPnkag8wkk8NyV7vDqoFjRQsXj0jp
   chBp2R6wP7q3+qcrdahPXQ7lkbxSgTJtzZR4cLEr7F/HcQk6Aic/stnjG
   g==;
X-CSE-ConnectionGUID: rGtxRGD/ReyB7S8/YtqiQQ==
X-CSE-MsgGUID: UsniJlE2S0Wxq7xi0kIkUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85631441"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="85631441"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 10:53:08 -0800
X-CSE-ConnectionGUID: JvCwrJ6DRWeWZDWd9w7lAQ==
X-CSE-MsgGUID: YdPlzswiRAmbz+hf4ianSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="200229359"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 10:53:06 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXOYC-000000005CO-0KhW;
	Sun, 21 Dec 2025 18:53:04 +0000
Date: Sun, 21 Dec 2025 19:52:04 +0100
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, peterz@infradead.org
Cc: oe-kbuild-all@lists.linux.dev, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, linux-sched@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] sched/fair: factor out common sched_entity stats/task
 lookup
Message-ID: <202512211954.HdIWtguJ-lkp@intel.com>
References: <20251217070040.8723-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217070040.8723-1-zhanxusheng@xiaomi.com>

Hi Zhan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on peterz-queue/sched/core linus/master v6.16-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhan-Xusheng/sched-fair-factor-out-common-sched_entity-stats-task-lookup/20251217-150252
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251217070040.8723-1-zhanxusheng%40xiaomi.com
patch subject: [PATCH] sched/fair: factor out common sched_entity stats/task lookup
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512211954.HdIWtguJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211954.HdIWtguJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211954.HdIWtguJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'update_stats_enqueue_sleeper_fair':
>> kernel/sched/fair.c:1337:44: error: 'p' undeclared (first use in this function); did you mean 'up'?
    1337 |         get_se_stats_and_task(se, &stats, &p);
         |                                            ^
         |                                            up
   kernel/sched/fair.c:1337:44: note: each undeclared identifier is reported only once for each function it appears in


vim +1337 kernel/sched/fair.c

  1327	
  1328	static inline void
  1329	update_stats_enqueue_sleeper_fair(struct cfs_rq *cfs_rq, struct sched_entity *se)
  1330	{
  1331		struct sched_statistics *stats;
  1332		struct task_struct *tsk = NULL;
  1333	
  1334		if (!schedstat_enabled())
  1335			return;
  1336	
> 1337		get_se_stats_and_task(se, &stats, &p);
  1338	
  1339		__update_stats_enqueue_sleeper(rq_of(cfs_rq), tsk, stats);
  1340	}
  1341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
