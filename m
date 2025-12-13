Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06B23E358
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765635770; cv=none; b=OkZuKET4MQiJ+7Vg8+I1vNuB5LyPliZR4Z6DpX6R3Chy9HTYzlhEG9EQ+UYZ+gTnZY3722i8tURRe5MiSXT6JKcKsSTV6Dgw8KswyVv2ZO85fYu1jJhfGA67PP4C6mRWYelhXfZAJeDpe4LOnfLkyjttUAJjHbTrZPvmsdE6nhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765635770; c=relaxed/simple;
	bh=yNsxj9ERSPV2VEMg68yPRK/oRvGFhQd+6Ev0NcKxWOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2Aq40QDtg5bxkzkD3usnfYM2dhGnmJEOGqBStqGZNxaWOjZzeZlio6m7Tt+WhlxSdMoHFu1hEsEmGYN3Lxd0SrmlgNTlWKeuC1VUp6yBf6L2Th/BH/Zm0L+UDni33jXxx8GBMxmbMlnSZaZEwouzrmAt9EUYs+9DVblbXZl1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5+suVuI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5+suVuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765635769; x=1797171769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yNsxj9ERSPV2VEMg68yPRK/oRvGFhQd+6Ev0NcKxWOY=;
  b=P5+suVuIAJO4hkWFYyUIeHYaBhPOw5tFJj1/Mnwm5K7d9VxsJXHCqjfo
   sDSG684NvtoEyTNNPI0OQfswB7SerTeELuGpuuqmI8DBJKLwjMV+mxbwJ
   +auos7J2hQYcGVFmiyRB/8nvWvMn65fFn9RdLNRXQDVOtW4UsqqQo/0a9
   PsSDwoUKY/ugo+b6+g93D0+LYu3wAlc7ojptqRJax+Oa5prQ5toP+ZjMR
   WQE/0uC2AvDZc31qf1GDWU6PH2NE2+lsXDpJwN2aR6UQl3PurSHLBG+45
   tcBqvarl3WlFYhAM/aJuMK8bj96piFrTof4ge/qRVq3RqPBxwIzOIHiGX
   Q==;
X-CSE-ConnectionGUID: 5McKQZIxRTmzZRS4QCliLQ==
X-CSE-MsgGUID: yppGl0CTQ/iiY9rIw77mvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67495098"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67495098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:22:48 -0800
X-CSE-ConnectionGUID: vwO5DseaRJKzTR2mjFgkRQ==
X-CSE-MsgGUID: co+lEReAS+yPlLXSwlMP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197590681"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 06:22:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQWD-000000007jT-1kXZ;
	Sat, 13 Dec 2025 14:22:45 +0000
Date: Sat, 13 Dec 2025 22:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [linux-next:master 13947/14265] ERROR: modpost:
 "m_can_class_allocate_dev" [drivers/net/can/m_can/m_can_platform.ko]
 undefined!
Message-ID: <202512132253.vO9WFDJK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d9771d0dbe18dd643760431870a6abf9b0866bb0
commit: 6abd4577bccc66f83edfdb24dc484723ae99cbe8 [13947/14265] can: fix build dependency
config: mips-randconfig-r051-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132253.vO9WFDJK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132253.vO9WFDJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132253.vO9WFDJK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "m_can_class_allocate_dev" [drivers/net/can/m_can/m_can_platform.ko] undefined!
>> ERROR: modpost: "m_can_class_get_clocks" [drivers/net/can/m_can/m_can_platform.ko] undefined!
>> ERROR: modpost: "m_can_class_register" [drivers/net/can/m_can/m_can_platform.ko] undefined!
>> ERROR: modpost: "m_can_class_free_dev" [drivers/net/can/m_can/m_can_platform.ko] undefined!
>> ERROR: modpost: "m_can_class_unregister" [drivers/net/can/m_can/m_can_platform.ko] undefined!
>> ERROR: modpost: "alloc_sja1000dev" [drivers/net/can/sja1000/sja1000_isa.ko] undefined!
>> ERROR: modpost: "register_sja1000dev" [drivers/net/can/sja1000/sja1000_isa.ko] undefined!
>> ERROR: modpost: "free_sja1000dev" [drivers/net/can/sja1000/sja1000_isa.ko] undefined!
>> ERROR: modpost: "unregister_sja1000dev" [drivers/net/can/sja1000/sja1000_isa.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
