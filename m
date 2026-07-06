Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA9F3F410E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330011; cv=none; b=nwfvpiVRUa4tq4dU2lLyqN+WuBKM/tVStCgwqTd7KiWPBTbKnVX4NSRhBFkz1/CxbazG5W/g0IBAdh7PN5MVEjoMytj1SfUa0kdEjvtvMBTCCoNY8ObB8lJIAbZC3QogmAlzyV8AzoBmFSpEB6bVnj+NF2Sx47jkJUvK09mKMnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330011; c=relaxed/simple;
	bh=B/fcRBI6Pk5OZ8bvKQdBzo0UtQnWdX7NHC4iSbRDoy0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BDH/XsGjpEI6fE2hctWMMxkwogeP8pV5wsRv/bnStNlo6j4OqAkU7Lxr0+e/xqCbKo3V4AvBUwxArnKMBD5w4A1KNSm/WTbBq5sJvT8j/UhK0e77KBADMc/LfmaGpBwAs9g4wM1z9f9YlxWOhpKthrspSXYzwB+1qaXlfisqbXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZA/a5xI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZA/a5xI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783330008; x=1814866008;
  h=date:from:to:cc:subject:message-id;
  bh=B/fcRBI6Pk5OZ8bvKQdBzo0UtQnWdX7NHC4iSbRDoy0=;
  b=WZA/a5xIph7OhqkDBDYIT9Y9KfpI7hxjc5rdVZ1Hh6bE5Pb4C/e/oCyW
   gX+csRa5jkboOaxbmn8/PI8chBwAPgONfO52FuemgZXKQe0esnUTEJJv6
   4/Iwr59GS6YfeaPj2LXGzBtB04L2c6V7nYBI7XKEMrGAKvUF1n21yCFPx
   /UL8w3OckwVAF+TiHC0+iTuo9YxQ8tM3oH3JA9wsBCTBixL+UtFcxzYfR
   G+SjrFJSd7ErE29fKgrE3Xtv2PR+euXhMqXK9n5iOn9upI0vFyo8DxZym
   pAwKRpKz0xOdosYsNCpzISt6ILxA8X2GI6dvbAI0TKqYXycevH8Cw9Ykp
   g==;
X-CSE-ConnectionGUID: I1h3vyHjQ3Om6t5EC9hqGw==
X-CSE-MsgGUID: Mlvvm33RTFiT2+T5Qe7DDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="82939001"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="82939001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:26:46 -0700
X-CSE-ConnectionGUID: 0rakbM+CScKF2f6djghEEQ==
X-CSE-MsgGUID: PYH6Fu78QYS5P3l7ovTPfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257995374"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Jul 2026 02:26:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgfb7-00000000EEj-42i8;
	Mon, 06 Jul 2026 09:26:41 +0000
Date: Mon, 06 Jul 2026 17:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 118/215]
 drivers/leds/trigger/ledtrig-timer.c:124:47: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202607061755.nDzp2X1X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: f49348c5d06766b552930c08ce1551fc89df0fb1 [118/215] led: trig: timer: stop offloading on deactivation
config: alpha-randconfig-r111-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061755.nDzp2X1X-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061755.nDzp2X1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061755.nDzp2X1X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/leds/trigger/ledtrig-timer.c:124:47: sparse: sparse: Using plain integer as NULL pointer
   drivers/leds/trigger/ledtrig-timer.c:124:50: sparse: sparse: Using plain integer as NULL pointer

vim +124 drivers/leds/trigger/ledtrig-timer.c

   118	
   119	static void timer_trig_deactivate(struct led_classdev *led_cdev)
   120	{
   121		/* Stop blinking */
   122		led_set_brightness(led_cdev, LED_OFF);
   123		if (led_cdev->blink_set)
 > 124			led_cdev->blink_set(led_cdev, 0, 0);
   125	}
   126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
