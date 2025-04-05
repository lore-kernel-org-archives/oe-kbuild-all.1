Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F81C27
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743830508; cv=none; b=HxAZDJo95IAfw6Q5Z+GzKpYfG9vfjHlIhYhUaO7DjqWd0G2hi88b5YNNJm/qkZo+BEaiUh2mf2kXPm9eUEptz2CyWGweYIvF7XrIiLhBiKj3xWQn2D5rvu1TU0kXxO0WW5/nsglL3crsL+djOq91m4yBksYRtfALJdKr50w968M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743830508; c=relaxed/simple;
	bh=aND+8oAqBAWfG+2mL1OigpULZl54jy/DeNZh8a9SQSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt6aaj+ksZtc31m/DTcCSl4tMQzpcGN1QtRpXWhszfiQZA6fi13PPIQ4uKF8FG2jiD/stry4Nkh8DEUrjSEM6/5JeQzd/D6mYaZD5VctcGOVeOIn1+l9OWK+1rS+v2mVzqcJ+APf6D3hFQl7+VLZe9au8YclzVbZTl7E0alHIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3sw7mu4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3sw7mu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743830507; x=1775366507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aND+8oAqBAWfG+2mL1OigpULZl54jy/DeNZh8a9SQSY=;
  b=N3sw7mu4/oomdwm1WP+OlKXiRs8+aqCtjWoB3Hlt5oN37mN6NqIgKrI0
   amDNdhDgrMeavzCe/+RR9NCQLP7Hk58wgLSDHNlr0U4eTaJ+k4iJtyQuI
   AeyGAY1pOiO5wEgCfTwQjSFtqJI+VFDzsJCW3blV/yK546W6q0FqNto28
   vg0F1hMA2zd5FS701nDO2qaVzjBG/Tsm4ryvpuHi87gbgvuI3ZNL7RqAF
   75/1I5mwTx1qSOaruBqzScN/yFg/KnF3svxhIjaJFgtD1D186XJ781k5F
   nZzTi0ub7cZGO+yOh6b7/uj06UsvcdoKYu7h5j+nkJ+XPSFFa5mn8PbLr
   g==;
X-CSE-ConnectionGUID: ZwyR2S2mRDCHs4mTbrWhZw==
X-CSE-MsgGUID: n0Y/ayQqR6uFUoeFaYlG7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56646977"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="56646977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 22:21:46 -0700
X-CSE-ConnectionGUID: SUtkV8xIQ8K4K+u3AG/4tQ==
X-CSE-MsgGUID: evH22QwbRK68V9Inl0lm2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="158463033"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 22:21:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0vyQ-0001pn-2q;
	Sat, 05 Apr 2025 05:21:42 +0000
Date: Sat, 5 Apr 2025 13:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/9] sched: Add sched tracepoints for RV task model
Message-ID: <202504051354.KA5K9Da6-lkp@intel.com>
References: <20250404084512.98552-16-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404084512.98552-16-gmonaco@redhat.com>

Hi Gabriele,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e48e99b6edf41c69c5528aa7ffb2daf3c59ee105]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/tools-rv-Do-not-skip-idle-in-trace/20250404-165047
base:   e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
patch link:    https://lore.kernel.org/r/20250404084512.98552-16-gmonaco%40redhat.com
patch subject: [RFC PATCH 5/9] sched: Add sched tracepoints for RV task model
config: i386-buildonly-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051354.KA5K9Da6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051354.KA5K9Da6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051354.KA5K9Da6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/rcu/tree.o: in function `rcu_exp_handler':
>> tree.c:(.text+0x3dbf): undefined reference to `__trace_set_need_resched'
   ld: kernel/rcu/tree.o: in function `print_cpu_stall':
   tree.c:(.text+0x5a92): undefined reference to `__trace_set_need_resched'
   ld: kernel/rcu/tree.o: in function `rcu_read_unlock_special':
   tree.c:(.text+0xb906): undefined reference to `__trace_set_need_resched'
   ld: kernel/rcu/tree.o: in function `rcu_core':
   tree.c:(.text+0xcbd9): undefined reference to `__trace_set_need_resched'
   ld: kernel/rcu/tree.o: in function `rcu_sched_clock_irq':
   tree.c:(.text+0xd662): undefined reference to `__trace_set_need_resched'
   ld: kernel/rcu/tree.o:tree.c:(.text+0xd682): more undefined references to `__trace_set_need_resched' follow
   ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_read_range':
   tda9950.c:(.text+0x90): undefined reference to `i2c_transfer'
   ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_write_range':
   tda9950.c:(.text+0x114): undefined reference to `i2c_transfer'
   ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_read':
   tda9950.c:(.text+0x392): undefined reference to `i2c_transfer'
   ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_driver_init':
   tda9950.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
   ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_driver_exit':
   tda9950.c:(.exit.text+0x9): undefined reference to `i2c_del_driver'
   ld: kernel/sched/build_policy.o: in function `idle_inject_timer_fn':
>> build_policy.c:(.text+0x33e): undefined reference to `__trace_set_need_resched'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
