Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45E18B494
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 16:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741969567; cv=none; b=gmQtChjw9Rbyv+bQo4xrZIR99BaN+zYRScNNKy9Ib1k+xifijswnZxo8FX4c1vwOQxklwzlweQYTmZ6vUneDAox6iEQGiTgOkqvIR/iNMj8PGDWq0brN2X7tGTl0Syq4ys04/q8aQii2Fe88ef3oCNskICVosJi8AA/MRn18j/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741969567; c=relaxed/simple;
	bh=D4q081IR1BvplDEpKnehhI7DsGIA9tnqZ1x/CK1w0B8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dq+w6jylIQhcZmPly7j9VML7yw9elWdyIomme4U9YVsdS+05W0njlT7F86fmzkM5qBjxbVa8hNL21yFJYfX+lutzYFMWgB3ieFyw3/9zl3fJUyKJqs9f8vgO3MO9o5BSt+TUOZuLrFPyLkfeZBPUlsysD7h3qRe/0CpL2+MVBKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqCmHHpQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqCmHHpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741969566; x=1773505566;
  h=date:from:cc:subject:message-id:mime-version;
  bh=D4q081IR1BvplDEpKnehhI7DsGIA9tnqZ1x/CK1w0B8=;
  b=PqCmHHpQInuE9sIzHLP6s+3tayOulxfoqi+GBCzxzuhGVorD0aRyabxk
   eW3BzMbaTumaBWM1GenTshR4pJe+oNeEzr/hnbQq2G+4FTdgzep4DXSNg
   EK6uBLd2w0wTBzxEkcQR3T/dN/42F5M+pE0yVIVsqUpNDlpkImnp4Zobi
   xiq5CuIX9IWVNVq+ou3HE0NE2tE7Ps+045AzKDAW6xEqf7y0z+D5ZVMCs
   oTuoCqyfDvBBGS5J3Ly8nvFJ8GrDrXB0OSJKEbVFm5ydi9HrcA+9gPgar
   vZ3Mdr7CRvxyluWsBOqzixiIYOTy5VcIo54+ooIXgIhAXu2Uyx4bbxboD
   Q==;
X-CSE-ConnectionGUID: jsxnKX2nScm9wVlQ3a/liA==
X-CSE-MsgGUID: 9ma6ixAsTu6ClXlkCRUY6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43036395"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43036395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 09:26:05 -0700
X-CSE-ConnectionGUID: b07bd8ioSZ+L2bmzlJmhmA==
X-CSE-MsgGUID: 5mgUGju8SVOWd5/1N8mX1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126532328"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Mar 2025 09:26:04 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt7rF-000Ady-1Q
	for oe-kbuild-all@lists.linux.dev;
	Fri, 14 Mar 2025 16:26:01 +0000
Date: Sat, 15 Mar 2025 00:25:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 7/7] WARNING: modpost: drivers/rtc/rtc-mv:
 section mismatch in reference: mv_rtc_driver+0x4 (section: .data) ->
 mv_rtc_driver_exit (section: .exit.text)
Message-ID: <202503150002.vutUJTv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   685a54e0f0ccdc484187e319722de7fc7709e8fb
commit: 2bc92c61c5417982e7b92ba628281f411d31013c [7/7] modpost: Optimize symbol search from linear to binary search
config: xtensa-randconfig-001-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150002.vutUJTv2-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503150002.vutUJTv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503150002.vutUJTv2-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: try_to_run_init_process+0x24 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/zsmalloc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-13.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8data.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hpfs/hpfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/efs/efs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/qnx4/qnx4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/adfs/adfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/encrypted-keys/encrypted-keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/irqchip/irq-ts4800.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/irqchip/irq-meson-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/goldfishfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/vfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6765-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-ipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-apmixedsys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-jpgdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7981-eth.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-apmixedsys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sprd/clk-sprd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sunxi-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/suniv-f1c100s-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-a64-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-a100-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-h6-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun4i-a10-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun6i-rtc-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-a33-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-a83t-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-h3-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/hisilicon/hi6220_reset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/st-rng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/ssbi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-fabrics.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-fc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/firewire-uapi-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/storage/uas.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/isight_firmware.o
>> WARNING: modpost: drivers/rtc/rtc-mv: section mismatch in reference: mv_rtc_driver+0x4 (section: .data) -> mv_rtc_driver_exit (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/xilinx/zynqmp-aes-gcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-bootrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-log.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
