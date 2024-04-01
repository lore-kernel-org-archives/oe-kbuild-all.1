Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326197F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 00:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711930981; cv=none; b=ApD7oUm8j/8PgOkkmHz5sY0HcyK3/IDMCahC0jPBn/dGJRlIt/oMlAYYeVyADrLclEou8kZZsgs4fDV+lqOQF3bbE/iKSlqJt50F0rUJBiZTaBFb6zQ2COcBLipdsBZqRco2b7iXK0jADHrrRwApe3hrs53RY763xFILzYkyME0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711930981; c=relaxed/simple;
	bh=xJnjGwvI7gAs9TVFN9ARdcTuiWkRh75D950Qh7BZm0g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IZxFHbmhtLyh/BGWRneu55DVCykUGYeYBq1jqE4OOWQ9zlEilyuR8BSFe3OvZ/wPbJ3eoektevpSEqrSpPK9u7vcCBxgaMTfFdGrEoHEz7PzfB7e3x3jTgnKnJDAoS8hIe77Y0H9vl6n3V9qm7phC+oO31qdIEF/h35Vrc25cNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdDtjqQK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdDtjqQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711930979; x=1743466979;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xJnjGwvI7gAs9TVFN9ARdcTuiWkRh75D950Qh7BZm0g=;
  b=hdDtjqQK4114yaSVXhUqYPanWHtdhzx7DqY53UH50lUu2Ry5lmkLd7tK
   ccIKqxMXIPdE2AKuV2pCzZsFWI//pA9C5hBBiNnAln17IfOILRogefZKB
   fJfdfnzgwZvsuPD1nlWzvPCFX/f+AUOg5X/qzs+nNIEjdUWmzUw0SGt2R
   1c2dHp7Qi0BuE2s0CUzJChVTS9LzCURaEx2+VQ2bfz0o4vw9w065I5T7g
   eFNjSSg/Nw/IS+pYEO4ITechTem3HOPmRhzMDqQYDGeU3P0rg8UiC/lRW
   CtOQycZA8d4aEBC877iCl2RjHrXvWS6ptipUnZ5JlM3YBMk/gF5l3U6BI
   w==;
X-CSE-ConnectionGUID: GXx80GP0RuyB4M1DysjGVw==
X-CSE-MsgGUID: FN6+EwrASeC6XxooGFRFcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="17671111"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="17671111"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 17:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="22235144"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2024 17:22:57 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr5Ru-0001Vs-0r;
	Mon, 01 Apr 2024 00:22:54 +0000
Date: Mon, 1 Apr 2024 08:22:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 47/107] ERROR: modpost: "devm_clk_hw_register"
 [drivers/media/i2c/ds90ub953.ko] undefined!
