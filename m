Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3341AA1FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 22:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646563; cv=none; b=U1JqjmxYbVS6UCHcgK9L1nYtsNwL779Pg3+l56TCR5dFGFkni6gfkBKcepdGJj4ZAduZ6kXVCTVUXTcsQXvQvc0/mRpzIZ6Z54Rt3CAuAjCycsK/o3Q84Zoqmqg8aCG3eVM5vFWJ1x3HLl3EevoGqANrQ6gXnLnLJ3oQCcbaCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646563; c=relaxed/simple;
	bh=UzicQI+g6FKBzC+Nb4M7IgG1UXKHmMqTY05oGm5JpeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQv9rEC6mflzxe8zUibsitnGv0xyG/nT8jTpxx1VyQRChnYVec97tNrQ1Vbo7S1K6C0xHfiB+aCeN9H1PpduyRgYgOIz4feUYv81JuBU59oaHOiI4jL6DYWHUG+xT5ynZ9KjIR3hjD+nLNsgs9h/qzJKAqEEf8BOxgG2UiucfS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZMmVYVu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZMmVYVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734646561; x=1766182561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UzicQI+g6FKBzC+Nb4M7IgG1UXKHmMqTY05oGm5JpeA=;
  b=fZMmVYVurDmJadQqSzqCv9lJ7NFLcTXwWlsdEL0VfCb1K4UeuNDTM16L
   sA2IWACDHhNSV2jVYgqgPpPhokV1R8xM2hkQbARch4FjdsiDo/DpOhwzE
   KqRxLTnEENZv25TcRIz33VeXBDwAnIYhh+Apy48vhEiWJILKxTu8pH8Em
   5/Sw5ZZi01Ho1NNQUtK44QSONx4FVsrHgD7g8bX+AaSO0iiE8w1Vr8V/r
   dSLk+3hR6b0yUFqczhPx9K8gbYafrH1ogk7lG/NqGRBeGQPXyEPgfJ89E
   m9PctW/D+qPRZ297RMh0sLNf4/utk6YvY5odUJMKZPriaqzo01ZOmgU3R
   A==;
X-CSE-ConnectionGUID: +8h/fUhbRSqHicTZr6xrwQ==
X-CSE-MsgGUID: cPOUYAInQxy6LLzKbmQ0NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38869063"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="38869063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 14:16:00 -0800
X-CSE-ConnectionGUID: TxS2XYBGRi6ZBP3BTyUo1w==
X-CSE-MsgGUID: 3lABmoaQQxSbtCdea6W5wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98859001"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Dec 2024 14:15:59 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOOoH-0000Zz-1h;
	Thu, 19 Dec 2024 22:15:57 +0000
Date: Fri, 20 Dec 2024 06:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 9/16]
 drivers/platform/chrome/cros_kbd_led_backlight.c:145: undefined reference to
 `cros_ec_cmd_xfer_status'
Message-ID: <202412200540.27Y5Rri7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   0ea005f637e8e1a643e2f943ff45f80e0f101a79
commit: df91ba37520e392eb56bc8ba08b9319b02db6216 [9/16] ANDROID: platform/chrome: cros_ec_proto: allow to build as module
config: x86_64-randconfig-104-20241219 (https://download.01.org/0day-ci/archive/20241220/202412200540.27Y5Rri7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412200540.27Y5Rri7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200540.27Y5Rri7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `keyboard_led_set_brightness_ec_pwm':
>> drivers/platform/chrome/cros_kbd_led_backlight.c:145: undefined reference to `cros_ec_cmd_xfer_status'
   ld: vmlinux.o: in function `keyboard_led_get_brightness_ec_pwm':
   drivers/platform/chrome/cros_kbd_led_backlight.c:165: undefined reference to `cros_ec_cmd_xfer_status'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +145 drivers/platform/chrome/cros_kbd_led_backlight.c

40f58143745eaa Tzung-Bi Shih 2022-05-23  125  
40f58143745eaa Tzung-Bi Shih 2022-05-23  126  static int
40f58143745eaa Tzung-Bi Shih 2022-05-23  127  keyboard_led_set_brightness_ec_pwm(struct led_classdev *cdev,
40f58143745eaa Tzung-Bi Shih 2022-05-23  128  				   enum led_brightness brightness)
40f58143745eaa Tzung-Bi Shih 2022-05-23  129  {
40f58143745eaa Tzung-Bi Shih 2022-05-23  130  	struct {
40f58143745eaa Tzung-Bi Shih 2022-05-23  131  		struct cros_ec_command msg;
40f58143745eaa Tzung-Bi Shih 2022-05-23  132  		struct ec_params_pwm_set_keyboard_backlight params;
40f58143745eaa Tzung-Bi Shih 2022-05-23  133  	} __packed buf;
40f58143745eaa Tzung-Bi Shih 2022-05-23  134  	struct ec_params_pwm_set_keyboard_backlight *params = &buf.params;
40f58143745eaa Tzung-Bi Shih 2022-05-23  135  	struct cros_ec_command *msg = &buf.msg;
40f58143745eaa Tzung-Bi Shih 2022-05-23  136  	struct keyboard_led *keyboard_led = container_of(cdev, struct keyboard_led, cdev);
40f58143745eaa Tzung-Bi Shih 2022-05-23  137  
40f58143745eaa Tzung-Bi Shih 2022-05-23  138  	memset(&buf, 0, sizeof(buf));
40f58143745eaa Tzung-Bi Shih 2022-05-23  139  
40f58143745eaa Tzung-Bi Shih 2022-05-23  140  	msg->command = EC_CMD_PWM_SET_KEYBOARD_BACKLIGHT;
40f58143745eaa Tzung-Bi Shih 2022-05-23  141  	msg->outsize = sizeof(*params);
40f58143745eaa Tzung-Bi Shih 2022-05-23  142  
40f58143745eaa Tzung-Bi Shih 2022-05-23  143  	params->percent = brightness;
40f58143745eaa Tzung-Bi Shih 2022-05-23  144  
40f58143745eaa Tzung-Bi Shih 2022-05-23 @145  	return cros_ec_cmd_xfer_status(keyboard_led->ec, msg);
40f58143745eaa Tzung-Bi Shih 2022-05-23  146  }
40f58143745eaa Tzung-Bi Shih 2022-05-23  147  

:::::: The code at line 145 was first introduced by commit
:::::: 40f58143745eaabc68ef44b068642ca3b38d23a6 platform/chrome: cros_kbd_led_backlight: support EC PWM backend

:::::: TO: Tzung-Bi Shih <tzungbi@kernel.org>
:::::: CC: Tzung-Bi Shih <tzungbi@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
