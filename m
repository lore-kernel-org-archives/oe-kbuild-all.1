Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EFF241139
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891042; cv=none; b=RFtBzXKVFyYMT4wQrIw4Jx04J6rXODgMJGEiBf0aoK6Uc9NHoh+o/Nh2Sx0NF2A/gW1b7gKTLzAG+oVvBdDIZ4Ni07KLgcqxlA9Lf3kZZHSwWrJ54kx6TCDcgd/qDNo8Pttnd2eiYtCF/ps8ed3xpWLbLOK38iT91dAWE1O1IAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891042; c=relaxed/simple;
	bh=DYpA+VPuNUlFoqyXG95b/XFarxI/Ytc7uGOzkdLtM8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPxt4qHx93UuubTxXpoHtnGdlXXPKQLjpwpjx2F618pYeiHfsDVy2FE3Ht7Q0VIHHGZkRDAa5SmpRy9axPQ/rjyGYnQ6ag8ZqlYtQYM/loEZOO0dU1h8gV4SskHtE7A4NLRSL4D2yu3WK7jezyUnGouWPAs4XvkIGmuQQkVCdw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzTQX9vf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzTQX9vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744891041; x=1776427041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYpA+VPuNUlFoqyXG95b/XFarxI/Ytc7uGOzkdLtM8c=;
  b=ZzTQX9vf0jptK8hvt4FzwgeM/W3Mz8fv6n6fFa4V9HfOn9fBT5i3QDmq
   5/BGBrS+jLd9UONRc4GW/Qhlqai9i4hSpccl8fR/tO1OtiLsMP30To6us
   GrTfGIatc7L5o2oRfETEAZcx/fVgm3snA3uIQB3GSSFonEQM4dtSHPvWF
   7vFNvywcnV8C4lSNLWSqVQ9Zlsab/zIdM9hr0agSyoAxAEbm78IGs4b6U
   1HPh8aOC4BR3ziweAi56uA7kUQtsjGbBsoI30T9b002B55qh1vhreWoME
   1mz0X0tu669Io7hv6EsU3dNnnr4AWJ703JYsOW83J01W0rxzZJA9qWvuX
   g==;
X-CSE-ConnectionGUID: T32hdsVXQbmEnNT2t5eiqw==
X-CSE-MsgGUID: S/10rmnxQq6AJxYRZhdDyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57844313"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57844313"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:57:16 -0700
X-CSE-ConnectionGUID: aVfUMN+kQXW3b9s+DDqjJw==
X-CSE-MsgGUID: blII3xuTQcymQRTKh14oIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="161736525"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Apr 2025 04:57:13 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Nrj-000Mcj-1x;
	Thu, 17 Apr 2025 11:57:11 +0000
Date: Thu, 17 Apr 2025 19:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 4503/4779] kismet: WARNING: unmet direct
 dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
Message-ID: <202504171939.HI9JW3JF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
commit: 90d80a3dc4fb24446d9d423c1c8967a63f136b0b [4503/4779] gpio: tb10x: enable building the module with COMPILE_TEST=y
config: x86_64-kismet-CONFIG_GPIO_SYSCON-CONFIG_GPIO_SAMA5D2_PIOBU-0-0 (https://download.01.org/0day-ci/archive/20250417/202504171939.HI9JW3JF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504171939.HI9JW3JF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171939.HI9JW3JF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for MFD_STMFX
     Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]
   
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
     Selected by [y]:
     - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
