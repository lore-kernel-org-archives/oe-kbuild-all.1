Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D612219EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 03:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716435945; cv=none; b=T+6FHakNIBjEAE1I2bOPHNKtHyUzMO3lqBrUJF4IXNTKKSlZZIG73ilTKwm7xzUoavBD9BaXymMjJWiqsKhO6jbXO9HMKOSA6z/TPysfC/OAiPmY5dqNSHwRPj5xd1G4whddZg7l22ZUecKRPTbfN/u6+NWV4JxvTZhInr9artE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716435945; c=relaxed/simple;
	bh=18ytjRkJs5mRB/9BH3QMa5wGueTiq/8azH6N4V4kIhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0jhbSrF8CSi071ZQDNyXsGY/CY6j8uSMF+lfWSnwTOPxbE8+1WQ7ZTI60YjBD19Rvbcn47Cwb5AqaowBSLoygjBhypDK/p1CwQ/pzd6eHtix5834/W/Y9UAQdZwK+aFoE/hUTRSUfB0XYK7udQhW07bllzl6OQs9zj2Ra1MaF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRKt+V6z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRKt+V6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716435943; x=1747971943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18ytjRkJs5mRB/9BH3QMa5wGueTiq/8azH6N4V4kIhw=;
  b=IRKt+V6z6dfwShpoBA3VwvWGDrNTIVnep2AUgfUhZmm3zTCkJS0yC6gd
   hUzmQuD3G/j0cF6LBRqRxE1TzSZDGvxYurFvpicsp7ixFYEuH/C0JfMRi
   hn1UPOvcp3sBPyMhpwBqXUG1fLyUf6uBBPDG6Eeu/id/+GEr+qLn8DKOV
   TA9riTAi+3Dbyr248OLjk64OOGmMVVtGq2rVYc2WBJ5F5ZpHrCVgXdJWW
   wzL5JaKumU8j9ECDRZIJLQJVXrtXuwwmADFNqpoA1QqCSIQXKzHY1UVSy
   YVotAn08s6r54J52PRqMAoSRPx7d+tuMLDvM316+b1JCYOOhgDWGOjipI
   g==;
X-CSE-ConnectionGUID: hxwjMM+OSn69z56qz6cbaQ==
X-CSE-MsgGUID: QUB9Hfu3Qg+XF7ALMdmmDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30257391"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="30257391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 20:45:32 -0700
X-CSE-ConnectionGUID: hC+YLZoQSHuW4QoTy9sU4g==
X-CSE-MsgGUID: 9lJj1D8BR+6GPTGa6ZGBFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="64747034"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 May 2024 20:45:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9zOS-0002Pl-0H;
	Thu, 23 May 2024 03:45:28 +0000
Date: Thu, 23 May 2024 11:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Saeed Nowshadi <saeed.nowshadi@amd.com>
Subject: ERROR: modpost: "irq_to_desc"
 [drivers/mailbox/zynqmp-ipi-mailbox.ko] undefined!
Message-ID: <202405231122.X5QcITz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c760b3725e52403dc1b28644fb09c47a83cacea6
commit: 6ffb1635341bec50fa9540ae7827d1e5d75ae0b0 mailbox: zynqmp: handle SGI for shared IPI
date:   3 days ago
config: arm64-randconfig-r112-20240318 (https://download.01.org/0day-ci/archive/20240523/202405231122.X5QcITz0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231122.X5QcITz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231122.X5QcITz0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-apu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/meson/a1-peripherals.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/meson/s4-peripherals.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sprd/clk-sprd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/suniv-f1c100s-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun20i-d1-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-a100-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-h6-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun4i-a10-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-a33-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-r40-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-npe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/meson-clk-measure.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-ee-pwrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/hisilicon/hi6220_reset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/esp32_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/omap-rng.o
WARNING: modpost: drivers/char/hw_random/mxc-rnga: section mismatch in reference: mxc_rnga_driver+0x10 (section: .data) -> mxc_rnga_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/arm_smccc_trng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_kunit_helpers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_buddy_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_cmdline_parser_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_connector_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_damage_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_exec_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_format_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_framebuffer_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_gem_shmem_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_managed_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_mm_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_modes_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_plane_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_probe_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_rect_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611uxc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/xen-blkback/xen-blkback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/open-dice.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/ssbi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscreen/cyttsp_i2c_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-omap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-tps65910.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/radio/si470x/radio-si470x-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/twl4030_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/ts4800_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/menz69_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/blink/leds-bcm63138.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-log.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-power-supply.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-vibrator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm-ccn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/arm_cspmu_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/nvidia_cspmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mn-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-quaddec.o
>> ERROR: modpost: "irq_to_desc" [drivers/mailbox/zynqmp-ipi-mailbox.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
