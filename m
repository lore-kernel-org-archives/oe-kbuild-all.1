Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0717B428
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732308079; cv=none; b=EN7I2i5SeNCUJLMRnKIiKeMK9aohMtjFVVMNad0vQEdd+kBs8mIRw2MKGA9z3HhSsBqZOxnAHQvUK9PNXCeUHds/QrWCRDmdkT6C6SzCDcBb1qOiMR2bR1P5ImiCzjXgeu/FerN76ofvDcCYs1xPPVc9xxoqCFYDE+PL7+E5eRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732308079; c=relaxed/simple;
	bh=L21L8TjlYewrtMpOyUB61qdP1CKljXXT1Z084xu774A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AEXu8dFINqPjYFyLFKGAjnhXBPbE9CyX2In84JEOsBn9rV0ZqKgloGlg+hrsuwWoapHlUbR4a7XtfL22HdGs9/y9LN+px3qU/IUV2Am7Wuut9l/O3V7PPG9CGyr7BH2m+U30RS7O6pk5N81Pu7/zUBJ14bQD+1ubEm719AqXmlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3Nw6A7i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3Nw6A7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732308076; x=1763844076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L21L8TjlYewrtMpOyUB61qdP1CKljXXT1Z084xu774A=;
  b=B3Nw6A7ioRzLl+GgoSXLSXLjvj+1af3N/mARACEDBK9NlCi9/S1wGdZi
   ni9C/vjjwssayjZzpvltg8etQg97Ypxs/1/7SdfyA//cyr3FFOxM8/ON+
   MKJr8ipAe5Y1mVKG4rg8BjNuIxpbnQx6ycKQSDWyqrD244Frf4O/btW++
   9Fsi9pDds1nArqlpR1P34yB4x3+S1IEBEzx53FRNm25YgORjyOmaW9wYD
   8ESyGNtY9oWhta5zVnmCrk5XsBzqMq8akYFH8KpjlbW8X4Xot86MCEdWC
   ci49VUZMwJTqqgPwbptVjJXQ9621ufgh58WuQ3mykvrrFNSvpS+GI3vaM
   Q==;
X-CSE-ConnectionGUID: P7aomCJBQBKmCV5yUQWrgw==
X-CSE-MsgGUID: q8MmSEW2Tu2+w07Of4zUKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32403412"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32403412"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 12:41:16 -0800
X-CSE-ConnectionGUID: nZ5TakCHSOuCZDBcdL3mww==
X-CSE-MsgGUID: N0WqDcTtSMakQD5aMhaIUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="121632372"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2024 12:41:14 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEaSm-0004CZ-0f;
	Fri, 22 Nov 2024 20:41:12 +0000
Date: Sat, 23 Nov 2024 04:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 11837/19813]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:10:5: warning: no previous prototype
 for 'pkvm_smc_filter_hyp_init'
Message-ID: <202411230432.c92S5DJO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   750f274d5959541e9b06c3ec33be00380e94728d
commit: fec28c0f19050ced22791075319327fa416f30a4 [11837/19813] ANDROID: misc: pkvm_smc: Add pKVM SMC filter driver
config: arm64-randconfig-003-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230432.c92S5DJO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230432.c92S5DJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230432.c92S5DJO-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:10:5: warning: no previous prototype for 'pkvm_smc_filter_hyp_init' [-Wmissing-prototypes]
      10 | int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pixelview-002t.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pixelview-mk12.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pixelview-new.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pixelview.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-powercolor-real-angel.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-proteus-2309.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-purpletv.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pv951.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-rc6-mce.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-real-audio-220-32-keys.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-reddo.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-snapstream-firefly.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-streamzap.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-su3000.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tanix-tx3mini.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tanix-tx5max.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tbs-nec.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-technisat-ts35.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-technisat-usb2.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-terratec-cinergy-xs.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-terratec-slim-2.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-terratec-slim.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tevii-nec.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tivo.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-total-media-in-hand-02.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-total-media-in-hand.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-trekstor.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tt-1500.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-twinhan1027.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-vega-s9x.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-m1f.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-s350.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-tv-pvr.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videostrong-kii-pro.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-wetek-hub.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-wetek-play2.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-winfast.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-x96max.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-xbox-360.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-xbox-dvd.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-zx-irdec.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/ti/vpe/ti-vpdma.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/power/reset/piix4-poweroff.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/cpufreq-dt-platdev.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-evision.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-google-stadiaff.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-prodikeys.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-retrode.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sony.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelseries.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tmff.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-uclogic.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_kunit.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/hisilicon/hisi_uncore_pmu.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-apple-efuses.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brcm_nvram.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mp-interconnect.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/libnvdimm.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_virtio.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
   WARNING: modpost: drivers/mtd/nand/raw/txx9ndfmc: section mismatch in reference: txx9ndfmc_driver+0x8 (section: .data) -> txx9ndfmc_remove (section: .exit.text)
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
   WARNING: modpost: drivers/hwmon/smsc47m1: section mismatch in reference: smsc47m1_driver+0x8 (section: .data) -> smsc47m1_remove (section: .exit.text)
   WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-ab8500-codec.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/mxs/snd-soc-mxs-pcm.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-common.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
>> ERROR: modpost: "v4l2_m2m_release" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ctx_release" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_queue" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_remove" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_get_vq" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_job_finish" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_init" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ctx_init" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_next_buf" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_fop_poll" [drivers/media/platform/amlogic/meson-ge2d/ge2d.ko] undefined!
   WARNING: modpost: suppressed 502 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/pkvm_smc_filter_hyp_init +10 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c

     9	
  > 10	int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
