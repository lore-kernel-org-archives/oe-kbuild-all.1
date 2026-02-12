Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486821A0B15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 00:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770856200; cv=none; b=gjxtOU/hhn2XBTdF9S9EF0SttXSAPqOiHXscr21aqXJDkZzzlxe/4yYMC3XnTnIXAOKhE2bju6ocD0ldWW7fNk5/ZA7EwcXNgYH5pA4tDg50bW/olsuD6EN8Yx6CsWfI5Ww7ffYswB/HsulsK4tnHHvJjrR2FTs4QhGkvtd5pfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770856200; c=relaxed/simple;
	bh=w7IEgnvkDYyjXAGmkgogz9gTp1cs7UjEBTP9+Uakn0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qtSujRYhhfoY9qWOLXMo8WX7lqgY3jqX/p/m9LmedEwLLzAO63oWCZCPVSj1goVVPwXQ8qLzkZQChusLe+F1MHRhH0lVDsnZLOX9njm1PW6nymmwxRhWAbp6t2wRu4Srm608/33PfMvlJb56n1lunJ0WpBLG6F2oZ2LSMp7bFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOe5aBLX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOe5aBLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770856199; x=1802392199;
  h=date:from:to:cc:subject:message-id;
  bh=w7IEgnvkDYyjXAGmkgogz9gTp1cs7UjEBTP9+Uakn0M=;
  b=mOe5aBLXELwGew51Wk09XdizUh9CKiOz8FxXXd3nzPNvPmjn37SBJxgb
   Ldozk+kR4GQpSTqq9IKyaUgb7pCDshKuyeGdkP6Wwkd833KFRIVwJmYp1
   2flGay0+wnz/Fl9omDcdoV4Y2FBi7nlM7y5X6Un/ke9JteoqTQWla1TtO
   aAZ4b9AF1xltFJ3D7m7MRXhXlu1qhEi4231qVczJ3+EGmDtD0dUUOsnRU
   izUys9NOl9Tag9dltsjlnHKTUsooy/ckBfhLAMhQ/agr+1gazKBvx5VM7
   t6bl2owjZ0BS63Jbw8g1gJohyGLj6F5g0+0HM/PkeMZeIX+hVhHjaFcBw
   Q==;
X-CSE-ConnectionGUID: STnqCX1mQu+jnBiOaO1BKA==
X-CSE-MsgGUID: F4Hq5QaRTPKmz7D8tw9vxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82744222"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="82744222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 16:29:59 -0800
X-CSE-ConnectionGUID: 74MpXe9SSa+NB2Q4vVp/Ew==
X-CSE-MsgGUID: u2P5Vgx3T9KzStL+xt7OkQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2026 16:29:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqKag-00000000qW0-2b2P;
	Thu, 12 Feb 2026 00:29:54 +0000
Date: Thu, 12 Feb 2026 08:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/urgent 1/1] include/linux/jiffies.h:470:36:
 sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee
 becomes ffff85ee)
Message-ID: <202602120804.UOTwdKQt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   b777b5e09eabeefc6ba80f4296366a4742701103
commit: b777b5e09eabeefc6ba80f4296366a4742701103 [1/1] time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
config: alpha-randconfig-r133-20260212 (https://download.01.org/0day-ci/archive/20260212/202602120804.UOTwdKQt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120804.UOTwdKQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120804.UOTwdKQt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpio/gpiolib-cdev.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)

vim +470 include/linux/jiffies.h

   454	
   455	#if !(USEC_PER_SEC % HZ)
   456	/**
   457	 * jiffies_to_usecs - Convert jiffies to microseconds
   458	 * @j: jiffies value
   459	 *
   460	 * Return: microseconds value
   461	 */
   462	static inline unsigned int jiffies_to_usecs(const unsigned long j)
   463	{
   464		/*
   465		 * Hz usually doesn't go much further MSEC_PER_SEC.
   466		 * jiffies_to_usecs() and usecs_to_jiffies() depend on that.
   467		 */
   468		BUILD_BUG_ON(HZ > USEC_PER_SEC);
   469	
 > 470		return (USEC_PER_SEC / HZ) * j;
   471	}
   472	#else
   473	unsigned int jiffies_to_usecs(const unsigned long j);
   474	#endif
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
