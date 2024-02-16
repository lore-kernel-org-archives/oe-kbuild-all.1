Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B0FC0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708065509; cv=none; b=N2cvqHyy+rgrnNXqMD7ZJSddwCso/ZSKjq2TMbW+18/blXGTsRmGWCUphgEhzZOIvyu8Rc/dqZ8HPSd/4wYip6dQrjKHXRGlnxub6Ty/+lJaeFKe60znbkf1pHgICNWlJ8ZYTztWBLOgMkcBpkDmK+NGORIg9PhR2WgLj+qbiwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708065509; c=relaxed/simple;
	bh=2TnTkVEQ6QunanVnWYKbzbxvJH1ZshrvFw1+Gbsx9z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FF3BQVJ1OlEYUAUGtsd2jOISHxfAuXi13tvoYhE1+RnRn+BalW59YLYZZAgZMRT4Dqt7GKBl+lM8iD6cGWJS6QquKK8d3tJDguE/7aJIvjQAUgbeiVF8rf22W50OW7BT8SHWqMeihh69JFcPdBmJspQmIBEhSlYkPV8x6VgPy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ/BLCN8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ/BLCN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708065508; x=1739601508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TnTkVEQ6QunanVnWYKbzbxvJH1ZshrvFw1+Gbsx9z8=;
  b=KQ/BLCN8VG0QG+w7jFVl3/HSpsDNslhGREXol4gppj7WQ1t4mEnbzTk6
   OHFZye0Qu13jKUwPJqWIZGEbJC94WSjbG+p3g48Fn6IHxYP5tMG0+7Rin
   Qf8lH3t/W2/KI95deM7JNi/l8bkHtEv9tXeRhbgEdl0vteJXQDuSlt4cK
   p7klVpGljxflv9QUWKGTSmMvOm2QOVy04IM7ysPyRehEXfzK/nWTgTwtt
   Ou5worMPEA5TUsrWlW5pMZJxQTMUV1bq+MxTlr7quS5ceTpzSAc8isW+v
   UPHry374IOB2ifnvbKk+CQdx9oKD+sZJ7NrD3lO3vHUy8JoT66OGHauCi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13588711"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="13588711"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 22:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="826535926"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="826535926"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Feb 2024 22:38:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rarra-000136-2D;
	Fri, 16 Feb 2024 06:38:22 +0000
Date: Fri, 16 Feb 2024 14:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [linux-next:master 2857/7658] ktd2801-backlight.c:undefined
 reference to `expresswire_write_u8'
Message-ID: <202402161410.IG9I4odj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d37e1e4c52bc60578969f391fb81f947c3e83118
commit: 66c76c1cd984c14660453dfa2118014817924375 [2857/7658] backlight: Add Kinetic KTD2801 backlight support
config: arm64-randconfig-r133-20240214 (https://download.01.org/0day-ci/archive/20240216/202402161410.IG9I4odj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402161410.IG9I4odj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161410.IG9I4odj-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/video/backlight/ktd2801-backlight.o: in function `ktd2801_update_status':
>> ktd2801-backlight.c:(.text+0xe4): undefined reference to `expresswire_write_u8'
>> ktd2801-backlight.c:(.text+0xe4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `expresswire_write_u8'
>> aarch64-linux-ld: ktd2801-backlight.c:(.text+0x118): undefined reference to `expresswire_power_off'
>> ktd2801-backlight.c:(.text+0x118): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `expresswire_power_off'
>> aarch64-linux-ld: ktd2801-backlight.c:(.text+0x16c): undefined reference to `expresswire_enable'
>> ktd2801-backlight.c:(.text+0x16c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `expresswire_enable'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
   Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
   Selected by [y]:
   - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
