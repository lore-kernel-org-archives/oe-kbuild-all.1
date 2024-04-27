Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB90D146D60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 22:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714256823; cv=none; b=npo/pk6++voeJdSWSX7TDiYaV9jQGnJBqNljl3zcWv205thAv/I6a4NGcT5QCYJNqfdvGtbuy+Jp7//IbiUwThX6KoOAMOUxev2jetPtHsxDvBX4dHzbXt/ekn6VahIf9XOQWoOMVr5SDrGXAMSOaF+JaIhyr1y726JGih7gwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714256823; c=relaxed/simple;
	bh=MFnRdcvTVArYBL9vDALH0c1JTni2w7bySOoda6dz/O0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BTD68j1aA1ZTiLuHHZAzNY7OP5unWnekWhsK35HGMl5xQDZi3qGv+WwuuBinAHfE3ADskccoygPuxEZmENiCF/w8hJuF2VlejGrSi22B1fw2lmmJAtKEQI6JuVW5sWrPPjz9oNEOh9ezhLELU0b9/XNJu5KQyb64AeF2x/C+wD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cd9A9REk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cd9A9REk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714256821; x=1745792821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFnRdcvTVArYBL9vDALH0c1JTni2w7bySOoda6dz/O0=;
  b=Cd9A9REkLvRHNHUjUvjy14pIoAkc/9MwSi9noIyi623Psdn7cnKVC3sP
   wvq6nwmehoKg2Nx63Jt5hDS7UuhxfBwBPF1zWPBaWcMOYY7ur5Jyt19Nw
   qmC+N4t6BRDPGWdWn/yPXl7oU0BT/aVJY3HBWCsZVVwz88jyUf5AsxfO5
   jA0VPylvvAivEFMyuOSl7Kkg7Q6SpyNEh25mMwhKkUE/kp75XHvBrD24e
   AWTMX8slnqcQ0gmJKQpOu2YfAjBxfcGcL/rzQ8jcXdBC9czHxHYb0IhAs
   VI/EYZ+bkM1yGiaoDLIVshNpK0zl0Zxy0ts0BLKwo+iqOovQhhGJAuZw6
   A==;
X-CSE-ConnectionGUID: F8/v2wtQRUKGFiD/yZ/E2g==
X-CSE-MsgGUID: 59Z64qX6RwGn8ONt8MRXjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10125189"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10125189"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 15:26:58 -0700
X-CSE-ConnectionGUID: pNjaaKGwSVyDXRQoHsdz+w==
X-CSE-MsgGUID: mt/9I1enRmybX+TbjrHh/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25622225"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Apr 2024 15:26:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0qVS-0005ZX-0D;
	Sat, 27 Apr 2024 22:26:54 +0000
Date: Sun, 28 Apr 2024 06:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 595/991] WARNING: modpost: module
 fpga-mgr uses symbol dma_buf_get from namespace DMA_BUF, but does not import
 it.
Message-ID: <202404280654.QoDXQCfa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   08ceadacc1da15a77045dee6654f9cd906906271
commit: dc67651172095c04c4e6e1a64983036f4e654fd2 [595/991] fpga: support loading from a pre-allocated buffer
config: arm64-randconfig-002-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280654.QoDXQCfa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280654.QoDXQCfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280654.QoDXQCfa-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

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
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: drivers/watchdog/at91sam9_wdt: section mismatch in reference: at91wdt_driver+0x8 (section: .data) -> at91wdt_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/omap_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/menz69_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/blink/leds-bcm63138.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/hisilicon/hisi_uncore_pmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/marvell_cn10k_ddr_pmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-apple-efuses.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-boot-env.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mm-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mq-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mn-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/qcom/interconnect_qcom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/qcom/icc-rpmh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brcm_u-boot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tplink_safeloader.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: drivers/mtd/nand/raw/txx9ndfmc: section mismatch in reference: txx9ndfmc_driver+0x8 (section: .data) -> txx9ndfmc_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic-adc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/drivers/snd-pcmtest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/snd-acp-config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-da7219.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-dmic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-i2s-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-max98927.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-max98357a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-nau8825.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-probe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt274.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt286.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt298.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt5663.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt5682.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/mxs/snd-soc-mxs-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/imx-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-of.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
>> WARNING: modpost: module fpga-mgr uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module fpga-mgr uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module fpga-mgr uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module fpga-mgr uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module fpga-mgr uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module fpga-mgr uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
