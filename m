Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64335E06C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 20:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709152360; cv=none; b=hNDBQHwIj8J4mIw/ab2ZdXemlIAgk+PlKy0RMOMXrzCqfGb3QxBVVhPZop3JKe7Zm1mHnMtRGQL3jqxQZMpliBh5LwqIH3JuU+KZVpheaiPUhVuhE6alTdbYC7KnkbJq6+qftC2lgCmFB6FvxvKEECWehg/5XyAT4GyLMb4933o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709152360; c=relaxed/simple;
	bh=M3bi+pw0vznQwhJUCLmyNRw6pbDTeWTqTyf/ZDJxsKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0r6aziGV2YawoPzKor2UH6WA5z7rUCIU4o0DMBm6az9LGhCdkfuEJ/nMBeE2xRbOOgJQzYCCLvha6U6glg0OBkOzI/HvqzNNd9ofPJR4Yw4/vhwLa25P/3IZWkAsnOtptXsROxP2IycfAASyrCmj67DgMarSoXxiLtpm7y4H7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgxeEcHa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgxeEcHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709152359; x=1740688359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3bi+pw0vznQwhJUCLmyNRw6pbDTeWTqTyf/ZDJxsKw=;
  b=RgxeEcHaA94xBVPdOXhVwqxQ15E/qpQwWFKcPlNOdbdEZnZZuCmeRqa9
   vs+iIoadRSGC5ZRATy+I3Fs7maDZpIq68Jb/6MftCbH6A+SZhMrisR2VQ
   xyWz9C3e9sIQTtPxUHYNQ6yFViHRhsI/4sKmUiOvdIGdVqg2Yden5ZYME
   tVed/62xvv/WF8B+zhn97Xpg9j+6UG1tAi8jfvhj2ggIl15bSDIGPP4Nq
   m3xO2zKt1SCjwav3G0OmYhm/rr5+mG6OyEJaYouwiYb+6aRLE9F5QhcWO
   LqUvzZjTtriXaxW1/rNqRlme5+8Pg/ypYjiI6nkAj8PTOsPBoQdf3FKYG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14291632"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="14291632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 12:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="38593224"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Feb 2024 12:32:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfQbR-000CNF-2p;
	Wed, 28 Feb 2024 20:32:33 +0000
Date: Thu, 29 Feb 2024 04:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [linux-next:master 5947/10830]
 include/linux/leds.h:299:(.text.igc_led_setup+0x170): undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202402290415.zUrgBrwr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: ea578703b03d5d651b091c39f717dc829155b520 [5947/10830] igc: Add support for LEDs on i225/i226
config: powerpc-randconfig-r004-20230504 (https://download.01.org/0day-ci/archive/20240229/202402290415.zUrgBrwr-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290415.zUrgBrwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290415.zUrgBrwr-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/net/ethernet/intel/igc/igc_leds.o: in function `devm_led_classdev_register':
>> include/linux/leds.h:299:(.text.igc_led_setup+0x170): undefined reference to `devm_led_classdev_register_ext'


vim +299 include/linux/leds.h

7c322056e3564d Jacek Anaszewski 2019-08-26  295  
7c322056e3564d Jacek Anaszewski 2019-08-26  296  static inline int devm_led_classdev_register(struct device *parent,
7c322056e3564d Jacek Anaszewski 2019-08-26  297  					     struct led_classdev *led_cdev)
7c322056e3564d Jacek Anaszewski 2019-08-26  298  {
7c322056e3564d Jacek Anaszewski 2019-08-26 @299  	return devm_led_classdev_register_ext(parent, led_cdev, NULL);
7c322056e3564d Jacek Anaszewski 2019-08-26  300  }
ec28a8cfdce630 Dan Murphy       2019-10-02  301  void led_classdev_unregister(struct led_classdev *led_cdev);
ec28a8cfdce630 Dan Murphy       2019-10-02  302  void devm_led_classdev_unregister(struct device *parent,
ca1bb4ee4c3a01 Bjorn Andersson  2015-02-23  303  				  struct led_classdev *led_cdev);
ec28a8cfdce630 Dan Murphy       2019-10-02  304  void led_classdev_suspend(struct led_classdev *led_cdev);
ec28a8cfdce630 Dan Murphy       2019-10-02  305  void led_classdev_resume(struct led_classdev *led_cdev);
c72a1d608dd0eb Richard Purdie   2006-03-31  306  

:::::: The code at line 299 was first introduced by commit
:::::: 7c322056e3564da1b5bdc3f3cb79229582955eb2 leds: Replace {devm_}led_classdev_register() macros with inlines

:::::: TO: Jacek Anaszewski <jacek.anaszewski@gmail.com>
:::::: CC: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
