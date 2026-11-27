Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804548;
	b=Uo/BXJzhzZPrdaxhNe0xu/ArrfyZfZZVOgs+91ktaEbv3ryjmyuRAGYa7iV7Qc31tgE8
	 2n8c+HG4EDyApcfbNAgvjG4gEOAqbs96a9T///fmJH4vAjGjYBsVKAksvuVKRZ9O0ZqEP
	 4me1FNq6o7dDuJSVZTRng9E6DXUv3vR8gZFJZdbGj+NEeaazb53qJGlzjVTHWrSjHkOjv
	 T8xrkgPckyCpSuAoDExE5PXdMV7hKDjRIYl4BIPZwesAC1j71UxMNyyaLOZS460pcQhRH
	 D8/2Q2klqzINNy9goxIrVzWw8i8LLP+LCSZ1c1rzUVjsQvgWlAWuuDfPbLfl7/1XITg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804548;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mCwUCKrfLvk4+7YggsUOqDVd31exrEjyEnffY56R1uo=;
	b=ZwKhtxpfv4UIWikUpVL2lryER7X8Dp3YyYmayxmqr7emlcQ9viiTGbUjGHBGaedzZtkG
	 M0uHRGyUAt/3TuX3OtFzLrAGsZb3+mPKS6v2yT7gpsDIV8Sn+SBsNZ12m9bYe8kN6HWDa
	 IOqikgPIDS83alQ1iOk8fieRw6KqezWMb3ZVJ12k8nhB4NQWK27jePQIhOkZrYvTqA//1
	 f3RvXw3wPxlztEWzmQqYaxAeE9Kr+gIqw7ffv6lHW4yjertooQqol349dD0D0IrA9nIku
	 VENRloRSa12OuNoOvNbMcQ+XA8SRC6XQMkmYamXj7YL4IeVmMul89C9mjhjdT19rzFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FprVCZIw;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620D606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 18:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E620D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FprVCZIw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795804548; x=1827340548;
  h=date:from:to:cc:subject:message-id;
  bh=vtvJyVGaGY5qnH0K504AKCPcAm+amx5im4AwIGGPMGQ=;
  b=FprVCZIwd7DbGFC/TynQ7xtcTfaM95LZa7L0CDgU1zon7HDA2xarUw25
   /ivZGw3fJfOZEUZ2903ZomrsiZuh3Ib5ZUrqjLxbQWDhxbHElbwXGBVO/
   Y3iGhsdzEdAPgKuMekp02yZXRqHNMXJWILlanXFvzmnVzADCpQHXJCjfS
   0kxX9cYeQjF5sGKS2x0tqT8e4rVqZxZIPbQ7FDq72Kt2Yxp0y8/jV+7z6
   6jGWSvN9uHWIoGFOfA1nZAmVLFydMuAMTFlmoYvOEThmziyfPNanfnKRD
   WVVXes33W+FoQlPjkDnc9VLc+XGl9s/enR9Q1DVZoXE5IVaWpmbftDgF+
   Q==;
X-CSE-ConnectionGUID: UrvG7zg7RlOakZrHgelLrA==
X-CSE-MsgGUID: hOA+2f1iQqu+C6vBbh0y5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4738566"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4738566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:35:47 -0800
X-CSE-ConnectionGUID: fXTjsMiQSPmOZzPDxAzUew==
X-CSE-MsgGUID: NCD0dhbHRr+1QnSrq+ETCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12859275"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Nov 2026 10:35:46 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX0nP-000000000IY-3W0m;
	Fri, 27 Nov 2026 18:35:43 +0000
Date: Fri, 27 Nov 2026 19:35:19 +0100
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
Subject: [lee-mfd:for-mfd-next 66/72] drivers/mfd/cs42l43.c:557:2:
 error: call to undeclared function 'sdw_slave_signal_unattach'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <20261127192646.c6RszVzQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   5a9a62afea200df7189a9bfc4dd5794c178f407c
commit: 54b3632c8ec08735d3f6235d80005aa0b648c7dd [66/72] mfd: cs42l43: Move to core detach helper
config: sparc64-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127192646.c6RszVzQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127192646.c6RszVzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127192646.c6RszVzQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/cs42l43.c:557:2: error: call to undeclared function 'sdw_slave_signal_unattach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     557 |         sdw_slave_signal_unattach(cs42l43->sdw);
         |         ^
   1 error generated.


vim +/sdw_slave_signal_unattach +557 drivers/mfd/cs42l43.c

   545	
   546	/*
   547	 * If the device is connected over SoundWire, as well as soft resetting the
   548	 * device, this function will inform the SoundWire core the device is about
   549	 * to detach from the bus.
   550	 */
   551	static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
   552	{
   553		static const struct reg_sequence reset[] = {
   554			{ CS42L43_SFT_RESET, CS42L43_SFT_RESET_VAL },
   555		};
   556	
 > 557		sdw_slave_signal_unattach(cs42l43->sdw);
   558	
   559		/*
   560		 * Apply cache only because the soft reset will cause the device to
   561		 * detach from the soundwire bus.
   562		 */
   563		regcache_cache_only(cs42l43->regmap, true);
   564		regmap_multi_reg_write_bypassed(cs42l43->regmap, reset, ARRAY_SIZE(reset));
   565	
   566		msleep(CS42L43_RESET_DELAY_MS);
   567	
   568		return -EAGAIN;
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
