Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F412D7805
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755722263; cv=none; b=BTIaE7TfP4ou8tbLOBeX3F+Mo6oRfzkkRN/eAZqUd0GEauENVsrOJepZXI3yDpALrr73SO7Q7AnfNcDKaWVnt402R12Rz6QRj/rKfku8XywjQkQPV4kBo87beIj9JqH8gl1Lm0+JxEuU0961I+7ptBuCRpH73RL+y1XPMwmVHro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755722263; c=relaxed/simple;
	bh=gNWbX58sl8y08MhNiozXze12Bp2HcSyyQjo4CJGcOm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1wmL7rAoyM347ERlRSZJrBncCYccGxJux/HIKJoW4IaeN+thrrlf5Hkl1jXdZJudx+QqhRIeOqh7l8/wU0QfX2NIHFzWBLXsJfsgfj8YUah27FW2dQDttxHOwC+w22wokUNyxuGeBMrIoFl7ZeMz/vey4ux4V1OLSbx+W3VkyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRhw+P2S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRhw+P2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755722262; x=1787258262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gNWbX58sl8y08MhNiozXze12Bp2HcSyyQjo4CJGcOm0=;
  b=dRhw+P2Slsh18dkjjQmy4d0xSGgXi6YhcO/DlfnIp5ML7Im/e/Vph/3U
   8GfJQ01umxxTjVUDujpOVy0Ss0iBsQJUCAmxC1gLQOh6Z0Wor0p4+yYHQ
   RK5szY1WWClXDHc38IY9YdMecf3HRvEBgJ2l9Q7TiXvw+ziArASNWeDUf
   khCrbKb4iUmDRgbv0A0NHxVix5sh9Db3JVEKaaX7N7D4nHb6jViKGrBPL
   rBUEtPUKDoufdTXOu3sn9X2vtuZlAhrUzEXrIPqQO9uETYQeTKUl3BXIq
   392zPxmnJ0o7mUb3abLFQKeZTxvNIJ94BqD20+7dtaiNz4S2+J98v7dTS
   Q==;
X-CSE-ConnectionGUID: t2fPUKMOQPOSc5S4QA47tg==
X-CSE-MsgGUID: ZofXGiPZSMKev0hKNhf0gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68707075"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68707075"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 13:37:41 -0700
X-CSE-ConnectionGUID: OSXEs8zTTr+ki8EQ2QMQ7A==
X-CSE-MsgGUID: 7MrthuPrREquoxWuysAfSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172442700"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Aug 2025 13:37:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uopYv-000Jfb-05;
	Wed, 20 Aug 2025 20:37:37 +0000
Date: Thu, 21 Aug 2025 04:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 2220/3631]
 drivers/clocksource/arm_arch_timer_mmio.c:256:56: sparse: sparse: cast
 truncates bits from constant value (ffffffffffffff becomes ffffffff)
Message-ID: <202508210406.ZpERK4Nr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5303936d609e09665deda94eaedf26a0e5c3a087
commit: ce5d33422d97dcefca2f6ab0aa54131f17ae77bc [2220/3631] clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone driver
config: arm-randconfig-r122-20250820 (https://download.01.org/0day-ci/archive/20250821/202508210406.ZpERK4Nr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce: (https://download.01.org/0day-ci/archive/20250821/202508210406.ZpERK4Nr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210406.ZpERK4Nr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/arm_arch_timer_mmio.c:256:56: sparse: sparse: cast truncates bits from constant value (ffffffffffffff becomes ffffffff)

vim +256 drivers/clocksource/arm_arch_timer_mmio.c

13f1a7a6f29a92 Marc Zyngier 2025-08-14  238  
13f1a7a6f29a92 Marc Zyngier 2025-08-14  239  static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
13f1a7a6f29a92 Marc Zyngier 2025-08-14  240  {
13f1a7a6f29a92 Marc Zyngier 2025-08-14  241  	at->evt = (struct clock_event_device) {
13f1a7a6f29a92 Marc Zyngier 2025-08-14  242  		.features		   = (CLOCK_EVT_FEAT_ONESHOT |
13f1a7a6f29a92 Marc Zyngier 2025-08-14  243  					      CLOCK_EVT_FEAT_DYNIRQ),
13f1a7a6f29a92 Marc Zyngier 2025-08-14  244  		.name			   = "arch_mem_timer",
13f1a7a6f29a92 Marc Zyngier 2025-08-14  245  		.rating			   = 400,
13f1a7a6f29a92 Marc Zyngier 2025-08-14  246  		.cpumask		   = cpu_possible_mask,
13f1a7a6f29a92 Marc Zyngier 2025-08-14  247  		.irq 			   = irq,
13f1a7a6f29a92 Marc Zyngier 2025-08-14  248  		.set_next_event		   = arch_timer_mmio_set_next_event,
13f1a7a6f29a92 Marc Zyngier 2025-08-14  249  		.set_state_oneshot_stopped = arch_timer_mmio_shutdown,
13f1a7a6f29a92 Marc Zyngier 2025-08-14  250  		.set_state_shutdown	   = arch_timer_mmio_shutdown,
13f1a7a6f29a92 Marc Zyngier 2025-08-14  251  	};
13f1a7a6f29a92 Marc Zyngier 2025-08-14  252  
13f1a7a6f29a92 Marc Zyngier 2025-08-14  253  	at->evt.set_state_shutdown(&at->evt);
13f1a7a6f29a92 Marc Zyngier 2025-08-14  254  
13f1a7a6f29a92 Marc Zyngier 2025-08-14  255  	clockevents_config_and_register(&at->evt, at->rate, 0xf,
13f1a7a6f29a92 Marc Zyngier 2025-08-14 @256  					(unsigned long)CLOCKSOURCE_MASK(56));
13f1a7a6f29a92 Marc Zyngier 2025-08-14  257  
13f1a7a6f29a92 Marc Zyngier 2025-08-14  258  	enable_irq(at->evt.irq);
13f1a7a6f29a92 Marc Zyngier 2025-08-14  259  }
13f1a7a6f29a92 Marc Zyngier 2025-08-14  260  

:::::: The code at line 256 was first introduced by commit
:::::: 13f1a7a6f29a92759d88eaa5c699f26809307c7c clocksource/drivers/arm_arch_timer: Add standalone MMIO driver

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
