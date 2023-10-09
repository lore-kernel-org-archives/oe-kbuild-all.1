Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B623B7A3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 19:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1vOXkl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696880203; x=1728416203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2bTJY6gQrKLdoJhA4+4B5orfYrd/J409U9zpLAX2x90=;
  b=K1vOXkl1CSgjExQsnlG+0P4E8X3nw9fZOWAM142yhMTmIBtYIpEH8vLr
   r0npr/E/b/gO4ib2B9neiHnRpd0sZP3cmtfzfPZmlxR0awhC8ZEldnp5X
   NajVhB+jciOApqX47nsL7oUAq5nuomsaDOlFAJ2+GrD5Bq7pPE/X5GJ8K
   HRZkbA+oV6yoV0VOejegSePav/0yebYVzh6oM7hxbcNqQUYyuIukrWeow
   dbwj4amuf02roMfxL33UKSJMdqIfzHqa6mFO2SqR2IsO4A32mO+9iTB2E
   3MEiZYyhiTFBk7G+BX2kfx+h2Kwd0AEfqy+/2+dgAQH0SKcFiOuiioDEn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2816375"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2816375"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 12:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782616104"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="782616104"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Oct 2023 12:36:38 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpw3Q-0000am-1k;
	Mon, 09 Oct 2023 19:36:36 +0000
Date: Tue, 10 Oct 2023 03:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 6984/7092]
 drivers/leds/trigger/ledtrig-timer.c:129:47: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202310100348.sjW4vyZ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   0658f6011c3209faea496342f5be207192b3b640
commit: 3087949a0c8befa357afc6a7ac1791a717202753 [6984/7092] led: trig: timer: stop offloading on deactivation
config: i386-randconfig-061-20231010 (https://download.01.org/0day-ci/archive/20231010/202310100348.sjW4vyZ8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100348.sjW4vyZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100348.sjW4vyZ8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/leds/trigger/ledtrig-timer.c:129:47: sparse: sparse: Using plain integer as NULL pointer
   drivers/leds/trigger/ledtrig-timer.c:129:50: sparse: sparse: Using plain integer as NULL pointer

vim +129 drivers/leds/trigger/ledtrig-timer.c

   123	
   124	static void timer_trig_deactivate(struct led_classdev *led_cdev)
   125	{
   126		/* Stop blinking */
   127		led_set_brightness(led_cdev, LED_OFF);
   128		if (led_cdev->blink_set)
 > 129			led_cdev->blink_set(led_cdev, 0, 0);
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
