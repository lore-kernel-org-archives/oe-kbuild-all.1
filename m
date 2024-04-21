Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6EA1BF20
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713736654; cv=none; b=oovzT6Pt9uNacz0HabZ4OwekfqF3p1VobTxVlAk6dhTHPaduPNBUyMsxvQhAjNmpZrEDAzwF74+u/KxOW2lcCkyByue1O2W737BG6Zci0UT6i3+SjLG3ugDSBNBXnGD/BADJlbchbo2/Kj+IGxGoCWNMbc1sFHCTG3XW2d5ZgYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713736654; c=relaxed/simple;
	bh=engaWFFmmPl8DWVeBWgDkCHx13kO7jilbwolu74aVt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mHr2Awb+wMnacqBpn6W8ucOOGQXA5LXl1v2YjkpOjxAU0N6oVQGC0VbLNI1finl99Nl/SrhUNPmcPTKxGoPxnhu2gFJWVfS2aLUiRlBHHbldWS5IcBlLIeLaD9nI1pruiyP9yG3dbDQTbhHBlu9Cei2IJ8oe/rrzQkv/FA/9vmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1VRfkR6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1VRfkR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713736652; x=1745272652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=engaWFFmmPl8DWVeBWgDkCHx13kO7jilbwolu74aVt8=;
  b=j1VRfkR6BtdydRoKY6lQWhLnYT08rRzHbV5YIacywk5Wq7dD8RN/vUFN
   hhS7/xJTXVypQk5vmFIciFVfnivRqq/RJjBulZHp/u7RbTCK4jabsFtsx
   E8bfWtxNXM/Sfp5QWQYnA3ZDqARV79j0VvGz9eBFo6aGiJYQD6Zm2kylu
   rvgpUNz82buXinNAjnn83BrjglgZXhqtX78LU9lLd9mdFGW0sUvBfXiRG
   dx2+uDmxUrj9bOT4o/VqqvIRfxo6OpfwyS61JLd5xSzuDrb7CyYd2c7/B
   1r/etOSZJ7y+S8EhJLwPzekTqpe3q/cMnrbG9nomneWqRoKZBIRHlTFKb
   A==;
X-CSE-ConnectionGUID: aGEMw1eKS+WOP/oP5/OLBQ==
X-CSE-MsgGUID: gpeprcZMSc2Kvg3GBcjCxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9378499"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9378499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 14:57:30 -0700
X-CSE-ConnectionGUID: pteqWL9iRb2fbZGFyeCp2A==
X-CSE-MsgGUID: D+bVdg+aTyyexNbDW5QG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="23887873"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Apr 2024 14:57:29 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryfBe-000CBO-2V;
	Sun, 21 Apr 2024 21:57:26 +0000
Date: Mon, 22 Apr 2024 05:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-inode 3/3] ERROR: modpost: "__get_user_bad"
 [fs/fuse/fuse.ko] undefined!
Message-ID: <202404220507.P4XDLJJv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-inode
head:   721b0ba2d14b9e1ba63b05d4837b1d3be2a5c8dc
commit: 721b0ba2d14b9e1ba63b05d4837b1d3be2a5c8dc [3/3] fuse: implement FUSE_DEV_IOC_BACKING_{ATTACH,DETACH}
config: arm-randconfig-003-20240422 (https://download.01.org/0day-ci/archive/20240422/202404220507.P4XDLJJv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404220507.P4XDLJJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220507.P4XDLJJv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/crypto/poly1305-arm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/test_udelay.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8data.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/exportfs/exportfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_dhry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_min_heap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x4 (section: .text.fixup) -> .Ltmp1 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x10 (section: .text.fixup) -> .Ltmp4 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x18 (section: .text.fixup) -> .Ltmp7 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x24 (section: .text.fixup) -> .Ltmp10 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x2c (section: .text.fixup) -> .Ltmp13 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x38 (section: .text.fixup) -> .Ltmp16 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x44 (section: .text.fixup) -> .Ltmp19 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x4c (section: .text.fixup) -> .Ltmp22 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x58 (section: .text.fixup) -> .Ltmp25 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x60 (section: .text.fixup) -> .Ltmp28 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x6c (section: .text.fixup) -> .Ltmp31 (section: .init.text)
WARNING: modpost: lib/test_user_copy: section mismatch in reference: (unknown)+0x74 (section: .text.fixup) -> .Ltmp34 (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bitmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ref_tracker.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_ring.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spi-avmm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/ublk_drv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/qcom-pm8008.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-altera-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/host/xhci-pci-renesas.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/isight_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/chipidea/ci_hdrc_msm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_kunit_proto_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/fsl_imx8_ddr_perf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mq-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/sound_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
>> ERROR: modpost: "__get_user_bad" [fs/fuse/fuse.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
