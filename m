Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F703B7A8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 02:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772418832; cv=none; b=PVMdfKNp6FoUOvcVP7Ys8Mm6mDmUHbDKulAXzNbfogAqY+ZEvqjWT3/MCG71KDw/CHsGIyuyZ4ZwCdiRCtbuhL1KsVrAQ4ZMNXPTLXMaihMqoOZPetJFVRsKPPYd3ivKHFRbGOE05X0gNV6NVASuiKS8AP2DdtG/fcN5Opa/MxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772418832; c=relaxed/simple;
	bh=B/hVczN6Kw4p5ydI39fGk33uOKcrWbbYH0rjvjk/mOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ILlgmbofON/PQFSqf/W8s0EIEvY5cRfVWDzVBmSf79D6o6181fXIHaAir8syJboR5ycTDzOFCDh0JVxsjk08eg6DS3jjy326vuU7ANWIoIBxwSuXoCuvMz8qeI/e+CmOglOKz86qDMB4MHCX0HekUm0a/0FcTEQyKjakbWDRvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPcNX1Uq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPcNX1Uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772418831; x=1803954831;
  h=date:from:to:cc:subject:message-id;
  bh=B/hVczN6Kw4p5ydI39fGk33uOKcrWbbYH0rjvjk/mOM=;
  b=cPcNX1Uq5SpLGUAqNNvaOFbqqMFaL0sEYc4mFtij8CIh97WVEdiYFO8K
   WXdvyrPjvfAi03jr1qmiksRXmCbbZ7cwOqI2sTix2EGWERLhc1DwOiz6L
   iMjYXFYyn1TT/9SMR5wpYUR/DweulUiZ3lHaBvOLJHD4d8cblurFvCbK1
   E/mz+7y4QjnXzYY8njvzfLHsS1TGGNRcQXMp1oyu/cC2u5ReEHaMXGxpT
   yCBO5OTj454508C2MVUNF146VS6/P2BpBDlsfk78u6QtPeXb7z1sEQ+XV
   RbUxzqzKTEC4/duuG8VinNWMRWWtOHfA4y4RP9NyEvEOIOrbVobWLjMJg
   g==;
X-CSE-ConnectionGUID: DoG6l9EUTqaLM8Rxe8t6Dw==
X-CSE-MsgGUID: sRiBRPrdSweU61Kz0hZbCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84510482"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84510482"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 18:33:51 -0800
X-CSE-ConnectionGUID: 3jbAtuAwR3GrnQ4obHYthw==
X-CSE-MsgGUID: nitMsFzOQxuwrcdlSINNSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="255357255"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Mar 2026 18:33:49 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwt6Q-000000000GL-1os4;
	Mon, 02 Mar 2026 02:33:46 +0000
Date: Mon, 02 Mar 2026 10:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [linux-next:master 2661/2910]
 drivers/hid/hid-lenovo-go-s.c:661: multiple definition of `touchpad_enabled';
 drivers/hid/hid-lenovo-go.o:drivers/hid/hid-lenovo-go.c:2083: first defined
 here
Message-ID: <202603021047.h2DoCbwL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: 14651777fd67507d19574cd7e7835c16e6174853 [2661/2910] HID: hid-lenovo-go-s: Add Feature Status Attributes
config: loongarch-randconfig-r053-20260301 (https://download.01.org/0day-ci/archive/20260302/202603021047.h2DoCbwL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021047.h2DoCbwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021047.h2DoCbwL-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/hid/hid-lenovo-go-s.o: in function `.LANCHOR4':
>> drivers/hid/hid-lenovo-go-s.c:661: multiple definition of `touchpad_enabled'; drivers/hid/hid-lenovo-go.o:drivers/hid/hid-lenovo-go.c:2083: first defined here
   loongarch64-linux-ld: drivers/hid/hid-lenovo-go-s.o: in function `.LANCHOR4':
