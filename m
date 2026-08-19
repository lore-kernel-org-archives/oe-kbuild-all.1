Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5043B4B2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131681; cv=none; b=jXwzCvOgF5i83R8wdsQL67bvC/6wi2+31Zwjfe+AGMgh4TW9HxqnVa+Da3Qi68ysexN//6/yoXoVBILN8ssLl9mnv1rg6nXhb4lGSixkpVe7Gt8pf9MTnU/SDtHpCNTrtAAp0wzdtx2AJgNphEWY26ubeyIfY9gHbtoJswJcF0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131681; c=relaxed/simple;
	bh=LgNfmz3rbkiDx+RA5lmUJc9/naPyormm7NsXgwopTHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u6tuFrTVqMYkxIQcXPdgVcJCtkHcOKFMp1Phc2Z9F0DYy91po9w2MCAicZ8yBWE4ieLqFrr/Odt35QxRcK7o97j89k077OJilILO5d6GsH1vunw5giAIXQbCFjLrpW7rnaS3uAhpQOqbaDu/Mr8zptzNzjNg5vD8QFpkwEnfxHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXFFTre1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXFFTre1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787131678; x=1818667678;
  h=date:from:to:cc:subject:message-id;
  bh=LgNfmz3rbkiDx+RA5lmUJc9/naPyormm7NsXgwopTHg=;
  b=HXFFTre1yYp+CgpktL3HWXJFp0mpwClKtrIZ+Jmcw/iJVuSJghJkKxxH
   FsEfjBbCdCzBfQcDRnrkb8pt3I9F6MogqmbR2iY6BfIIEsSh3liW62L69
   2ucbNFmSH0HoJkTEBY8a673Hw7uZ1WZBlHuejaqFVRZJCGCzOiMz9+FLt
   XZyaYVO591AXZoYFXr8RDZwDRT7AyqHL87scRWS4HP4ctYxk74NGOMKGV
   9xP7yzfDM6ptYxgnyJo8GoEAX2ZNI96pPwD9du3XDGQqi/CDyJzkwq2su
   x9GV1bEMfowCKJ3SUIfclrXuXsbddAQtM7LEgH9a2nzt1LwEXQvcy8XJX
   w==;
X-CSE-ConnectionGUID: 3Vl/46Z5SaWVcMbPFYrrvA==
X-CSE-MsgGUID: WdusUqC2RBa3ndFsCtC+rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87762058"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87762058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:27:53 -0700
X-CSE-ConnectionGUID: 8mqJcMJ/RuWhMewQC/nb2A==
X-CSE-MsgGUID: przJdmXaRwWkpVDb+3+PHw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2026 02:27:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwcaL-00000000f10-0t4E;
	Wed, 19 Aug 2026 09:27:49 +0000
Date: Wed, 19 Aug 2026 17:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 651/740] kernel/sched/alt_sched.h:334:25:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202608191732.ytq7bc3P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   b735d8ec47d31db8e62d1925521a44d98c1cac2d
commit: add9dba34cde0a2265b292326f8318bf0fd733ef [651/740] sched/alt: [Sync] 6199f9999a9b sched/cputime: Handle dyntick-idle steal time correctly
config: m68k-randconfig-r122-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191732.ytq7bc3P-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191732.ytq7bc3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191732.ytq7bc3P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file (through kernel/sched/sched.h):
>> kernel/sched/alt_sched.h:334:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:334:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:334:25: sparse:    struct task_struct *

vim +334 kernel/sched/alt_sched.h

2f7ec82370cbb7 Alfred Chen 2019-08-19  331  
e6d6a4e78f98f6 Alfred Chen 2026-01-19  332  static inline bool idle_rq(struct rq *rq)
e6d6a4e78f98f6 Alfred Chen 2026-01-19  333  {
e6d6a4e78f98f6 Alfred Chen 2026-01-19 @334  	return rq->curr == rq->idle && !rq->nr_running && !rq->ttwu_pending;
e6d6a4e78f98f6 Alfred Chen 2026-01-19  335  }
e6d6a4e78f98f6 Alfred Chen 2026-01-19  336  

:::::: The code at line 334 was first introduced by commit
:::::: e6d6a4e78f98f667774453eb1b15379f06183e1f sched/alt: [Sync] 1e0a2ba7afb1 sched: Provide idle_rq() helper

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
