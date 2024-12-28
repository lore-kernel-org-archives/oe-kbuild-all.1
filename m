Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD2C1917F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735396794; cv=none; b=B33PX+W90dRG9t7g3qFWWy5kwIrVqW1uk+q3/RmSJ44kXbFcRv7A9VE0B7BSQfB5oGvtXUL/0BSusEB6RwPPN1X19I9I2L/fW4rh6eMTAUi4qmzQjPKJT0q2r8mpyWWR7fzqy4Z8yWzjZewkdJEad2BCyzkEQdc9VqMYK03yXg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735396794; c=relaxed/simple;
	bh=ueLld8QGpAgMYN11nDYOZhXLheCNXVmsBLqTYtBHP/M=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gz2o59oZinyPtKndN9dr4rARKgEu5VUb7ZiSHTOCvTvxhpg+ggQ0lrkL74VhxPsopunmOqwouv0CMMoVtjhn+Ul6RQ5Mx7ZWyRFOn8GRN9Mf+sPv7TxnZrrQtYWNAYQpXSv1M0f4s49sVeqv1gUoEEjf8B1cs2aUGYbg8BxkAKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iA6ztvkq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iA6ztvkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735396791; x=1766932791;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ueLld8QGpAgMYN11nDYOZhXLheCNXVmsBLqTYtBHP/M=;
  b=iA6ztvkqPuq3AHqB5f0VTOUE+jrEMISRqUh+PyMQhgpHNzuDtsji2IhI
   xXGY+ynhPF/EalOvhWnhP9Gt9sGaBJtzVnaVtF7jbzyFmUudb8OTLaDGO
   tQYplxDV5zEDVebkKGEZ/vwAAWd/J/EvfxlvUc3ZjYYj7Vn5RiFmZx+KE
   l0ZqQ3VUZ0/rerDKW5t3PRhzGUonY4nSanDl2/qos52A+5hHM4V12miH0
   OXgC9dwdkgw1O249/4NB+d9QnlP5kcnrWzNKwuVHQ+tzlJmjM3P6X6WfB
   FmMmuDCtVCdGdn7DA5Gi6t3u4HOM/tf5kHI6s2c3QyM78IjhqiYRDskK3
   w==;
X-CSE-ConnectionGUID: n2L5raa5SwW/3Ur7xm38iw==
X-CSE-MsgGUID: 1IWX5xe7S7C8HO0ac53/aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="53159631"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="53159631"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 06:39:51 -0800
X-CSE-ConnectionGUID: YovTv/UYQuKf/ku/bQsUCA==
X-CSE-MsgGUID: 6scAbVP6Tdq3uR8p5u1bvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104992675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Dec 2024 06:39:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRXyl-00047A-3D
	for oe-kbuild-all@lists.linux.dev;
	Sat, 28 Dec 2024 14:39:47 +0000
Date: Sat, 28 Dec 2024 22:39:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 3/3] WARNING: modpost: "__udelay"
 [drivers/char/hw_random/ingenic-rng.ko] has no CRC!
