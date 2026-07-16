Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592C22E738F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191209; cv=none; b=bpaBgLVQzdWD8LXVEGn2I/9xPPURDPzdBpqcf/IeGsRKl5hmIxPyBBrikkI3Mr44Qx4p94Vx6kCZ2KsrZv0WYZjg1uceJS6QDyLroHlEdSnhpTeK73CXBktIiK18W2ds/w0B9O63SIFKnSyhk++3XxWB9SUjNgsPGWgBrF1ORhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191209; c=relaxed/simple;
	bh=pBMmkWHEHElHygywY5poGeIw+bOq9E/lciBp+LoyQks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BQGwF/ntCLJJ7j4BsJjFbzVQnlUDdBmGkLeDYA/diHKsdzTCnyiz07hnrUtOPKMvPoITzv4EHJ1sedXDB+DSIlDEF6Vtr4vFHSh6AIYlA66c0gS02snJOmQNQmwLCVlevHg8kun5uaCC4cD/tktrVlrHtSklown1QlK2i91ZMEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zy9V2zm4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy9V2zm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784191207; x=1815727207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBMmkWHEHElHygywY5poGeIw+bOq9E/lciBp+LoyQks=;
  b=Zy9V2zm4HU5elO8cPRHU8cDrJ8xJZiYBfq/5Ja8GUU0tatEcBI8n8JxX
   GBVrHxdDVZJ0Qw/6rZpbrTqVlGU/Xxm38U2O0uPY+Kc2u+t1y1YjWRFfv
   mRDf7SYZwHP9hHeI3nebWgKMYI0gMmnYWJsmn9lLgQx3fBLfbIQYMFnrY
   muifGY782GYrG7Ri34bO1c17n5u9+LYhJU/rrUBmZyRYz04qYM23Uvg0m
   n8ZXdT1Am7r1/WfrZ+GbfKSQxx0Ls6owKxilLOIqQu7npxMi573vnUN+t
   A8zR6mLwDyHFUBvSWRLv8CK8CryX6USvzZ46KVkuo6LF1xiNU6Le030db
   w==;
X-CSE-ConnectionGUID: 08CFbnOeR5KIkG9g/HXeCQ==
X-CSE-MsgGUID: GBmv1pV5SjqR9N5j9CsVSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84883883"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84883883"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:40:05 -0700
X-CSE-ConnectionGUID: RumDhZMvTcaUSOFIZILjEg==
X-CSE-MsgGUID: qRgR4cp5S+6nM5Geqie7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="252009666"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jul 2026 01:40:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHdR-00000000OYR-11Ur;
	Thu, 16 Jul 2026 08:40:01 +0000
Date: Thu, 16 Jul 2026 16:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-arch-clockmodes 7/8]
 drivers/clocksource/timer-riscv.c:101:52: error: expected '}' before ';'
 token
Message-ID: <202607161618.vrbUCScQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-arch-clockmodes
head:   3dbee6bdfde299e16016f35170fcb77aa411415e
commit: 2d8fecdc0e0a3d2bccc9cdff478fa0d7b84c6266 [7/8] clocksource/drivers/timer-riscv: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260716/202607161618.vrbUCScQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161618.vrbUCScQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161618.vrbUCScQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clocksource/timer-riscv.c:101:52: error: expected '}' before ';' token
     101 |         .vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER;
         |                                                    ^
   drivers/clocksource/timer-riscv.c:95:47: note: to match this '{'
      95 | static struct clocksource riscv_clocksource = {
         |                                               ^


vim +101 drivers/clocksource/timer-riscv.c

    94	
    95	static struct clocksource riscv_clocksource = {
    96		.name		= "riscv_clocksource",
    97		.rating		= 400,
    98		.mask		= CLOCKSOURCE_MASK(64),
    99		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
   100		.read		= riscv_clocksource_rdtime,
 > 101		.vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER;
   102	};
   103	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
