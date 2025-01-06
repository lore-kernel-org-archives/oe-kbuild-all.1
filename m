Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DE31E0E0A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 22:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736200836; cv=none; b=nsANrtEz+mYva798s/M3Bb9FSSqK5MIAPwXs4fg9c3qdTfh5QSgkgn5EnazNJs+zPA6/BrEcj70t0KICqSF9V3y9cVVjgc40kUqYjfb6DB4KnBUnmmAep9lQZbV+KsWtZGomqDFcvRF4zHaY83HZlYgJD0CRiA3B1h5L9PCwjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736200836; c=relaxed/simple;
	bh=NE4jy9th8qpanhgfKgz/vHQofGHYtXvU7J/OofoLDBg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RWd3f8pOqGqBQpXSBk1YjQlObfFMYki4mtppR9YLCtQ+JX4/VuQNil4YG/7CyXbZ0sGskNYKPSpaw2eFpzzxTU2ccL2yK9ssA2acF8L6pxj9J4lZWhcEs7Qy9RYid27ObfMOFC2E/vDg/lTu2JkfzoBsru2+iYcWj+7Q4d7GK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYVjenDY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYVjenDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736200832; x=1767736832;
  h=date:from:cc:subject:message-id:mime-version;
  bh=NE4jy9th8qpanhgfKgz/vHQofGHYtXvU7J/OofoLDBg=;
  b=VYVjenDYM2+U0Tk9o+vgqwTw+UU9QcfeVrhdbtwaiB7a+6lziGFkl1Fb
   kAv4Mu1x+5JZYE272PitomJYztcJ13NKHApCdviRxPsVja/7yE81cbW0f
   mxrEsWvN9i6kvAc1B8S3uHlDxfENV0YKinfl17eYhJhtm+4Aru0AV3Uzj
   v+HILSRuo6ZT1CQAiJ1ldbaKd2sXNBYhrNFqDgvVv9zaLSjLoti+U1nJN
   QTQ4+dyJwFhiB12uvdjW8H/PWGSOAMnzgezW6Or+6tJoCxGe9j0iVjZqP
   SDaDad6v6O7+YPnQF9Jujxcp9K/WfDW0yv8yiHcFvn0a7vQ1cq4XY+/6/
   A==;
X-CSE-ConnectionGUID: b8P0hYDgR4mOAQtE1dEFew==
X-CSE-MsgGUID: L34+Uqc3Qhe7H0J/o7l/qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47031258"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="47031258"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 14:00:28 -0800
X-CSE-ConnectionGUID: TW/OxkufQCG5Lr9d13JdBw==
X-CSE-MsgGUID: Qt3W/+1KTdC6qqKY+n6tew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102422824"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2025 14:00:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUv96-000Dy7-0K;
	Mon, 06 Jan 2025 22:00:24 +0000
Date: Tue, 7 Jan 2025 05:59:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] WARNING: modpost: "__udelay"
 [drivers/i2c/busses/i2c-designware-core.ko] has no CRC!
Message-ID: <202501070547.ulf6Ckd9-lkp@intel.com>
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
config: sparc-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20250107/202501070547.ulf6Ckd9-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070547.ulf6Ckd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070547.ulf6Ckd9-lkp@intel.com/

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
