Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB021AAB1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710499271; cv=none; b=iM1iFHVJrMnNEtsWz0bzHUVM6suvKEcxjAWHxqG+oW2TpZaHm1oKXHWxiniZStrdHk6lszOXdXc7Epw+F2y13DbAWUNGZTEJDI5r7L/stgzIlY2ERBgDAN+6XuXzMUkUULgrZjbZ1Xi7hMU7ima0IfRRxh61Py4CiVzABgGqq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710499271; c=relaxed/simple;
	bh=5S0lql9cRqkpQWlBetge2Fehmpj2WFxQqaHL/VpO4RI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+yb64dhZhqwEAMpHiojWV6X3LKPa52/9yT8khVKqPK9SK3zrZ/ws4NonwDnGoQdDmxb1PQ8mrhU8oRCkoIYLv6+L2ig5fTfHopUyCRJ7I9CqoAH2FLSUqQhmdEimjXmt0bCUFLsJEWU5JXiMO5rc+Q9sAsIIH3GjdfSSE95nIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coYy/Ytx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coYy/Ytx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710499269; x=1742035269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5S0lql9cRqkpQWlBetge2Fehmpj2WFxQqaHL/VpO4RI=;
  b=coYy/Ytx13sGgqA4LY6kXJB1CGBEzZZjp47Cd8cnDq9dQjoWqqu6BEui
   Iu7dra9+yWjfrATMEIFIqyLlsv7YZhQjaNJuvP6VU8VoNSHOKY90xQq2A
   IGh1t95h9faMS05TW8yhyehKtrXgLQ9SQnMq5oYIJ4yuF1otvqEhgS1VD
   6JLlb92H5GG5v/xcRMdsYxyEGCiq/kYuS/B+3Hjh838tnJydGVBQFjucY
   p+p1zfVUK8GPmwAZKyF33sjX8y7jLyHBVD9XHw4ZnzJ8FkTmg4Aqbk0h4
   IhNvfCIxIGTr3wEcxDqPnOAFt2Mv8y3oExz1H4PuEJCcuBqFRmriLQOD5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16084810"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="16084810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 03:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="12548845"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Mar 2024 03:41:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl4zm-000ELV-39;
	Fri, 15 Mar 2024 10:41:02 +0000
Date: Fri, 15 Mar 2024 18:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26603/27507] kernel/sched/fair.c:4807:5:
 warning: no previous prototype for function 'runtime_refresh_within'
Message-ID: <202403151848.sdHv7HPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: ce39c5b91ae9f91569ddd4f8812fdf687631d389 [26603/27507] rue/cpu: Implement bandwidth control of BT based on cfs_bandwidth
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240315/202403151848.sdHv7HPa-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151848.sdHv7HPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151848.sdHv7HPa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:23:
   kernel/sched/sched.h:1551:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1551 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:4807:5: warning: no previous prototype for function 'runtime_refresh_within' [-Wmissing-prototypes]
    4807 | int runtime_refresh_within(struct cfs_bandwidth *cfs_b, u64 min_expire)
         |     ^
   kernel/sched/fair.c:4807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4807 | int runtime_refresh_within(struct cfs_bandwidth *cfs_b, u64 min_expire)
         | ^
         | static 
>> kernel/sched/fair.c:4824:6: warning: no previous prototype for function 'start_cfs_slack_bandwidth' [-Wmissing-prototypes]
    4824 | void start_cfs_slack_bandwidth(struct cfs_bandwidth *cfs_b)
         |      ^
   kernel/sched/fair.c:4824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4824 | void start_cfs_slack_bandwidth(struct cfs_bandwidth *cfs_b)
         | ^
         | static 
   3 warnings generated.


vim +/runtime_refresh_within +4807 kernel/sched/fair.c

  4799	
  4800	/*
  4801	 * Are we near the end of the current quota period?
  4802	 *
  4803	 * Requires cfs_b->lock for hrtimer_expires_remaining to be safe against the
  4804	 * hrtimer base being cleared by hrtimer_start. In the case of
  4805	 * migrate_hrtimers, base is never cleared, so we are fine.
  4806	 */
> 4807	int runtime_refresh_within(struct cfs_bandwidth *cfs_b, u64 min_expire)
  4808	{
  4809		struct hrtimer *refresh_timer = &cfs_b->period_timer;
  4810		s64 remaining;
  4811	
  4812		/* if the call-back is running a quota refresh is already occurring */
  4813		if (hrtimer_callback_running(refresh_timer))
  4814			return 1;
  4815	
  4816		/* is a quota refresh about to occur? */
  4817		remaining = ktime_to_ns(hrtimer_expires_remaining(refresh_timer));
  4818		if (remaining < (s64)min_expire)
  4819			return 1;
  4820	
  4821		return 0;
  4822	}
  4823	
> 4824	void start_cfs_slack_bandwidth(struct cfs_bandwidth *cfs_b)
  4825	{
  4826		u64 min_left = cfs_bandwidth_slack_period + min_bandwidth_expiration;
  4827	
  4828		/* if there's a quota refresh soon don't bother with slack */
  4829		if (runtime_refresh_within(cfs_b, min_left))
  4830			return;
  4831	
  4832		/* don't push forwards an existing deferred unthrottle */
  4833		if (cfs_b->slack_started)
  4834			return;
  4835		cfs_b->slack_started = true;
  4836	
  4837		hrtimer_start(&cfs_b->slack_timer,
  4838				ns_to_ktime(cfs_bandwidth_slack_period),
  4839				HRTIMER_MODE_REL);
  4840	}
  4841	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
