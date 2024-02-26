Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076DCEAC2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 02:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708915639; cv=none; b=cyUdPJTrb5wC1K2N1Hnm/0Q8uZ09yKcSjnhhnmNXnmbPf6zgfpO0/I9V531ePGEugga9vnrh8YkHVUbRWMYh7kNilm4odDC8lUumpq0FnoNumTu09OxEi+68SAPQYQw+4mMoeM0H3bzRfhn5F7oKJli9wDW2w9w0zRLoPUVNJyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708915639; c=relaxed/simple;
	bh=by4mG/oI3NKUpXrkJs4RPzf1c/bYf7kDPNdpYzAoTuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDmGq5tKShZhY0DjG+C6QKDaiojIjbJbVt/HIoCMSUgThplbWiY1Q+Lgl9AXuoIQ+yHC35ShNhUpH4h3qjFnhK6HYKpRncFHtDZvkyiuV9g3/Hjdp/0EazlnY/kMJyvP+bTrEx6mKYBTv3Jn6O6HIGe5BINtckUGtdS5uhz0wQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CF/jMRWy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CF/jMRWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708915637; x=1740451637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=by4mG/oI3NKUpXrkJs4RPzf1c/bYf7kDPNdpYzAoTuY=;
  b=CF/jMRWyWAMavqPXwB/8EpiYGYK8+JJVNlc0W5Bfb/qmfuWKJhiW/rf1
   023TLlzaVagKPEsV22rtkgBVApof+hkpi9oolyfCcOR/W+cNo/eilo9FK
   6s7ayaiApMFcOfQrD0swYQm1Qxiy582vVnpnPOGJOuVO5BGrN93ADVhal
   EX1+C7m2dCejGICtLEZVfXTpvwSuuUyULg4st/SW4ymB4XYRo263URkUL
   DHhzgZUKCMDEORcMoIgg1PaCabDEgalJaUDqynj35tt4nVdLOQP+uPrrV
   39ZLZ5mGQrFuErepJh8rKrFVOY4neTLdjqJ9D5dkSCHPf4jSFKcWMyzvE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="25653732"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="25653732"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 18:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6508743"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Feb 2024 18:47:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reR1G-000A0j-2u;
	Mon, 26 Feb 2024 02:47:11 +0000
Date: Mon, 26 Feb 2024 10:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [linux-next:master 2856/9575] undefined reference to
 `expresswire_power_off'
Message-ID: <202402261051.led61Qav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33e1d31873f87d119e5120b88cd350efa68ef276
commit: 66c76c1cd984c14660453dfa2118014817924375 [2856/9575] backlight: Add Kinetic KTD2801 backlight support
config: microblaze-randconfig-r133-20240225 (https://download.01.org/0day-ci/archive/20240226/202402261051.led61Qav-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240226/202402261051.led61Qav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261051.led61Qav-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/video/backlight/ktd2801-backlight.o: in function `ktd2801_update_status':
>> (.text+0x40): undefined reference to `expresswire_power_off'
>> microblaze-linux-ld: (.text+0x54): undefined reference to `expresswire_enable'
>> microblaze-linux-ld: (.text+0x6c): undefined reference to `expresswire_write_u8'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
   Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
   Selected by [y]:
   - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
