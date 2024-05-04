Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243A017C9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 00:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714783151; cv=none; b=iLuLekQ61ve7E81uRyv41X8Q2X4aK1t++gAiyAyP7cX5ng78itRXfVtl5dAB57SmtfhpDO6a0mi/8IMSA5eQa0H6AtgU1SYfPRFXL+mW5oVphTNyAL86ZVoIEHfK3B4Qpoz27nuvzA6vLyTNCkFSrAh5N8QO0TgPGw3h/7ff7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714783151; c=relaxed/simple;
	bh=9ICopGl1di+/JPlLEalcb7Nig5F3a1H2471LOSTjcwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T6gGRfFDSeOourDDuXZpgeaMXKlTa8/6y2GoHkEuqNA7oyGaQF8OEkz5nDo3JYQMfuiuXfDsw6Vyc4qm8NeFPoWnTY7dFCgO9sfCTQK1utYim4Ek4WDhJ8b6M422QYeymEt1V5Yi95I7dtKIx1Js0pXvA7LtEtVGi0x0HQVf2VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8AwSico; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8AwSico"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714783149; x=1746319149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ICopGl1di+/JPlLEalcb7Nig5F3a1H2471LOSTjcwA=;
  b=X8AwSicoDbKPHhpT6innwS8FTvANDb+ub1BVNUE6sJNsJkniaxaXzEoz
   /LI0yiBcdmosLOhArRfjRovNjtGeWcEpx37N0ZLVT7sLmLcV4TuwRGjEd
   B+Cyy54rGd9r6402xxGs2n219pUJmCmS0Wv89lUpJ7QuGFgpZebMtTgpz
   nyiHUCBqJqlOCzYKtTgfz+83bg/DNQnOHEi+qihDzoqPHDFDKs2fLNyMW
   /5Lc6NBEXBvBeO9f/6mGK+Qfw5kxQYZl79PiakgiykWt/IGPk1dKyBffm
   Hv2q8tlhEqv7pEtvnd9cJsdZ8LJuiX4fyMDeebwh/nXYed8usZ33e8qDk
   Q==;
X-CSE-ConnectionGUID: BS52SZp5RFGmnPLplYg6eQ==
X-CSE-MsgGUID: t1MLOWPTRvCZDA8dVfycTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10438115"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="10438115"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 17:39:08 -0700
X-CSE-ConnectionGUID: SJvNQEu7RDazmag95T1KdQ==
X-CSE-MsgGUID: YmIK1dEbQ761fwdXiR5uVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="27576642"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 May 2024 17:39:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s33Qf-000CGV-0W;
	Sat, 04 May 2024 00:39:05 +0000
Date: Sat, 4 May 2024 08:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 80/82] kernel/watchdog_perf.c:282:
 warning: Function parameter or struct member 'str' not described in
 'hardlockup_config_perf_event'
Message-ID: <202405040851.2EgypmL1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   2ce87845f9106e693ba6d72cc95af6c86dc52d98
commit: 96dca662f6d64b4d31ad186ea1464e9b25d749c3 [80/82] watchdog: allow nmi watchdog to use raw perf event
config: x86_64-buildonly-randconfig-003-20240504 (https://download.01.org/0day-ci/archive/20240504/202405040851.2EgypmL1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040851.2EgypmL1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040851.2EgypmL1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog_perf.c:282: warning: Function parameter or struct member 'str' not described in 'hardlockup_config_perf_event'


vim +282 kernel/watchdog_perf.c

   277	
   278	/**
   279	 * hardlockup_config_perf_event - Overwrite config of wd_hw_attr.
   280	 */
   281	void __init hardlockup_config_perf_event(const char *str)
 > 282	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
