Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9491E31813A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765540316; cv=none; b=LJCPxmMNqPAaS6+kH0v/2zkyNcxDngriQYWOdp6DQUW8jIg7fFdqqJfWFtZDsk1tMKqAY/H4DyL84fVcUWpO6qLmyWOOik3l4gzprUXHhOUu8zUy3SmIae++gH0PYKwV7QB4kr1KiBTtoJg3CkBw8WNi7k1sYGwXFkyiTFIa8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765540316; c=relaxed/simple;
	bh=3kwx2KcHyoGT84T0X6hzTgwfeFKvEKGyzhe/zckp3Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qo0Nq7UyFIgfWBXsSASawQWqsO1wSRZHKhZXlrQBtejQjbCl7uxgajVJxLQhliv3QkBGUIHgv/QdcQ4iOq+CEqldtdtz4/57UNz7m8iyAUwWfYAHl9jJnoDmy2yFBMsMeRue1x1pKYzlcf/kd9DxUN497slomv/qAyEELoZnSO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5IYvef4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5IYvef4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765540315; x=1797076315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3kwx2KcHyoGT84T0X6hzTgwfeFKvEKGyzhe/zckp3Jw=;
  b=C5IYvef4tg7/7kIB//4A+B+2hhC/YWr8j1PFmknTCKjhiyCeCH96eIEe
   3Q13IdIyabQ7TTC4hrUCQ0jL2z1KLa660xLIu1txzejuUKTtwiPRavxJK
   +XAtur90elElfHPY+iRjL3am2JrChpFQ9jFBl3BFXDD59DbkRy783c5Ea
   qW2zHy3hgoNw/D0ekltdeo+UDAmXLpjf8AoLiXZ7k+6Wu4S9Uzqo8A7bw
   7H3Oq+JAoB5JyoNYrEhqQ9HQ+H++aIx30P/bHL1qK014mdHO1v4ktp/lE
   QZoKz/kgAFRKueHSi6+3VDC4CCrrEJkH0+2VZABPoRuAO+QjG3OVVR4Oi
   w==;
X-CSE-ConnectionGUID: 3k3NfvejSieKdMbK5aHlzw==
X-CSE-MsgGUID: zSC3YTP7S5GNAREH7fN26w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="77856831"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="77856831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 03:51:52 -0800
X-CSE-ConnectionGUID: EPpufP90QFaENmc+j4VdVA==
X-CSE-MsgGUID: dCcCl14yRPS7uPq/KPWbYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197565365"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 03:51:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU1ga-00000000601-1oSB;
	Fri, 12 Dec 2025 11:51:48 +0000
Date: Fri, 12 Dec 2025 19:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/power/energy_model.c:113:15: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512121938.yfif9Tvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eed7f8d4a5572c294712b683d6b4890a3b5e1267
commit: 93f31a5fdf8f86146b5a630a1fa706fde5fb36c1 [0/1] UPSTREAM: PM: EM: Introduce runtime modifiable table
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121938.yfif9Tvg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121938.yfif9Tvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121938.yfif9Tvg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/power/energy_model.c:113:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:113:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:113:15: sparse:     got struct em_perf_table *
>> kernel/power/energy_model.c:114:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *table @@
   kernel/power/energy_model.c:114:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:114:15: sparse:     got struct em_perf_table [noderef] __rcu *table
>> kernel/power/energy_model.c:119:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   kernel/power/energy_model.c:119:19: sparse:     expected struct callback_head *head
   kernel/power/energy_model.c:119:19: sparse:     got struct callback_head [noderef] __rcu *
>> kernel/power/energy_model.c:130:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got void * @@
   kernel/power/energy_model.c:130:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:130:15: sparse:     got void *
   kernel/power/energy_model.c:195:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:195:9: sparse:     expected void const *
   kernel/power/energy_model.c:195:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:195:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:195:9: sparse:     expected void const *
   kernel/power/energy_model.c:195:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:195:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:195:9: sparse:     expected void *p
   kernel/power/energy_model.c:195:9: sparse:     got struct em_perf_state [noderef] __rcu *

vim +113 kernel/power/energy_model.c

   108	
   109	static void em_destroy_table_rcu(struct rcu_head *rp)
   110	{
   111		struct em_perf_table __rcu *table;
   112	
 > 113		table = container_of(rp, struct em_perf_table, rcu);
 > 114		kfree(table);
   115	}
   116	
   117	static void em_free_table(struct em_perf_table __rcu *table)
   118	{
 > 119		call_rcu(&table->rcu, em_destroy_table_rcu);
   120	}
   121	
   122	static struct em_perf_table __rcu *
   123	em_allocate_table(struct em_perf_domain *pd)
   124	{
   125		struct em_perf_table __rcu *table;
   126		int table_size;
   127	
   128		table_size = sizeof(struct em_perf_state) * pd->nr_perf_states;
   129	
 > 130		table = kzalloc(sizeof(*table) + table_size, GFP_KERNEL);
   131		return table;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
