Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F53587CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010286; cv=none; b=P+qYCv5BO68fnPgsQD8HdFGm1rsl1afCDIIj64B4my7kF6nhaGk3OTc9Ch/ikblwJhOWCKafkPEUvmqG1LOlfv2dT2RGUQzNAqbHcnTJLu+YsSmF1EyQvFV7YqJoW0Ox1cfu4SxoMKsKVbJxyzjYJUvCwWoYLeiIA+sLyTnPZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010286; c=relaxed/simple;
	bh=pgJ82lj9OVDzzfC3unGeXCGx1s1YNuG+gP+ir87hWcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mh/Ux6BHwNEdOHQ0yC6eUL0l3M4TWOLFYnHU0dD6KGxRB3L3boiHT8LwK+4gk9YvFwtstDIxGscYsi6im4UCFP7Vuci0C0NMx2VQriiMLoDnIJ5CE5cahnQXf2YhxBKiGyW8cknAh3dgT/NICGta67VdKVNs7EWxt5oy9imWRgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P50wmEc6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P50wmEc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769010285; x=1800546285;
  h=date:from:to:cc:subject:message-id;
  bh=pgJ82lj9OVDzzfC3unGeXCGx1s1YNuG+gP+ir87hWcE=;
  b=P50wmEc68i44jmAbF4rZ+M30EoXxRd/KVobR3Xg1d0JwlOmeDBzr/sxr
   cpKVcjvJWGW8DQ/gTdxyKYOkKaaEkwyMA+PmnX+THqRaK1SIA+kibeq7g
   /wj5Mu3TIdwUQiy6Newjd9ng/5pt1APOkkzOkM3+yOccr0Sgo6wZjQnfC
   1TKlgrt4pQ98spHr9cCGB2WGSO/hu4vEZLO04Yofg4hY/JZfjfdJT7Ukt
   oIX8NEBmzGfJnFUMQNG7E5Ww2nkOq7I+deh8yQuxIAOuJzbpiRp9hrRX6
   7mlT8PBAVGlufwJXFVO1N0MrYMNQk0PrQMSwuyY8mLmFiIGi/nwQJgWXA
   Q==;
X-CSE-ConnectionGUID: dErLaEzeS7y5at4oDGEQLA==
X-CSE-MsgGUID: UaW/twaDR9S2I9VW/T0iNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="72828054"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="72828054"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 07:44:45 -0800
X-CSE-ConnectionGUID: vRp1YuXbQcGfoMR05X4weQ==
X-CSE-MsgGUID: qbFxgMlQRo6AQpBNLOLopQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206387690"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 07:44:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viaNt-00000000RMX-00to;
	Wed, 21 Jan 2026 15:44:41 +0000
Date: Wed, 21 Jan 2026 23:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/clocksource 6/6]
 kernel/time/clocksource.c:124:61: warning: integer overflow in expression of
 type 'long int' results in '445948416'
Message-ID: <202601212345.5Le2uByD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/clocksource
head:   b69a88525b5d119e9571d2052242e2c4ca559f36
commit: b69a88525b5d119e9571d2052242e2c4ca559f36 [6/6] clocksource: Rewrite watchdog code completely
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260121/202601212345.5Le2uByD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212345.5Le2uByD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212345.5Le2uByD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/clocksource.c: In function 'watchdog_check_freq':
>> kernel/time/clocksource.c:124:61: warning: integer overflow in expression of type 'long int' results in '445948416' [-Woverflow]
     124 | #define WATCHDOG_INTERVAL_NS            ((WATCHDOG_INTERVAL * NSEC_PER_SEC) / HZ)
         |                                                             ^
   kernel/time/clocksource.c:138:42: note: in expansion of macro 'WATCHDOG_INTERVAL_NS'
     138 | #define WATCHDOG_FREQ_MAX_READOUT_NS    (WATCHDOG_INTERVAL_NS >> 12)
         |                                          ^~~~~~~~~~~~~~~~~~~~
   kernel/time/clocksource.c:413:32: note: in expansion of macro 'WATCHDOG_FREQ_MAX_READOUT_NS'
     413 |                 if (wd_delta > WATCHDOG_FREQ_MAX_READOUT_NS) {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +124 kernel/time/clocksource.c

   121	
   122	/* Watchdog interval: 0.5sec. */
   123	#define WATCHDOG_INTERVAL		(HZ >> 1)
 > 124	#define WATCHDOG_INTERVAL_NS		((WATCHDOG_INTERVAL * NSEC_PER_SEC) / HZ)
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
