Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D127B32C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 22:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782167750; cv=none; b=OS3UpV2shG2umBQzV5OKzpHffY0DySadcgI+pj+HaHdzX6Hjjnp7XDG8eTNCORwT5RIEXNI1KUPjWNAFY/MkEFpaAWTuxTk4HS+TGO/7QlmljLWpzsuOgVaxIhM5oY6Rj3q1axL4Vf3+YEBYQShRuN6Drr4kSGZNXsvgWylm3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782167750; c=relaxed/simple;
	bh=jF8NFtgVoJxHz2YVgAfg4BZv1D763C/dJ7GJ6NQ0nPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VIGMncUoOymV9rh63p5xtwI9TtVEKsCSoYZ10bQ1hdZ6k2o/X5tYW7G2cZQ7F5FmUtfziC8PideVXWUvqs6uznQACYGsXuPaR+vVEq3WqJpsL41+VgnFKsJZ8vASESbjI8dhHbIL2qtSyBi8HTERV1tyJYLuyQJNeHQfa5eC2ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfvbSmAJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfvbSmAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782167749; x=1813703749;
  h=date:from:to:cc:subject:message-id;
  bh=jF8NFtgVoJxHz2YVgAfg4BZv1D763C/dJ7GJ6NQ0nPw=;
  b=JfvbSmAJjGYwy5sp3LElQOy5z5vzW2BnbzDVyiWwo49cFXybXIlnkWZV
   Zbzt7gCV4exN+ghcDTHyiXEmhs7qAxbGJT3v8+iorVyOTaUj2uqUMAyP4
   04B7xFD55u3ddyka/Mr048S4ym4civ+UlryR+LyQLNZ3rVbbdnZgJ1inZ
   F4JMP9yx3MzIp40PRfDanGHMr1JqKWSMl2ADlbRsxw6UwELJM/ueCxE/z
   tMHpvUcAhpTGnJ5dWvQeQesa+uQiryvFqFRiW3me+6aY6kT9CKammLE1T
   WV/MGIPzbiPxroNjgpxpRb5cMYG6Vd7ITFTrQBGpFcvvYnnduH5JhPLFK
   g==;
X-CSE-ConnectionGUID: neUGkDYzQUq06rmqBfToCQ==
X-CSE-MsgGUID: r5DtlrtRREyUKMsk1T8VTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86595823"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="86595823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:35:48 -0700
X-CSE-ConnectionGUID: Asm/XDzCSkqwaG831LlSCg==
X-CSE-MsgGUID: k15y20F0T+uVsehAzIhjMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="247006078"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jun 2026 15:35:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbnEz-0000000021i-0JfK;
	Mon, 22 Jun 2026 22:35:42 +0000
Date: Tue, 23 Jun 2026 06:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: YoungSoo Shin <shinys000114@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.1.y 64/64]
 drivers/video/fbdev/sh1106fb.c:20:10: fatal error: linux/of_gpio.h: No such
 file or directory
Message-ID: <202606230619.nDNwa1S0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.1.y
head:   dbb4f6bd9fe8a1786673783249095632aff93442
commit: 5c91927d862c0529165cdba04283fa5ab793215a [64/64] ODROID-COMMON: fbdev: add support for Sino Wealth SH1106 OLED controller
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230619.nDNwa1S0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230619.nDNwa1S0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230619.nDNwa1S0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/sh1106fb.c:20:10: fatal error: linux/of_gpio.h: No such file or directory
      20 | #include <linux/of_gpio.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/video/fbdev/sh1106fb.c

  > 20	#include <linux/of_gpio.h>
    21	#include <linux/uaccess.h>
    22	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
