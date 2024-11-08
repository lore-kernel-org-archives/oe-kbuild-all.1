Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD84233D8D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731103344; cv=none; b=dBsbmun3SvVlrWhLM58D8m/XHb9AjjzGtyEvqvYEL4mmqji9fuH4un7QRhz8j+3jxFZvztrYznKTm9RxCeXLqTneKx8R++SEGeghS3fNSajbn9H9hjv6Du3/9kqu/v25tb2MMNtVLOjiK+x3XshsQtisPBmPOV2W8QmuRHCgAGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731103344; c=relaxed/simple;
	bh=MHaMxNH+3WBPAepLrwMFHuUU1pv5tsvRGL+nHShMJyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yk+vIazDNYuYQGkTquMgQIMIgW6peMSJzh03FnuDIOTyz5Ss5eDmbLw8GdkXw2ydMN9xrWkrRTozl0dvdGXWRD+Y3tHpq8FYazt5KlrOCs7xDYsvzES+Lx/FcbslGgDgCooH0WuG7xr3pk5R+s3Qhtzd76frWso8BCpKm6kd7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcosSR15; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcosSR15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731103342; x=1762639342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MHaMxNH+3WBPAepLrwMFHuUU1pv5tsvRGL+nHShMJyI=;
  b=OcosSR15ASfnpE0djeesqC2bJZ17RCzOQHlqNvWusPuPMzcSN6jH63dr
   dH77ZFWqNTflDGJ95V9QXU/NPKSJJCM8UcZyUADNf6ouY4V6FikC+E+yc
   lZhZhGLQ+1f/6w6zKnNZ4sWCrkVRW/p0nLU+D2NSBS6orxzBYbrX8muJQ
   ynjir1iJaD+NZnvIiguPlxlCV288pWlv3RIKbBW9muhNbuJbhgv67no0a
   ZQNaTUecdcpKck2xS9kUabHHB6+Tjv2FL3/2Fw5Kfudfe7OQH/6jkX9+v
   F4BqjUAHLpdg3HmM0cot7XWLQqJnXciAvsLdlqKCX4nk2uvnhe3tEs6wn
   w==;
X-CSE-ConnectionGUID: mjjrPTVNQPi2A7BsVvQZ6w==
X-CSE-MsgGUID: WZRlVoyVTUql8X0rxOBoww==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="56398637"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="56398637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 14:02:21 -0800
X-CSE-ConnectionGUID: 9DCADrmhS1CPXiWGA3TuMA==
X-CSE-MsgGUID: yJlNy2WyQZuF1b+eVCOYlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="90860558"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2024 14:02:21 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9X3a-000rpa-1l;
	Fri, 08 Nov 2024 22:02:18 +0000
Date: Sat, 9 Nov 2024 06:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 23/149] drivers/media/i2c/gc5035.c:1173:2-3:
 Unneeded semicolon
Message-ID: <202411090552.TIs2P4Mu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   89f5fb0eb30b534192c362f38bf8e075040e5008
commit: da320c5527fa9b5b7cef05b3c43c895117b4c102 [23/149] BACKPORT: FROMLIST: media: i2c: Add a driver for the Galaxycore GC5035 sensor
config: x86_64-randconfig-r053-20241109 (https://download.01.org/0day-ci/archive/20241109/202411090552.TIs2P4Mu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090552.TIs2P4Mu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/i2c/gc5035.c:1173:2-3: Unneeded semicolon

vim +1173 drivers/media/i2c/gc5035.c

  1129	
  1130	static int gc5035_set_ctrl(struct v4l2_ctrl *ctrl)
  1131	{
  1132		struct gc5035 *gc5035 = container_of(ctrl->handler,
  1133						     struct gc5035, ctrl_handler);
  1134		struct i2c_client *client = gc5035->client;
  1135		s64 max;
  1136		int ret;
  1137	
  1138		/* Propagate change of current control to all related controls */
  1139		switch (ctrl->id) {
  1140		case V4L2_CID_VBLANK:
  1141			/* Update max exposure while meeting expected vblanking */
  1142			max = gc5035->cur_mode->height + ctrl->val
  1143				- GC5035_EXPOSURE_MARGIN;
  1144			__v4l2_ctrl_modify_range(gc5035->exposure,
  1145						 gc5035->exposure->minimum, max,
  1146						 gc5035->exposure->step,
  1147						 gc5035->exposure->default_value);
  1148			break;
  1149		}
  1150	
  1151		if (!pm_runtime_get_if_in_use(&client->dev))
  1152			return 0;
  1153	
  1154		switch (ctrl->id) {
  1155		case V4L2_CID_EXPOSURE:
  1156			ret = gc5035_set_exposure(gc5035, ctrl->val);
  1157			break;
  1158		case V4L2_CID_ANALOGUE_GAIN:
  1159			ret = gc5035_set_analogue_gain(gc5035, ctrl->val);
  1160			break;
  1161		case V4L2_CID_DIGITAL_GAIN:
  1162			ret = gc5035_set_digital_gain(gc5035, ctrl->val);
  1163			break;
  1164		case V4L2_CID_VBLANK:
  1165			ret = gc5035_set_vblank(gc5035, ctrl->val);
  1166			break;
  1167		case V4L2_CID_TEST_PATTERN:
  1168			ret = gc5035_enable_test_pattern(gc5035, ctrl->val);
  1169			break;
  1170		default:
  1171			ret = -EINVAL;
  1172			break;
> 1173		};
  1174	
  1175		pm_runtime_put(&client->dev);
  1176	
  1177		return ret;
  1178	}
  1179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
