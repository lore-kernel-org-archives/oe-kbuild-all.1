Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE7440C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 02:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736647555; cv=none; b=QjOPFl94xVK3amZXXlH0tOm3gNabGMVCrh5GKJuDM6LBu21InXT9eCb0pBCB4AbNDMVlT5wcF1LZoUrumF3XBarjv4UCzIaFoR1iQZ6CF9g0YG8Xmvw1Ya/VlGEFY481X24keUQt2WoWWrURpYzU9/FwD4PDiS29p2ss0g6GVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736647555; c=relaxed/simple;
	bh=JZQzeWItoogFyVK2hOyj6dJAeC74U1POOE5bUYfawqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=il1dcJnxEdbMCco9nIo1/J0gJAwUxmf0m6ukQ7E4JjWlpvtTAlxGWlfhrY5d9I8NJB6GqAoe6goAWeOZ9vllvXpWI9ynOdqHyt2FxcxQx0QoCUwHMNeW6N1iGtg22zMC+qqtaeLTBZSMYLGAYH3zdVNPUp7Iloajr4JB1DRcq2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCvej5V/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCvej5V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736647554; x=1768183554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZQzeWItoogFyVK2hOyj6dJAeC74U1POOE5bUYfawqI=;
  b=fCvej5V/3qdncLZR1XT/Ud1IbckfksCX6U1XNL/HwgZGN4w+G/4la37l
   ZUnnkNG4TcuqNfR/ek3nDBHwr1lnOBjY8ZCOKADUhe/l2r/VvWr2jpBuk
   22fiveyKzXYQG9OOtsEnAAWD7ZOTM/VLqNS0d6J1v46aRzPL5lJax2HND
   dy0SiuzckhM3tIDE4asM/0CHKRQMVXHHoCk0NhvGCIDMCAPjspxAhpGPZ
   VG3ILzgSNi/qGex7Sw7XQBLY+5b+sLP8xkJWFjWhAKLUOA8x2o7XQSXbd
   RZd1+QRhyJA3ZX7kCVDbym6OSH1DYVaYxPDB3ri0rw09rjU+LGolfOdHZ
   Q==;
X-CSE-ConnectionGUID: 2RXzyA9uT2aG78T081NsyQ==
X-CSE-MsgGUID: FI2buCTATkq0pdCak7kRbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37066429"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="37066429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 18:05:54 -0800
X-CSE-ConnectionGUID: aKOa1N6SRLyvvWgRCzZ/bQ==
X-CSE-MsgGUID: ip/QihofQ4G3rggZpsqyLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="104021473"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jan 2025 18:05:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWnMK-000LRV-2x;
	Sun, 12 Jan 2025 02:05:48 +0000
Date: Sun, 12 Jan 2025 10:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 111/504] kismet: WARNING: unmet direct
 dependencies detected for PTP_1588_CLOCK when selected by XILINX_TSN_PTP
Message-ID: <202501121204.sGR2ZrGn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 79569a88d904a3efdb6a5f054e40344b688ed82e [111/504] staging: net: xilinx: add Xilinx TSN driver
config: nios2-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_XILINX_TSN_PTP-0-0 (https://download.01.org/0day-ci/archive/20250112/202501121204.sGR2ZrGn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121204.sGR2ZrGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121204.sGR2ZrGn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by XILINX_TSN_PTP
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - XILINX_TSN_PTP [=y] && STAGING [=y] && NET_VENDOR_XILINX [=y] && XILINX_TSN [=y]
     - XILINX_TSN_QBV [=y] && STAGING [=y] && NET_VENDOR_XILINX [=y] && XILINX_TSN_PTP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
