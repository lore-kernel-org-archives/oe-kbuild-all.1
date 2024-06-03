Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6122312DDB3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423995; cv=none; b=ZPWSCnYi7chDnMd+sCToVbcIXrW6JSt/f/8MC6KYmLDLym/ScdQM8Swv1t748+5Q6zztEYG3wHYI2SZ2BBH5syQEPLhW4xXarbfVYSPERo7ymgEbt7XpujAOIQhxOACN+g+C1RqCX5hgclAd6nSyUHwegkINfIIX3zMzajoyu7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423995; c=relaxed/simple;
	bh=HJGGnvEGFT31VPKpdSl/BMOK9g4zLkxjvinJEXSZqn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7+PdXLWXe5BM2LnH2mT9VGu2KjTXf+Xdz0znY7k1093xgJP0r823f4AND9krEekiHV4M2BdDuxE8ZUUxTMpiEGdYYXEIXOP5aw4XOSJ/Yc3W6nFKju2ENxNubaN3Pyv2zBbY7RNTgptqaB93HkeCoWw7IwYiiMvb28fZtk669A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM5X0Nb7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM5X0Nb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717423993; x=1748959993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJGGnvEGFT31VPKpdSl/BMOK9g4zLkxjvinJEXSZqn8=;
  b=RM5X0Nb7BF8OaakGSWgy2peNZXzY0bVZ6kcW7xPkObIe/uBXLtgBs/Xa
   XwssSfJGai/eYZM0Qju/DOONXqcy8EnzzVNTCq7KO/w4peEivO4Ar06B/
   gTH17IWnLjRBLlsXWfFYyMOzJeM8OtCa3zBcuqsT0isHHlCWXzDUnwxZp
   hZdnDw5jv760/VQjUvP4/KOXnGzkWsE21UGw89NRuS5Cjv6MDH73ThYeX
   /rKJ7Si8qoppPCwzamxZeaMxQ/iRqYRI2dhV9xxLH76X1mXji0eZ2a1ot
   YsPwhIeUuZYf0Ei+uE2m/1oQNB38XLraL5d9uB0l65mLLR3+P1E9MxfsK
   w==;
X-CSE-ConnectionGUID: /cabNCb8SYmLDTdMNXAPUQ==
X-CSE-MsgGUID: m1IP4N/aTyijP4rbyz78dA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="16859733"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="16859733"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 07:13:12 -0700
X-CSE-ConnectionGUID: G2fqLwr6QVyziRBEz6fISw==
X-CSE-MsgGUID: GQmsxekwRU+OboQw5jDKeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="41429969"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jun 2024 07:13:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE8Qu-000LjV-2f;
	Mon, 03 Jun 2024 14:13:08 +0000
Date: Mon, 3 Jun 2024 22:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.10.y-rt-rebase 11/93] kernel/softirq.c:663:54:
 error: implicit declaration of function 'local_pending_timers'
Message-ID: <202406032240.HGRwGwRQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.10.y-rt-rebase
head:   6d20efa57a896036453f4b061ae22601ef61b494
commit: 9105c9af2449940dbb3b9c2b98f2c9868a384410 [11/93] softirq: Use a dedicated thread for timer wakeups.
config: i386-randconfig-014-20240529 (https://download.01.org/0day-ci/archive/20240603/202406032240.HGRwGwRQ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406032240.HGRwGwRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406032240.HGRwGwRQ-lkp@intel.com/

Note: the rt-devel/linux-6.10.y-rt-rebase HEAD 6d20efa57a896036453f4b061ae22601ef61b494 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/softirq.c: In function '__irq_exit_rcu':
>> kernel/softirq.c:663:54: error: implicit declaration of function 'local_pending_timers' [-Werror=implicit-function-declaration]
     663 |                 if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
         |                                                      ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/local_pending_timers +663 kernel/softirq.c

   649	
   650	static inline void __irq_exit_rcu(void)
   651	{
   652	#ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
   653		local_irq_disable();
   654	#else
   655		lockdep_assert_irqs_disabled();
   656	#endif
   657		account_hardirq_exit(current);
   658		preempt_count_sub(HARDIRQ_OFFSET);
   659		if (!in_interrupt()) {
   660			if (local_softirq_pending())
   661				invoke_softirq();
   662	
 > 663			if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
   664				wake_timersd();
   665		}
   666	
   667		tick_irq_exit();
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
