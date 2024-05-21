Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04814286
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716272558; cv=none; b=vDaygXwZyWPpySmItwtEkVpYNFjOfe7zSZMoQJ/D/4PIxGUJuKCxjT5NnL37Pb2cftcy+kaySWAEIRICf23Xdwi4llu9eTnhs3BWIHoC8GhYk3hCstziIHlmdDYjFbHGfeKH5r0yrzbJ/R7oJzc7sWggCsVknYt1QbH+OxQlyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716272558; c=relaxed/simple;
	bh=meLUx/tSjQWNaBSscn0szHwCb+2p3JYxQmqeYrA/cbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6bxtPShOzS82/VQ3T/NhSGAB/IggsvNiuzni9H5XUTZGjP/exWoZMSN1hwcvCHRFJY8SR9kDcTGqmILZMPyJHu5c9bQ192zgzRQupGOKkv9hB2F5koD0+wQa/78iEzToJ9aDYhcJ9Bkf4Q5L6atLpLBC5Rr65VJNS2IeWn2qoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtEBu7fJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtEBu7fJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716272557; x=1747808557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=meLUx/tSjQWNaBSscn0szHwCb+2p3JYxQmqeYrA/cbQ=;
  b=QtEBu7fJcqfyglT/k0zv1QiHMqLuMfVa4WrppJRhLC166X7ztLUl2hO4
   ztExR9XWRkoqpyf4dwDt77XSbhryRhDRqGsrJoZZ4XtR9ZqZeVzAX5X8f
   Iba6XETU0YTVYCckixYJiyk/g3fcZpFlmLEOLd0jRHHfOIOMamOYhFZEW
   fhsd4K/B4d2/AjSvAkp+qLZi4lkS6z01X/52tnTaMIBUiu551sPFUrKso
   8fIVFlamHWltKNPpypBgQfcgdOzCA2W0P2RHrAIi4BgBYn856rTsKtiz/
   qPMcBVE7l/yRHoA0G2YziuIYXQm28k+JGgeejL01MO+0mLtzn/7urxPTG
   A==;
X-CSE-ConnectionGUID: X+umRBcoQz686EhmFH7luw==
X-CSE-MsgGUID: f123c/fWRz2eLe43VpQR3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23017645"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="23017645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 23:22:36 -0700
X-CSE-ConnectionGUID: o01RB2NPQZC4lhjpn7taug==
X-CSE-MsgGUID: 7eHeRM/dR2mhvWyzHBzZ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="32821599"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 May 2024 23:22:34 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9ItL-0005xU-2C;
	Tue, 21 May 2024 06:22:31 +0000
Date: Tue, 21 May 2024 14:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [linux-next:master 13226/13585] ERROR: modpost: "crc16"
 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
Message-ID: <202405211405.TidTWIBX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   124cfbcd6d185d4f50be02d5f5afe61578916773
commit: 3ed181b8ff43fc03c85d43a726e578bd131d39e4 [13226/13585] drm/amdkfd: Ensure gpu_id is unique
config: x86_64-randconfig-a012-20230624 (https://download.01.org/0day-ci/archive/20240521/202405211405.TidTWIBX-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211405.TidTWIBX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211405.TidTWIBX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/intel/intel-uncore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted-keys/trusted.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libchacha.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_kmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_bm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_fsm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_encoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/vmd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/pci-stub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/rt4831-backlight.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-fractional-divider_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_kunit_helpers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_buddy_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_cmdline_parser_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_connector_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_damage_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_exec_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_format_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_framebuffer_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_gem_shmem_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_managed_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_mm_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_modes_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_plane_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_probe_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_rect_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ccgx-ucsi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/twl4030_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-vibrator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-sdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/ibm_rtl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_kunit_proto_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_cif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
>> ERROR: modpost: "crc16" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
