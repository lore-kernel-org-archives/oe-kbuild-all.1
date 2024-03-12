Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4817F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710210610; cv=none; b=la/RMAG20YT9l9IBon8Ze9SiiJla7i7QDDxAL7FAUJMk6a/dTxzdDPW4JtQ2mM9A0C/+CHqhfFc2+GJsRLY+wWFq9YozXyPdJBX6d6A/pgQAwpc8IS8/4p6T1eK29BW6UPxOnNy4EYKAjjsqsQ+uLA/mBtopU7LfMslm1LueOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710210610; c=relaxed/simple;
	bh=G/jqdNGw9/BMOdsOXuYFCFkGIL0NflZl46VV2LDI+iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGQ7pgV45NaunijbPZpaTeTNJ8yu0x0aZlr7B7f2VL5XAWN1UMmUnecBHzIOSn1b/1vwLjhHNW5ziG6Fd1h4JPiZBJL9siJrUvWPsRbIRQSv+qcyQ0oxKClkLXTxrv/WJL3i+IXJmdug+H5u792c4D6duB/3SsxlSxriv5Kh42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wog28Unh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wog28Unh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710210608; x=1741746608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/jqdNGw9/BMOdsOXuYFCFkGIL0NflZl46VV2LDI+iY=;
  b=Wog28UnhWUnVebz8eonb+qR6kMfhZS6WvLFS294UvIBLerjWQj64Ce9e
   /t+JITb+j2FXtbtt8rRvJn3FXZ62s8c7vkY2T+1ojB3Mmwo3+M4OTsn5T
   fdko8teT8npzsHFEjtdrAsdxAxgvKTCrwisJLr/R7BloSNLWbN7tv+UtK
   t/nTT+xessNz3aN2AvZ3RYjOZP2jfYCTWUrEoAafRkruS0zGIpfDhy3Oa
   tUI3d6IOVJmEsz9vcso9ALeLwc5rVThuRnpPBgUZYGgkpfG10NV1sOU/Y
   1lgnmAj9MMWYBhY91Gm5FhbaYks91R3J+R0YDISRYJ1W+JC6udZQNZyp5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16344358"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="16344358"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 19:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="42290516"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2024 19:30:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjru0-0009f9-1g;
	Tue, 12 Mar 2024 02:30:04 +0000
Date: Tue, 12 Mar 2024 10:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/dlserver.debug.mar8.2024 7/8]
 kernel/sched/deadline.c:1776:5: sparse: sparse: symbol 'delay_inject_count'
 was not declared. Should it be static?
Message-ID: <202403121047.sgcQCUzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.debug.mar8.2024
head:   bd3d324705ac0f33f5bea0ef5c265361850a0b0f
commit: 91b5af10954139daa84dca3cf0e1fe388b2f2908 [7/8] TEST: Add a delay in enqueue
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240312/202403121047.sgcQCUzp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121047.sgcQCUzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121047.sgcQCUzp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:2498:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2498:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2498:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2508:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2508:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2508:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2624:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2624:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2624:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2115:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2115:42: sparse:     expected struct sched_dl_entity *b
   kernel/sched/deadline.c:2115:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2126:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2126:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2126:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1239:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1239:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1239:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1592:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1592:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1592:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/deadline.c:1776:5: sparse: sparse: symbol 'delay_inject_count' was not declared. Should it be static?
   kernel/sched/deadline.c:2354:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2354:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2354:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1998:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1998:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1998:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2076:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2076:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2076:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2671:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2671:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2671:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2673:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2673:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2673:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2675:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2675:44: sparse:     expected struct sched_dl_entity *b
   kernel/sched/deadline.c:2675:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2851:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2851:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2851:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:1141:29: sparse: sparse: context imbalance in 'dl_task_timer' - different lock contexts for basic block
   kernel/sched/deadline.c:1395:36: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:1660:31: sparse: sparse: context imbalance in 'inactive_task_timer' - unexpected unlock
   kernel/sched/deadline.c: note: in included file:
   kernel/sched/sched.h:2076:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2076:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2076:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2076:25: sparse:    struct task_struct *

vim +/delay_inject_count +1776 kernel/sched/deadline.c

  1775	
> 1776	int delay_inject_count;
  1777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
