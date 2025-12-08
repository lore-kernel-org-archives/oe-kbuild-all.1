Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF19581ACA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 00:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765154322; cv=none; b=Z1pXizqCDDmhzr49Me+cvMJpSKwtbEHgqEuMFdPMeTuug4wE7hh006zwIuScTqPEYw0oaws81jJJXbFeJIOBjL+iXwfI2zWrSGrvGnRx7+5pXQ9fmQcoOU9O9kQwhz4k2XPN5O0xU/uEXWeyvv+yVmMDR3AATz6UECFy0WI1Tk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765154322; c=relaxed/simple;
	bh=iIcWoV/fTRjQjRFc0pzfA+knD/aIPdcT3qWy1WrjatQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpxbwMshCZ8B70e4v/BHTjsa6zBjFcjbg1MqwoWXDW7xrfZU87kBi60Qd1BhF5oCS1jsd7SsqiaxfxA+V2sP/kcP5M25IsEEOlKDI2iiBQVlbF50o08LzZXlP/Vjs48onz9ib6glX9eu3/n5doCPNf0oJRoAAGp7WtCpDioar7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+sBwa/n; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+sBwa/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765154320; x=1796690320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iIcWoV/fTRjQjRFc0pzfA+knD/aIPdcT3qWy1WrjatQ=;
  b=Y+sBwa/nruh7BZDhFtuTYO4HE0X9P8Gg0Y8zNmrWsjl8egipvS+zkC6B
   A4ueG2byC2ZkqZINbHlODvC7/lTrg6Vk/ej/C7znldEuQLsQSwrvfH9ir
   4wAVnbv5cAQ6nIOQBMxc0ZW29Vho6J661nK4FR+/n+ZZ4Q9Fv9gBLmA3Z
   TSBSGEittYlEWmOtf0DueHq/iPdKcHMV5uwaN83pIi9aD5yKKPQD1tVuy
   OpVRxZJCdrkShLpp8RJy4GBtMXgzqnSqoUS+AUFY1mDy8Cf6UNneBDStq
   EuCCdNOixS7XrXhz/7JEA0LIYYGnHM1bSy82Slpu3dvJc9mP1Jyntl3id
   w==;
X-CSE-ConnectionGUID: aS0ZWi2KScypXj0qL5lE7g==
X-CSE-MsgGUID: C1hGEnkkTYWipqbX8pox9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66992008"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66992008"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 16:38:38 -0800
X-CSE-ConnectionGUID: 8KGuNvtkS8GNqtE2tB9t/A==
X-CSE-MsgGUID: vGmSvctVQBW5RL9ohJdJ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="196569329"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Dec 2025 16:38:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSPGs-00000000Jjr-3muK;
	Mon, 08 Dec 2025 00:38:34 +0000
Date: Mon, 8 Dec 2025 08:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] kernel/xsched/rt.c:207:6: sparse:
 sparse: symbol 'rq_init_rt' was not declared. Should it be static?
Message-ID: <202512080850.XFeNdf38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 832ec54e11a079d968d8f23780ab455b1537b214 [3482/3482] xsched: Add xsched RT class
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251208/202512080850.XFeNdf38-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080850.XFeNdf38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080850.XFeNdf38-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/xsched/rt.c:207:6: sparse: sparse: symbol 'rq_init_rt' was not declared. Should it be static?
>> kernel/xsched/rt.c:218:6: sparse: sparse: symbol 'xse_init_rt' was not declared. Should it be static?
>> kernel/xsched/rt.c:228:6: sparse: sparse: symbol 'xse_deinit_rt' was not declared. Should it be static?
--
   kernel/xsched/core.c:189:5: sparse: sparse: symbol 'xsched_xse_set_class' was not declared. Should it be static?
>> kernel/xsched/core.c:497:12: sparse: sparse: symbol 'xsched_sched_init' was not declared. Should it be static?

vim +/rq_init_rt +207 kernel/xsched/rt.c

   206	
 > 207	void rq_init_rt(struct xsched_cu *xcu)
   208	{
   209		int prio = 0;
   210	
   211		xcu->xrq.rt.nr_running = 0;
   212	
   213		for_each_xse_prio(prio) {
   214			INIT_LIST_HEAD(&xcu->xrq.rt.rq[prio]);
   215		}
   216	}
   217	
 > 218	void xse_init_rt(struct xsched_entity *xse)
   219	{
   220		struct tgid_prio *map = tgid_prio_find(xse->tgid);
   221	
   222		xse->rt.prio = (map) ? map->prio : XSE_PRIO_DFLT;
   223		XSCHED_DEBUG("Xse init: set priority=%d.\n", xse->rt.prio);
   224		xse->rt.timeslice = XSCHED_RT_TIMESLICE;
   225		INIT_LIST_HEAD(&xse->rt.list_node);
   226	}
   227	
 > 228	void xse_deinit_rt(struct xsched_entity *xse)
   229	{
   230		struct tgid_prio *map = tgid_prio_find(xse->tgid);
   231	
   232		if (map) {
   233			tgid_prio_delete(xse->tgid);
   234			XSCHED_DEBUG("Map deleted: tgid=%d\n", xse->tgid);
   235		}
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
