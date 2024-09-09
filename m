Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838A318D643
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 22:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725922607; cv=none; b=OAGnGtnh1Qapz5FW5ckpntoInOZk8aryGZCYN7haDh+WY3HMx8U4Dngxkj6cyR0Xj0Rb4VqjB5tmL+xkElqbz8Bf3OzVAd8/mrYYF2VO7Xx0XhyRsRqvxSQNixShevfzrp7+4IvBvGyOd+/FvwkF5GSzRUbLnOOa7BT23gAeJ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725922607; c=relaxed/simple;
	bh=iq5dAr/fWtkbmrgEF0k/fapEoNptu94iXxEzk0NHUjw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ubgyjcAhTpwUvNSMX7gqsyRFHWRmUH5t+XO2xWaeRfIefUMzzHKsD4HqLVW88EKqFaGNHiK8D1pIQs93E/siFkmwmuKdepsGy7SX4t7bDUHFQ7zph0LCJu8FhIl6nu9KP+T7hpqtA8xe0B+az/t4Qs14bcOmBM7kMAQvBdcQyjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfkpAyEX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfkpAyEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725922606; x=1757458606;
  h=date:from:cc:subject:message-id:mime-version;
  bh=iq5dAr/fWtkbmrgEF0k/fapEoNptu94iXxEzk0NHUjw=;
  b=mfkpAyEXKn4po5VHQ6PVja7LrDxjnPYen022ybYYAR0yAf0NDAniCmww
   vR47JF318X7TEG62f7YM6CEJGlAc/XINXlW+k6PwhcDt7lXSeGsoWomIQ
   lNKfiLr2d5Vm+U/Wo0k5itfT7yo96ySQbH2w++CeJQWCTO3wByLexr3xZ
   TpprpCk3crPV5baCFgISDcrCxScZqbqB+eiKKiJ4QTM23jM2AMbwkZKVS
   mbYt2b/OU1rM3O9rA301ahE5YsnhCZRl2M3AOcu0IOeKKhN0YWL7drVx1
   vNgJVjjjXTq5rVWUIxsGsaWl9AOhUyGOzQpMFBsv6PWYC5tGlsPseVdig
   g==;
X-CSE-ConnectionGUID: NfYyJdkIQyCgmiDJvClgKQ==
X-CSE-MsgGUID: ZzTGhT55SJyPhLrrAt1Dzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24145054"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24145054"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 15:56:43 -0700
X-CSE-ConnectionGUID: 4ypdYWkxTseOlthUTDMamQ==
X-CSE-MsgGUID: yDapMIK9RQqRgjpkz+/brw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67077146"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 15:56:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snnJH-000FJY-0C;
	Mon, 09 Sep 2024 22:56:39 +0000
Date: Tue, 10 Sep 2024 06:56:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 54/339] WARNING: modpost: "__udelay"
 [drivers/usb/typec/tipd/tps6598x.ko] has no CRC!
