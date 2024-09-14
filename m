Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C9A8F58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 06:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726297010; cv=none; b=BpDmJb7aZXNc9rM9h7B9At58MquUhpCy+nN3MEdMpdNmGJuNHsJ1/XN37BZLsszGdQEbF9cHIgVuCss1VIsp3p99gkvI3VNrtqrlmnEE2pA/ub1HJxW4/VIr0lvaD4LKTSD4XCJDj3MhNzRV1fs3VlnTYNM5ckXpb0bBdLJnxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726297010; c=relaxed/simple;
	bh=Efy7h+f5R6Mz7L0Q+ychx+axXW7aR/Hps9URTzpQWJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hBH44Es5aiLZf/zD+NMRr8iVbsTEbqRGb5tAsewchZ3DjsKaC5tzN42SChMF14mcPpVnTmrODgei3IMu1LsV7MJyEU+FUbQaddL0Vzie9h5zu65xYzrkLHkdH5KfKjDPs8kC/PUeSgglnFWSwriXOVk4LrSp5Tvp2hbz9WfsaaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRxkuc3K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRxkuc3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726297008; x=1757833008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Efy7h+f5R6Mz7L0Q+ychx+axXW7aR/Hps9URTzpQWJ0=;
  b=DRxkuc3Ksd8OhzudKlUBiA+4chCl95ld2vZ8h4K57a3jY2QnZeUho6RP
   wISnslVRn7JXQEhFEZLjSABoTDMa1Zz5GyELArNTrJNwxO0zIcJzR00kw
   AcCPW5FHyLuNfRhPQhlgge+mC3KdeZHaawLyFdYmqtCXkhOaOi/d0bgdJ
   EdsMr7s0ZGriSlbULXoPaos8ID0I5bd0TUDjC2/pLmzJdPbJh8Qi9rAi4
   38kxpfQ/RgSBaA1tWrHNhuGfB/iboG+CQlqErM/WZnrtk9mjILVqU9iqL
   fDpg7ASk/SZCqN1FL5G3XsdD71JbB8zExfF+Zg7oxl1Xk49gEY/z9lcjC
   Q==;
X-CSE-ConnectionGUID: pD5NUDAoSRScwlDsiI17SA==
X-CSE-MsgGUID: ltuGSntKQzasItEG4WjYhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35878462"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35878462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:56:48 -0700
X-CSE-ConnectionGUID: klsHnkQhQK6c5ctyL7ywDA==
X-CSE-MsgGUID: HmpWxW7bSCOOjp5SJZm9wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68320760"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Sep 2024 23:56:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spMi5-0007TO-0P;
	Sat, 14 Sep 2024 06:56:45 +0000
Date: Sat, 14 Sep 2024 14:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 4481/30000]
 kernel/power/wakeup_reason.c:199:6: sparse: sparse: symbol
 '__log_abort_or_abnormal_wake' was not declared. Should it be static?
Message-ID: <202409141420.aBcYszmc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d62984adb112e9b02a3e754e0b5b3295d7501600
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [4481/30000] ANDROID: power: wakeup_reason: wake reason enhancements
config: x86_64-randconfig-121-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141420.aBcYszmc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141420.aBcYszmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141420.aBcYszmc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/power/wakeup_reason.c:199:6: sparse: sparse: symbol '__log_abort_or_abnormal_wake' was not declared. Should it be static?
   kernel/power/wakeup_reason.c:378:12: sparse: sparse: symbol 'wakeup_reason_init' was not declared. Should it be static?

vim +/__log_abort_or_abnormal_wake +199 kernel/power/wakeup_reason.c

   198	
 > 199	void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
   200	{
   201		unsigned long flags;
   202	
   203		spin_lock_irqsave(&wakeup_reason_lock, flags);
   204	
   205		/* Suspend abort or abnormal wake reason has already been logged. */
   206		if (suspend_abort || abnormal_wake) {
   207			spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   208			return;
   209		}
   210	
   211		suspend_abort = abort;
   212		abnormal_wake = !abort;
   213		vsnprintf(non_irq_wake_reason, MAX_SUSPEND_ABORT_LEN, fmt, args);
   214	
   215		spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
