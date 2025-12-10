Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8AE20013A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355227; cv=none; b=SQl+j+qxrs+J6uSSoydgq7UxhXrgDXOAoF7c5qts37oFQ5DVpmf3qflxu0zWJhp07tGMl8DH1zTrz2LFrWVvETMVPi++TfnCzc33wzPZDqz6rgD0ZudZDu0wSyXJGKBMRehAYb7xP8bx0bDY+LS8Sjw6lc3Q8bjbhO3MzFfaimk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355227; c=relaxed/simple;
	bh=nhVl4NDJmBlvLf6ksBWIt90J/5wzI/UB11jKt2M4rEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=td/lLHqveXK7QUQGzUGeD2l8kjg+VzBX4dwo5IbKHUjdd2E4sPjIn0QRpgrk7KXP2+SYHtmCpeaAB/RsaXBSHbwEM/HJ/zEMS7EUhMSi9NDmfYvm/bl57izpmXjn0gL0TWu1WVEXhFvnKwKQJl/WZFJKgYaetPtYEkznOyy0LvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eT98FbNc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eT98FbNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765355225; x=1796891225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhVl4NDJmBlvLf6ksBWIt90J/5wzI/UB11jKt2M4rEY=;
  b=eT98FbNchBVUQ8ICa7hkai1wOGF8X0hXS3vKc3BfK/tV4RGRYaXzJKlG
   7wYHZ5Ht8cGBzjv7p73H4rwDuIPtQzaXqyrRd6j5eqqOtwwDupfnSRLFn
   e1nvz4aJcvhNngRkaIGXd2F0vsT2r2+w/XuGrvUBntSmvt/IK6PAVQ0zL
   af7qxvrwPlCYUewP7FyNFDCz25zwSPWyh6SyjZLKn9ZePakgwvPEQ1NFA
   +7tZI6S/+uMST2/7ckjk2unuPbXokOlOLpJNHldUyZRfIhqe/BCwFGLAk
   02fTAwjY5+ipTRmMbsP7dzCgktYj8EKkya+Fzb0JvA1tO3kgByPVZmGWX
   g==;
X-CSE-ConnectionGUID: 5RWTL5hmSzeLTc2vx61GPg==
X-CSE-MsgGUID: w/YgCE1+SYyThDCiECTVhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69911035"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="69911035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 00:27:04 -0800
X-CSE-ConnectionGUID: 1pzXTmU8SPO7kEEIsjPtDQ==
X-CSE-MsgGUID: ub5Q3/MXSRmIBLlRe73abQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196365913"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 00:27:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTFXJ-00000000301-0vCe;
	Wed, 10 Dec 2025 08:27:01 +0000
Date: Wed, 10 Dec 2025 16:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v2 26/29] [EXPERIMENTAL] sched/fair: Add push
 task framework
Message-ID: <202512101615.0IPukQ21-lkp@intel.com>
References: <20251208092744.32737-26-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208092744.32737-26-kprateek.nayak@amd.com>

Hi Prateek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3eb59356014674fa1b506a122cc59b57089a4d08]

url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/sched-fair-Simplify-set_cpu_sd_state_-with-guards/20251208-183121
base:   3eb59356014674fa1b506a122cc59b57089a4d08
patch link:    https://lore.kernel.org/r/20251208092744.32737-26-kprateek.nayak%40amd.com
patch subject: [RESEND RFC PATCH v2 26/29] [EXPERIMENTAL] sched/fair: Add push task framework
config: nios2-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101615.0IPukQ21-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101615.0IPukQ21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101615.0IPukQ21-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'has_pushable_tasks':
>> kernel/sched/fair.c:13079:42: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13079 |         return !plist_head_empty(&rq->cfs.pushable_tasks);
         |                                          ^
   kernel/sched/fair.c: In function 'fair_remove_pushable_task':
   kernel/sched/fair.c:13109:47: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13109 |         plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                               ^
   kernel/sched/fair.c: In function 'fair_add_pushable_task':
   kernel/sched/fair.c:13115:55: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13115 |                 plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                                       ^
   kernel/sched/fair.c:13118:55: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13118 |                 plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                                       ^
   kernel/sched/fair.c: In function 'init_cfs_rq':
   kernel/sched/fair.c:13886:32: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13886 |         plist_head_init(&cfs_rq->pushable_tasks);
         |                                ^~
   kernel/sched/fair.c: In function 'has_pushable_tasks':
   kernel/sched/fair.c:13080:1: warning: control reaches end of non-void function [-Wreturn-type]
   13080 | }
         | ^


vim +13079 kernel/sched/fair.c

 13076	
 13077	static inline int has_pushable_tasks(struct rq *rq)
 13078	{
 13079		return !plist_head_empty(&rq->cfs.pushable_tasks);
 13080	}
 13081	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
