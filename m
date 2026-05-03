Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D883043CF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835144; cv=none; b=IFexmu+GPcgCf/fVb4mc5S4nnS4sWNFgywHQPlSV3P+un7/Ii9hlyUy51w/H83F7wcQi8+tDpA6asnUpMq1GHCzLnPwkra7p708Xcq7M4cqdYjjacVubAA9kXpW+XXqdsS1FiOgzvbLuIP5YRMjE0HL+oabTvRnAblpVCxmXl3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835144; c=relaxed/simple;
	bh=Rvu5EosqghY0ls+HRCC1JKcESuJR/yUN0x9V2jgoOAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KrigWeWN5ATqeFgt95sq4B0t1eyLZ7FmBkE63LkCxmu8ljgafNjgSxVgUMhl73wS7VZRJE/KR8+/jiPcV479bJ/nGPG1EuUE6RcccibAlmhy5Pmwa8r4zDCo7xR6gGJRil/nVBufJy+igZQzfsmLQ+SSQZdR0E1A1Px4gHRzpEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBZjZ/mA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBZjZ/mA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777835143; x=1809371143;
  h=date:from:to:cc:subject:message-id;
  bh=Rvu5EosqghY0ls+HRCC1JKcESuJR/yUN0x9V2jgoOAg=;
  b=WBZjZ/mAhG2qEqjgY6caEpOPOTZ59Vqeb8k/8ns+bnaavTGQSkh0bQqp
   wjHVUkUp612ri/KkxxSoQPwcvop5ISs6ggMl6BZrys8FnxS58uTAp+BvF
   V+nfh781/qO82NdDHZ6HL6Ye8uXgkrRMmtGVoSUgTO0acGRFQYxxFnSYi
   kJuh/O3WCbYqHwounLyvtATIO3vhzJ+/3Jqj0XKOJzTjHsm2ZUJqMJyv7
   yXvi+VmAkrEVR5sMrMjqLbrk8dePn8flvnsBTpblsSQWQ+nnjiqlA2BMk
   ep4Ih4R93ouDfcETgN/Kfu6N2I545nZ/DzOYgtAYKQ0kFkUox1N9JlQzN
   w==;
X-CSE-ConnectionGUID: gi/M+LKpQwecEix+LBdeVQ==
X-CSE-MsgGUID: grMzVOCNQUWtIVcTqLcPqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="90169761"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="90169761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 12:05:43 -0700
X-CSE-ConnectionGUID: MI1Qox28Tp6bWb1uSYHy/w==
X-CSE-MsgGUID: CTnpHV86Ql+rD7IRnO9BjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="258693006"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 12:05:40 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJc85-000000002uf-0gIR;
	Sun, 03 May 2026 19:05:28 +0000
Date: Mon, 04 May 2026 03:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Harry Yoo (Oracle)" <harry@kernel.org>
Subject: [harry:kvfree-rcu-improvements-rfc-v1r1 6/7]
 mm/slab_common.c:1381:21: warning: initialization of 'struct llist_node *'
 from 'int' makes pointer from integer without a cast
Message-ID: <202605040348.ld8fyL5w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kvfree-rcu-improvements-rfc-v1r1
head:   51772323aadc1a7ab9654997f5398cff0e190bcf
commit: 38b523021a8b745d402010232cc6995f5ae30cd0 [6/7] mm/slab: introduce kfree_rcu_nolock()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260504/202605040348.ld8fyL5w-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040348.ld8fyL5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040348.ld8fyL5w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slab_common.c:1381:21: error: implicit declaration of function 'IRQ_WORK_INIT' [-Werror=implicit-function-declaration]
    1381 |         .irq_work = IRQ_WORK_INIT(defer_kfree_rcu),
         |                     ^~~~~~~~~~~~~
>> mm/slab_common.c:1381:21: warning: initialization of 'struct llist_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/slab_common.c:1381:21: note: (near initialization for 'krc.irq_work.node.llist.next')
   mm/slab_common.c:1381:21: error: initializer element is not constant
   mm/slab_common.c:1381:21: note: (near initialization for 'krc.irq_work.node.llist.next')
   mm/slab_common.c: In function 'kvfree_call_rcu_head':
   mm/slab_common.c:1393:25: error: implicit declaration of function 'irq_work_queue'; did you mean 'drain_workqueue'? [-Werror=implicit-function-declaration]
    1393 |                         irq_work_queue(&krcp->irq_work);
         |                         ^~~~~~~~~~~~~~
         |                         drain_workqueue
   cc1: some warnings being treated as errors


vim +1381 mm/slab_common.c

  1377	
  1378	#ifndef CONFIG_KVFREE_RCU_BATCHED
  1379	static DEFINE_PER_CPU(struct kfree_rcu_cpu, krc) = {
  1380		.llist_head = LLIST_HEAD_INIT(llist_head),
> 1381		.irq_work = IRQ_WORK_INIT(defer_kfree_rcu),
  1382	};
  1383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
