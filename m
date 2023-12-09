Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D15F1B29E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 23:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOy3V829"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702162916; x=1733698916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EnDubmjACSWPbF08w3YYY0HD5ZXALSIsPG7blTFGysU=;
  b=NOy3V829hs0WIpDzH3Vg5c4SyTolKnJ9hcCiuB+0N6VKyt8aqclvLJ2R
   EsXdwRcjQVgIfgENgGRAHdFj/zFZBk2l8PbKZwyAt/3uwpPAPgZSrSJii
   AkFdu6VLs5QwIX6qvVAYxKA2w/EE3jzm1yHNkvKdeVNMwP/6bvU1vUDvV
   EJ5CFPL4qLtPSskGatt0P4qNpjY3XUYeTctngCOamyxSCP7P7wliITNSN
   ZdJLbMv2nAdM1Gt2R9/YSJr+n/1iJ68ICMWI/N2zoi8z15S2ZHMDT9AuH
   q0IP0CnCBDIl7mNbuQUDJv1fqEJLUTC9A33T4387XjnOEg8tuIb3jhU3h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1401590"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1401590"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 15:01:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="895925733"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="895925733"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 09 Dec 2023 15:01:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC6KT-000G4x-0J;
	Sat, 09 Dec 2023 23:01:49 +0000
Date: Sun, 10 Dec 2023 07:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Brennen <jbrennen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: WARNING: modpost: drivers/watchdog/at91sam9_wdt: section mismatch in
 reference: at91wdt_driver+0x4 (section: .data) -> at91wdt_driver_exit
 (section: .exit.text)
Message-ID: <202312100601.WtR8QPq5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21b73ffcc62ab772bc06e3e90bd87eff5e9e8ed4
commit: 4074532758c5c367d3fcb8d124150824a254659d modpost: Optimize symbol search from linear to binary search
date:   10 weeks ago
config: xtensa-randconfig-r021-20220808 (https://download.01.org/0day-ci/archive/20231210/202312100601.WtR8QPq5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100601.WtR8QPq5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100601.WtR8QPq5-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8data.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libpoly1305.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-mc33880.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-spear.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-visconti.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/dwc/pci-exynos.o
WARNING: modpost: drivers/pci/controller/dwc/pci-exynos: section mismatch in reference: exynos_pcie_driver+0x4 (section: .data) -> exynos_pcie_driver_exit (section: .exit.text)
WARNING: modpost: drivers/pci/controller/dwc/pcie-kirin: section mismatch in reference: kirin_pcie_driver+0x4 (section: .data) -> kirin_pcie_driver_exit (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pci-host-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mediatek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mediatek-gen3.o
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410: section mismatch in reference: tfp410_driver+0x4 (section: .data) -> (unknown) (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015: section mismatch in reference: tpd_driver+0x4 (section: .data) -> (unknown) (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-dvi: section mismatch in reference: dvi_connector_driver+0x4 (section: .data) -> (unknown) (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv: section mismatch in reference: tvc_connector_driver+0x4 (section: .data) -> (unknown) (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-dpi: section mismatch in reference: panel_dpi_driver+0x4 (section: .data) -> (unknown) (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_accel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_DAC1064.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_Ti3026.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/macmodes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/via/viafb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/kyro/kyrofb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/goldfishfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-ipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-aud.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/lpass-gfm-sm8250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/videocc-sdm845.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sunxi-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/suniv-f1c100s-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun20i-d1-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun20i-d1-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-a64-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-a100-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-a100-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-h6-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-h6-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-h616-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun4i-a10-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun6i-a31-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun6i-rtc-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-a23-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-a83t-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-h3-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-de-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-usb-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma_mgmt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_kunit_helpers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_buddy_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_cmdline_parser_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_connector_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_damage_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_format_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_framebuffer_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_managed_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_mm_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_modes_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_plane_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_probe_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_rect_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_exec_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-novatek-nt39016.o
WARNING: modpost: drivers/gpu/drm/bridge/ti-tpd12s015: section mismatch in reference: tpd12s015_driver+0x4 (section: .data) -> tpd12s015_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ac97.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-sccb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/qcom-pm8008.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-fsl-lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-omap2-mcspi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-qup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: drivers/rtc/rtc-at91rm9200: section mismatch in reference: at91_rtc_driver+0x4 (section: .data) -> at91_rtc_driver_exit (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-pcap: section mismatch in reference: pcap_rtc_driver+0x4 (section: .data) -> pcap_rtc_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-qup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/ttpci/budget-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-empress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/radio/si470x/radio-si470x-common.o
>> WARNING: modpost: drivers/watchdog/at91sam9_wdt: section mismatch in reference: at91wdt_driver+0x4 (section: .data) -> at91wdt_driver_exit (section: .exit.text)
WARNING: modpost: drivers/mmc/host/davinci_mmc: section mismatch in reference: davinci_mmcsd_driver+0x8 (section: .data) -> davinci_mmcsd_driver_exit (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/tmio_mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/renesas_sdhi_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/xilinx/zynqmp-aes-gcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sha204a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm-ccn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mq-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_cif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_mf624.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/snd-acp-config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/mxs/snd-soc-mxs-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
