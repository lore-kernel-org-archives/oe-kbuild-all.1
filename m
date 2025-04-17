Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925920F087
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 22:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929743; cv=none; b=u09Q8ZVkjI7n51A7T8L55a5K8VVeD/1YhdjtLSQbtG1NhBFZYNP4/mvxm+wpvjPQDrgX4vb/nIlX3SCa0hwWWj90hpEQCyQ/C/SlESHzYQ8+NPwhoiYKnMhdEwdmcDStkfMQ+WtQ/qHaHCMptmQNitRVr27gzP8uXNM2tlrBrgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929743; c=relaxed/simple;
	bh=jcBNgZKY/BMbf8rxu+vuOD/OqVUtkK6nzzKL0dWESTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXdFCeM/crFJISNx4XXXX4UnYFimP5yRnpYEQs3sLnwYdhF/p19v3nToUMVesE8AMvq1cqtNBmJMq+KBTSq+rD6Rj5GIbPvwJEMEs9YcqqJZa1Bx3/bNy5CCXtGwRIloYaHMB+HKOYhR57Rgv5/97N5QH82iW9yPm1o85etRMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwVMueVP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwVMueVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744929743; x=1776465743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jcBNgZKY/BMbf8rxu+vuOD/OqVUtkK6nzzKL0dWESTc=;
  b=MwVMueVPg/xwSN7gp9rXHTUu9+K3E18Fac6gH1TNigm0WRXsXZ4eGNnx
   4aJaLPhq5f55cMjFVwm66CIY44+DXbg5nvxOguM7jQfwJYPPrXiURQXOO
   qc5OBZbvgxFVk6lKwl984SZWRLj/JKkQQwop86UsZdvJScom0s0by7PqT
   x253PiDZ/ZqRRxBfQol/tFGXRHXgspnhZox1hI0t1O5DNjDZK5p19dSIM
   JmrZsvbI60clAA2Xf2E7iV99R7ZgHDS36L9HnQhKQHMu79ApfDhwoljDC
   A7xmy27E1u+4myZnpQwsNa1DAOKbAH43sTTFm8Mikl5fJmkofHT6z+Ktv
   g==;
X-CSE-ConnectionGUID: ENj0XkoXROWJZKHXELCwuQ==
X-CSE-MsgGUID: h7mJ7Mq1RraMEvUxDC/4Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46554800"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="46554800"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 15:42:22 -0700
X-CSE-ConnectionGUID: VtboJnvvQZy1KueTKmRHxg==
X-CSE-MsgGUID: neM76nv6Qg2g17HYqbPufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="136056776"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Apr 2025 15:42:20 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Xw2-000277-0G;
	Thu, 17 Apr 2025 22:42:18 +0000
Date: Fri, 18 Apr 2025 06:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for TQMX86_WDT when selected by ZII_RAP
Message-ID: <202504180625.0uK1ONoZ-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_TQMX86_WDT-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250418/202504180625.0uK1ONoZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250418/202504180625.0uK1ONoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180625.0uK1ONoZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TQMX86_WDT when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=y] && (BRIDGE [=y] || BRIDGE [=y]=n [=n]) && (HSR [=n] || HSR [=n]=n [=n]) && INET [=y] && NETDEVICES [=n]
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
