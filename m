Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1950D32C332
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 15:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756482794; cv=none; b=i3tTqpaYWtyhnnlIXxGokpgqeyIDOp0gL5q72KCWV2rXzCtzO9klTQIVwSWMkyvfAHmSOIVaG4qCpUshZPoLV2jN+sq/tCbWsOvKodcLvDw5BFEXjz3WPN+JXosVRXN2WU8IpiyGpyNoHuBrSvs0IksutRiwwj3WprpIqsDUv/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756482794; c=relaxed/simple;
	bh=UWFY0JLHsJMUfcKlKs0YNjb9PahGef/x2LzTGoVsq6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXybV+Lxd1MF6S3HP/hDEH1SDhr8mCqPIbQYV4/KD8ddrIMvc2PoWkW7/SpLTz9iXVDVwV+2WOWosr3Du6DXOPJPSkny4HNivIERSaE/l9QLaVRSPK8oCrMpdBrNvzftr7dRHwajAk+AQ4Mgpjx76WLglRKtRgNxhJ/s5VUfcH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcrryrfB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcrryrfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756482794; x=1788018794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWFY0JLHsJMUfcKlKs0YNjb9PahGef/x2LzTGoVsq6w=;
  b=lcrryrfB1POt6/Dh4IxvMnufbIRgxepsUyhz3oygrc6iEaLHr/BOkSkm
   PzWm9GPWziX2IrMWbHvaRhzK8adv+8DHAnSEw7Os4jANiCKhaiMPJuhAB
   rBGoYJ5DPwia9HEqelvu6WcfhZWc6+aREpI0aTIwwYTPLKrtG56qaXLQp
   u9y7LjVkc3ixvZ07QFInkq3whPAlTB49ygWyuz4gw1N51quWp/BIiz8Rp
   r6nxEfdmXRRM/MjYoGOL1MIlKY373C9wU4fBoAMyUsU9dckkbl5ZkM/w6
   AlEnhHig0bIOy3TrfyLnRhcRCLFcOcGVVFko/aC4SEgaXkIDzEU5pvoXh
   Q==;
X-CSE-ConnectionGUID: IncLLiPnQ6qf5cokVipd9g==
X-CSE-MsgGUID: WfbtR4FoSU6YNj/xHnxx3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58696867"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58696867"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 08:53:11 -0700
X-CSE-ConnectionGUID: ULmxDgHpRlikWVDrs0XvUA==
X-CSE-MsgGUID: a2FIUYIaTaGkW5Kd3Qh66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="201324199"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Aug 2025 08:53:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us1PX-000UjI-18;
	Fri, 29 Aug 2025 15:53:07 +0000
Date: Fri, 29 Aug 2025 23:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202508292318.ujIvmwAj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   07d9df80082b8d1f37e05658371b087cb6738770
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   3 months ago
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250829/202508292318.ujIvmwAj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250829/202508292318.ujIvmwAj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508292318.ujIvmwAj-lkp@intel.com/

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
