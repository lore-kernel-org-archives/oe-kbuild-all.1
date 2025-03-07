Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B63F208973
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741384495; cv=none; b=XfyV7GO11uAP6uxID9+t3Ql76QUUrdFvB/FALHPOlWnviSEVaGOBWY3iaO3uTIk6T3un5BVZ8eYtoclotxhuHShYhbhP7+T5JT9q3ktbTs0RWnIN7LhPF6s20Sbs2uRxUNbJ7r9GBDbFVy+aLd6OWAmIPQWFUmJAOz4JrIet318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741384495; c=relaxed/simple;
	bh=TUCWj5HBSg4xcrJ4MYgOMqCQVulaWkW58cDJXX01iNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=stErPT3KYLG8IKWSS40yPUWqo60GgDVBexLE34f49zfOgY6YJpoPBs8FTTk5W5bzHVhYKD5MfxLL7XtPKKBeIKRa2J1jF5E3xzP0ny5l2khlP8Hp+wiA1r2TdLSyiGyx0+v1VHHvq/xhHwytFIZFqZ8l9PwrM8oZE+1LW2oZZtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5uadw+E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5uadw+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741384493; x=1772920493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TUCWj5HBSg4xcrJ4MYgOMqCQVulaWkW58cDJXX01iNk=;
  b=S5uadw+E3bvZGxycNeUToEDkMnDCbjqNWDHMvDDKaxTu0Ql+rMNRiZmy
   GEfLQLra35z3IDGaT6GxcwT8Q03hWWvyAPoaNEyydDjQRmCSG+9hVeQ9X
   IxL+obrcCFJAWD21I0YnJi8MbYWXKDuUGa/7JvUm/a7dhsgMkymJiOpHD
   Ti0uECxRjegoODYs/txUJXJdP+HgYVe2HwXRkHQdLi5PLzg5p2SWsjVo1
   mXTrat9B/OWULRK3p3yJnfaeUykpwPe7K/bm4IdhJQG9yuJqBUnhUksOY
   +ojGt5EhHmj91vTvGNfeAjCygLVscaZWhgPECjQN7rwIXjTff9BnWLP85
   A==;
X-CSE-ConnectionGUID: vDzcmDQkQySFdGr1IrMhxg==
X-CSE-MsgGUID: hFraf3uLRzmAX2Jj/sP2pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="30023828"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="30023828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 13:54:52 -0800
X-CSE-ConnectionGUID: i3lC6bgLScmrwwbMqTgObg==
X-CSE-MsgGUID: /qCgFnPKTxuxI2P51o7YaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="119433276"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2025 13:54:51 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqfeb-00016h-2U;
	Fri, 07 Mar 2025 21:54:49 +0000
Date: Sat, 8 Mar 2025 05:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 drivers/platform/chrome/cros_kbd_led_backlight.c:145:undefined reference to
 `cros_ec_cmd_xfer_status'
Message-ID: <202503080547.9ft3zwnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   662b41bcd3134a4bbc569f0edc00ff824197a171
commit: df91ba37520e392eb56bc8ba08b9319b02db6216 [2/2] ANDROID: platform/chrome: cros_ec_proto: allow to build as module
config: arm64-randconfig-004-20250308 (https://download.01.org/0day-ci/archive/20250308/202503080547.9ft3zwnK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080547.9ft3zwnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080547.9ft3zwnK-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/platform/chrome/cros_kbd_led_backlight.o: in function `keyboard_led_set_brightness_ec_pwm':
>> drivers/platform/chrome/cros_kbd_led_backlight.c:145:(.text+0x2ec): undefined reference to `cros_ec_cmd_xfer_status'
   aarch64-linux-ld: drivers/platform/chrome/cros_kbd_led_backlight.o: in function `keyboard_led_get_brightness_ec_pwm':
   drivers/platform/chrome/cros_kbd_led_backlight.c:165:(.text+0x398): undefined reference to `cros_ec_cmd_xfer_status'


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
