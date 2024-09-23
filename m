Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6745619E99C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727110181; cv=none; b=V5sGcZODDBF/+FEl2JMSgCcWm+ZKgs1dJ3IdZQ5sld7oxQ8LybUpdK7nYGR5VAE0cnGr60x4AV8FTaeZk1uQDA9HSPXACiLIoCDbO/DkUOz8ehBpBMoAWe++AQfUK1WiTbBuRn4VMiDyULl6Vhnr3jDn1mDNSJEUfZXBCkNjvl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727110181; c=relaxed/simple;
	bh=+o5IQJOXepwmK79KMJgJr9wP9x2fBcZf3rx8cN/vBg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HcE3s5pAHFlAvhY0g4Gu2O9PZp+2FyCqfeSQxDRosiunlqsI2NrqcBSxzx9tpb2PFNvtCDMgsnFMT8MApcFmBcff4Xt0y8qxD2DiKUkc8Z6Bu12YBEQbzoS11pzZQa7LcANMncAE06HSqcSfK7QtOWhBQBZ+92FjRVQ+m5sF06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCS+sEQe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCS+sEQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727110179; x=1758646179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+o5IQJOXepwmK79KMJgJr9wP9x2fBcZf3rx8cN/vBg4=;
  b=MCS+sEQenA0KWuaxs1Dxv1JM0IjOcZEpo9bsZuy+PKoOtXyXC5RfjoAm
   PZaCqoe20nmKjxoL8MH9EFLNvR6pTGCICNJAICkx5k2YkG9tf4+rZ5iq2
   DzcZUPjQiND0LQNsJh88/n4SyxeRY4uMCinO+NzN2aaQ+AsWUTA2eeug3
   qKOIz946mDGMhU3zofCgvY9JDy3Qq2IfRFDBEfwKC4wdAPJ09QNNf4/Os
   MYKmu5CfeuizXUj2kF8wEVi1SIKKAhNgPang+zEl9X2o2ZmYoiGUUCHco
   EYkmZvwBj9tkEYqeJhi2dQP775wnYh+xTVWGt6DkGUmR20/7ICgGubXEw
   g==;
X-CSE-ConnectionGUID: 8tu1qrO0TUaWb76Gzfc7dA==
X-CSE-MsgGUID: OTLUATeFRcW8OKsJqToGZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43587025"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="43587025"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 09:49:37 -0700
X-CSE-ConnectionGUID: QquEjcQ/RCCdZTuZDKnkPw==
X-CSE-MsgGUID: U7WJFat2R9+C7l8Vr8CIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="70708269"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2024 09:49:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssmFh-000HQq-15;
	Mon, 23 Sep 2024 16:49:33 +0000
Date: Tue, 24 Sep 2024 00:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 6/13] WARNING: modpost: "__ndelay"
 [drivers/mtd/nand/spi/spinand.ko] has no CRC!
Message-ID: <202409240048.YVVS5ZuC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   7866eaeb3c1ddb52b976c3e4140cdfbba28a74f3
commit: b330991759e4d4db58ee791f91601004ae99310d [6/13] mtd: spinand: Add late_init for W25N01JW and W35N01JW
config: sparc-randconfig-002-20240922 (https://download.01.org/0day-ci/archive/20240924/202409240048.YVVS5ZuC-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240048.YVVS5ZuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240048.YVVS5ZuC-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: drivers/hwmon/smsc47m1: section mismatch in reference: smsc47m1_driver+0x4 (section: .data) -> smsc47m1_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/soc-topology-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/snd-acp-config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: EXPORT symbol "empty_zero_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "empty_zero_page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__udelay" [vmlinux] version generation failed, symbol will not be versioned.
Is "__udelay" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__ndelay" [vmlinux] version generation failed, symbol will not be versioned.
Is "__ndelay" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__ashldi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__ashldi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__ashrdi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__ashrdi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bzero_1page" [vmlinux] version generation failed, symbol will not be versioned.
Is "bzero_1page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__copy_1page" [vmlinux] version generation failed, symbol will not be versioned.
Is "__copy_1page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__divdi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__divdi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "___rw_read_enter" [vmlinux] version generation failed, symbol will not be versioned.
Is "___rw_read_enter" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "___rw_read_exit" [vmlinux] version generation failed, symbol will not be versioned.
Is "___rw_read_exit" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "___rw_read_try" [vmlinux] version generation failed, symbol will not be versioned.
Is "___rw_read_try" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "___rw_write_enter" [vmlinux] version generation failed, symbol will not be versioned.
Is "___rw_write_enter" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__lshrdi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__lshrdi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__muldi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__muldi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "__udelay" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/rcu/rcuscale.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "empty_zero_page" [lib/crypto/libchacha20poly1305.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/broadcom/phy-bcm-kona-usb2.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/phy/cadence/phy-cadence-torrent.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/video/backlight/ktd253-backlight.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/s1d13xxxfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/ipmi/ipmi_si.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/block/floppy.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/misc/eeprom/eeprom_93cx6.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/misc/eeprom/eeprom_93xx46.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/misc/eeprom/eeprom_93xx46.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/misc/c2port/core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mfd/atmel-hlcdc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/scsi/esp_scsi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/scsi/sun_esp.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/scsi/qlogicpti.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/scsi/sd_mod.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spi/spi-loopback-test.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/sbus/char/uctrl.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ehci-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ehci-platform.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/sl811-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ehci-fsl.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/serial/keyspan.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/musb/musb_hdrc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/chipidea/ci_hdrc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/chipidea/ci_hdrc_msm.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/chipidea/ci_hdrc_tegra.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/m66592-udc.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/usb/gadget/udc/m66592-udc.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/usb/gadget/udc/r8a66597-udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/r8a66597-udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/bdc/bdc.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/usb/gadget/function/usb_f_mass_storage.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/usb/gadget/function/usb_f_mass_storage.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/serio/apbps2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/keyboard/matrix_keypad.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/analog.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/sidewinder.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/touchscreen/ads7846.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-ds2404.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-rs5c348.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/rc/gpio-ir-tx.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/media/rc/gpio-ir-tx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/watchdog/pcwd_usb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/watchdog/rave-sp-wdt.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-cadence.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/ufs/core/ufshcd-core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/flash/leds-ktd2692.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/flash/leds-rt8515.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/comedi/drivers/cb_das16_cs.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/comedi/drivers/ni_daq_700.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/comedi/drivers/ni_labpc_common.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/fsi/fsi-master-aspeed.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/fsi/fsi-master-gpio.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/fsi/fsi-master-gpio.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_util.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_cmdset_0002.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_cmdset_0001.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/lpddr/qinfo_probe.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/lpddr/lpddr_cmds.ko] has no CRC!
>> WARNING: modpost: "__ndelay" [drivers/mtd/nand/spi/spinand.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/tests/mtd_nandbiterrs.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/pcmcia/pcmcia_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/w1/wire.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/hwmon/sht15.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/bcma/bcma.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mux/mux-core.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/siox/siox-bus-gpio.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/core/snd-timer.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [sound/core/seq/snd-seq.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-aw8738.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-cs4271.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-dmic.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-peb2466.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-tlv320aic32x4.ko] has no CRC!
WARNING: modpost: "__ndelay" [sound/soc/codecs/snd-soc-tlv320aic32x4.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-tlv320aic3x.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-wm8510.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-wm8711.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/amd/acp_audio_dma.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/fsl/snd-soc-fsl-xcvr.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
