Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964875914F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635845; cv=none; b=pO5g6F0Q0DSOh7KNONUPhqOdFgpRpmDyd/ZZUuHWKCKMBa1+onhK6nI+cg/xHhxkjsGYYapYMNfBPXD9r8thXpkQZGLBttuud17Y28jrfI0x4zh6b919tuo8TTMUZVNkEvAwoP/6KY4AxA30/WfDJyGdbPoDWYSNzkxdnz2rDYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635845; c=relaxed/simple;
	bh=6tE8HtyfAZht/6VpAR5/I1qyP5LlMNtaDjd7MEsCwLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SocWqdxjE1WAqwpyOEjDjA49OppuNsXnBFpFYT2V0DpQclfkZ2HSAszpzLQ3nKLohpOd/mZLidufYy+WVxxWkNIVcCBF8qOM+v7heQOI8U3HP/6wfXkzrRggCgalWxoovYb7fAFv/URPmRduqzbdjDCWDaqQ9Pw9VRXkGDxwm2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyWAM3sQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyWAM3sQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709635844; x=1741171844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6tE8HtyfAZht/6VpAR5/I1qyP5LlMNtaDjd7MEsCwLA=;
  b=MyWAM3sQrqkxNzNgqxw+/1TAkdvRmmR93gn/4k7DqE/N+KaE6VoF4fLG
   bEc5v6GRcAfMt5vlKp1RnMolT2bd8MEK2lgea50dK2QLiWqga6L64hLqr
   04Yac1dxWo6nbpPnpYK0RClRGi6vXD1jrJaU/48HtuaWi7cDKjNU3ufHl
   Q0bESdATArnzXAOZJ9eS0j9CplVu9Yji8Vup9Z+DujPBMZvyloXxhCG6a
   IDBOjX5bPbJIlKJs6Dxt0srn6IA2mfkxiHzPQgakKDt+ydEkvEuAgSjXg
   ebG3uuSPNs2xzUz9yWSORO3bvcAD+0+U7M3ye+H2K2p01JsKt/FeYw1YT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4345510"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4345510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 02:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13824053"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2024 02:50:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhSNb-0003FV-0w;
	Tue, 05 Mar 2024 10:50:39 +0000
Date: Tue, 5 Mar 2024 18:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	David Bauer <mail@david-bauer.net>
Subject: [linux-next:master 10916/11963] pinctrl-aw9523.c:(.text+0x13a8):
 relocation truncated to fit: R_NIOS2_CALL26 against `__devm_regmap_init_i2c'
Message-ID: <202403051807.vgb2hT4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11afac187274a6177a7ac82997f8691c0f469e41
commit: bfa5aa367a8226004b548b13ff8409c3b356af68 [10916/11963] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20240305/202403051807.vgb2hT4I-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051807.vgb2hT4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051807.vgb2hT4I-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw9523_probe':
   pinctrl-aw9523.c:(.text+0x13a8): undefined reference to `__devm_regmap_init_i2c'
>> pinctrl-aw9523.c:(.text+0x13a8): relocation truncated to fit: R_NIOS2_CALL26 against `__devm_regmap_init_i2c'
   nios2-linux-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw9523_driver_init':
   pinctrl-aw9523.c:(.init.text+0x14): undefined reference to `i2c_register_driver'
>> pinctrl-aw9523.c:(.init.text+0x14): relocation truncated to fit: R_NIOS2_CALL26 against `i2c_register_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