>> drivers/hid/hid-lenovo-go-s.c:579: multiple definition of `gamepad_mode'; drivers/hid/hid-lenovo-go.o:drivers/hid/hid-lenovo-go.c:1792: first defined here
   loongarch64-linux-ld: drivers/hid/hid-lenovo-go-s.o: in function `.LANCHOR2':
   drivers/hid/hid-lenovo-go-s.c:50: multiple definition of `drvdata'; drivers/hid/hid-lenovo-go.o:drivers/hid/hid-lenovo-go.c:93: first defined here


vim +661 drivers/hid/hid-lenovo-go-s.c

   578	
 > 579	struct gos_cfg_attr gamepad_mode = { FEATURE_GAMEPAD_MODE };
   580	LEGOS_DEVICE_ATTR_RW(gamepad_mode, "mode", index, gamepad);
   581	static DEVICE_ATTR_RO_NAMED(gamepad_mode_index, "mode_index");
   582	
   583	struct gos_cfg_attr gamepad_poll_rate = { FEATURE_POLL_RATE };
   584	LEGOS_DEVICE_ATTR_RW(gamepad_poll_rate, "poll_rate", index, gamepad);
   585	static DEVICE_ATTR_RO_NAMED(gamepad_poll_rate_index, "poll_rate_index");
   586	
   587	static struct attribute *legos_gamepad_attrs[] = {
   588		&dev_attr_auto_sleep_time.attr,
   589		&dev_attr_auto_sleep_time_range.attr,
   590		&dev_attr_dpad_mode.attr,
   591		&dev_attr_dpad_mode_index.attr,
   592		&dev_attr_gamepad_mode.attr,
   593		&dev_attr_gamepad_mode_index.attr,
   594		&dev_attr_gamepad_poll_rate.attr,
   595		&dev_attr_gamepad_poll_rate_index.attr,
   596		NULL,
   597	};
   598	
   599	static const struct attribute_group gamepad_attr_group = {
   600		.name = "gamepad",
   601		.attrs = legos_gamepad_attrs,
   602	};
   603	
   604	/* IMU */
   605	struct gos_cfg_attr imu_bypass_enabled = { FEATURE_IMU_BYPASS };
   606	LEGOS_DEVICE_ATTR_RW(imu_bypass_enabled, "bypass_enabled", index, gamepad);
   607	static DEVICE_ATTR_RO_NAMED(imu_bypass_enabled_index, "bypass_enabled_index");
   608	
   609	struct gos_cfg_attr imu_sensor_enabled = { FEATURE_IMU_ENABLE };
   610	LEGOS_DEVICE_ATTR_RW(imu_sensor_enabled, "sensor_enabled", index, gamepad);
   611	static DEVICE_ATTR_RO_NAMED(imu_sensor_enabled_index, "sensor_enabled_index");
   612	
   613	static struct attribute *legos_imu_attrs[] = {
   614		&dev_attr_imu_bypass_enabled.attr,
   615		&dev_attr_imu_bypass_enabled_index.attr,
   616		&dev_attr_imu_sensor_enabled.attr,
   617		&dev_attr_imu_sensor_enabled_index.attr,
   618		NULL,
   619	};
   620	
   621	static const struct attribute_group imu_attr_group = {
   622		.name = "imu",
   623		.attrs = legos_imu_attrs,
   624	};
   625	
   626	/* MCU */
   627	static DEVICE_ATTR_RO(mcu_id);
   628	
   629	struct gos_cfg_attr os_mode = { FEATURE_OS_MODE };
   630	LEGOS_DEVICE_ATTR_RW(os_mode, "os_mode", index, gamepad);
   631	static DEVICE_ATTR_RO(os_mode_index);
   632	
   633	static struct attribute *legos_mcu_attrs[] = {
   634		&dev_attr_mcu_id.attr,
   635		&dev_attr_os_mode.attr,
   636		&dev_attr_os_mode_index.attr,
   637		NULL,
   638	};
   639	
   640	static const struct attribute_group mcu_attr_group = {
   641		.attrs = legos_mcu_attrs,
   642	};
   643	
   644	/* Mouse */
   645	struct gos_cfg_attr mouse_wheel_step = { FEATURE_MOUSE_WHEEL_STEP };
   646	LEGOS_DEVICE_ATTR_RW(mouse_wheel_step, "step", range, gamepad);
   647	static DEVICE_ATTR_RO_NAMED(mouse_wheel_step_range, "step_range");
   648	
   649	static struct attribute *legos_mouse_attrs[] = {
   650		&dev_attr_mouse_wheel_step.attr,
   651		&dev_attr_mouse_wheel_step_range.attr,
   652		NULL,
   653	};
   654	
   655	static const struct attribute_group mouse_attr_group = {
   656		.name = "mouse",
   657		.attrs = legos_mouse_attrs,
   658	};
   659	
   660	/* Touchpad */
 > 661	struct gos_cfg_attr touchpad_enabled = { FEATURE_TOUCHPAD_ENABLE };
   662	LEGOS_DEVICE_ATTR_RW(touchpad_enabled, "enabled", index, gamepad);
   663	static DEVICE_ATTR_RO_NAMED(touchpad_enabled_index, "enabled_index");
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
