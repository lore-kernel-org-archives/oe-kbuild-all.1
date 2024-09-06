Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659431D2780
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636273; cv=none; b=chAfzSSjLm+80srl4sNZYY+4lj8kgMqYcmUIYKRP4Py+ddyKH/S9stca58NLQLUJ97lZ7tWzaju2CbdnzcB6w8he8iMhZdckg8cYeEgbJK6qsdWW0VcylK6C9M3r1/RXvjqY3LFtuX6W3vqgkP1rhEBYXMddeTxwT+dFGbIb2lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636273; c=relaxed/simple;
	bh=eWFahaVY3S6vtdVFhMZm7FpOiI9cSfFJZfMLQkJlCDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZ3p1OLE4aAqYnHp1fM9X+XATypgYiI/FDuuzKq03/GPqU6F79Jay4Eo+Du+krXCO/jM07ego9C9cKy7nf8rdB8sKkb0/5vBtJOZVdTiH5HShrHU35iwh/4/FKHI7/9Z/viRx/rwf3lig1za3sRl/ujgVQzjUO1A3318Uy4Ccnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVCTODug; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVCTODug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725636271; x=1757172271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWFahaVY3S6vtdVFhMZm7FpOiI9cSfFJZfMLQkJlCDg=;
  b=NVCTODugo/9uqy+NB+4cUnQ3fBJ7b+yPA43pVvgxFUMLm1uSleF93E8U
   UyQhHG9yveRxeAJCzRZcl4xPJm68QlIgdPc7oiy0pUmiMzSd9CU5G7kL5
   gY1towe/fdhWBDY+N3WBEVf0xYopjSboMcGbHbQUt80k0rhDoOXWwnHQs
   u9q0FFwkGYalgyS8Qh3pu515mNLkZ78KLwP582ZuYh8570j/RLdcHPp8r
   wmEJq3yCGtpkbef1OlkDa2nYcmyW3nNBFGlQhFLQZuVI5CnA2dFwVeQvb
   ccuchEFUOac9ypQ50HPSg6d8yZ4versfCq3NNlsrdmNNU1fPvUDOANd85
   Q==;
X-CSE-ConnectionGUID: b7r+51M+Q4e0CcK69dQjQw==
X-CSE-MsgGUID: dqF/GQteT9qoFlxidAXnTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24264265"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24264265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 08:24:31 -0700
X-CSE-ConnectionGUID: G6b8Xo8sSa+WttZY22+s+g==
X-CSE-MsgGUID: j/iTkgJQTvWT2lh2Ek8eqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="66526467"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Sep 2024 08:24:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smap0-000BPx-0s;
	Fri, 06 Sep 2024 15:24:26 +0000
Date: Fri, 6 Sep 2024 23:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 98/10296] kernel/sched/ext.c:468:25: sparse:
 sparse: symbol 'scx_has_op' was not declared. Should it be static?
Message-ID: <202409062337.m7qqI88I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: f0e1a0643a59bf1f922fa209cec86a170b784f3f [98/10296] sched_ext: Implement BPF extensible scheduler class
config: loongarch-randconfig-r131-20240906 (https://download.01.org/0day-ci/archive/20240906/202409062337.m7qqI88I-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240906/202409062337.m7qqI88I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409062337.m7qqI88I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:916:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:916:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:916:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1002:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1002:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1002:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1536:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1536:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1536:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1876:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1876:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1876:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1556:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1556:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1556:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1621:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1621:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1621:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1682:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1682:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1682:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2044:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2044:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2044:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2067:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2417:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2417:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2417:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2401:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2401:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2401:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2411:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2519:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2026:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2026:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2026:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2037:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2037:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2037:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1220:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1220:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1220:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1444:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1444:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1444:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2262:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2262:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2262:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1911:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1911:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1911:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1987:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1987:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1987:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2566:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2566:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2566:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2568:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2568:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2568:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2570:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2570:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2570:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2794:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext.c:468:25: sparse: sparse: symbol 'scx_has_op' was not declared. Should it be static?
>> kernel/sched/ext.c:875:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext.c:1284:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext.c:1294:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext.c:4165:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4165:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:4165:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2389:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2389:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2389:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2214:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2214:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2389:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2389:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2389:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1422:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1707:15: sparse: sparse: dereference of noderef expression

vim +/scx_has_op +468 kernel/sched/ext.c

   467	
 > 468	struct static_key_false scx_has_op[SCX_OPI_END] =
   469		{ [0 ... SCX_OPI_END-1] = STATIC_KEY_FALSE_INIT };
   470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
