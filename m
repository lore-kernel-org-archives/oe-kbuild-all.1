Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3DC8F70
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723368257; cv=none; b=lylmrxEuAWbSCdkPHNl9tK1WfdIHyz66Gp269s3BjCvPj9LCzcUKOpioU4k6kqa8+IJ/k5FHM1BCtDWYjCkzGECvnn/jzUz993/H87DqRAiMTPYbaj5lD4esdcyff/EwqXIypuA2qa7J4ijRC8guzsny2L1DN0nLEqwhnf2SF2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723368257; c=relaxed/simple;
	bh=1ptPh6ol4+J1FNOSRZ8rj3pGAvl+pUeQ9ws5eIGlKVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kn2AAPlJwcQs2mwOvupSUkwckRWvq8NbGr49UdRFEvIwIvUvqmUEuBv8zEV0U2VJEDZVJG8gXkJC1EJBSeMyJ44xgOU0W+3tv5Ii42sjV3W6EJy45zOEZvH6QUL04gMXUEp/pLIpeKDEtftCncjrQp6bipeGiAMqG1H5Cm8EyBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQFSGOUg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQFSGOUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723368256; x=1754904256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ptPh6ol4+J1FNOSRZ8rj3pGAvl+pUeQ9ws5eIGlKVk=;
  b=HQFSGOUgg6K/aDaAjQgjKD091h4guyH/wFDmEaDJGdtUi8RgclLoyZmi
   f74L8BY8Rht2B+KgQGCyP0L8p8IVa3IItyHnVu8pgVbL2V3GV/AR2euwY
   ix7LqYcVQL2SfyvlzYDVYymXc6KluTHKe7vQHJ4fkZJl9das0ebJ+9msS
   stECYsdLgz5dtGRaNOKW6EkfQ/52HYV23gHe+L5cusdw3nfslvTS74n4Z
   Q8GfIDm2ABBO8JYAVuQSrxjuboWQoFMGvC+A1mBQvhoAArZ8zVVeKjfyI
   xSJlhxy9xeBLieo0sAALaR/AfS3SNB/qeIWUQJ6vEPxWo9gvEX9JhbHd7
   g==;
X-CSE-ConnectionGUID: bsva463SQiG49E04gRJAqA==
X-CSE-MsgGUID: fbL9djT6SzycCMjaFKikRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="39000820"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="39000820"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 02:24:16 -0700
X-CSE-ConnectionGUID: ZWfsyi8+QIuh19YaO8nHcw==
X-CSE-MsgGUID: 6YAXCMOxQh6vl4CIFOj1HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="57913937"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Aug 2024 02:24:14 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd4o8-000AiL-0k;
	Sun, 11 Aug 2024 09:24:12 +0000
Date: Sun, 11 Aug 2024 17:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Joseph Strauss <jstrauss@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 2040/3984]
 drivers/leds/leds-blinkm.c:440:undefined reference to
 `led_mc_calc_color_components'
Message-ID: <202408111700.OhOvZxD1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: 56e8c56c9af0df8b6de7bc4b6d9a2f4570b055db [2040/3984] leds: Add multicolor support to BlinkM LED driver
config: m68k-randconfig-r064-20240811 (https://download.01.org/0day-ci/archive/20240811/202408111700.OhOvZxD1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111700.OhOvZxD1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111700.OhOvZxD1-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/leds/leds-blinkm.o: in function `blinkm_set_mc_brightness':
>> drivers/leds/leds-blinkm.c:440:(.text+0x4b2): undefined reference to `led_mc_calc_color_components'
   m68k-linux-ld: drivers/leds/leds-blinkm.o: in function `blinkm_probe':
>> include/linux/led-class-multicolor.h:70:(.text+0x740): undefined reference to `led_classdev_multicolor_register_ext'


vim +440 drivers/leds/leds-blinkm.c

   432	
   433	static int blinkm_set_mc_brightness(struct led_classdev *led_cdev,
   434					 enum led_brightness value)
   435	{
   436		struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
   437		struct blinkm_led *led = mcled_cdev_to_led(mcled_cdev);
   438		struct blinkm_data *data = i2c_get_clientdata(led->i2c_client);
   439	
 > 440		led_mc_calc_color_components(mcled_cdev, value);
   441	
   442		data->next_red = (u8) mcled_cdev->subled_info[RED].brightness;
   443		data->next_green = (u8) mcled_cdev->subled_info[GREEN].brightness;
   444		data->next_blue = (u8) mcled_cdev->subled_info[BLUE].brightness;
   445	
   446		blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
   447	
   448		return 0;
   449	}
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
