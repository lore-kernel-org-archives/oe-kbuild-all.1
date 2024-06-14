Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ADE194ACB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718383513; cv=none; b=KlkvlnOiUNB1u4QCyToU2axzBzXaEQ62gJPd6vF4qn/fVfBKBVYFkkEZ4gXEOS4zm1nX4+D9kVTRRs3Zhdrw7c2f/orr/jCCGEYwk+NUymzgANFpt6VYKJ5MqhMFPr2Cr7og6YOtWwSnHYHAO7UUJEpXZgKA2rBUBdOeobwJjek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718383513; c=relaxed/simple;
	bh=5G4+aSalHuLPnK9xIAew5JJ+rftIFQ2pWUyCjPJeUvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TjJf1L2Z3ng+8qjzT1gH28gbE9IZsOB+DX59ShQeOX0WhtcbS2lk6CpogzhmLEV2rKVpja6qkHFdghpk1IuLrjMMV/j7Q9Iq8hSCMRSV7Ajy33zt17ej7EIGLLWeMifolBgRwyDe2MrtU0fdxLBMZptGSqXl82jbWQHnKLFvocQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVX1jmwk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVX1jmwk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718383511; x=1749919511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5G4+aSalHuLPnK9xIAew5JJ+rftIFQ2pWUyCjPJeUvY=;
  b=MVX1jmwk8OvDL1G/gUh3qkIElFLthrN9NcjvRKkxuZaMkHh45jHiUy1s
   KLpiFq4k6kc4vg/CV3+s4ScYWkEiImcJJFEgv2EbQnPg0ffgpTFS0qYmu
   9R9GsrVrpv0KVluUxmcGXN6Z61rsAUtGgNpdQ0xhQ1Stztxz7kws5Enm4
   u5gN/tQSPE4yvBE8pMZL4sUQXYMmac5AVgyCr6UXu94NuPjWVKnSzXoMB
   UtYDpoNa5vuL2hiV4iRXB+WaUw31d7roe13be4FowOBEWT3p5afGH2Tsa
   GXRX6ICtyeyLlynymowHU0HkRvGnjaAFoo4b+MU93vDYvHa6s3Ip5y2Du
   g==;
X-CSE-ConnectionGUID: Q0KrOqrgTKyM+SIXMQF/eg==
X-CSE-MsgGUID: cZ4ia/OCQZSEOjYpxPldYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25957916"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="25957916"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 09:45:10 -0700
X-CSE-ConnectionGUID: O1mURG5hSmG69XN4ULWoOg==
X-CSE-MsgGUID: A1R7f3cGQKqLx5JlJ6OEEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="45661576"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2024 09:45:09 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIA31-0001X4-0r;
	Fri, 14 Jun 2024 16:45:07 +0000
Date: Sat, 15 Jun 2024 00:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm/for-nexxt 8/12] WARNING: modpost: module lm3630a_bl
 uses symbol pwm_apply_might_sleep from namespace PWM, but does not import
 it.
Message-ID: <202406150024.15LqmCL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-nexxt
head:   aa32efbe5b833a7a4d67294f32456563f328668c
commit: aeb9cedc87a270625004c77e08a2e642a21e6ade [8/12] pwm: Make use of a symbol namespace for the core
config: arm-randconfig-001-20240614 (https://download.01.org/0day-ci/archive/20240615/202406150024.15LqmCL6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150024.15LqmCL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150024.15LqmCL6-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x38 (section: .text.fixup) ->  (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x44 (section: .text.fixup) ->  (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x4c (section: .text.fixup) ->  (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x58 (section: .text.fixup) ->  (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x60 (section: .text.fixup) ->  (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x6c (section: .text.fixup) ->  (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x74 (section: .text.fixup) ->  (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_xarray.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/bitfield_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/checksum_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/hashtable_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_linear_ranges.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bits.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cmdline_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/memcpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/is_signed_type_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/overflow_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/stackinit_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/fortify_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/siphash_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/bus/vexpress-config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-gw-pld.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-fractional-divider_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma_mgmt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611uxc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sil-sii8620.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/vexpress-sysreg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/isight_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/mon/usbmon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/chipidea/ci_hdrc_msm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ss_lb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac1_legacy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_midi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_printer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/legacy/g_zero.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/legacy/g_midi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscreen/cyttsp_i2c_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/vpd-sysfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-hidpp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-prodikeys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-samsung.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelseries.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tmff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-uclogic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/of_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
>> WARNING: modpost: module lm3630a_bl uses symbol pwm_apply_might_sleep from namespace PWM, but does not import it.
>> WARNING: modpost: module lm3630a_bl uses symbol devm_pwm_get from namespace PWM, but does not import it.
>> WARNING: modpost: module pwm_bl uses symbol devm_pwm_get from namespace PWM, but does not import it.
>> WARNING: modpost: module pwm_bl uses symbol pwm_apply_might_sleep from namespace PWM, but does not import it.
>> WARNING: modpost: module pwm-ir-tx uses symbol pwm_apply_atomic from namespace PWM, but does not import it.
>> WARNING: modpost: module pwm-ir-tx uses symbol devm_pwm_get from namespace PWM, but does not import it.
>> WARNING: modpost: module pwm-ir-tx uses symbol pwm_apply_might_sleep from namespace PWM, but does not import it.
>> WARNING: modpost: module pwm-fan uses symbol pwm_apply_might_sleep from namespace PWM, but does not import it.
>> WARNING: modpost: module pwm-fan uses symbol devm_pwm_get from namespace PWM, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
