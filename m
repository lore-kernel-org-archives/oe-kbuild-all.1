Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BC12DD91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 03:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718248351; cv=none; b=prcqjIZSb+pgn9OSXrDuGbHP48Ou0F4HDkEMDm0r9WAgal/tXK42tJzkM9tyojGaiODBHBubW7Lmh9DkLyt3GbmK6WKV0Sb7ADiEPGYZBh95jgpNK/fT0zdD4yeATA2USifH9Lu+p4ggw/jse8NOq9EmsIqH2i4HTYzlkg9z28o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718248351; c=relaxed/simple;
	bh=geJKlljVd7s+IkUzNBAE1vUwxiHPnSbJfmLqMAVZDXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAAkbG0ph9pN0S/p3skPUJqC0NN98U9a686GKvEqD84j8Ac5FQK4tpq0b0fWmHHRJ0xGnX++X/nH24/dx57bc0jspmfXu3U4A3hlJK1BeCzGSiaTlAX0owRY8xWzCzBcaGA5dkvDSRwhlqOC2z+cZ1ZBM+xozlFeaACJe6Djg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ht0GPDtR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ht0GPDtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718248350; x=1749784350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=geJKlljVd7s+IkUzNBAE1vUwxiHPnSbJfmLqMAVZDXk=;
  b=Ht0GPDtRQwefCPkC8I5AdzqwMTx8VZQlkxKAQJco/8hZF08qczhq7YSR
   HxJg2E+zgyV5HeAz8sZIjxXyFQSgRPV52OQep1D6pi/gbhJR1Hvfy8WQT
   1c5on7++86z8RfZS8eqbaMxlPffONex0nNCaBfzL4yfNN2SW+N7vXIDw4
   j2fEZrb3i0oRcq05y8BtVy/dr4+7c3PfeHfBWSdvnhyu2kZ639YlqGX5X
   mNBShouC0Iq8ML86w1mY5aoMfRx4uY6tkPmoqJcafT5dYqArBTyIvDKaD
   se0t6GZCi664VkmMlUZ9HxL6Qd+ja4pwqykGG5omUEmwwag0sm2WIJGyV
   Q==;
X-CSE-ConnectionGUID: 5VXsQS5gQAuHPiBVbkPJBA==
X-CSE-MsgGUID: gBVKvRfZSnqXlkdqnBUChg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26464810"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="26464810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:12:29 -0700
X-CSE-ConnectionGUID: 1ctU7GQGQvGFlwojt1MiJg==
X-CSE-MsgGUID: ldSE+5UQRgeAcSudbtMRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44893485"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2024 20:12:28 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHasz-0002AE-2Y;
	Thu, 13 Jun 2024 03:12:25 +0000
Date: Thu, 13 Jun 2024 11:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/3] ERROR: modpost:
 "__early_static_cpu_has__thunk" [drivers/acpi/processor.ko] undefined!
Message-ID: <202406131101.ZikZaQ1f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   77b952c11556f38dbdc95c25a04ff72c8fd20a1b
commit: 873d254d7a3c15b60376b9cfcd8002a1943ffb1e [2/3] todo
config: i386-randconfig-001-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131101.ZikZaQ1f-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131101.ZikZaQ1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131101.ZikZaQ1f-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hpfs/hpfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/efs/efs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/adfs/adfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted-keys/trusted.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/crypto_simd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test-kstrtox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bitmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_fpu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_encoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/acpi_tad.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma_mgmt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sil-sii8620.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/gm12u320.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/floppy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/intel_soc_pmic_bxtwc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/core/usbcore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/mon/usbmon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/class/usbtmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/ezusb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/yurex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/misc/soc_button_array.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in reference: et8ek8_i2c_driver+0x8 (section: .data) -> et8ek8_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sha204a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-betopff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-bigbenff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-kbd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-hidpp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ntrig.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-retrode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-samsung.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sony.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tmff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-vbtn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-smartconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/asus_atk0110.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
>> ERROR: modpost: "__early_static_cpu_has__thunk" [drivers/acpi/processor.ko] undefined!
>> ERROR: modpost: "__early_static_cpu_has__thunk" [drivers/acpi/acpi_pad.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
