Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6526B756
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 02:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768963884; cv=none; b=fSUoXyFqCoI6kph7zLzqZkMhrqyWRPV+N6I48K55Jfg3ANE23M5E6we7B98qwj0Nmlg+O+y/IXaY6J7TSS869V4wxZIdhT1RccsPLCGbKXnqwu8RbnfXAUp+q5t5ro7m3uOamUiFdodABw813V2tHT6i+KqHECMOF2SD7SwCawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768963884; c=relaxed/simple;
	bh=L+2X9koJcm5j1wMX7NF0a4zA22N2x3BbiTtZJsQTATI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m9524HJDlg9Bz1UFA+QUfRIku78NGfp/CPnOI7MYRJ5kswZnYP4vIvC9YvWwmVyKTtH2cMZSQr4MvWgqCAnnTfC6eP5WE83Yz5N8QBvOHlbXzcjwtu3xLgMnqcMdLf3RC/z8b28qEUum7g/WEaWvhmStJzYln9nt6EfCPAT53a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDnkaQgd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDnkaQgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768963882; x=1800499882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L+2X9koJcm5j1wMX7NF0a4zA22N2x3BbiTtZJsQTATI=;
  b=lDnkaQgd+djWmP9qQtmXD4Gy3Bu8UQ0EZHd3x35RUlfmq7OFT75L6vbN
   gHki6Muo4ajSb+C8wcDXduAkAUokpzM5DJvwqAoUwv+hpunF8G5b1Yjii
   UG9QskqX+22ZvDvMlaR7e6txKzzwb311+db4C45On6yvLlQbOPEAqN6hj
   Dwm1GPF3HAjck1GhZDYqa5WAmHniHisL5bes+924ruUrn4aznPTd5USF6
   QPFuPXdLxi1WgeFlddL0kzVwScbt18dwJhUQr33s37R9G1tCYM4nKfbho
   +puCBo26Rv8HrUcp/xKsnJcCdhC2vCIEpIDGyehH8MmGBnS1hizviMASc
   Q==;
X-CSE-ConnectionGUID: UmklwvGGSNWU91vmDw+g1Q==
X-CSE-MsgGUID: 96DsS9dvQeqyLG3VL1AFBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="72777404"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="72777404"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 18:51:21 -0800
X-CSE-ConnectionGUID: rgfacspnS9OLGn7IAQKuDg==
X-CSE-MsgGUID: BCDjk9bbQqSsvSU2WTGnIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="211164171"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2026 18:51:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viOJS-00000000Psp-1aFU;
	Wed, 21 Jan 2026 02:51:18 +0000
Date: Wed, 21 Jan 2026 10:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 1/28]
 kernel/fork.c:549:undefined reference to `rt_mutex_debug_task_free'
Message-ID: <202601211003.aAKWT2re-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   90614b63ef6a2f10b6e486e486ca8d5bfd2b7a81
commit: 3d3535e426c8e15bef8f2b193de5a970bbc84a20 [1/28] debugging
config: powerpc-adder875_defconfig (https://download.01.org/0day-ci/archive/20260121/202601211003.aAKWT2re-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211003.aAKWT2re-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211003.aAKWT2re-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/fork.o: in function `free_task':
>> kernel/fork.c:549:(.text+0x1f28): undefined reference to `rt_mutex_debug_task_free'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_RT_MUTEXES
   Depends on [n]: DEBUG_KERNEL [=y] && RT_MUTEXES [=n]
   Selected by [y]:
   - DEBUG_TIMERS [=y]


vim +549 kernel/fork.c

68f24b08ee892d Andy Lutomirski     2016-09-15  527  
68f24b08ee892d Andy Lutomirski     2016-09-15  528  void free_task(struct task_struct *tsk)
68f24b08ee892d Andy Lutomirski     2016-09-15  529  {
a1140cb215fa13 Kuniyuki Iwashima   2022-08-23  530  #ifdef CONFIG_SECCOMP
a1140cb215fa13 Kuniyuki Iwashima   2022-08-23  531  	WARN_ON_ONCE(tsk->seccomp.filter);
a1140cb215fa13 Kuniyuki Iwashima   2022-08-23  532  #endif
b90ca8badbd114 Will Deacon         2021-07-30  533  	release_user_cpus_ptr(tsk);
d08b9f0ca6605e Sami Tolvanen       2020-04-27  534  	scs_release(tsk);
d08b9f0ca6605e Sami Tolvanen       2020-04-27  535  
68f24b08ee892d Andy Lutomirski     2016-09-15  536  #ifndef CONFIG_THREAD_INFO_IN_TASK
68f24b08ee892d Andy Lutomirski     2016-09-15  537  	/*
68f24b08ee892d Andy Lutomirski     2016-09-15  538  	 * The task is finally done with both the stack and thread_info,
68f24b08ee892d Andy Lutomirski     2016-09-15  539  	 * so free both.
68f24b08ee892d Andy Lutomirski     2016-09-15  540  	 */
68f24b08ee892d Andy Lutomirski     2016-09-15  541  	release_task_stack(tsk);
68f24b08ee892d Andy Lutomirski     2016-09-15  542  #else
68f24b08ee892d Andy Lutomirski     2016-09-15  543  	/*
68f24b08ee892d Andy Lutomirski     2016-09-15  544  	 * If the task had a separate stack allocation, it should be gone
68f24b08ee892d Andy Lutomirski     2016-09-15  545  	 * by now.
68f24b08ee892d Andy Lutomirski     2016-09-15  546  	 */
f0b89d3958d73c Elena Reshetova     2019-01-18  547  	WARN_ON_ONCE(refcount_read(&tsk->stack_refcount) != 0);
68f24b08ee892d Andy Lutomirski     2016-09-15  548  #endif
23f78d4a03c53c Ingo Molnar         2006-06-27 @549  	rt_mutex_debug_task_free(tsk);
fb52607afcd062 Frederic Weisbecker 2008-11-25  550  	ftrace_graph_exit_task(tsk);
f19b9f74b7ea3b Akinobu Mita        2012-07-30  551  	arch_release_task_struct(tsk);
1da5c46fa965ff Oleg Nesterov       2016-11-29  552  	if (tsk->flags & PF_KTHREAD)
1da5c46fa965ff Oleg Nesterov       2016-11-29  553  		free_kthread_struct(tsk);
b0fd1852bcc21a KP Singh            2023-06-02  554  	bpf_task_storage_free(tsk);
^1da177e4c3f41 Linus Torvalds      2005-04-16  555  	free_task_struct(tsk);
^1da177e4c3f41 Linus Torvalds      2005-04-16  556  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  557  EXPORT_SYMBOL(free_task);
^1da177e4c3f41 Linus Torvalds      2005-04-16  558  

:::::: The code at line 549 was first introduced by commit
:::::: 23f78d4a03c53cbd75d87a795378ea540aa08c86 [PATCH] pi-futex: rt mutex core

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
