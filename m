Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468E828A415
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426945; cv=none; b=fqACOJYhqK2q6T8IIY3MB3GGntAFJiML7rSSN30ErSA5YmRvoki4brlPLN9JV5Eml2Gt2YtqWl1rg44Cq1MFofEvdHTARyxt3nTcYMb7nUt3W13hEK4ZVW2vyYQKVn1zH3zwQVsgED8iTwnaF9Get8DAp3AfhwI8CsWNT7qu020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426945; c=relaxed/simple;
	bh=yZW+QU92x26ZmitH72h1FAkMqsKL9gwfSG6PJ7lIVj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F1LwrTXPVL3LXOfrcfldoHFLnIUvXTihuNElgMH5b0z3elX34AzwybBjj37XcptsZLFLd+Dh2+odR5AGoYhDnRgjBY2w61W0VwsqhmR8wzo8YasuBnBQZWs2y+rBpRg16GTfdAMW/I5EPTrOz9MxqqKNSIm9n/5TTKeCJVi4UF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKBbM9XJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKBbM9XJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750426943; x=1781962943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZW+QU92x26ZmitH72h1FAkMqsKL9gwfSG6PJ7lIVj4=;
  b=dKBbM9XJiXIpOUkPnRq82BozneqEQWkNoTn98amuuE1vFMSi/RyEeaIX
   hDMiL3J00BbuEAZOa7+wwRWEOcGGIHi32KYCAO4aNT0moVMFwN9pf+Bgo
   PkFVZJrwW1AF3u44uIvjolW/wWr2AUyY1Zdfw/Xe9LvQ/MvimJwhgn93p
   47RaT/E0IiEnZxocXo+ukRryoalln+yAiCMgU9ZjizmHEayuWSAYJ7nwx
   b7IlaicTs6eP/DpkYzdSmV928Vghh/bRukpo77gFvDdWu0ehow+FOHQ/v
   zHwn89PnWBqDdMzsZUycBuxZWg0QcrQS7+7VW9uA4+MOhapDjvjvJZi4C
   Q==;
X-CSE-ConnectionGUID: cblCFqXWQ4useTo8F+EboQ==
X-CSE-MsgGUID: +ehn5ebsT4+8ZWogrLfHgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40300051"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="40300051"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 06:42:22 -0700
X-CSE-ConnectionGUID: 0+Lo1EOEROON6leNIeUcMw==
X-CSE-MsgGUID: wta5cQeXQm6RNxU3kpo+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="156725421"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jun 2025 06:42:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSc0Y-000LoA-2w;
	Fri, 20 Jun 2025 13:42:18 +0000
Date: Fri, 20 Jun 2025 21:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:syscon-rework-4 8/9] drivers/clk/clk-divider-regmap.c:
 warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202506202159.X355TV3x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework-4
head:   c92ed84a7a047f91e6c0f0cc90cea59f7b91727b
commit: b77274a05640212e8e658373601240e2df4ad02d [8/9] clk: divider, gate: create regmap-backed copies of gate and divider clocks
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250620/202506202159.X355TV3x-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202159.X355TV3x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202159.X355TV3x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/faux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/firmware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/firmware_loader/builtin/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/firmware_loader/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/firmware_loader/sysfs_upload.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/isa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/memory.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/node.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/platform-msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/power/clock_ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/power/wakeirq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-ac97.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-fsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-i3c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-mdio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-mmio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-ram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-raw-ram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-sccb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-sdw-mbq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-slimbus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-spi-avmm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-spmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/regmap/regmap-w1.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/soc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/base/syscore.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bcma/driver_mips.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bcma/host_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bcma/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/block/drbd/drbd_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/btbcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/btintel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/btmrvl_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/btmtk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/btqca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/btrsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/btrtl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/hci_h4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/hci_ldisc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bluetooth/hci_serdev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/arm-cci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/dpbp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/dpcon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/dprc-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/dprc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/fsl-mc-allocator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/fsl-mc-bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/mc-io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/mc-sys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/fsl-mc/obj-api.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/mhi/ep/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/mhi/host/boot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/mhi/host/init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/mhi/host/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/mhi/host/pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/mips_cdmm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/moxtet.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/mvebu-mbus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/stm32_firewall.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/sunxi-rsb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/ts-nbus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/bus/vexpress-config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cache/sifive_ccache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cdrom/cdrom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cdx/cdx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cdx/cdx_msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/agp/backend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/agp/generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/agp/intel-gtt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/apm-emulation.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/hw_random/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/ipmi/ipmi_dmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/ipmi/ipmi_msghandler.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/ipmi/ipmi_plat_data.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/ipmi/kcs_bmc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/nsc_gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/nvram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/random.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/scx200_gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/toshiba.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/st33zp24/st33zp24.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/tpm-buf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/tpm-chip.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/tpm-interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/tpm1-cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/tpm2-cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/tpm2-sessions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/tpm_crb_ffa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/tpm/tpm_tis_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/xillybus/xillybus_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/char/xillybus/xillybus_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/analogbits/wrpll-cln28hpc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/at91/pmc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk-composite.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk-conf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/clk/clk-divider-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk-divider.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk-fixed-factor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk-fixed-rate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk-fractional-divider.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/clk/clk-gate-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk-gate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk-mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clk_kunit_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/clkdev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/hisilicon/clk-hisi-phase.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/hisilicon/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/hisilicon/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/imx/clk-composite-7ulp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/imx/clk-pfdv2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/imx/clk-pllv4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/imx/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-apmixed.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-cpumux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-gate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-mtk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/clk-pllfh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mediatek/reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-cpu-dyndiv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-dualdiv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-mpll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-phase.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/clk-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/meson-aoclk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/meson-clkc-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/meson-eeclk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/sclk-div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/vclk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/meson/vid-pll-div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/mxs/clk-ssp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/nuvoton/clk-ma35d1-divider.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/nuvoton/clk-ma35d1-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/qcom/clk-krait.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/qcom/clk-regmap-mux-div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/renesas/r9a06g032-clocks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/rockchip/clk-ddr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/rockchip/clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/rockchip/softrst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/composite.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/gate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sprd/pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/starfive/clk-starfive-jh7110-sys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/starfive/clk-starfive-jh71x0.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_div.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_frac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_gate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_mmc_timing.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_mp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_mult.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_mux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_nk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_nkm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_nkmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_nm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_phase.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_reset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/sunxi-ng/ccu_sdm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/tegra/clk-dfll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/tegra/clk-tegra210-emc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/ti/clkctrl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clk/versatile/icst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/acpi_pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/arm_arch_timer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/hyperv_timer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/i8253.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/samsung_pwm_timer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/timer-clint.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/clocksource/timer-riscv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_buf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_fops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_pcmcia.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/comedi_usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/addi_watchdog.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/amplc_dio200_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/amplc_pc236_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/comedi_8254.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/comedi_8255.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/comedi_isadma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/das08.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/mite.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_labpc_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_labpc_isadma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_routes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_tio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/drivers/ni_tiocmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/kcomedilib/kcomedilib_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/comedi/range.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/connector/connector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/amd-pstate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/cpufreq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/cpufreq/cpufreq_governor_attr_set.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
