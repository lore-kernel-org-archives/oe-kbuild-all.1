Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4550D14884C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736177303; cv=none; b=qCiyYZ/KZUnoFX5JV70pIolOmEvq1ZrUQuY1TBp2X3WygOTY1ZRPyU5dfs27kjY90/Ix/1rtK/MEgsZHBjKLuT2udzGYN8OUHiDexfn0ASxCN9UX8DELJHpBFGD9J1W4MdusoKBqLc39Ki/bZalhIkuKQi1gC9CLWXdm1ceKvps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736177303; c=relaxed/simple;
	bh=LxnCyfd49SzuDqRdXuGbTQmsIFvsToK2ZEzEj/M33nE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzqetIg8Txugj0v3jWDg7xKINKLpr0oFuypCGSk1wR5RpnpCtLahcXdAQShyjd3g3CcFpOzqSa9ndgVmA6fDYWmRCnhmrdxWS1EgLhNwXTh/Ab4jJp/qncCs37C0B/l7GZK3mtHMgt93zuQWv4JGOE0B8NLXa2UIlKSvy57Fh1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQIXL8u4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQIXL8u4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736177301; x=1767713301;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LxnCyfd49SzuDqRdXuGbTQmsIFvsToK2ZEzEj/M33nE=;
  b=cQIXL8u4anhNu4DyaFuPm3TdAi5FvVRxo1DXT15OvfpwF9vXoFWVgshP
   +tFqvQam5DvNlgwtYJm1OC4JUTTjTvRy5CQCkQjQSNr6zV4CXMDuA5Tme
   FPXvxUEhSZk9HCzb9zc2PJr0DGsKxcLqAAz/4xqN91Fq35p4us3Fps8vf
   IYM3V77WG2d+NF829+UWltz5V2uGsmU28r3tOLuEvVFWTM3/RXHeplkVm
   N8b9XrjgNbciEUk1q7z3ed4NAfx0Kqka0V83JtJgheeZMwz+xImZ5JzLT
   Y2ggmrI9KZLTAu92aSsJVUHg7G8sgNJfskejI/NqWvV2kH6NwedrtsasA
   g==;
X-CSE-ConnectionGUID: 28TlQHdATFKByZf/B4M/Qg==
X-CSE-MsgGUID: YNJUDNVEQzqAb1h3NsFFDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="23929450"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="23929450"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 07:28:19 -0800
X-CSE-ConnectionGUID: 3JXMw8rxQP24+AUDjKXuog==
X-CSE-MsgGUID: vp5kvzxRROu+pZbI5jKBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107102789"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jan 2025 07:28:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUp1c-000CrJ-24
	for oe-kbuild-all@lists.linux.dev;
	Mon, 06 Jan 2025 15:28:16 +0000
Date: Mon, 6 Jan 2025 23:27:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 3/3] WARNING: modpost: "__lshrdi3"
 [drivers/fsi/fsi-master-i2cr.ko] has no CRC!
Message-ID: <202501062350.83legcSH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eddie,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: 53e89e3e4490d6630a68e61a3cb478e7a7f2ce8b [3/3] fsi: Add IBM I2C Responder virtual FSI master
config: sparc-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20250106/202501062350.83legcSH-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062350.83legcSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062350.83legcSH-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

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
WARNING: modpost: "__udelay" [drivers/char/hw_random/omap-rng.ko] has no CRC!
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
>> WARNING: modpost: "__lshrdi3" [drivers/fsi/fsi-master-i2cr.ko] has no CRC!
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
WARNING: modpost: "__lshrdi3" [sound/pci/hda/snd-hda-codec-generic.ko] has no CRC!
WARNING: modpost: "__ashldi3" [sound/pci/hda/snd-hda-intel.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/hda/snd-hda-intel.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/ice1712/snd-ice1724.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/ice1712/snd-ice17xx-ak4xxx.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/korg1212/snd-korg1212.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/nm256/snd-nm256.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/oxygen/snd-oxygen-lib.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/pcxhr/snd-pcxhr.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/riptide/snd-riptide.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/rme9652/snd-rme9652.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/rme9652/snd-hdsp.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/trident/snd-trident.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/ymfpci/snd-ymfpci.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/pci/vx222/snd-vx222.ko] has no CRC!
WARNING: modpost: "__ashldi3" [sound/usb/snd-usb-audio.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/usb/snd-usb-audio.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [sound/usb/snd-usb-audio.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/usb/line6/snd-usb-line6.ko] has no CRC!
WARNING: modpost: "__ashldi3" [sound/firewire/snd-firewire-lib.ko] has no CRC!
WARNING: modpost: "__ashldi3" [sound/soc/snd-soc-core.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-adau1701.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-aw8738.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-cs35l41-lib.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-cs42l73.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-cs4265.ko] has no CRC!
WARNING: modpost: "__ndelay" [sound/soc/codecs/snd-soc-cs4270.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-cs4271.ko] has no CRC!
WARNING: modpost: "__ashldi3" [sound/soc/codecs/snd-soc-cs53l30.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-dmic.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-max98357a.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-nau8540.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/soc/codecs/snd-soc-nau8810.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
