Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45B225A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 01:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731547147; cv=none; b=Fr3EzXuCz7H+RJVcpJHwKRaSAYVndHrjgFHSTCgJRXXykQMUTweaS7TT1/5ezdVKUM5Ck67PAvrq+K1XxELBcKJ5Tch8l4NoZn4oyVC490exGfuYKR0ENzdbj4dm14Soap3uBQ2rjml28DycAiPyrQ/ZnHtEL+7hZmRH4X9HZ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731547147; c=relaxed/simple;
	bh=Sd2FXOM/6gN3BsSsnR6KlqFoUxb7WezHump7294fngI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+dy7SqtnoUi28+je5Xk24Wj0NQuylSywy1kjjj9Pvb7fsax+uIVxjDRAAsNHLgbVEApEI17YxzfeXCuNNaF19R5j2qOG+kJN6f8Org3x6mzLa+itBawichUohLK2mLTCl4+ROoLR0LNhspdE61TxlBEEHeIk38QYnWqy4jhvmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+jZy9Cs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+jZy9Cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731547145; x=1763083145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sd2FXOM/6gN3BsSsnR6KlqFoUxb7WezHump7294fngI=;
  b=Q+jZy9Csj10260sTIw05Ex5xfBM5Ux3+SEoD2AtctYe+3zxCXUeWGTYX
   H2cBFZ9rO4PFKkdTGKGQwjxbAcJh6L93CiWOmHH85SXLUMPkl8kKzc86E
   W76N6muTAjnSzkKmTBjKYSB4Yy7pMW1fgdTSHRdiO4/nGPcpKJNK8a5ZN
   wFsjZo9IQ8Aw5XQgX9HjNY2Ehd/w3YRafssPOFIt34rdqPOBv8PQ1eExH
   ae6oChJLhs1G6UZxhn87iol/d7EV5meDatVOhLONo9aVPw/LKHxIPyUHp
   7ZMiew8mLr2auyuM4enwIFbF/+GgY9ml1WGBJyMsXYvzMA4w4jxNxnZ4S
   A==;
X-CSE-ConnectionGUID: MjVW9cgISFmFDp/TTpD0Pw==
X-CSE-MsgGUID: SVNJIl43SYKHu2+dtWBtlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35395509"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="35395509"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 17:19:04 -0800
X-CSE-ConnectionGUID: oKGDpmwtRq61PW1iR7Dsiw==
X-CSE-MsgGUID: EAHJdEGnShyYK3KUIkOkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88224627"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Nov 2024 17:19:03 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBOVh-00011Z-0S;
	Thu, 14 Nov 2024 01:19:01 +0000
Date: Thu, 14 Nov 2024 09:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 kernel/watchdog_hld.c:123:13: error: implicit declaration of function
 'is_hardlockup'
