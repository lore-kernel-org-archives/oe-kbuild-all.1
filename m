Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AED15252E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706914; cv=none; b=MnPqTUZI0zLBeSKnnvIj4SdeMDVqnTmeYe0+423VJrAs7Mj5AxOnJBVtuGEXWi6WX8NXXbVWTPu5vhx4GSdwHkKipI8TzLx1UaWcm4M4SOGY+ZXw3pxmGHSozwpcGmtRy7aD3F6kXbNjjTKLPWmOGHyN+6fyxJMVh5dFuMhMOVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706914; c=relaxed/simple;
	bh=UpBA2d4B6PApZ6wUIxPd4/yk85DSTJSE09UulsReSdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LRkKDq7DerO2P3HShQPIV2rvHdeLIDHKSxKe5JWhabNXXAuZ4XDYXdZKCKQ8FFWGxum5p0u/C231Ubl96M5U8sW7GZyYhol91NqAp70XiorwUzhqEGj44KGJyak1te0Ul6oAmGWE6mjfqhJb71GVOoWPWAqFigXv3wQKZod14qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFtHCHFi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFtHCHFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720706912; x=1752242912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpBA2d4B6PApZ6wUIxPd4/yk85DSTJSE09UulsReSdE=;
  b=mFtHCHFiQJAvlsaRg25nmTe8wfKx3199QKThZjeugXTZRu0kCbiPi5P/
   5GZ1H8Y4jjrtN8IxszTQi4/g/122lbN+tL6RG/4CvkDSDZPKRiRkLG0Cw
   M0jKncVil3H3X/A8+2J+b8imIe1yRDz1vASHF5vE32Ty/SBD1tKS8D5Rf
   rR5XENR0SeDvyAeqZOwawmTUpvZ/hmfke8aeVb/h9h2VCgJ0BjWL4roXh
   mSLJQJOzXF6TpxB7PAvJ41FZqu6+OjxGY9uxFwzNrzHWwl3zCUTc0nhE0
   n12uFkMaU+p8aRdHvgC5nyfpbjJPZrpnU7wQyQsfGtLVnJvzF2+Dq7iVR
   g==;
X-CSE-ConnectionGUID: IRJgWbHuRMqjKtcRn9eWMg==
X-CSE-MsgGUID: 3lewH6j2QPuO2Q5oqYd6BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18294506"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18294506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 07:08:28 -0700
X-CSE-ConnectionGUID: uuqdsik/TGqq17RVOBdN0w==
X-CSE-MsgGUID: lMiPUuUSS9WwpJwpHsYwlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53161520"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2024 07:08:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRuTA-000ZM4-33;
	Thu, 11 Jul 2024 14:08:24 +0000
Date: Thu, 11 Jul 2024 22:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Adam Ford <aford173@gmail.com>
Subject: [jmondi:imx8mp/iob-gitlab/v6.9/extensible-format-v6+bls 4/79] ERROR:
 modpost: "of_clk_del_provider"
 [drivers/phy/freescale/phy-fsl-samsung-hdmi.ko] undefined!
Message-ID: <202407112215.hP2f6Gf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git imx8mp/iob-gitlab/v6.9/extensible-format-v6+bls
head:   360e44ff2e74395b492b91f6f54b285863cf9b17
commit: a9430aecf306bda301d01a0698b4662f3205cdc3 [4/79] phy: freescale: add Samsung HDMI PHY
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407112215.hP2f6Gf9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112215.hP2f6Gf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112215.hP2f6Gf9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-power-supply.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-vibrator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-audio-manager.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-gbphy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-pwm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-sdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-usb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_kunit_proto_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm-ccn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/fsl_imx8_ddr_perf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/arm_cspmu_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/nvidia_cspmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/ampere_cspmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-apple-efuses.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brcm_nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-boot-env.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mm-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mq-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mn-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mp-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra194-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brcm_u-boot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tplink_safeloader.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/spmi-pmic-arb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic-adc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-quaddec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/sound_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/drivers/snd-pcmtest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/pci/hda/snd-hda-cirrus-scodec-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/soc-topology-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-ab8500-codec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8ulp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/imx-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mtk-adsp-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8195/snd-sof-mt8195.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8186/snd-sof-mt8186.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-of.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mbochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/sh/drivers/push-switch.o
>> ERROR: modpost: "of_clk_del_provider" [drivers/phy/freescale/phy-fsl-samsung-hdmi.ko] undefined!
>> ERROR: modpost: "__clk_get_name" [drivers/phy/freescale/phy-fsl-samsung-hdmi.ko] undefined!
>> ERROR: modpost: "of_clk_src_simple_get" [drivers/phy/freescale/phy-fsl-samsung-hdmi.ko] undefined!
>> ERROR: modpost: "of_clk_add_provider" [drivers/phy/freescale/phy-fsl-samsung-hdmi.ko] undefined!
>> ERROR: modpost: "devm_clk_register" [drivers/phy/freescale/phy-fsl-samsung-hdmi.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
