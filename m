Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFEE283C89
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806540; cv=none; b=YgrhtLaFpEUM+s/+ZFWmpQcAY8mns4PVpg+x0YPPgfBuJYnzQxQrV4haWcDmQa5JIw6kLT1gvHn3XZH+p396vheTc1UqezBQa4a2iPFSX47RytL0wQTb5pLd5cELnb5juTGOfDD7BKxzM+UUYFHOca/zzurNJ4IKV6TQcxIF2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806540; c=relaxed/simple;
	bh=KhmR4Aggkb8tG5qYjuLKRPou+kNZ7E4vr4WDM69DvzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=orz2xczqG38O117QM6B930nsmU02q9UTtmvDzovvKrD+JTncGiIo/dLyIcAKR4G3F/P9Q3wgFDAKDmK4Mc7AtI8q9cRxq5LP0WPFWmM9hzGcUtJLZ9XebUJr6RM14DC8yvrCc8cKK9ayv1g2EATIVjGe8cquFRhm7AczpKK3Q/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BC8MBZ3U; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BC8MBZ3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782806539; x=1814342539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KhmR4Aggkb8tG5qYjuLKRPou+kNZ7E4vr4WDM69DvzM=;
  b=BC8MBZ3UMp1aiz4/ip6t5ERh2oHQZWniGiXlX+XRFwLC/lRRIJkoWKUG
   JCMta/O9OsLEMc7uOCnYD0fJ+f1wC+zdnXRYPyUOghK3iUlUTCRtW/mRi
   ikmCbGYlu3TzdNFfjvVC5YHaOS7Jnopi2ALyuhRNxSMaAeflhN9dxzgrc
   9nWC8UUsfREjdM+Rf42qOE8FlOyih/OJyY9Qe2R9ikWDa5mN+4QjTNiWN
   uea3GmiUSbWwWbqy2sBY+Dqw0ps1FzSWVMKXjN57cgNr9Wk7eSOYu2AdH
   7BXHIC33b91HOEJFtX4/fLd+ARVRMANfCggUfXNAEvUqeNEEeqPSptWHc
   w==;
X-CSE-ConnectionGUID: ixZTkEGwSy2zK4VWGP3nlQ==
X-CSE-MsgGUID: lngDc8Z3QwOZvH6sUIZ2NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83570522"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83570522"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:02:19 -0700
X-CSE-ConnectionGUID: F8MXldWhRUaOrSio80TJTQ==
X-CSE-MsgGUID: gUoLHFu5RmCTkcYnbj/NHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="251142482"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2026 01:02:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weTQ6-0000000085t-3c7f;
	Tue, 30 Jun 2026 08:02:14 +0000
Date: Tue, 30 Jun 2026 16:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-arch-clockmodes 8/9]
 arch/loongarch/kernel/time.c:216:73: error: expected '}' before ';' token
Message-ID: <202606301535.crMAS6G7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-arch-clockmodes
head:   eff49b51a77d9c6c1fc86147e587f0305e9f0236
commit: 422d4770226b98d9c78b4bd420adc8bd86b0d450 [8/9] LoongArch: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
config: loongarch-randconfig-r063-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301535.crMAS6G7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301535.crMAS6G7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301535.crMAS6G7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/time.c:216:73: error: expected '}' before ';' token
     216 |                                 VDSO_CLOCKMODE_CPU : VDSO_CLOCKMODE_NONE;
         |                                                                         ^
   arch/loongarch/kernel/time.c:209:47: note: to match this '{'
     209 | static struct clocksource clocksource_const = {
         |                                               ^


vim +216 arch/loongarch/kernel/time.c

   208	
   209	static struct clocksource clocksource_const = {
   210		.name = "Constant",
   211		.rating = 400,
   212		.read = read_const_counter,
   213		.mask = CLOCKSOURCE_MASK(64),
   214		.flags = CLOCK_SOURCE_IS_CONTINUOUS,
   215		.vdso_clock_mode = IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) ?
 > 216					VDSO_CLOCKMODE_CPU : VDSO_CLOCKMODE_NONE;
   217	};
   218	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
