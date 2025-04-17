Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F201494CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 02:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744855825; cv=none; b=bH/BS/slCsezZ5MWyJd3DkenCmLITLZu7A8hEqUIXmtonpRQiGtrnSCXVE+yh+hUsWyZFudToSZyzSTsGV3tojOsBdvj/EFpzEFKKmEMYq276c+g0wY1ealB68ha2e7C3mUs/EOlRucyA6ySvgN+ntes/LO7R9ou+6/yzZCHKF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744855825; c=relaxed/simple;
	bh=HeY+ZYbrFs/kLMMGQiHN5Wt3KsDgvAYOzOruzM1T/9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jeutEqGvqaHIhJYy8luG+OENT6aaj8nkoymblfmgqOE5QsOkAGgBcgZV8lFImMhLcu7WLJ+n1lfZjLVO+rPL7T7NnTSc563s/SClnYK2u2iswNDZaX7R7mMYbw05Gko92laUnoisOx0g7ejCNbN4XIdOKqpTqHztqhnviGISBeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrdbM1fs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrdbM1fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744855823; x=1776391823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HeY+ZYbrFs/kLMMGQiHN5Wt3KsDgvAYOzOruzM1T/9U=;
  b=KrdbM1fsxJDsa9OcLX3MXKpDPo9nMVlmEmMZKWtK7PAwx6xX1V8P1Jn9
   guDGNhDcEi30M9fqEnfe0Ow6GjTRaB12iGR/1tICb270KePASP2GyakST
   qi7hUuPWWTqqkifbR4v384hDQcwU0QYyxdzXW834hBrMKuQEfwK7MwgH3
   XqMoVi5YNAzcDA5MQ5DH15cHnR3SQix+32lIohj6zmYUsR2l78u7eKJwM
   sWpJ6YGqC1ByuDxkC+nyy84K7i3BJnhAoGTfhhmjaEg+ExOc+pN7+wuL6
   uJYTPFmac5v/pxcaRAKZQ1EqFgSBakKOhp16mmNuPToqzgDlv0Mtrdz1T
   Q==;
X-CSE-ConnectionGUID: aieTfwdZRs+Y8y4506hLGw==
X-CSE-MsgGUID: PFsELf58RXSQrqSCczRo0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63836578"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="63836578"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 19:10:22 -0700
X-CSE-ConnectionGUID: 7JiHd/7CQhqXw/tkrYfg2g==
X-CSE-MsgGUID: iokUttP7QMmlccDkp1oU7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="135747924"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2025 19:10:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Ehm-000Kis-2J;
	Thu, 17 Apr 2025 02:10:18 +0000
Date: Thu, 17 Apr 2025 10:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for MARVELL_PHY when selected by ZII_RAP
Message-ID: <202504170911.8kdR6gFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.15-rc1-next-next-inband
head:   9e2d85243a79cbf10ea6538b605260e3199fda1a
commit: 9e2d85243a79cbf10ea6538b605260e3199fda1a [24/24] platform/x86: Add Zodiac Radio Access Point platform driver
config: x86_64-kismet-CONFIG_MARVELL_PHY-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250417/202504170911.8kdR6gFf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504170911.8kdR6gFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170911.8kdR6gFf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MARVELL_PHY when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=n] && (BRIDGE [=n] || BRIDGE [=n]=n [=n]) && (HSR [=n] || HSR [=n]=n [=n]) && INET [=n] && NETDEVICES [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for IGB
     Depends on [n]: NETDEVICES [=n] && ETHERNET [=n] && NET_VENDOR_INTEL [=n] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for TQMX86_WDT
     Depends on [n]: WATCHDOG [=n] && (X86 [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for NET_DSA_MV88E6XXX
     Depends on [n]: NETDEVICES [=n] && NET_DSA [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for PHYLIB
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for USB_SERIAL
     Depends on [n]: USB_SUPPORT [=y] && USB [=y] && TTY [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_BITBANG
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
     Depends on [n]: INPUT [=y] && INPUT_KEYBOARD [=n] && GPIOLIB [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MARVELL_PHY
     Depends on [n]: NETDEVICES [=n] && PHYLIB [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_GPIO
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n] && MDIO_BITBANG [=y] && (GPIOLIB [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
