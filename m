Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE19B40DFC8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 01:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776474258; cv=none; b=GLyqmzgY2B1KoZ1x/+X8QN++L9r+HJauijSnYS+RXFiFbDCa9ruyMP705AdsnrW062WIE8s0TcJT2Q02iZgaOnXrYxOcqwNfTNQavlUtnEUpUh+Wm1Hd/vQzNLTrni+BedAIPnLPLg2rELkkMMZvVGcF+xwM7rXpOqieKaJxfQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776474258; c=relaxed/simple;
	bh=sE74wmOjVznHLzUS9xuDM6lv7fLVv6gl6okrz55Swi0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gvA3QI30D2vBL4DizuW7gWvj6fREX0FzxSuxurRzdLz8rByr70Pj0ZyNLAF+VobJpDXvEKop/nJyEcoqOVWdHu4fM3mJYJvh27a+KAHQlNTyXIDeeHf/0aRaZW6RZOtFl6guZ0JlylugPhgW3Ge2MJY/LpI1CgwxhI9w1N1VcJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/dbrr9a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/dbrr9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776474256; x=1808010256;
  h=date:from:to:cc:subject:message-id;
  bh=sE74wmOjVznHLzUS9xuDM6lv7fLVv6gl6okrz55Swi0=;
  b=I/dbrr9atwmRKqPhR8kXzoFf9wcJx3AG/w638sjOBC7oQU3gIH7gJpkc
   ICNRU3XY7K15KjLpg7jchhwDlXRAfS92562OdmsV6bzunu9ZDHY3jEEjD
   zO3gJHU8dY/lIu9GkI3F2r2RySCCRdoTxFDZqjjkVdCXG+ENRlgXRn4Mg
   /ryRCJb4M0S5qtRQzNlyJvNIUkhePXHcvPzxLr1JvBj2CERdZIe+IcktS
   fQOaJMIoaVpJ1yhpaJPCZH9cVEqHHHMmcvcwMSczb8ed/YOtRse2/jPZ2
   9lFIMP5l1K+sXKu1KQgosA9N7w7oNslJYcu2WaB1VEpIwOZRk2DQLIhZ1
   Q==;
X-CSE-ConnectionGUID: hHwHq/rXT6ezD8seoEa/1g==
X-CSE-MsgGUID: ekW6163xSi6NMvYFKyDUoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88945328"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="88945328"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 18:04:15 -0700
X-CSE-ConnectionGUID: kFnzXCeGTP+OU2RrvPJHPg==
X-CSE-MsgGUID: VCgTiw3/TwONarVSwIMnbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="236155104"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 17 Apr 2026 18:04:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDu6V-000000001UX-3T64;
	Sat, 18 Apr 2026 01:04:11 +0000
Date: Sat, 18 Apr 2026 03:04:06 +0200
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: mm/slab_common.c:1345 struct member
 'defer_call_rcu_head' not described in 'kfree_rcu_cpu'
Message-ID: <202604180209.o8h50WjN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo-Oracle/mm-slab-introduce-k-v-free_rcu-with-struct-rcu_ptr/20260417-105128
head:   9a622bfd287229f4a91dcae07d37b4db2a3d41fd
commit: fcffe562da31298332c884751c03166cf69f388e mm/slab: introduce deferred submission of rcu sheaves
date:   22 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260418/202604180209.o8h50WjN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180209.o8h50WjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604180209.o8h50WjN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: mm/slab_common.c:1345 struct member 'defer_head' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'defer_free' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1345 struct member 'defer_call_rcu_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1345 struct member 'defer_call_rcu' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'sched_delayed_monitor' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'run_page_cache_worker' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'defer_head' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'defer_free' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1345 struct member 'defer_call_rcu_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1345 struct member 'defer_call_rcu' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'sched_delayed_monitor' not described in 'kfree_rcu_cpu'
   Warning: mm/slab_common.c:1345 struct member 'run_page_cache_worker' not described in 'kfree_rcu_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
