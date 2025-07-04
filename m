Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8A515E5DC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 04:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751603830; cv=none; b=HuZQuuyK5okdsSKep/FJqOh/un7X/9IRTWwm2LKgnf78Z/Dh83rfUXtP7EIDhLg0PP6zWs0PDHHgiF2rARPafqWoGeT/RUIJZo5Ez9LuIRoTb7+AnqGG9NMJMMYTMWep/75U5NeQ9rpJKzb89XzMXiXsu4unYkJaVZUJHCXgiLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751603830; c=relaxed/simple;
	bh=R6NTFccffGawZDl1pAez0XRKWk/lYZkQT95w5kb0k74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwOhsxZDHvAJL9guSobG80IlUL0//aLEmDmZZgooRvqs2NOlFRR6+XwN4CIiXEmiq1JhjeQwljrdty4li0hL13cp7LH242OfcSKonjTUUB23rZoB6PQTyQY9csqKNWWnzncXIOoXcE7dwPoDlouXBAQyJ8zXzjerFPAjCp5bo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPr2vwuz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPr2vwuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751603828; x=1783139828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R6NTFccffGawZDl1pAez0XRKWk/lYZkQT95w5kb0k74=;
  b=HPr2vwuzKNYeo1fxIPps+wpCe1xgcuOLB/CFs5UKvfXSUZTLpoMvED5P
   AoCNZMQLYjuubfZlC8nBXQyVskzMXtZVgvg2CMYuGpzpN8sX+NOces5Fo
   LqImfbv7t7CIBuKAk1V43T2V7Xm+cWFedGwnF8hTm50h6tVsZmtaDYACt
   AjEhmpacbA4/PKopn99/i5fEUbe+I+IMs+b7BkBeBUyPKGPhxQG63PZHk
   DWGA2amkn6J+6LFzrjCuKbPbym++Pgj1HvZzhBXlejHbvQESAJGK9awNP
   Tk3tv9vVV15Fevlb9kaKYiwiT27E1GysaWZax0VAcCgE/LDL9OCRoPerk
   w==;
X-CSE-ConnectionGUID: SsDSQZcmQ0S8RWsioQryPQ==
X-CSE-MsgGUID: 5gJn+fFjSXCjSfO3A/1GAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56560452"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="56560452"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 21:37:07 -0700
X-CSE-ConnectionGUID: oqXgfm0eSJ6grmAz6XKR0g==
X-CSE-MsgGUID: OsRaog7/TPOf4+cT9wXjow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154194748"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2025 21:37:06 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXYAa-0003L9-0W;
	Fri, 04 Jul 2025 04:37:04 +0000
Date: Fri, 4 Jul 2025 12:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2455/2455] ERROR: modpost: "fg_console"
 [drivers/video/fbdev/ls2k500sfb.ko] undefined!
Message-ID: <202507041220.xQnKLHix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   673b27ee13cb811b3f418669e6826b95459c32f4
commit: 8248d42b7c5f4338a54f26d8efebec8614b43466 [2455/2455] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: arm64-randconfig-001-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041220.xQnKLHix-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041220.xQnKLHix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041220.xQnKLHix-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/xen-blkback/xen-blkback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/qcom-pm8008.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-tcp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/mdio/mdio-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ath/wcn36xx/wcn36xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/brcmfmac-wcc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/brcmfmac-cyw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/brcmfmac-bca.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wlcore/wlcore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wlcore/wlcore_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wlcore/wlcore_sdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wl12xx/wl12xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wl1251/wl1251_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wl1251/wl1251_sdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/arcnet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/rfc1201.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/arc-rawmode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/capmode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com90io.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/bsd_comp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/atm/iphase.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/atm/eni.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/firewire-uapi-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/host/ohci-exynos.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/mon/usbmon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/class/usbtmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/chipidea/ci_hdrc_msm.o
WARNING: modpost: drivers/rtc/rtc-at91rm9200: section mismatch in reference: at91_rtc_driver+0x8 (section: .data) -> at91_rtc_remove (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-mv: section mismatch in reference: mv_rtc_driver+0x8 (section: .data) -> mv_rtc_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-omap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-rc5t583.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/videobuf2/videobuf2-dvb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/ttpci/budget-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/of_mmc_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/tmio_mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/renesas_sdhi_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_sd8787.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/coreboot_table.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/cbmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/vpd-sysfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/xilinx/zynqmp-aes-gcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/intel/keembay/keembay-ocs-hcu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sha204a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/wlan-ng/prism2_usb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_tkip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/fbtft/fbtft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/marvell_cn10k_ddr_pmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-boot-env.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mn-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic-adc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: drivers/hwtracing/coresight/coresight-etm4x: section mismatch in reference: etm4x_amba_driver+0x98 (section: .data) -> etm4_remove_amba (section: .exit.text)
WARNING: modpost: drivers/hwtracing/coresight/coresight-etm4x: section mismatch in reference: etm4_platform_driver+0x8 (section: .data) -> etm4_remove_platform_dev (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in net/core/dev_addr_lists_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nft_fib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_reject_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtables.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_broute.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_filter.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nfc_digital.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o
>> ERROR: modpost: "fg_console" [drivers/video/fbdev/ls2k500sfb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
