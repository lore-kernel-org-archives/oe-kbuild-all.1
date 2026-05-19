Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FDF64AA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160670; cv=none; b=Jb0fUw1K1GrkL+oSMC2ndw8rUSuKCnWP2tBjRT6eLE6CQCntgrc3wo2ucRSq6ZCEte6H7eq/gUy/myfSkosDsvXYhHe3EypOZytTCWLDCqu6i+/aLvVpiC8kl+m0SLoyx8uT5Kn9hwEkyGfRbOiXMsixj57aQd8A/5b6O56G4GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160670; c=relaxed/simple;
	bh=QEhOb083rNjm3spqxdGiQ1V4ufqgbIwGBEAHLoPlz88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GtwqEBPrRhPNUDcflp7qHXQK/p+J/agi0qM/+b3cCD8jFlb4cd4og5u9Nu0jfCZIf4jQUisD2AwICD1vqdwR8fYGXb5hP1plN7uyXPt3aHODCHYsBhF8D0vHFOqhn1JBWN604rSpTOzpIDzjEgfgy3syffkJXdzsnaa48Hwd32Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMoZ5svt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMoZ5svt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779160668; x=1810696668;
  h=date:from:to:cc:subject:message-id;
  bh=QEhOb083rNjm3spqxdGiQ1V4ufqgbIwGBEAHLoPlz88=;
  b=EMoZ5svt/C62UQ/ZuNWBj13gJI77gGNwROADq5lTQ1vX5zZr/zQrwoyC
   20BygxeDqGh3ZYUT8ZCBUq0h5s32lTdoGA2mAu8q5AZnDc+0t3TzYENSt
   K5P4xpbEFmq3gkdbBNCJY/9drU0/t4DBuG0UIUK+4a2sKuw2tpONOIN6b
   kYsXytE3OJs3iwWR4JifAZ6gyHcnBM3px5RWERbP04Pmu4M8/C25apq6Q
   JdZGsynOaIoFx+6PCX96GcA/q/8KOEl3VtCMO6aHEoqpgwC6wV0lXeUhI
   MfIIi9ZcYvel4ERTxFxiDk7H1YqAjrTKz9iMjK1FD4D9queSr9ux6uIrQ
   Q==;
X-CSE-ConnectionGUID: nV9rMSrQSmm6FwdssnG5EA==
X-CSE-MsgGUID: GZUMMxplQQ6qQPLYFAdpSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97461665"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97461665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 20:17:45 -0700
X-CSE-ConnectionGUID: X7+V/60NT+StSlsu4uA/yA==
X-CSE-MsgGUID: Nq3aBYnKSAKJ73JoaGkPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277738571"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 20:17:43 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPAx9-000000000LM-3bR5;
	Tue, 19 May 2026 03:17:19 +0000
Date: Tue, 19 May 2026 11:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nam Cao <namcao@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>
Subject: kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202605191116.acPXYOW4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d3a2a466b8d68d852a1f3bbf11204b718428dc4
commit: b133207deb72609ad4da40c4d50128a5e150677b rv: Add nomiss deadline monitor
date:   7 weeks ago
config: loongarch-randconfig-r111-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191116.acPXYOW4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191116.acPXYOW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b133207deb72 ("rv: Add nomiss deadline monitor")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191116.acPXYOW4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/nomiss/nomiss.c: note: in included file:
>> kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst @@     got struct sched_attr [noderef] __user * @@
   kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:     expected void *dst
   kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:     got struct sched_attr [noderef] __user *
>> kernel/trace/rv/monitors/deadline/deadline.h:118:21: sparse: sparse: dereference of noderef expression
   kernel/trace/rv/monitors/deadline/deadline.h:120:30: sparse: sparse: dereference of noderef expression

vim +115 kernel/trace/rv/monitors/deadline/deadline.h

    94	
    95	static inline int extract_params(struct pt_regs *regs, long id, pid_t *pid_out)
    96	{
    97		size_t size = offsetofend(struct sched_attr, sched_flags);
    98		struct sched_attr __user *uattr, attr;
    99		int new_policy = -1, ret;
   100		unsigned long args[6];
   101	
   102		switch (id) {
   103		case __NR_sched_setscheduler:
   104			syscall_get_arguments(current, regs, args);
   105			*pid_out = args[0];
   106			new_policy = args[1];
   107			break;
   108		case __NR_sched_setattr:
   109			syscall_get_arguments(current, regs, args);
   110			*pid_out = args[0];
   111			uattr = (struct sched_attr __user *)args[1];
   112			/*
   113			 * Just copy up to sched_flags, we are not interested after that
   114			 */
 > 115			ret = copy_struct_from_user(&attr, size, uattr, size);
   116			if (ret)
   117				return ret;
 > 118			if (attr.sched_flags & SCHED_FLAG_KEEP_POLICY)
   119				return -EINVAL;
   120			new_policy = attr.sched_policy;
   121			break;
   122		default:
   123			return -EINVAL;
   124		}
   125	
   126		return new_policy & ~SCHED_RESET_ON_FORK;
   127	}
   128	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