Message-ID: <202412282238.bGazcu64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: 1ce1cd8208ad6060e4fcf6e09068c8954687c127 [3/3] hwrng: Enable COMPILE_TEST for more drivers
config: sparc-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241228/202412282238.bGazcu64-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412282238.bGazcu64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412282238.bGazcu64-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ss_lb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_obex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_fs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_printer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/legacy/g_zero.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ccgx-ucsi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/twl4030_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/menz69_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfish/goldfish_pipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/snd-acp-config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
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
WARNING: modpost: "__udelay" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "__ndelay" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/scftorture.ko] has no CRC!
WARNING: modpost: "__ashldi3" [fs/quota/quota_v2.ko] has no CRC!
WARNING: modpost: "__ashldi3" [fs/quota/quota_tree.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [fs/quota/quota_tree.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "empty_zero_page" [lib/crypto/libchacha20poly1305.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [lib/test_scanf.ko] has no CRC!
WARNING: modpost: "__ndelay" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "__udelay" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "__ashldi3" [lib/zstd/zstd_compress.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [lib/zstd/zstd_compress.ko] has no CRC!
WARNING: modpost: "__ashldi3" [lib/zstd/zstd_decompress.ko] has no CRC!
WARNING: modpost: "__ashldi3" [lib/zstd/zstd_common.ko] has no CRC!
WARNING: modpost: "__ashldi3" [lib/xz/xz_dec.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [lib/xz/xz_dec.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [lib/asn1_encoder.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/broadcom/phy-bcm-kona-usb2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/samsung/phy-exynos5-usbdrd.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/gpio/gpio-latch.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/pci/controller/dwc/pci-meson.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rapidio/switches/idt_gen3.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/core/fb_ddc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/matrox/matroxfb_DAC1064.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/riva/rivafb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/aty/radeonfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/savage/savagefb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/neofb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/vt8623fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/sstfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/cirrusfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/s1d13xxxfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/gxt4500.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/mb862xx/mb862xxfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/ssd1307fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/8250/8250_dw.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/tty/serial/sccnxp.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/sc16is7xx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/jsm/jsm.ko] has no CRC!
>> WARNING: modpost: "__udelay" [drivers/char/hw_random/intel-rng.ko] has no CRC!
>> WARNING: modpost: "__udelay" [drivers/char/hw_random/geode-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/omap-rng.ko] has no CRC!
>> WARNING: modpost: "__udelay" [drivers/char/hw_random/mxc-rnga.ko] has no CRC!
>> WARNING: modpost: "__udelay" [drivers/char/hw_random/ingenic-rng.ko] has no CRC!
>> WARNING: modpost: "__udelay" [drivers/char/hw_random/xgene-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/stm32-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/ks-sa-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/misc/cardreader/rtsx_pci.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/misc/dw-xdata-pcie.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mfd/axp20x.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/firewire/firewire-ohci.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/firewire/firewire-ohci.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/firewire/firewire-ohci.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/sbus/char/uctrl.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/cdns3/cdns3-imx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ohci-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ehci-fsl.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ssb-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/dwc3/dwc3.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/dwc2/dwc2.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/usb/c67x00/c67x00.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/musb/musb_hdrc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/chipidea/ci_hdrc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/chipidea/ci_hdrc_msm.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/net2272.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/net2280.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/pxa27x_udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/goku_udc.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/usb/gadget/udc/m66592-udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/m66592-udc.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/usb/gadget/udc/r8a66597-udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/r8a66597-udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/pch_udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/mv_u3d_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/udc-xilinx.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/usb/gadget/function/u_audio.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/misc/adxl34x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-r7301.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-x1205.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/algos/i2c-algo-bit.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/algos/i2c-algo-pcf.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-gpio.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/muxes/i2c-arb-gpio-challenge.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/muxes/i2c-mux-pca954x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i3c/master/dw-i3c-master.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/hwmon/pmbus/pmbus_core.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/hwmon/pmbus/pmbus_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/hwmon/pmbus/max15301.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/hwmon/pmbus/ucd9000.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/hwmon/pmbus/zl6100.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/watchdog/pcwd_usb.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/watchdog/mena21_wdt.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/watchdog/da9063_wdt.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/watchdog/gpio_wdt.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/accessibility/speakup/speakup.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/alcor.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/cb710-mmc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/toshsd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/core/pwrseq_emmc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-bd2802.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-is31fl319x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/flash/leds-aat1290.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/flash/leds-ktd2692.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/flash/leds-rt8515.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/extcon/extcon-fsa9480.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/nau7802.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/iio/adc/nau7802.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/ti-ads7924.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/gyro/itg3200.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/pressure/dlhl60d.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/proximity/srf04.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/fsi/fsi-master-hub.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/fsi/fsi-master-aspeed.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spmi/hisi-spmi-controller.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/serio/i8042.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/serio/apbps2.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/w1/masters/ds2482.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/w1/masters/sgi_w1.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/w1/slaves/w1_ds28e17.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/w1/wire.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/w1/wire.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/w1/wire.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/bcma/bcma.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/ntb/hw/idt/ntb_hw_idt.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/ntb/hw/mscc/ntb_hw_switchtec.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/ntb/hw/mscc/ntb_hw_switchtec.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/ntb/test/ntb_pingpong.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/ntb/test/ntb_pingpong.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/ntb/test/ntb_tool.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/ntb/test/ntb_tool.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/ntb/test/ntb_perf.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/ntb/test/ntb_perf.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/ntb/ntb_transport.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/ntb/ntb_transport.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mux/mux-core.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/siox/siox-bus-gpio.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/core/snd-timer.ko] has no CRC!
WARNING: modpost: "__ashldi3" [sound/core/snd-pcm-dmaengine.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/i2c/other/snd-ak4114.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/i2c/other/snd-ak4113.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/i2c/other/snd-ak4xxx-adda.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/drivers/opl3/snd-opl3-lib.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/drivers/mpu401/snd-mpu401-uart.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/drivers/vx/snd-vx-lib.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-atiixp.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
