Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4711DFFC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 00:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733445862; cv=none; b=YcQwbNhOb9MTUbUHpXhRCW5iCNlHQ3dEO+wDCTtB0cnMtr4+lD9EhLggKwMfqHQkL3/SD4QmWfwJZxGfSeuJrCRN0I1YbpwxGooW6n6sy6ICi5xND3PLkx60ycl51WDgLg1Dy/yUNkKfF68DykRmVcqhXYEd1wtIOf90MepaExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733445862; c=relaxed/simple;
	bh=loEs6gUC/h8fr/lhSpTDTbV1DrcM1iT8+SnWfcq1MiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K9+jSyjjITX3BmJ8bbI/KdRSQaln7g5Gcj1dALsqYuPm2XCsM2J+5V4IwrfCAwSnim0J2uvhDYwvlt9a0VfawkDHLW3IY2Xi8Al4VyvBcH+vTmXyfI8juj4qeQrpV9eRYspHd6+x6F4MwkDsjKhVI6LXXsnC1o8oXI2NtF+xrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RK7rhl0/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RK7rhl0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733445861; x=1764981861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=loEs6gUC/h8fr/lhSpTDTbV1DrcM1iT8+SnWfcq1MiA=;
  b=RK7rhl0/AMeJ+zApfYaD5k4cUPx9QTUMhtsACvEdCXjdDU8ld4YhNamq
   JfuILAtKnaJJvyA0CtfkjhwZMAZd7S+YKfdl3LSwrqJyAWAfM4MlekqRd
   T8F0jiOuFdZitexjIgK0JjMTQVVDlYb2p5fbsQert52A8T6VlzQG+9MIc
   9ZcevDBFaxGcv9dm7TtWLIIkr46eHm+oUjMQgjZWblxV9Qte/gFQd8Bs9
   vp3gLs7D90RjqM6XYhSgE/ojFjFgRR9ciattnFFD/BvnUQWiPnkCE9oDt
   gKa6PXfzm4tWZiab8/G5s15N8mq60h12yEFj7QquouiJvapcPbebzdDRO
   w==;
X-CSE-ConnectionGUID: xwCl9wmaSXKN5qH1T7pdhw==
X-CSE-MsgGUID: mKqRfd0wStuUoGliX33E7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37459466"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="37459466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 16:44:21 -0800
X-CSE-ConnectionGUID: WvU0DoVTQ4umKDIXMPMKRA==
X-CSE-MsgGUID: fwBzaQCOSJORXa7W5B9fWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="131671939"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2024 16:44:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJMS9-0000Xs-0i;
	Fri, 06 Dec 2024 00:44:17 +0000
Date: Fri, 6 Dec 2024 08:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1324/1324] kernel/sched/core.o:
 warning: objtool: missing symbol for section .text.unlikely
Message-ID: <202412060831.N6mrEnfc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e416567e80778667f6a949f0f19c32a3ee4cb06e
commit: f2701b77bbd992f3df4631de8493f21db0830452 [1324/1324] Merge 4.18-rc7 into master to pick up the KVM dependcy
config: x86_64-buildonly-randconfig-001-20241206 (https://download.01.org/0day-ci/archive/20241206/202412060831.N6mrEnfc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060831.N6mrEnfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060831.N6mrEnfc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:1283:5: warning: no previous prototype for 'migrate_swap' [-Wmissing-prototypes]
    1283 | int migrate_swap(struct task_struct *cur, struct task_struct *p)
         |     ^~~~~~~~~~~~
   kernel/sched/core.c:1577:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    1577 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3716:35: warning: no previous prototype for 'preempt_schedule_irq' [-Wmissing-prototypes]
    3716 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                                   ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
