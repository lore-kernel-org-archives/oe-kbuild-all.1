Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2463EBF33
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361332; cv=none; b=Pp+hyHg7t1t8CH9nwgemMuH5WEqhUpmVAoF66nYF9UBVTlQ3BztKivG5+tcgf6agF6KJfT2F0V2O78FPawczplEja0AC0XCfwhHcDB1S/XRyxbr1NovXoHGM/vOEIeQGmfrN38ZMpdzdw0qHGrkKydUgnrmBFtWovvPcBbzhG30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361332; c=relaxed/simple;
	bh=jGdDSaS7ExvEX/pLGf1xYmEMSBqkEIKLe0/pJun81cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2WLk6nHkeoY7SnnfixnI6h1YJyESHyzgQ6Ty5jIkDmWf/isxk6yfqqtfRX/Jg8TQu2O1WYzn5PEf9ToMs3CSnBlR1lHxT+ZCjiesGRdhxI50iqzw6r2NVCVOgN0fhuKEJhRKTgnq/jOfGqhLH50+kemImTYATUXIKFhl9qNVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYz4YRS7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYz4YRS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769361330; x=1800897330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jGdDSaS7ExvEX/pLGf1xYmEMSBqkEIKLe0/pJun81cM=;
  b=FYz4YRS73zG18udbUgj1rwRVMOfXClOl7gunsTbdXvgPNxtvZnC6ooxw
   dz1de39rvx/rrPJgvFwQqBk3Nd55uzOzEhxaSUYucye5IROVqJ+2krGK4
   JIqC8lF08bEF+tCZUr/6KYRJt9QGTKtintF+7/Gx+fVEGWeAoeXFCi7YM
   W8RhrhheialuBtLxCnmcaznjSxyKzPvrA6fa3JKPjnPnJxCGTIVnx0BQj
   qf3t+ZGt6Eym+macDZu2ZvqZcB90Gilh+wKt7HNn0S5+y5D5+NvgxsjDx
   SEgUeBBOzBvM3SRhRiMfuKDFmSCrLtG4k086mKePfR9BJfr3QvAzRe06o
   Q==;
X-CSE-ConnectionGUID: BPeGmq0sT8+1r4OoqYHhGQ==
X-CSE-MsgGUID: C98yULJcTUyOhET3OnWKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96015911"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="96015911"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:15:29 -0800
X-CSE-ConnectionGUID: Ka6eOLGuQ8G9FfO7k7wmYQ==
X-CSE-MsgGUID: s57Pl8iHSE2wC9et/w4XUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207387497"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2026 09:15:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk3hu-00000000WHy-00wf;
	Sun, 25 Jan 2026 17:15:26 +0000
Date: Mon, 26 Jan 2026 01:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] leds: add delay_on, delay_off and invert
 attributes to disk trigger
Message-ID: <202601260156.pfrTEEer-lkp@intel.com>
References: <20260123-ledtrig_disk_-v1-3-07004756467b@posteo.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-ledtrig_disk_-v1-3-07004756467b@posteo.de>

Hi Markus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Probst/leds-dt-bindings-add-disk-trigger-led-pattern/20260124-030650
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260123-ledtrig_disk_-v1-3-07004756467b%40posteo.de
patch subject: [PATCH RFC 3/4] leds: add delay_on, delay_off and invert attributes to disk trigger
config: x86_64-buildonly-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260156.pfrTEEer-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260156.pfrTEEer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260156.pfrTEEer-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/leds/trigger/ledtrig-disk.c: In function 'pattern_init':
>> drivers/leds/trigger/ledtrig-disk.c:119:9: error: cleanup argument not a function
     119 |         u32 *pattern __free(kfree) = led_get_default_pattern(led_cdev, &size);
         |         ^~~
   drivers/leds/trigger/ledtrig-disk.c: In function 'ledtrig_disk_activate':
>> drivers/leds/trigger/ledtrig-disk.c:139:21: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     139 |         disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
         |                     ^~~~~~~
