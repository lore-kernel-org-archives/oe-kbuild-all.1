Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025138FA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 21:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713304456; cv=none; b=Ioz6LLCM3b2ZSyUtXkwGokBwiOGd4Mauvs8sKxOlMf4rQv4Afhk1W6xh1CVjoaTI04Ov95sLUztfmFIM4HaBSRPceX5hAo2TkX+b/k5kffmkGDKSuBXvTgXJRLGRAToVQBxckVRkU5gKwxhkY72mJzGhO/EB76Eics+Jij+YaYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713304456; c=relaxed/simple;
	bh=lMXX68PlnrQWtNDaa1qELzE4AUTgOK7Ys/OnwwQPGCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPWcI9jgeoXrKQ4lfovQrrgOHJS86EEjosAwyahr0xzsQ8A8yPViZuHPEuBYObs9LT2x0Kvwi4QFRcT9AOZl6GKKw9fT6JgEhYHSErkMmZDCLc4wRpOYYEuOs+diU1apAwsI8NWQpUmAxeV4DPiVCKXgcJgRlLvvcZpLMohEJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2QFlG1n; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2QFlG1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713304454; x=1744840454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lMXX68PlnrQWtNDaa1qELzE4AUTgOK7Ys/OnwwQPGCA=;
  b=e2QFlG1nlCHTm6lxPYY50AcItvOijOe7KUptGxiHt+5tni+c70C+kl+q
   a8qqSQ6A9b+zNkJ1N2AE2Soqk8tiQ5AKkod4DRkHfkqc5KOKNIBCo4ucr
   G2yvCY5r1kWZnpD7iJ8vCeBdTfU3xkhqTsQXFGlxpc/G1Vi+xrQP4UJoz
   b1qrvc+rSSQdYweP6r9XX6u86ZzMTdfWZ8Vgu0Fh/2J62evUZ+TNwP9jJ
   e8IT0xndYE7WlvAs+ADz+gwMwwrN2SCTlf+mIde6Ye9K7yDPxERbVANrj
   Sx2jmbDUPfMyeIu3G8dHKE53UwcL1wadhXLEbBzxlvNFwLcMFPHRBGTsi
   A==;
X-CSE-ConnectionGUID: 17wZRxpwQc6cWgueqJeo2w==
X-CSE-MsgGUID: +LW1tpTqQS2O9zIssLImCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19377137"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="19377137"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 14:54:13 -0700
X-CSE-ConnectionGUID: 5a5ai5ohSMmDXKOzNZusnw==
X-CSE-MsgGUID: 6avd6HSXSl6R2DPtGm8FvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="27196855"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Apr 2024 14:54:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwqkk-0005m4-09;
	Tue, 16 Apr 2024 21:54:10 +0000
Date: Wed, 17 Apr 2024 05:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5790/6520] ERROR: modpost: "page_pool_create"
 [drivers/net/netdevsim/netdevsim.ko] undefined!
Message-ID: <202404170527.LIAPSyMB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66e4190e92ce0e4a50b2f6be0e5f5b2e47e072f4
commit: 1580cbcbfe770b0a7fb76735c1a601483335c1c2 [5790/6520] net: netdevsim: add some fake page pool use
config: microblaze-randconfig-r033-20220130 (https://download.01.org/0day-ci/archive/20240417/202404170527.LIAPSyMB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170527.LIAPSyMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170527.LIAPSyMB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp874.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-13.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_skcipher.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libchacha.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/8250_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/serial_mctrl_gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ttyprintk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/omap-rng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/omap3-rom-rng.o
WARNING: modpost: drivers/char/hw_random/mxc-rnga: section mismatch in reference: mxc_rnga_driver+0x8 (section: .data) -> mxc_rnga_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-sccb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/yurex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ccgx-ucsi.o
WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in reference: et8ek8_i2c_driver+0x8 (section: .data) -> et8ek8_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/dvb-usb/dvb-usb-dibusb-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/dvb-usb/dvb-usb-dibusb-mc-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_sd8787.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-kbd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-dj.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-hidpp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ntrig.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-retrode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelseries.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-uclogic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
>> ERROR: modpost: "page_pool_create" [drivers/net/netdevsim/netdevsim.ko] undefined!
>> ERROR: modpost: "page_pool_alloc_pages" [drivers/net/netdevsim/netdevsim.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
