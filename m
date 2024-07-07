Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B01BC43
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720353654; cv=none; b=iBxhNzAVKv5rNWUYpiEOHudgodV0PiTeGP+8xWOjK7wpixO7UgSx7IPcrr8ItjYC+FfEZzmfAm3MQc6AHXxenrn1CADRh0KSi4N09e7/TphJ562hS9DnrHTJ3enb8le21M9lipIMcjCgpLXXG48PVb6QteTidLdoiz0POOYHvAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720353654; c=relaxed/simple;
	bh=mFIUJSHdn1mY+Z5F9uEuJdA4zVl21nkGMtFw2lYk67w=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X8meWWh2h0lZVlg7Sc9cGyGpRY3bxcX3BWOR/GhW+xPJyBCLX+L0Jkvyz2l0oRiLoYGa0onbN/Si5Rbku//w4mJblx/D/4JqD68bkGD8srPekrBI3VjGRdV9kmFC0PsZGvg4A/MKwovdHj1Mc9MqzCFVVokpFmqpSaxxR5jCPko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhwYatBs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhwYatBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720353652; x=1751889652;
  h=date:from:cc:subject:message-id:mime-version;
  bh=mFIUJSHdn1mY+Z5F9uEuJdA4zVl21nkGMtFw2lYk67w=;
  b=lhwYatBs/yApVNkDnZfx73c+WRDo8PlVRRiUIiNU/eyirg5ucN/xGtPk
   tD0K5taG6NG6CwoqHkNTBuewbm6SyhPA3Ft3FLrzcGZUBMztrE0+FwSjy
   Agrn8YqWFzC3Ozy/vPQNxuEIvn2epREqTFlr8MwVkVl24zm1guBoXKNN7
   8uGcGpWkCn0CiCrY0hn91RTFaLPbERTQYjfI6UWUNt22w7bvq3QfnEr52
   nx6Y/13pb0/wfuQG6cLR91CqlcU8GJa71+AYu0XqG0xOLRuCnpPkihHAy
   TIXsLKHGyZs6VPNABB3afzMMkuAqiIV2JMUN3Q/9/L8T7PAWb/OS4g0lE
   g==;
X-CSE-ConnectionGUID: MDpS2QHvSaSw0QC65d84YA==
X-CSE-MsgGUID: 8H6JyOLoRF+SmCbE6nlvdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17698598"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17698598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 05:00:52 -0700
X-CSE-ConnectionGUID: 2aDVjhLtSq+ZAAHvICzIdw==
X-CSE-MsgGUID: 42J3iz+9QjCeGskQ2Dp9vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47023387"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jul 2024 05:00:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQQZU-000Uuy-06;
	Sun, 07 Jul 2024 12:00:48 +0000
Date: Sun, 7 Jul 2024 20:00:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vibhore Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 29/42] ERROR: modpost:
 "dev_pm_qos_read_value" [drivers/firmware/ti_sci.ko] undefined!
Message-ID: <202407071956.DhM4sxnC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   fb89cd4d622ce6cc1b7b254ae21298570d437a08
commit: 8457ae66a127a7bcfcbd4e5faf2cb938d42aabca [29/42] firmware: ti_sci: add CPU latency constraint management
config: arm-randconfig-003-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071956.DhM4sxnC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071956.DhM4sxnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071956.DhM4sxnC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libchacha.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test-kstrtox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_min_heap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_encoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7622-hif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-apmixedsys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-apu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/clk-qcom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/gcc-msm8976.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/ti/cppi41.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/serial_cs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/n_hdlc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/omap-rng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/omap3-rom-rng.o
WARNING: modpost: drivers/char/hw_random/mxc-rnga: section mismatch in reference: mxc_rnga_driver+0x4 (section: .data) -> mxc_rnga_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/nomadik-rng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/arm_smccc_trng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iommu/iova.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611uxc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sil-sii8620.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/gm12u320.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/scsi_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-fabrics.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/target/nvmet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/target/nvme-loop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/target/nvmet-fc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/common/nvme-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/class/usbtmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/storage/uas.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch341.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/ezusb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/isight_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_obex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/mon/usbmon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscreen/cyttsp_i2c_common.o
WARNING: modpost: drivers/rtc/rtc-mv: section mismatch in reference: mv_rtc_driver+0x4 (section: .data) -> mv_rtc_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-rc5t583.o
WARNING: modpost: drivers/rtc/rtc-sh: section mismatch in reference: sh_rtc_platform_driver+0x4 (section: .data) -> sh_rtc_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-tps65910.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/omap_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/menz69_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/tmio_mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/renesas_sdhi_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/ufs/host/ufs-qcom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/vpd-sysfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfish/goldfish_pipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/qcom/interconnect_qcom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/qcom/icc-rpmh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tplink_safeloader.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/snd-acp-config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
>> ERROR: modpost: "dev_pm_qos_read_value" [drivers/firmware/ti_sci.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