Message-ID: <202404010821.sqzgpYjr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   01dbe4e64bacaa4c891c1997f2724c320698d61f
commit: d1a221d48b45bc73a80c3e86a028dfe60f8a34b2 [47/107] media: i2c: add DS90UB953 driver
config: sparc-randconfig-r121-20240326 (https://download.01.org/0day-ci/archive/20240401/202404010821.sqzgpYjr-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404010821.sqzgpYjr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010821.sqzgpYjr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux.o: section mismatch in reference: leon_pci_init (section: .text) -> pci_assign_unassigned_resources (section: .init.text)
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
WARNING: modpost: "__udelay" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "__ndelay" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/time/test_udelay.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/bus/mhi/host/mhi_pci_generic.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/amlogic/phy-meson8b-usb2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/amlogic/phy-meson-gxl-usb2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/amlogic/phy-meson-axg-pcie.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/hisilicon/phy-histb-combphy.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/marvell/phy-mvebu-cp110-utmi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/marvell/phy-pxa-usb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/rockchip/phy-rockchip-inno-dsidphy.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/rockchip/phy-rockchip-pcie.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/rockchip/phy-rockchip-typec.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/pci/controller/pci-aardvark.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/pci/controller/pcie-brcmstb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rapidio/switches/idt_gen3.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rapidio/rio-scan.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/arcfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/cyber2000fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/neofb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/vt8623fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/w100fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/broadsheetfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/gxt4500.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/ssd1307fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/soc/qcom/qcom_rpmh.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/regulator/rk808-regulator.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/regulator/ti-abb-regulator.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/stm32-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/mtk-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/ks-sa-rng.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/misc/eeprom/eeprom_93cx6.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mfd/axp20x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mfd/atmel-hlcdc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/phy/phy-am335x-control.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/phy/phy-tegra-usb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/oxu210hp-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ohci-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ohci-s3c2410.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/ssb-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/pxa27x_udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/m66592-udc.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/usb/gadget/udc/m66592-udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/aspeed_udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/dwc2/dwc2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/renesas_usbhs/renesas_usbhs.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/keyboard/imx_keypad.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/db9.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/misc/cma3000_d0x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-r7301.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-stm32.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-v3020.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-amd8111.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-bcm-iproc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-eg20t.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-jz4780.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-pnx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-pxa.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-qup.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/i2c/busses/i2c-s3c2410.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-s3c2410.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-stm32f7-drv.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/muxes/i2c-mux-ltc4306.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/adp1653.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/adv7183.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/bt819.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/cx25840/cx25840.ko] has no CRC!
ERROR: modpost: "__clk_get_name" [drivers/media/i2c/ds90ub913.ko] undefined!
ERROR: modpost: "devm_clk_hw_register_fixed_factor" [drivers/media/i2c/ds90ub913.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/ds90ub913.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/ds90ub913.ko] undefined!
>> ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/ds90ub953.ko] undefined!
>> ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/ds90ub953.ko] undefined!
>> ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/ds90ub953.ko] undefined!
WARNING: modpost: "__udelay" [drivers/media/i2c/imx274.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/ks0127.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/mt9t112.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/mt9v032.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/ov6650.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/tc358743.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/vpx3220.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/i2c/vs6624.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/tuners/mt20xx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/tuners/mxl5007t.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/tuners/tuner-simple.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/tuners/tda18271.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/dvb-frontends/atbm8830.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/dvb-frontends/m88rs2000.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/dvb-frontends/si2168.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/dvb-frontends/stb6000.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/dvb-frontends/stv0299.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/dvb-frontends/stv6110.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/dvb-frontends/zl10353.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/media/dvb-core/dvb-core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/w1/masters/sgi_w1.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/power/supply/sc27xx_fuel_gauge.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/core/pwrseq_emmc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-s3c.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-milbeaut.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/alcor.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sh_mmcif.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/toshsd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/owl-mmc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/rtsx_pci_sdmmc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-esdhc-imx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-of-esdhc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-bcm-kona.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-iproc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-msm.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-bd2802.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-is31fl319x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/staging/iio/impedance-analyzer/ad5933.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/staging/emxx_udc/emxx_udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mailbox/mtk-cmdq-mailbox.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/extcon/extcon-fsa9480.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/nvmem/nvmem-mxs-ocotp.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/nvmem/nvmem_rockchip_efuse.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/fsi/fsi-master-gpio.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/fsi/fsi-master-gpio.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_util.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_cmdset_0002.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_cmdset_0001.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/mtd/nand/raw/nand.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/nand.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/nand/raw/nand.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/mtd/nand/raw/nand.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/nand/raw/diskonchip.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/diskonchip.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/mtd/nand/raw/diskonchip.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/mtd/nand/raw/fsmc_nand.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/mtd/nand/raw/nandsim.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/nand/raw/nandsim.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/nandsim.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/atmel/atmel-nand-controller.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/mtd/nand/raw/gpio.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/mtd/nand/raw/marvell_nand.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/marvell_nand.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/lpc32xx_slc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/sh_flctl.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/mxc_nand.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/raw/mtk_nand.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/ecc-mtk.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spmi/hisi-spmi-controller.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/vfio/platform/reset/vfio_platform_bcmflexrm.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/ssb/ssb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/bcma/bcma.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/accel/mma9551_core.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/iio/adc/ad7606.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/adi-axi-adc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/bcm_iproc_adc.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/iio/adc/hx711.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/imx8qxp-adc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/mt6577_auxadc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/nau7802.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/rcar-gyroadc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/sun4i-gpadc-iio.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/dac/ad5592r-base.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/dac/stm32-dac-core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/dac/stm32-dac.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/potentiometer/ad5272.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/pressure/dlhl60d.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/proximity/ping.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/proximity/srf04.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/thunderbolt/thunderbolt.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/thunderbolt/thunderbolt.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/usb/line6/snd-usb-line6.ko] has no CRC!
WARNING: modpost: "__udelay" [sound/sparc/snd-sun-dbri.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
