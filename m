Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C28817D9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693726309; x=1725262309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMeb+qz1oi8rdmXQoZ84tZAN3Q7L9QYZ4YK0ad3ciYc=;
  b=J9tte5vkuFwOlIbcU9Go+QO9rDTOUZVE+QQDb/qThBP2BrN45xw2H3R1
   HC9UmrguB6PIY3TZjieV52arwpZkk8EOwZa3zKBQr2N38rrMi47M5qX0t
   GxbteFgoRb8j3TPFyWzRY706CX/jqwmFHVsquu7LpnbKAnThECDcKJcjF
   b0NAZwgTg+UWrb6BEZOwCPHL8syBEhrSLU6x1SeMWe0+Y7OHOOAglhsqh
   DcWPCu1/C/A9ToA2t//y8nucewAj0y1bjLmnSEkMoRDYOIz4hSKPky4KU
   EI++weKRBgLQ6F/Pxa1dsf7QHJrj8tAF2Ho9D6R/O34UVBt3zEp5MY2Aw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="442832258"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="442832258"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 00:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="805920617"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="805920617"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Sep 2023 00:31:47 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qchaD-00030H-19;
	Sun, 03 Sep 2023 07:31:45 +0000
Date: Sun, 3 Sep 2023 15:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_3 14417/14511]
 drivers/leds/trigger/ledtrig-timer.c:129:47: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202309031543.Q8rbknbX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_3
head:   bd334514d2acb4d7ae8675e52ad6faf9cd7e64b6
commit: 13d269136409558402f267abdb2729d34731f371 [14417/14511] led: trig: timer: stop offloading on deactivation
config: x86_64-randconfig-122-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031543.Q8rbknbX-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031543.Q8rbknbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031543.Q8rbknbX-lkp@intel.com/

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