Message-ID: <202409100635.az04501c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   85d46cfcef8242e37cbd99a6591cab2b90d0d8ed
commit: a7d6403b0558d64e1a481d38ac336eb0f676d975 [54/339] USB: typec: tsp6598x: Add cmd timeout and response delay
config: sparc-randconfig-002-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100635.az04501c-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100635.az04501c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100635.az04501c-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "__lshrdi3" [fs/xfs/xfs.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [fs/xfs/xfs.ko] has no CRC!
WARNING: modpost: "__ashldi3" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "empty_zero_page" [security/keys/encrypted-keys/encrypted-keys.ko] has no CRC!
WARNING: modpost: "__ashldi3" [crypto/ecc.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [crypto/ecc.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [block/t10-pi.ko] has no CRC!
WARNING: modpost: "__ndelay" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "__udelay" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "__ashldi3" [lib/xz/xz_dec.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [lib/xz/xz_dec.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/bus/mhi/host/mhi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/amlogic/phy-meson8b-usb2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/amlogic/phy-meson-gxl-usb2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/amlogic/phy-meson-axg-pcie.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/broadcom/phy-brcm-sata.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/broadcom/phy-bcm-sr-usb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/hisilicon/phy-hi3670-pcie.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/intel/phy-intel-keembay-emmc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/marvell/phy-armada38x-comphy.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/marvell/phy-mvebu-cp110-utmi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/marvell/phy-pxa-usb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/qualcomm/phy-qcom-sgmii-eth.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/phy/rockchip/phy-rockchip-snps-pcie3.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/pinctrl/bcm/pinctrl-bcm2835.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/gpio/gpio-aggregator.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/ipmi/ipmi_si.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/dma/mediatek/mtk-cqdma.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/dma/xilinx/xilinx_dpdma.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/dma/altera-msgdma.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/dma/dw/dw_dmac_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/dma/idma64.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/dma/tegra210-adma.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/dma/uniphier-xdmac.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/soc/mediatek/mtk-mutex.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/soc/qcom/qcom_rpmh.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/soc/samsung/exynos-usi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/pmdomain/amlogic/meson-ee-pwrc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/regulator/mt6359-regulator.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/regulator/qcom_spmi-regulator.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/samsung_tty.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/sh-sci.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/imx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/sc16is7xx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/mxs-auart.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/serial-tegra.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/ba431-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/mxc-rnga.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/ingenic-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/xgene-rng.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/char/hw_random/mtk-rng.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/char/xillybus/xillybus_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/misc/eeprom/eeprom_93xx46.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/misc/eeprom/eeprom_93xx46.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/misc/c2port/core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mfd/ssbi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mfd/acer-ec-a500.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/scsi/sd_mod.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/scsi/sd_mod.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/ata/ahci_imx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spi/spi-loopback-test.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/spi/spi-ath79.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spi/spi-bcm-qspi.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/spi/spi-bcm-qspi.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/spi/spi-bitbang.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spi/spi-davinci.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spi/spi-imx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spi/spi-orion.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/spi/spi-pic32.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spmi/spmi-mtk-pmif.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/auxdisplay/panel.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/auxdisplay/panel.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/auxdisplay/lcd2s.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/phy/phy-am335x-control.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/phy/phy-tegra-usb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/cdns3/cdns3-imx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/isp116x-hcd.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/usb/host/xhci-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/xhci-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/xhci-mtk-hcd.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/host/sl811-hcd.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/usb/c67x00/c67x00.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/renesas_usbhs/renesas_usbhs.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/usb/gadget/udc/m66592-udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/m66592-udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/renesas_usb3.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/renesas_usbf.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/mv_udc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/mv_u3d_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/udc-xilinx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/usb/gadget/udc/bdc/bdc.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/usb/gadget/function/usb_f_mass_storage.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/usb/gadget/function/usb_f_mass_storage.ko] has no CRC!
>> WARNING: modpost: "__udelay" [drivers/usb/typec/tipd/tps6598x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/serio/i8042.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/serio/apbps2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/as5011.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/analog.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/db9.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/gamecon.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/input/joystick/gf2k.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/input/joystick/gf2k.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/gf2k.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/input/joystick/sidewinder.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/sidewinder.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/touchscreen/ads7846.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/touchscreen/elants_i2c.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/touchscreen/ili210x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/touchscreen/ilitek_ts_i2c.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/input/touchscreen/pixcir_i2c_ts.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/rmi4/rmi_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-ds2404.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-msm6242.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-stmp3xxx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rtc/rtc-tegra.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/algos/i2c-algo-pca.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-digicolor.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-mt65xx.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/i2c/busses/i2c-mt65xx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-npcm7xx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-ocores.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/i2c/busses/i2c-pca-platform.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-pca-platform.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-pnx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/muxes/i2c-arb-gpio-challenge.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/muxes/i2c-mux-pca9541.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/muxes/i2c-mux-pca954x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i3c/master/i3c-master-cdns.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/w1/masters/ds2482.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/w1/masters/sgi_w1.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/power/supply/88pm860x_charger.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/power/supply/sc27xx_fuel_gauge.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/thermal/k3_j72xx_bandgap.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-s3c.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-milbeaut.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/renesas_sdhi_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sh_mmcif.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/moxart-mmc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-esdhc-imx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-tegra.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-of-esdhc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-iproc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-msm.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-omap.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/host/sdhci-xenon-driver.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mmc/core/pwrseq_emmc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-bd2802.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mailbox/hi3660-mailbox.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mailbox/mtk-cmdq-mailbox.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/extcon/extcon-fsa9480.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/nvmem/nvmem-vf610-ocotp.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/parport/parport.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/target/target_core_iblock.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/parsers/sharpslpart.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/mtd/chips/cfi_util.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_util.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/mtd/chips/cfi_cmdset_0020.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/chips/cfi_cmdset_0020.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_cmdset_0002.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/mtd/chips/cfi_cmdset_0002.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_cmdset_0001.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/mtd/chips/cfi_cmdset_0001.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/lpddr/qinfo_probe.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/lpddr/lpddr_cmds.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/mtd/lpddr/lpddr_cmds.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/mtd/devices/phram.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/mtd/nand/onenand/onenand.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/onenand/onenand.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/mtd/nand/onenand/onenand.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/mtd/nand/onenand/onenand_samsung.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/mtd.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/mtd_blkdevs.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/mtdoops.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/ubi/ubi.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/ubi/gluebi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/hwmon/ad7418.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/hwmon/hs3001.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/hwmon/lm93.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/hwmon/ltc2947-core.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [drivers/hwmon/ltc2947-core.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/hwmon/nct6775-core.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/hwmon/nct6775-core.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/hwmon/sht15.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/iio/accel/adxl345_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/accel/mma9551_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/ad7280a.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/ad7476.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/iio/adc/ad7793.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/iio/adc/ad7793.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/iio/adc/ad9467.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/ad9467.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/adi-axi-adc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/iio/adc/bcm_iproc_adc.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