Message-ID: <202411140951.wQy7SE1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xiongfeng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: 818ac22d9d2f02632b39ef1a4f472e6dbe0d417a [1291/1291] sdei_watchdog: fix compile error when CONFIG_HARDLOCKUP_DETECTOR is not set
config: arm64-randconfig-004-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140951.wQy7SE1b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140951.wQy7SE1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140951.wQy7SE1b-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/watchdog_hld.c: In function 'watchdog_hardlockup_check':
>> kernel/watchdog_hld.c:123:13: error: implicit declaration of function 'is_hardlockup' [-Werror=implicit-function-declaration]
     123 |         if (is_hardlockup()) {
         |             ^~~~~~~~~~~~~
>> kernel/watchdog_hld.c:142:21: error: 'sysctl_hardlockup_all_cpu_backtrace' undeclared (first use in this function)
     142 |                 if (sysctl_hardlockup_all_cpu_backtrace &&
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/watchdog_hld.c:142:21: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +/is_hardlockup +123 kernel/watchdog_hld.c

7edaeb6841dfb2 Thomas Gleixner 2017-08-15  106  
b8163908982cff Xiongfeng Wang  2019-01-28  107  void watchdog_hardlockup_check(struct pt_regs *regs)
73ce0511c43686 Babu Moger      2016-12-14  108  {
73ce0511c43686 Babu Moger      2016-12-14  109  	if (__this_cpu_read(watchdog_nmi_touch) == true) {
73ce0511c43686 Babu Moger      2016-12-14  110  		__this_cpu_write(watchdog_nmi_touch, false);
73ce0511c43686 Babu Moger      2016-12-14  111  		return;
73ce0511c43686 Babu Moger      2016-12-14  112  	}
73ce0511c43686 Babu Moger      2016-12-14  113  
7edaeb6841dfb2 Thomas Gleixner 2017-08-15  114  	if (!watchdog_check_timestamp())
7edaeb6841dfb2 Thomas Gleixner 2017-08-15  115  		return;
7edaeb6841dfb2 Thomas Gleixner 2017-08-15  116  
73ce0511c43686 Babu Moger      2016-12-14  117  	/* check for a hardlockup
73ce0511c43686 Babu Moger      2016-12-14  118  	 * This is done by making sure our timer interrupt
73ce0511c43686 Babu Moger      2016-12-14  119  	 * is incrementing.  The timer interrupt should have
73ce0511c43686 Babu Moger      2016-12-14  120  	 * fired multiple times before we overflow'd.  If it hasn't
73ce0511c43686 Babu Moger      2016-12-14  121  	 * then this is a good indication the cpu is stuck
73ce0511c43686 Babu Moger      2016-12-14  122  	 */
73ce0511c43686 Babu Moger      2016-12-14 @123  	if (is_hardlockup()) {
73ce0511c43686 Babu Moger      2016-12-14  124  		int this_cpu = smp_processor_id();
73ce0511c43686 Babu Moger      2016-12-14  125  
73ce0511c43686 Babu Moger      2016-12-14  126  		/* only print hardlockups once */
73ce0511c43686 Babu Moger      2016-12-14  127  		if (__this_cpu_read(hard_watchdog_warn) == true)
73ce0511c43686 Babu Moger      2016-12-14  128  			return;
73ce0511c43686 Babu Moger      2016-12-14  129  
73ce0511c43686 Babu Moger      2016-12-14  130  		pr_emerg("Watchdog detected hard LOCKUP on cpu %d", this_cpu);
73ce0511c43686 Babu Moger      2016-12-14  131  		print_modules();
73ce0511c43686 Babu Moger      2016-12-14  132  		print_irqtrace_events(current);
73ce0511c43686 Babu Moger      2016-12-14  133  		if (regs)
73ce0511c43686 Babu Moger      2016-12-14  134  			show_regs(regs);
73ce0511c43686 Babu Moger      2016-12-14  135  		else
73ce0511c43686 Babu Moger      2016-12-14  136  			dump_stack();
73ce0511c43686 Babu Moger      2016-12-14  137  
73ce0511c43686 Babu Moger      2016-12-14  138  		/*
73ce0511c43686 Babu Moger      2016-12-14  139  		 * Perform all-CPU dump only once to avoid multiple hardlockups
73ce0511c43686 Babu Moger      2016-12-14  140  		 * generating interleaving traces
73ce0511c43686 Babu Moger      2016-12-14  141  		 */
73ce0511c43686 Babu Moger      2016-12-14 @142  		if (sysctl_hardlockup_all_cpu_backtrace &&
73ce0511c43686 Babu Moger      2016-12-14  143  				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
73ce0511c43686 Babu Moger      2016-12-14  144  			trigger_allbutself_cpu_backtrace();
73ce0511c43686 Babu Moger      2016-12-14  145  
73ce0511c43686 Babu Moger      2016-12-14  146  		if (hardlockup_panic)
73ce0511c43686 Babu Moger      2016-12-14  147  			nmi_panic(regs, "Hard LOCKUP");
73ce0511c43686 Babu Moger      2016-12-14  148  
73ce0511c43686 Babu Moger      2016-12-14  149  		__this_cpu_write(hard_watchdog_warn, true);
73ce0511c43686 Babu Moger      2016-12-14  150  		return;
73ce0511c43686 Babu Moger      2016-12-14  151  	}
73ce0511c43686 Babu Moger      2016-12-14  152  
73ce0511c43686 Babu Moger      2016-12-14  153  	__this_cpu_write(hard_watchdog_warn, false);
73ce0511c43686 Babu Moger      2016-12-14  154  	return;
73ce0511c43686 Babu Moger      2016-12-14  155  }
6c19c0e5140a24 Xiongfeng Wang  2019-04-20  156  NOKPROBE_SYMBOL(watchdog_hardlockup_check);
73ce0511c43686 Babu Moger      2016-12-14  157  

:::::: The code at line 123 was first introduced by commit
:::::: 73ce0511c43686095efd2f65ef564aab952e07bc kernel/watchdog.c: move hardlockup detector to separate file

:::::: TO: Babu Moger <babu.moger@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
