Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E565B286A7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 06:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187692; cv=none; b=o/a8s1jotSg7TYsuYhYCGsASvqQ+NHZSLguCOsmS3ydpH83aBNgwNnP671RUIPEV6GhEd5ZCB4O35P50bJfFiMZ4P51YSc8R7OtF8ncizvHJgQcBsk+L4CnSj/mqiEhdnx1DIrm7BzaQkar4wmQD8chWcv6brL6TiiSz7I0uHrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187692; c=relaxed/simple;
	bh=eiN/1soyWzHVx249GWy1tH/TVvzuxT5I2xWKi0NG5pA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R7r9flPwGkTpwfsVT7LUtWbF4o1NIhqE7rcKKV36Tl0Ixp9182ttdUmiI9qHttzJ4E9ryFLZDKKZuBdHZy5J8lsh24hEcl0CHpTgHXDjxal6h+nKxynZXIlj//0cOiwJCVISvU9hdzlMdXNOJmxB11ePRu6LogW4hlfEsqwL5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9lMqY/7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9lMqY/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770187692; x=1801723692;
  h=date:from:to:cc:subject:message-id;
  bh=eiN/1soyWzHVx249GWy1tH/TVvzuxT5I2xWKi0NG5pA=;
  b=l9lMqY/79jtHsG1mmkdGyeG6zNJQs3O4XC7V5Rvnfn6fzyLSCwrHLP/a
   5/wJb87MNPBkrebJcPE5iDPvtCNdSVSeHfDmvyR8nL22jpZl4LrZbpohF
   PZIa4ZprGXm2mKFRujNPHcVlWwXSPv37K/Vv5IDn3iAZybu1cXcV9DMR+
   LqeDVM1b2Fq+RLtXZhxiMvI1hex5o+IyDA8uK9oFeAuNBC9MeWoVLLRpn
   FjtVIXFqdk00aiCDvaAUAKUBpc989itkHdsDM6/FGbqweAoMZAXtK2WOD
   onRgYR1pok11e+TRsWiZsqWcYOLaMPYZ9AI3yZE0cq4gp+LJzyI6TJ2aE
   Q==;
X-CSE-ConnectionGUID: hxV31HVBT42s7NYOZ6f1dw==
X-CSE-MsgGUID: UMvRSmuISxCA1/LoZXWlrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82000541"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82000541"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 22:48:11 -0800
X-CSE-ConnectionGUID: aPNCSNpoTdm6bx0dF0W4TQ==
X-CSE-MsgGUID: Ye88ACotQZGdB+YqfgP9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="247674428"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2026 22:48:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnWgJ-00000000hX4-2pO6;
	Wed, 04 Feb 2026 06:48:07 +0000
Date: Wed, 04 Feb 2026 14:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 322/322]
 kernel/sched/core.c:4069:26: error: implicit declaration of function
 'stack_trace_save_tsk'
Message-ID: <202602041404.Qfh7us82-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   a392e986a4b52a65ef06eeec24c4adabefd4b830
commit: a392e986a4b52a65ef06eeec24c4adabefd4b830 [322/322] trace_sched_wakeup_backtrace
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260204/202602041404.Qfh7us82-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041404.Qfh7us82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041404.Qfh7us82-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'do_trace_sched_wakeup_backtrace':
>> kernel/sched/core.c:4069:26: error: implicit declaration of function 'stack_trace_save_tsk' [-Wimplicit-function-declaration]
    4069 |         unsigned bt_nr = stack_trace_save_tsk(task, bt, ARRAY_SIZE(bt), 0);
         |                          ^~~~~~~~~~~~~~~~~~~~


vim +/stack_trace_save_tsk +4069 kernel/sched/core.c

  4057	
  4058	static noinline void do_trace_sched_wakeup_backtrace(struct task_struct *task, u64 start_time)
  4059	{
  4060		u64 duration = ktime_get_ns() - start_time;
  4061	
  4062		if (duration < 100 * NSEC_PER_MSEC)
  4063			return;
  4064	
  4065		if (task->__state & TASK_NOLOAD)
  4066			return;
  4067	
  4068		unsigned long bt[10];
> 4069		unsigned bt_nr = stack_trace_save_tsk(task, bt, ARRAY_SIZE(bt), 0);
  4070	
  4071		trace_sched_wakeup_backtrace(task, duration, bt, bt_nr);
  4072	}
  4073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
