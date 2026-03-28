Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC22B67E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774701151; cv=none; b=AjDp6QL/BRHEb3RHmRRelBPSLtw9nIQQDRBc/Mi3XLJkui/V4C+V+jEqvQp3BQH6CajuOBeBVqHJLaZNkI//G03hW/RjDkY9FCVjh7F3IOBqgpi8cn/UAa6+CmXEadeHYU8+qSFAokxE8u+Gyzr5DQjXhxUKNayQroJQ4D07jos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774701151; c=relaxed/simple;
	bh=dx+58d+wPfq5R6pb+MD6lK5ayZywp1gOZmQoMlCyP7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZeXDiKB+swga1nzFycBvRq2WgVhIEnOq9wGy3DG4Dj+QKFJgwt5u2hHsqEjXf09QmPpXAmOa9CwafuXgmQOp2EafjnxXnSCprwWlItCS7nDwJaLitRWV46abSR8e6IdwKzgTd+bVMHdacrHKvXuDG9n0DxJf65Rzi+CKJuejwRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mg6qfwnf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mg6qfwnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774701150; x=1806237150;
  h=date:from:to:cc:subject:message-id;
  bh=dx+58d+wPfq5R6pb+MD6lK5ayZywp1gOZmQoMlCyP7c=;
  b=mg6qfwnfqgbebqZiUhqBrTy2RqwDfZiwiILmt8X9OTBgVG1YM+OfCNs4
   p7RoCAXG9aT4gunRAEeGKcn9I9XiEiB5aQ+HqUzE2FLxIFQcm3ol2Xf4I
   o7aTKNvEk5+vB9P0fCYMQL3oBf6c/bgb0uJ3idDNAPUz6FpTqYkoZuCeZ
   aaO4BOjEJP2IW9i75GQeH+JSi+JIA9BBj4LHEadB5Bi9MJL/W0hFi1Qzs
   +VV9rh23n9JNbuh6PXiPibF/ELJZHxDV4iB9MR+nrDmdoWLRZpUbbT6Jx
   bKkHQjfDSMFa9LnPYZ/pR/BzhL5FjOndAB7ZlfDunVhtLWO0gAdRrWtiT
   w==;
X-CSE-ConnectionGUID: bFS7M5OgThWdgYKt5mgmuw==
X-CSE-MsgGUID: XUABmijwSx6rU/RTJ2r0Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75872963"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="75872963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 05:32:30 -0700
X-CSE-ConnectionGUID: 2NQlLLHCRPaEHqIXo2JiqA==
X-CSE-MsgGUID: QPLtIMdWQ5OcAiJtlaUf0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="230489637"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Mar 2026 05:32:29 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Sq2-00000000BPB-1moY;
	Sat, 28 Mar 2026 12:32:26 +0000
Date: Sat, 28 Mar 2026 20:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 25/31] ERROR: modpost:
 "torture_sched_setaffinity" [kernel/rcu/hazptrtorture.ko] undefined!
Message-ID: <202603282006.JQAOVmld-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/paulmckrcu/linux dev
head:   8600e98cae614a9336f54a79ea5c152b14369076
commit: c34dc928341480ede82702b6ee0e594b06e9c07f [25/31] fixup! torture: Add a hazptrtorture.c stress test
config: parisc-randconfig-r122-20260328 (https://download.01.org/0day-ci/archive/20260328/202603282006.JQAOVmld-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603282006.JQAOVmld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603282006.JQAOVmld-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "torture_sched_setaffinity" [kernel/locking/locktorture.ko] undefined!
>> ERROR: modpost: "torture_sched_setaffinity" [kernel/rcu/hazptrtorture.ko] undefined!
ERROR: modpost: "torture_sched_setaffinity" [kernel/rcu/rcutorture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