>> drivers/leds/trigger/ledtrig-disk.c:139:19: error: assignment to 'struct ledtrig_disk_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     139 |         disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
         |                   ^
   drivers/leds/trigger/ledtrig-disk.c: In function 'ledtrig_disk_blink_oneshot':
>> drivers/leds/trigger/ledtrig-disk.c:184:9: error: implicit declaration of function 'list_for_each_entry_rcu'; did you mean 'list_for_each_entry_from'? [-Wimplicit-function-declaration]
     184 |         list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         list_for_each_entry_from
>> drivers/leds/trigger/ledtrig-disk.c:184:61: error: 'trig_list' undeclared (first use in this function); did you mean 'lru_list'?
     184 |         list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
         |                                                             ^~~~~~~~~
         |                                                             lru_list
   drivers/leds/trigger/ledtrig-disk.c:184:61: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/leds/trigger/ledtrig-disk.c:184:71: error: expected ';' before '{' token
     184 |         list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
         |                                                                       ^~
         |                                                                       ;
>> drivers/leds/trigger/ledtrig-disk.c:181:35: warning: unused variable 'disk_data' [-Wunused-variable]
     181 |         struct ledtrig_disk_data *disk_data;
         |                                   ^~~~~~~~~


vim +119 drivers/leds/trigger/ledtrig-disk.c

   114	
   115	static void pattern_init(struct led_classdev *led_cdev, struct ledtrig_disk_data *disk_data)
   116	{
   117		unsigned int size = 0;
   118	
 > 119		u32 *pattern __free(kfree) = led_get_default_pattern(led_cdev, &size);
   120		if (!pattern)
   121			return;
   122	
   123		if (size != 3) {
   124			dev_warn(led_cdev->dev,
   125				 "Expected 3 but got %u values for delays + invert pattern\n",
   126				 size);
   127			return;
   128		}
   129	
   130		disk_data->delay_on = pattern[0];
   131		disk_data->delay_off = pattern[1];
   132		disk_data->invert = !!pattern[2];
   133	}
   134	
   135	static int ledtrig_disk_activate(struct led_classdev *led_cdev)
   136	{
   137		struct ledtrig_disk_data *disk_data;
   138	
 > 139		disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
   140		if (!disk_data)
   141			return -ENOMEM;
   142	
   143		disk_data->delay_on = DEFAULT_BLINK_DELAY;
   144		disk_data->delay_off = DEFAULT_BLINK_DELAY;
   145	
   146		led_set_trigger_data(led_cdev, disk_data);
   147	
   148		if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
   149			pattern_init(led_cdev, disk_data);
   150			/*
   151			 * Mark as initialized even on pattern_init() error because
   152			 * any consecutive call to it would produce the same error.
   153			 */
   154			led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
   155		}
   156	
   157		led_set_brightness_nosleep(led_cdev, disk_data->invert ? LED_FULL : LED_OFF);
   158	
   159		return 0;
   160	}
   161	
   162	static struct led_trigger ledtrig_disk = {
   163		.name = "disk-activity",
   164		.activate = ledtrig_disk_activate,
   165		.groups = ledtrig_disk_groups,
   166	};
   167	static struct led_trigger ledtrig_disk_read = {
   168		.name = "disk-read",
   169		.activate = ledtrig_disk_activate,
   170		.groups = ledtrig_disk_groups,
   171	};
   172	static struct led_trigger ledtrig_disk_write = {
   173		.name = "disk-write",
   174		.activate = ledtrig_disk_activate,
   175		.groups = ledtrig_disk_groups,
   176	};
   177	
   178	static void ledtrig_disk_blink_oneshot(struct led_trigger *trig)
   179	{
   180		struct led_classdev *led_cdev;
 > 181		struct ledtrig_disk_data *disk_data;
   182	
   183		rcu_read_lock();
 > 184		list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
   185			disk_data = led_get_trigger_data(led_cdev);
   186			led_blink_set_oneshot(led_cdev, &disk_data->delay_on, &disk_data->delay_off,
   187					      disk_data->invert);
   188		}
   189		rcu_read_unlock();
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
