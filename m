Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25CE299501
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746044055; cv=none; b=DOdbnNKoRH56c64d0ZzIZKq9pO8TtNTas9FM88X9VyWhunKEx4biqvagtCZl/EO2DFA0XsJLb2Ee7oM1er6dJMmW8A2S5Fqxlx6ZuXo0rK63JUe4oTirvo+hb6YOa7Bd/heksEBE4iEJciNOZ/UGEgQ5I76I7kUjMRbt05U9+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746044055; c=relaxed/simple;
	bh=5gj89b4/HHVR+FSaIXJmjn44XXXoIDhnYr5LveVWdC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DnVHcpsmXb0Zkc5tsMKLhp/mayrvC6h0KYgsCiw5KXlve2qRls8D3DWsqLO3U5tvxrIHjM/bB9GTs1S8ipXDr82rdpzolQfpVx5R1vpbXO6mwcgD/OoS5pJDgyTKwPsultyUUW+xzppouxZpBwS7jz2iioQP46jrala1Bd39Pls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeC1CXv5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeC1CXv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746044054; x=1777580054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gj89b4/HHVR+FSaIXJmjn44XXXoIDhnYr5LveVWdC0=;
  b=JeC1CXv5d94/T3/eAVn6JcKx8ZM/lLVN0VhjOJiXo02dDnxWDRBGo5WS
   6uYXroPVge0uWTlRwWkqYyZnm372zKQrJMWL5LEqrLwRU6sEs4XEQO25K
   eCtRjDU9QuScVWPK6/eNr/hTEXQjGK3vofIdn3s9JdRairESNmODX5qi2
   zeFAjmnQWPrUrMsgi1VxBxCKtiCu2559QOC+GtRuywyssKzVQAZ6M05VC
   fVCZNsZ1klO6YNKclitftgkjsCdlcm5uA+XU3QsWASmb6HH4rOIZ7BShY
   mtHJ6xxxozzdPcEYP/cxwwcAptWTkS72U8mpKSSCpdoXj1eyKO56Njq5W
   A==;
X-CSE-ConnectionGUID: 2vSYmr0GR6COYStKy3ePGg==
X-CSE-MsgGUID: +IATg/zqQ3qdvXBGTFefgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="57917562"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="57917562"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 13:14:11 -0700
X-CSE-ConnectionGUID: Pgt2qBNXRiWIplQMG91mhQ==
X-CSE-MsgGUID: N/Q9WwcHQLOdJyJW4IBtZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="139393690"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2025 13:14:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uADok-0003kJ-2r;
	Wed, 30 Apr 2025 20:14:06 +0000
Date: Thu, 1 May 2025 04:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 7116/7638] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by PINCTRL_AT91
Message-ID: <202505010447.kUlI61vt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
commit: 8e86af65f39df6a8f1c1f033b90a5f7d5457ee7a [7116/7638] pinctrl: at91: allow building the module with COMPILE_TEST=y
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_PINCTRL_AT91-0-0 (https://download.01.org/0day-ci/archive/20250501/202505010447.kUlI61vt-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250501/202505010447.kUlI61vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010447.kUlI61vt-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by PINCTRL_AT91
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - PINCTRL_AT91 [=y] && PINCTRL [=y] && (OF [=n] && ARCH_AT91 || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
     Selected by [y]:
     - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
