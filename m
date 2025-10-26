Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCA835B13C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761463800; cv=none; b=gaqi7K0VH95gqh9qEsJ6CEguz3jYJz43JczQb6aZ1RfUzHpPnutzGIW21yivlw61Q2mHYEPhDuG9QtQCm7yxb7387rJ3x7rDCjpP3NzSxwBnxKjSMT1UDlYFOPpJBAutUpFE+D5ZMQTwnp+vL9CnJ0Ps+E/ly9TM9Hhp0H7g1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761463800; c=relaxed/simple;
	bh=LDfYezswqsE3ljG1Blh0XYnh2C+x+bJcoOPC40on7BY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=snFaEldcerEi/Z+usltHBfPMTTh+2utms6eORiedDXZcFz171++xFvIaIbK6Iu4hTqjnlzVCw8b4D7l7jI26AVpCPXhhif8gDDEuvzgrhSEdBKT/+NWfigH84vJIcqBCNRze/2PVEQwyQmS9FnPEsDSPnfuXgEtoLeHUSzQh+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6tqzm5Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6tqzm5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761463799; x=1792999799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDfYezswqsE3ljG1Blh0XYnh2C+x+bJcoOPC40on7BY=;
  b=L6tqzm5ZrMEAvoMWhmn+CbgWQ97P3K6U6uRBKUwgxxEftiHlz6vCIycB
   P7HbAJXlDz9KRNxfJAqUryoKgfkUKKcW4FDASlM5ToC9Wfj6MB0vvB6CZ
   HScoHNfwJOMLcwDxGroVXf1ZzOYaf4wpRbLuvNOhngZOeL/BmMF7OIwgU
   hij1rHbvYz4MS2fhEjTvcWe3wnqP5oFwj8LS3tVXuCCeUDR9pnZO+Whmx
   FrNBcXFcfQIGqNqKZYXnCoLrAgc73/76XTXV7jzQN2K3+TEaTuETvZJSj
   83ZGGYCx9wXLYg/dAm7TFtyhio433EpO7AnwcsbqO+UH77GIVxuQsXY3w
   g==;
X-CSE-ConnectionGUID: JQWcXxhhSwSLnIR9mE6fzg==
X-CSE-MsgGUID: g12a/rxGQsG4qJ7YRQ8I8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62784254"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="62784254"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 00:29:58 -0700
X-CSE-ConnectionGUID: StbKvK2RRymWAjlq29DDfA==
X-CSE-MsgGUID: QY6pDLjZRNC6s5C5eMrxXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184674714"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2025 00:29:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCvCN-000FxX-0L;
	Sun, 26 Oct 2025 07:29:55 +0000
Date: Sun, 26 Oct 2025 15:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 40/75] kernel/entry/common.c:71:29: error:
 implicit declaration of function 'rseq_exit_to_user_mode_restart'; did you
 mean 'arch_exit_to_user_mode_prepare'?
Message-ID: <202510261513.J1Ewgg2U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   44778ec169878406f8c7822820c9dce29df889ba
commit: 5b3fd8db8fd83f539e5ac3b6738be415f6087114 [40/75] rseq: Switch to fast path processing on exit to user
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251026/202510261513.J1Ewgg2U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261513.J1Ewgg2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261513.J1Ewgg2U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from include/linux/context_tracking.h:5,
                    from include/linux/irq-entry-common.h:5,
                    from kernel/entry/common.c:3:
   kernel/entry/common.c: In function 'exit_to_user_mode_loop':
>> kernel/entry/common.c:71:29: error: implicit declaration of function 'rseq_exit_to_user_mode_restart'; did you mean 'arch_exit_to_user_mode_prepare'? [-Wimplicit-function-declaration]
      71 |                 if (likely(!rseq_exit_to_user_mode_restart(regs)))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^


vim +71 kernel/entry/common.c

    59	
    60	/**
    61	 * exit_to_user_mode_loop - do any pending work before leaving to user space
    62	 * @regs:	Pointer to pt_regs on entry stack
    63	 * @ti_work:	TIF work flags as read by the caller
    64	 */
    65	__always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
    66							     unsigned long ti_work)
    67	{
    68		for (;;) {
    69			ti_work = __exit_to_user_mode_loop(regs, ti_work);
    70	
  > 71			if (likely(!rseq_exit_to_user_mode_restart(regs)))
    72				return ti_work;
    73			ti_work = read_thread_flags();
    74		}
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
