Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3812D6D1AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713249904; cv=none; b=mMvXNqy3ZWDdwbl5ouIxTSt9aWpq46NSvVmjOyqm75+G9LsiYQb0pp3NUUAF2TzMTHFGyNvOANGSC8+zoLegWLrmrIaV1JO8vkSBD24gB/NFTH01gDDeu3AQp60uJQ6wBjs3wIXuD6jjZo0oTUy2FlWPTBVihlZLV2y2JyOaM5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713249904; c=relaxed/simple;
	bh=t5RikqwAb4DkSZHY9DB3TVAOEt9ZlUn4Df6n9A9YMG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bX5d8eq6agLEzvhMmfGsPH9DyVTrNfo6AelZtVoZ3lc+QWOpWeJi1+HHOYTFc6oKt8ri4Ih9Lh3RTb3EaKzYO7v3QrNyWx9RbLgr/HEGMPz5O+6fhUklSYm/bMcsK023z0pV+rViT+jfBuCupW4vLWaSGmnun44uHSc2tZm+mq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDtqTTBs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDtqTTBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713249902; x=1744785902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5RikqwAb4DkSZHY9DB3TVAOEt9ZlUn4Df6n9A9YMG4=;
  b=YDtqTTBst5gYj9f45+CfzEjUGo8NoQ8sa1cu3eKHbZqSUFHN1u1SUpub
   hyOi0B3mzslserbwtshaTT0a3gypt7QzVq9kIGoCDmH8Gf6tHbb3bhxUv
   RGVLjvHWcXOc42y73C3Ji3u6gUNciHWGo6aFhUUutjWZyuuzEfW7rZTbA
   e5+9rLweXtQVFh2QhJq7iXANoEYxTV16vHnKLiVrA1A0yw6Ozu/baX3uW
   skbEDYIF93DFSmHx5HAoQlfymUZY1frldAbvdlxgDffdqq+9cegvq7qIY
   CuQ3ZgwjJcRFAhhkdXQDEJ7WhoxQY+EUg2BZgtOco2nE3+EW0EeLRcjwT
   w==;
X-CSE-ConnectionGUID: 8K/3Vb/YRFuVVSEz+wUnkg==
X-CSE-MsgGUID: WJI169KyRQWUoRLvT1vJ4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="9223400"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="9223400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 23:45:01 -0700
X-CSE-ConnectionGUID: /QSTJc05SyaOJH7fapJWBw==
X-CSE-MsgGUID: 0bcBfgzrTWeRTg5ZDiorjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22058394"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2024 23:45:00 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwcYp-00051E-2p;
	Tue, 16 Apr 2024 06:44:56 +0000
Date: Tue, 16 Apr 2024 14:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v5 5/9] ERROR: modpost:
 "led_sysfs_enable" [drivers/media/v4l2-core/videodev.ko] undefined!
Message-ID: <202404161442.vtG0u0ub-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v5
head:   db5976dcfcee45b460fc59b10fc29abcfd9adb3d
commit: 9d7e7e8493bc0393f85b88e2b3b49d4b7cd02407 [5/9] net: Add helpers for netdev LEDs
config: sparc-randconfig-r064-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161442.vtG0u0ub-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161442.vtG0u0ub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161442.vtG0u0ub-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hfs/hfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ufs/ufs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/qnx4/qnx4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/qnx6/qnx6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/pstore/pstore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/af_alg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_min_heap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/irqchip/irq-ts4800.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/irqchip/irq-meson-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/bcm/pinctrl-bcm4908.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-audio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-mipi0a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-vcodec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7988-apmixed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7988-topckgen.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7988-infracfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-mfgcfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-mdp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-aud.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-ipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-mdp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-msdc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-ee-pwrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/hisilicon/hi6220_reset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/esp32_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/owl-uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spi-avmm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-bitbang.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-fsl-lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-omap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-qup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/radio/si470x/radio-si470x-common.o
WARNING: modpost: drivers/mmc/host/davinci_mmc: section mismatch in reference: davinci_mmcsd_driver+0x8 (section: .data) -> davinci_mmcsd_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/tmio_mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/renesas_sdhi_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/sa2ul.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-apple-efuses.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brcm_nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-quaddec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/spmi-pmic-arb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
>> ERROR: modpost: "led_sysfs_enable" [drivers/media/v4l2-core/videodev.ko] undefined!
>> ERROR: modpost: "led_set_brightness" [drivers/media/v4l2-core/videodev.ko] undefined!
>> ERROR: modpost: "led_sysfs_disable" [drivers/media/v4l2-core/videodev.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_CLASS
   Depends on [n]: NEW_LEDS [=n]
   Selected by [y]:
   - NETDEV_LEDS [=y] && NET [=y]
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
   Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
   Selected by [y]:
   - NETDEV_LEDS [=y] && NET [=y]
   Selected by [m]:
   - BT_LEDS [=y] && NET [=y] && BT [=m] && LEDS_CLASS [=y]
   - MAC80211_LEDS [=y] && NET [=y] && WIRELESS [=y] && MAC80211 [=m] && (LEDS_CLASS [=y]=y || LEDS_CLASS [=y]=MAC80211 [=m])
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
   Depends on [n]: NEW_LEDS [=n] && LEDS_TRIGGERS [=y] && NET [=y]
   Selected by [y]:
   - NETDEV_LEDS [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
