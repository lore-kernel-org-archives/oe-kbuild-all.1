Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9F4367F41
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768022; cv=none; b=kMLZveqmxEAQEue3keamy37OYibYpDnCzvVpJhii6ECWeEd1qDrDCSrY6fMWqC9BQ5om6r0vRu3no1P1iSSmyfMUMCFa3YfD53UXotJ+9YI5E3HO0+PpOATLcE3DBUOozhtXkMg/NNOKcVRMIjlT/RpocWqVhhEJTOSrZ8QkZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768022; c=relaxed/simple;
	bh=7hACW6gqwn+kYHLYeH9RIrv0GGWGhAtvLcPUpFtkEhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qif2ZxCPsaBwN4VlWsA/8Dn3g+wVDEAmd7dzgTNE/yBk59smGKx1cKVWh0NnmYFGPADajs2NgbLiMLJrtJHzaOMsNhg2NQGI8B0HhJ1/2exKmh1FuC2SyWIHbpI1ljsmGg7FfTbW3IHGkH5w5Sd1a4XLcYpPHJM9sZSQ0V22vw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggeRYOi/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggeRYOi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787768015; x=1819304015;
  h=date:from:to:cc:subject:message-id;
  bh=7hACW6gqwn+kYHLYeH9RIrv0GGWGhAtvLcPUpFtkEhA=;
  b=ggeRYOi/ncGj+A996U0YS6+GxKTBuVakOfoRhU7tsAyaQvUC3d7NYBz8
   vNhRnhnHkwHMaolSAZCV/BEaFKPWy++1AX0jBPpTYlxwBiCzUmAbQgF8J
   4fS1wO0uPxlwNwnOBKyc1L4wR5aJRHZCpLEu4Fl27xpvVqIdSqLZuTQsj
   7mwT5QOYv1Oe/KNmgk/e52UWImhfCgFBchdxEt4R17p0qRBBg8x/+A8+A
   Ljw2kOzrFu6WYNxdKyp64rsyO4wW4bZHIzTisHcXm/dE/chaKweaG4Dkq
   cFC95T3CDIAguD9k71J1+R19sSU5VaA4c/gVrKpxwkJuYFA7xj584OWOn
   Q==;
X-CSE-ConnectionGUID: Es3kTlbmTz+se+JjqtHg5w==
X-CSE-MsgGUID: DG9u/xZpTTm7mHwM7XGI5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92120505"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="92120505"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:13:28 -0700
X-CSE-ConnectionGUID: 1oxNJB+2TVW9EHc+Usq7yw==
X-CSE-MsgGUID: stahew9TSAOJ61CiVS1zJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="267069089"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2026 11:13:27 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzI7o-000000000YT-311m;
	Wed, 26 Aug 2026 18:13:24 +0000
Date: Wed, 26 Aug 2026 20:12:43 +0200
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202608262023.aWiCeMHm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   1 year, 3 months ago
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262023.aWiCeMHm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262023.aWiCeMHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262023.aWiCeMHm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
     Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=y] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
