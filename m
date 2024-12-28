Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA52744D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735412976; cv=none; b=SOkeHm2vgbiYudoiFsqpa1VsoG3+dbONKRcwiAu5OJYSMT+YHrRSiFijf1Ekl9wlidGSv1yHBZ6zOo5GXIvew/Z89Sw19g9O9R6HOBWK7HnLRfhfaENUHwDeyqWgWapDxRIFTqLgxyO5TqFRBJ4iCVg2widihlZCO4C+iD72oQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735412976; c=relaxed/simple;
	bh=+xPgxcCACcOoRpCkcv4+gSnhgu2x2dEalhfpZ/VOCR8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jghE5eru9I+qQeg6jFYlF+yzvP5/+C6LKwOrsBZYFubqU+q8nnBaLlSLbs2/OQcPaWcORByACGLQdZaCHCeuWBEu5vrA+/Fr92XxGRevy0fImkI/CoTu56QrwGvqoFVYgVIkoUXffy7pJtnHvfSi6BmYR++KjKU7f2UGbvBHvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OaRQUnC2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaRQUnC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735412973; x=1766948973;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+xPgxcCACcOoRpCkcv4+gSnhgu2x2dEalhfpZ/VOCR8=;
  b=OaRQUnC2JX3dxR9DmwwBZCBh7Xwk2mZ/7pHON3Akx8l3oSkxAJRmJXqq
   jde0UB6/3O+fW0aC0tlyZC05w2mykfLyg5Mwwt6dUvEq5OFcCaUaBHReJ
   tMhuXBNsYzCkv3rEaOExTb31asbNRXt5IvIc3x3Lox4+4C5EtfMoIqxox
   x9G/AuOmcIBwhfVjv6S6SDpwJ1ojCk2Wgzr0i2Gahso67aAq4OFgAQxeY
   dWDiWg+67iD+4GGljzhwOVvtXP0iuuXdERCddUoEKbrq8JL5HBE2oZEi4
   WTMNf0mZFMA/uWb7N5FijP44FcNKnX2KAuj7oGi+ByFkbw/SlmaHsLwqN
   Q==;
X-CSE-ConnectionGUID: L/ftUK/cTxyCeFTE3UBxPg==
X-CSE-MsgGUID: ZLB9WdA8Q5GZIUQDqMF05Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39542240"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="39542240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 11:09:33 -0800
X-CSE-ConnectionGUID: gEjzbgLBSyi15XIWMjQ8MQ==
X-CSE-MsgGUID: 4gbqjIvORCCUzPnJ7uB53Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100901339"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Dec 2024 11:09:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRcBl-0004GS-29;
	Sat, 28 Dec 2024 19:09:29 +0000
Date: Sun, 29 Dec 2024 03:08:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] WARNING: modpost: "__udelay"
 [drivers/i2c/busses/i2c-designware-core.ko] has no CRC!
Message-ID: <202412290300.XEyFuDfI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kimriver,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: d6c159c066d2b092e33d13f3392fbc3146216937 [3/3] i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled
config: sparc-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241229/202412290300.XEyFuDfI-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290300.XEyFuDfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290300.XEyFuDfI-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

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
WARNING: modpost: "__udelay" [drivers/char/hw_random/intel-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/geode-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/omap-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/mxc-rnga.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/ingenic-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/xgene-rng.ko] has no CRC!
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
>> WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-designware-core.ko] has no CRC!
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
WARNING: modpost: "__lshrdi3" [drivers/fsi/fsi-master-i2cr.ko] has no CRC!
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
WARNING: modpost: "__udelay" [sound/pci/snd-atiixp-modem.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-cmipci.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-cs4281.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-ens1370.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-ens1371.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-fm801.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-intel8x0m.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-maestro3.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-sonicvibes.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/snd-via82xx-modem.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/ac97/snd-ac97-codec.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/au88x0/snd-au8810.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/au88x0/snd-au8820.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/au88x0/snd-au8830.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/ctxfi/snd-ctxfi.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/ca0106/snd-ca0106.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/cs46xx/snd-cs46xx.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/lola/snd-lola.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/lx6464es/snd-lx6464es.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-darla20.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-gina20.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-layla20.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-gina24.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-mona.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-mia.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-echo3g.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-indigo.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-indigoio.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-indigodj.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-indigoiox.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/echoaudio/snd-indigodjx.ko] has no CRC!
WARNING: modpost: "__ashldi3" [sound/pci/emu10k1/snd-emu10k1.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/emu10k1/snd-emu10k1.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/hda/snd-hda-codec.ko] has no CRC!
WARNING: modpost: "__ashldi3" [sound/pci/hda/snd-hda-codec-generic.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
