Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE385661
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766613962; cv=none; b=BAkD32gKeOdzyooRFhAtymSH8cSg37r0lJIgV3ZcdmaDtCCiWhGp14KMOoLWbLz3Ia3iuvuLguOh81y/4VFeMtWeFnoVmDC44vtt/rzs1wCD/a9dTxS7MQn5W/sV5O6i8RoG4bHwhGXbVRCAL5jLBWtzHBMsg99kD8TaspWlgx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766613962; c=relaxed/simple;
	bh=sKuX3tIjZon+ClANrmrDEBzU1G4rzq6XCYxQ1lbj66U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMW6qr6c6EKrjyrWp3RiR4hu8b3jz5yk8DyGl7zmOWP2kqt+L3AEGAlDyq8RPjF6h+coZr3lTHYdujX2c5a7sMJzLGjCDOcoOVER2/pH95FF5zdp4MOMSHZb0GRaL39he4GudYll1I4JHs1kuWQ4UTPa1b7JOGjM9Cl2osGMlP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ib26vpIZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ib26vpIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766613960; x=1798149960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sKuX3tIjZon+ClANrmrDEBzU1G4rzq6XCYxQ1lbj66U=;
  b=Ib26vpIZK0x3Zs0H9Eu0ga0WMyIFU2Q8GSs9VvdJ+P/WrISFof07mXM8
   iaJwCAj0Hkb6XgBxGZTsykEP8mOUR5nLCqeZGuPynjQTXRqe714+n8FQe
   v03k8/QT1mRVDkI4E9i6vWwdnJtUYTI9bwuba8wNBK1zVlipIEMvKYP9Z
   1RQZVh8Tn4wRAHKrMAltIG0MxVe9LMMz5JW/xiq/PznLJoowR3J3Bn9hC
   tsqwxLy/L/gQ3fHLmlQ3UsadrfUobPOnMPFi2hLjcw783Iv9CGMZcwPY5
   2l3mfTz9VhpRBKDq24WLTakSaw5K72srmk6bej+kRCtAKAuLMKtF6/Qci
   g==;
X-CSE-ConnectionGUID: yB7Tj6NMREaKfKlKTsIb1Q==
X-CSE-MsgGUID: D+rdb49dRXWPJBtS0umjZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68480939"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="68480939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 14:05:59 -0800
X-CSE-ConnectionGUID: kITVkWKRQWqRJNeXzXKp/g==
X-CSE-MsgGUID: S+2GUmXtSwerkaz/5gtSgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="201004467"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Dec 2025 14:05:58 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYWzQ-000000003UD-16qI;
	Wed, 24 Dec 2025 22:05:52 +0000
Date: Thu, 25 Dec 2025 06:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Eta Zhou <stephen.eta.zhou@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	groeck7@gmail.com, Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
Subject: Re: [PATCH] clocksource: timer-sp804: Fix an Oops when
 read_current_timer is called on ARM32 platforms where the SP804 is not
 registered as the sched_clock.
Message-ID: <202512250520.APOMkYRQ-lkp@intel.com>
References: <20251219-fix_timersp804-v1-1-020e3cde7cf5@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-fix_timersp804-v1-1-020e3cde7cf5@gmail.com>

Hi Stephen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Stephen-Eta-Zhou/clocksource-timer-sp804-Fix-an-Oops-when-read_current_timer-is-called-on-ARM32-platforms-where-the-SP804-is-not-register/20251219-130527
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251219-fix_timersp804-v1-1-020e3cde7cf5%40gmail.com
patch subject: [PATCH] clocksource: timer-sp804: Fix an Oops when read_current_timer is called on ARM32 platforms where the SP804 is not registered as the sched_clock.
config: arm-randconfig-r134-20251224 (https://download.01.org/0day-ci/archive/20251225/202512250520.APOMkYRQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250520.APOMkYRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250520.APOMkYRQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-sp804.c:112:21: sparse: sparse: symbol 'delay_clkevt' was not declared. Should it be static?

vim +/delay_clkevt +112 drivers/clocksource/timer-sp804.c

   108	
   109	/* Register delay timer backed by the hardware counter */
   110	#ifdef CONFIG_ARM
   111	static struct delay_timer delay;
 > 112	struct sp804_clkevt *delay_clkevt;
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
