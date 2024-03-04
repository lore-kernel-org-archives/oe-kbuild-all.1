Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD162399
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 00:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709512960; cv=none; b=QZGmqb5GHqz2+JW2sk4qillk2Y2uQ7iud7Hi9y2rM5s8RVw7DWz8G//u6GuDQHgPJYNfwn3O9JW/WZ4+saInxrtehLAKx5k9jjbYZgGlYBjpPQ3GNQ8zDGuutcQShLdbIuyZxG9iJl2z/MYRFC8n7WhatlF8ZXarohbYgzIMj7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709512960; c=relaxed/simple;
	bh=F0oF6tV5B2ADCECHsU9kYJ25Tp5TigLQBJgObzgUKfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUMQraFIbBcx8iYTe4FCB3p20Sg7QxZcnDDmnTmlgiqmArVSuq60nsK2/qeUe23DF02jCIzs6F1yenRr1KV50kueHPv4uVq0HeZYhQaHmGQp38SBcJEun8pj3q9mG5Ac4unn9GowdC7j9ztf2CjMkGHPBwO4YRXu5Ss/1WYca2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVvOYWbe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVvOYWbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709512958; x=1741048958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0oF6tV5B2ADCECHsU9kYJ25Tp5TigLQBJgObzgUKfQ=;
  b=cVvOYWbeOvb4WJQLajQZkmQGUgmdX7wwrWfAGGMemp06ZliYCGTJBK09
   LM58XS+lh8jR9QqPhY8DbFcY+5+IkNe6uoe1jnr1tc7huMagK0h4kzx13
   PMTlR/Ipfu27N0DM1TCq6hOyhUh0z2TI8QxcOV2huAlSkHf9+jSh8SrIK
   DQKF4C2mX0E6BfrAA2JVv9k8eT8xLrRYlE5BuNjMbXqFx8Bt1v8KYgiIE
   46QY5x3uS+j48tnJqcL5SU4IRBb2y8ZTfibiv1/TpeJfqVZ97+gJZl/EA
   LrPJmZ1lCt9g45Qj8Adge375DZ3MBw9JnQZrDFjTbY5oEnLI4hvLKIJeC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15423634"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="15423634"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 16:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="31975524"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2024 16:42:36 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgwPZ-0002E3-1s;
	Mon, 04 Mar 2024 00:42:33 +0000
Date: Mon, 4 Mar 2024 08:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:for-next/kspp 32/48] WARNING: modpost: "strncat"
 [lib/fortify_kunit.ko] has no CRC!
Message-ID: <202403040858.7aB2PlIN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   e36b70fb8c707a0688960184380bc151390d671b
commit: fa4a3f86d4982b603865ccb97dde82f0ae1e3302 [32/48] fortify: Add KUnit tests for runtime overflows
config: alpha-randconfig-r016-20221128 (https://download.01.org/0day-ci/archive/20240304/202403040858.7aB2PlIN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040858.7aB2PlIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040858.7aB2PlIN-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-innolux-ej030na.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-newvision-nv3052c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-novatek-nt39016.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611uxc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sil-sii8620.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/cirrus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_dbi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-fabrics.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-fc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/target/nvmet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-fsl-lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_pruss.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscreen/cyttsp_i2c_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/coreboot_table.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/framebuffer-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/vpd-sysfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sha204a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-razer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfish/goldfish_pipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section mismatch in reference: adc3xxx_i2c_driver+0x10 (section: .data) -> adc3xxx_i2c_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: EXPORT symbol "strcpy" [vmlinux] version generation failed, symbol will not be versioned.
Is "strcpy" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "strcat" [vmlinux] version generation failed, symbol will not be versioned.
Is "strcat" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "strncpy" [vmlinux] version generation failed, symbol will not be versioned.
Is "strncpy" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "strncat" [vmlinux] version generation failed, symbol will not be versioned.
Is "strncat" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "strncpy" [fs/squashfs/squashfs.ko] has no CRC!
WARNING: modpost: "strcpy" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "strncpy" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "strcpy" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "strcat" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "strncpy" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "strcpy" [lib/kunit/kunit.ko] has no CRC!
WARNING: modpost: "strncpy" [lib/kunit/kunit.ko] has no CRC!
WARNING: modpost: "strncpy" [lib/test_hexdump.ko] has no CRC!
>> WARNING: modpost: "strncat" [lib/fortify_kunit.ko] has no CRC!
>> WARNING: modpost: "strcat" [lib/fortify_kunit.ko] has no CRC!
>> WARNING: modpost: "strncpy" [lib/fortify_kunit.ko] has no CRC!
>> WARNING: modpost: "strcpy" [lib/fortify_kunit.ko] has no CRC!
WARNING: modpost: "strncat" [lib/strcat_kunit.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/video/backlight/sky81452-backlight.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/video/fbdev/cyber2000fb.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/video/fbdev/s3fb.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/video/fbdev/sm501fb.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/clk/clk_test.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/tests/drm_cmdline_parser_test.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/tests/drm_connector_test.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/tests/drm_dp_mst_helper_test.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/tests/drm_framebuffer_test.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/tests/drm_plane_helper_test.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/tests/drm_probe_helper_test.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/gpu/drm/nouveau/nouveau.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/base/regmap/regmap-kunit.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/misc/lkdtm/lkdtm.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/nfc/pn544/pn544_i2c.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/w1/slaves/w1_ds28e17.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/md/dm-mod.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/hwmon/pmbus/pmbus_core.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/iio/proximity/sx9324.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/core/snd.ko] has no CRC!
WARNING: modpost: "strcat" [sound/core/snd.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/core/snd-rawmidi.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/drivers/opl3/snd-opl3-lib.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/snd-es18xx.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/ad1816a/snd-ad1816a.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/cs423x/snd-cs4236.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/es1688/snd-es1688-lib.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/gus/snd-gus-lib.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/opti9xx/snd-opti92x-ad1848.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/opti9xx/snd-opti92x-cs4231.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/sb/snd-sb-common.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/sb/snd-sb8.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/sb/snd-sb16.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/sb/snd-sbawe.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/isa/wss/snd-wss-lib.ko] has no CRC!
WARNING: modpost: "strcpy" [sound/pci/ac97/snd-ac97-codec.ko] has no CRC!
WARNING: modpost: "strcpy" [net/core/gso_test.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
