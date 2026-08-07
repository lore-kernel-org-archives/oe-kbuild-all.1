Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACFC3B83E3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 02:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786068146; cv=none; b=NtBbQqVUzhGw3dEr7yzh+0kHKNJMAX9y2ttkt5YviIQYPSgM/r1JWSjEj44uG5LspEsyrkmegjilh+7GpZgaJN0ljGviy9NCvzunKjF70F9oPs71xxOiCpNsRMUzgRczpeTkkzt6Nnd/tl6LRYHxTQ5S3m4OuXN6HscTGVgY02Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786068146; c=relaxed/simple;
	bh=IUIiNIBYil9P0JTZerDVGlCyiLK0CufOH75vN8PJhkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fvZJpalgq1peLh4SRmj75+uWAskTxv2JSDNbWWrqg2lre9sMOMLCPD4mNI0wRfr5rGPs8c/oG+Zwd2O9Mjhx66/uQ1S815yxNJAZRlZZbYTycneVCCWsRaet9nPiuVRuQP8Y3MQMezh3fgU93riu8GRvI2h7qxvIypio2wViCHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKcmUEf1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKcmUEf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786068143; x=1817604143;
  h=date:from:to:cc:subject:message-id;
  bh=IUIiNIBYil9P0JTZerDVGlCyiLK0CufOH75vN8PJhkg=;
  b=lKcmUEf1CiJ/kC9AFPIxfZBzovBblv4+wFd5hbAPHYOVsIzLW5sXSsdz
   oIm2PwMMelVjQTKmGJNlyUwVJUy7LQlgnvZfc0VLsOv0rzLmb282R7b7w
   kZImEKUFg4h0POSTaAmDepqGYWlmQNYdBpLw4AKGdbpSxkLIQ358sxebC
   FhG3aWENONPlnsArDHxavqJb3WtRVRQTGPiiDnGSvZrkCEZWTXypYUK+a
   b0mggrTA7w6mUf+6xE5FTepyhCWEmH50V1YMwgY/OY29t0Cn5RKVTbjnK
   DP9HULgxVJRlIpbOG5e6fdK79z8ruA2DLhyxRmRXGIXXoTlBJn9hEbEXO
   Q==;
X-CSE-ConnectionGUID: +0PBN5GzToe+1hvjULu3JA==
X-CSE-MsgGUID: tlwIiXcUTPGHrDLmAwqpgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85796883"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="85796883"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 19:02:23 -0700
X-CSE-ConnectionGUID: zOsQ+Tr6TWGdaN5RDRzC5Q==
X-CSE-MsgGUID: XxaSW/5/T7WtLcrh9VhTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="267406174"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2026 19:02:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws9uc-00000000GqT-35D3;
	Fri, 07 Aug 2026 02:02:18 +0000
Date: Fri, 07 Aug 2026 10:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Nam Cao <namcao@linutronix.de>
Subject: [linux-next:master 10349/13479]
 kernel/trace/rv/monitors/nomiss/nomiss_kunit.c:11: undefined reference to
 `__udivdi3'
Message-ID: <202608070948.U43eR84W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea2bff00da89d7767d677bb68470130ba96f4928
commit: 8da2a88383658dac97769ed8f807ef6100a69480 [10349/13479] rv: Add KUnit tests for some DA/HA monitors
config: xtensa-randconfig-001-20260807 (https://download.01.org/0day-ci/archive/20260807/202608070948.U43eR84W-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070948.U43eR84W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070948.U43eR84W-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/trace/rv/rv_monitors_test.o: in function `rv_kunit_alloc_mock_task':
>> kernel/trace/rv/monitors/nomiss/nomiss_kunit.c:11: undefined reference to `__udivdi3'
   xtensa-linux-ld: kernel/trace/rv/rv_monitors_test.o: in function `rv_test_nomiss':
   kernel/trace/rv/monitors/nomiss/nomiss_kunit.c:31: undefined reference to `__udivdi3'


vim +11 kernel/trace/rv/monitors/nomiss/nomiss_kunit.c

     9	
    10	static void rv_test_nomiss(struct kunit *test)
  > 11	{
    12		struct task_struct *target = rv_kunit_alloc_mock_task(test);
    13		struct task_struct *other = rv_kunit_alloc_mock_task(test);
    14		struct rv_kunit_ctx *ctx = test->priv;
    15	
    16		prepare_test(test, &rv_nomiss_ops.mon);
    17	
    18		target->pid = 99;
    19		target->policy = SCHED_DEADLINE;
    20		target->dl.runtime = 10000;
    21		target->dl.dl_deadline = 20000;
    22	
    23		rv_nomiss_ops.handle_newtask(NULL, target, 0);
    24	
    25		/* Task gets preempted and can't terminate before deadline */
    26		rv_nomiss_ops.handle_sched_switch(NULL, 0, other, target, TASK_RUNNING);
    27		rv_nomiss_ops.handle_dl_replenish(NULL, &target->dl, 0, DL_TASK);
    28		udelay(10);
    29		rv_nomiss_ops.handle_sched_switch(NULL, 0, target, other, TASK_RUNNING);
    30		RV_KUNIT_EXPECT_REACTION_HERE(test, ctx) {
    31			udelay(15 + *rv_nomiss_ops.deadline_thresh / 1000);
    32			rv_nomiss_ops.handle_sched_switch(NULL, 0, other, target, TASK_RUNNING);
    33		}
    34	}
    35	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
