Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9FB48B37E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834413; cv=none; b=hHdNMFWTp+FU6az7dy6uNf3l2/m6sBbLmVXkZWJcvpSFVm/9skVRWelG4F7cQJTn4ilZT8vLvtHwwvuzEyqnaS4XG3DESX7f2okvnidZN0nHaTNKwrUIeC6KrtO5jNiB+ZMIfWZCGRvBx7QJ3JkPG6YWCmQPc9cVIGOQnJN0Rrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834413; c=relaxed/simple;
	bh=c9LszkMgmXKiOdA33yXWceAov/da0NmgYkFToYFiDko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TH8y2n5ZG6Dl40CcprIT6zExfJBOTaKKatLGiFvVtFlJrFjkc80nJLCa9AtUiUEVCnJZsVGYwP/JykfscdZ2GOaSzCDtQuqidJjzcZ0+2eq8eFLpoB1E3FYQD4m2AKhiS4ERPQHkc6JAWB7+aE9SC9tu+Kd7vNefkD0GhMFOgIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A161xIM0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A161xIM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772834410; x=1804370410;
  h=date:from:to:cc:subject:message-id;
  bh=c9LszkMgmXKiOdA33yXWceAov/da0NmgYkFToYFiDko=;
  b=A161xIM0XiiapDUP+LhN14lKADww9hf1Q5VUndWuknT020ivq6yd/A2F
   lsnsQM3lLWIqfRmsClfjzC3UQ7e1LEuMno5CfECEogLno+PY9ALncrz34
   zlhAZUBgNEF0c4FPrp1lujU+HXQv4+QO/ciJQbaVqvzdygurklhi51Yua
   /01WhOFSONWin05G9cX9Uj69Ox+NWw2gcZaFGTXu2BtnxnpZgG4Y0GjdR
   oQGVfArurgXMrRCNYCWnZHkCvPKK5GA1X5suX/2/0g9k6HXsIZIednzne
   lkJqt7bB+ctTLdkNPb3En1z9DTxEzqOjHCc+Sa1IfrGdprRUM3SNc2hLg
   Q==;
X-CSE-ConnectionGUID: dr+BACUhSsOhYtiCm8uI8w==
X-CSE-MsgGUID: HA9JmEyrQXujTmZmG2+3PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73918080"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73918080"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 14:00:10 -0800
X-CSE-ConnectionGUID: 9CuhoXJ7Sk6QlWI+kexITQ==
X-CSE-MsgGUID: c6K2pxA8SD+clN7J7kX0Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223820914"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Mar 2026 14:00:07 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vydDJ-000000001Q1-1TdO;
	Fri, 06 Mar 2026 22:00:05 +0000
Date: Sat, 07 Mar 2026 05:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_bpf_monitors 14/29]
 kernel/trace/rv/monitors/deadline/deadline.h:111:23: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202603070541.YX91hd1f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_bpf_monitors
head:   11b61a32f588d34caa7cc11204224b8bc95a0f01
commit: d00a7c35d280ccd0e5e0e796a3f5f606543fa992 [14/29] rv: Add deadline monitors
config: i386-randconfig-063-20260307 (https://download.01.org/0day-ci/archive/20260307/202603070541.YX91hd1f-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070541.YX91hd1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070541.YX91hd1f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/nomiss/nomiss.c: note: in included file:
>> kernel/trace/rv/monitors/deadline/deadline.h:111:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_attr [noderef] __user *uattr @@     got void * @@
   kernel/trace/rv/monitors/deadline/deadline.h:111:23: sparse:     expected struct sched_attr [noderef] __user *uattr
   kernel/trace/rv/monitors/deadline/deadline.h:111:23: sparse:     got void *
>> kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst @@     got struct sched_attr [noderef] __user * @@
   kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:     expected void *dst
   kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:     got struct sched_attr [noderef] __user *
>> kernel/trace/rv/monitors/deadline/deadline.h:118:21: sparse: sparse: dereference of noderef expression
   kernel/trace/rv/monitors/deadline/deadline.h:120:30: sparse: sparse: dereference of noderef expression

vim +111 kernel/trace/rv/monitors/deadline/deadline.h

    93	
    94	static inline int extract_params(struct pt_regs *regs, long id, struct task_struct **p)
    95	{
    96		size_t size = offsetof(struct sched_attr, sched_nice);
    97		struct sched_attr __user *uattr, attr;
    98		int new_policy = -1, ret;
    99		unsigned long args[6];
   100		pid_t pid;
   101	
   102		switch (id) {
   103		case __NR_sched_setscheduler:
   104			syscall_get_arguments(current, regs, args);
   105			pid = args[0];
   106			new_policy = args[1];
   107			break;
   108		case __NR_sched_setattr:
   109			syscall_get_arguments(current, regs, args);
   110			pid = args[0];
 > 111			uattr = (void *)args[1];
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
   125		if (!pid)
   126			*p = current;
   127		else {
   128			/*
   129			 * Required for find_task_by_vpid, make sure the caller doesn't
   130			 * need to get_task_struct().
   131			 */
   132			guard(rcu)();
   133			*p = find_task_by_vpid(pid);
   134			if (unlikely(!*p))
   135				return -EINVAL;
   136		}
   137	
   138		return new_policy & ~SCHED_RESET_ON_FORK;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
