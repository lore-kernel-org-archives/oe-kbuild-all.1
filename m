Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD2BE565
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708745282; cv=none; b=OcDacDHVvAiZmOqQjoylESn6LwV5auT94NgDFz9/bIiA4QB8JxzbqxAm5A2BSlaa12HmeaF3VHbCGhrSUP9xdazQUnCzXDClUTtiOZ7C3j14xM62VVuzlI8feMV+VjtQEWC0gvjperck3ou4riDOVvJB+5uZHjK0FXVsa+ZUyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708745282; c=relaxed/simple;
	bh=ufNyU4w1r4m1aw1HjscxyVtj9td+hJh0SFrkSngpELc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oH0acrriR1LUkzjttBYTMK/A20JsGexaorcGzADnPnJZg0+e6mXdkhnu7ZmRRGZ+1IzprPWHpnb/CqHx0TU2/3wSN8WnOF74oLTrGtJ7Y85hdd6gJpkq/KCot9FiPnqCutWgpVYl7rQyC4lWHzOIMzdiX/tHIL5TfoJHfIAhXaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Chw3tggf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Chw3tggf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708745281; x=1740281281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufNyU4w1r4m1aw1HjscxyVtj9td+hJh0SFrkSngpELc=;
  b=Chw3tggfjHYVCRGx2NoUiqG7qNEhKKFx/u+FSVshAu63YlAJHopQIsaa
   aFPCugGD7TjyKSBlakHML5G5Wz3XEePWi5qaE+px1orfzVoUHr+TIgK+3
   b2F1ZYrlq/mELOleWQY5RGWHydRUjyHkzIz4clJWNkiIKXrYC1qjyaQc4
   nwP7tA2X60pTZZeYIRj6koc2onPl+oFC3TzbpbwDyshSePmmm8dFpI+5o
   TOQlHBBNeo15wXStDjYCp1brAvU4I47XDe+0Nat8XjFaAK5VLkcKtyDEG
   FLc3kp8od3+ZnGGf4v1rR8wQRqZmv7UKSzw/mx62lqB+BLtsZERHEb6aZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6904770"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6904770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 19:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10810089"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Feb 2024 19:28:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdihX-00089u-2F;
	Sat, 24 Feb 2024 03:27:57 +0000
Date: Sat, 24 Feb 2024 11:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm32-cfi 8/8] ERROR: modpost: vmlinux: local
 symbol '__cpu_clear_user_highpage' was exported
Message-ID: <202402241116.V4J849RD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-cfi
head:   2b0074bb71d631d2a003e080f7b8c216b2ce63d4
commit: 2b0074bb71d631d2a003e080f7b8c216b2ce63d4 [8/8] ARM: page: Turn highpage accesses into static inlines
config: arm-am200epdkit_defconfig (https://download.01.org/0day-ci/archive/20240224/202402241116.V4J849RD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241116.V4J849RD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241116.V4J849RD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> ERROR: modpost: vmlinux: local symbol '__cpu_clear_user_highpage' was exported
>> ERROR: modpost: vmlinux: local symbol '__cpu_copy_user_highpage' was exported
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/vfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/scsi_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ethernet/smsc/smc91x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_ether.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm_subset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_rndis.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
