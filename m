Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5B178CDF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726578018; cv=none; b=HnWLVfAHK7IcH+o3wprVzfhXMzxuKMZtr4wCvO8Nt1GnNH8FZlLXhyHCbFfx06IGu6rHGbuLc/1JhXunHWu2IgymZPoUU/XqNvG/AKvYxmrYqJMRpAXJMhIuVCe6ChJ77k2QP6pMlNsbZ7vrYns9JLyTMLFnbPao4R3GSJXrXtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726578018; c=relaxed/simple;
	bh=JOdvYIqmUYTtMKaDOGC+daUs92mV0q64yRhtThKeRzg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KzerjxYtJBFUz+Ad0OM/ntQqxAZt1hYXapH5XNhiTo8EeSaRw8gviNdW1OLAf2WMPVHXDtkhws6WjtRnFo+fwSxAL8kri1SED/Zn5T5WuqreOFsre26NNR8gor3mH/OFavliIJYETdL6D9mtqIsgX6Yyf+7+gV5hFb92vYxxmGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHceEhJH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHceEhJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726578015; x=1758114015;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JOdvYIqmUYTtMKaDOGC+daUs92mV0q64yRhtThKeRzg=;
  b=bHceEhJHjMYvWAz55MLrj1XgH77EgxJoyXk3YGtfIDFuvGawost6LYuC
   bKBBWtCt7sXQ3kuJ91zaHvaOerafhVfwu+AKtAOEoKZaiQJmQwvBQuiND
   llrw9DIFiqQth2K9+T+KwJjc68a5UI1XhND4OutM9cii1jHomUxJpqx1L
   dgpvw1ixgw4qu5Nf5kPMO1txGKm7D68CqECLmPo3xn1M7KsrZcuQ2JoMb
   fogCn9phJbIg7sDb6HRhk8WnbSRl8PWyZ+Iy6Jzi1mi97LPP7yfLMcA4q
   LieviKsv940akfRiElmj9sC7HihxKdyTHoVjW4wgu5IYBk68GrZ9WZE81
   g==;
X-CSE-ConnectionGUID: Cfw9+/oTRVSuB/jkcoJmdA==
X-CSE-MsgGUID: nvF1whK6Tr2YQOjn2WyVLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25369845"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25369845"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 06:00:14 -0700
X-CSE-ConnectionGUID: 5PyPRhBKSdCpqFBmDEQfTA==
X-CSE-MsgGUID: JqvouTGBQCOoosLlA2Xnlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69155016"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2024 06:00:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqXoQ-000BAc-2V;
	Tue, 17 Sep 2024 13:00:10 +0000
Date: Tue, 17 Sep 2024 20:59:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_IPROC_GPIO
Message-ID: <202409172026.gThq8HDj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: nios2-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_IPROC_GPIO-0-0 (https://download.01.org/0day-ci/archive/20240917/202409172026.gThq8HDj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240917/202409172026.gThq8HDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409172026.gThq8HDj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_IPROC_GPIO
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_IPROC_GPIO [=y] && PINCTRL [=y] && OF_GPIO [=y] && (ARCH_BCM_IPROC || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
