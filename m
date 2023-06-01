Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB07947017
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685643637; x=1717179637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oMS/0nzg5rGrOCNyCGd3KWrLeTU/0aafWVjcn14b06I=;
  b=m+3u7B7sEFk/RO0x2zJzlElR1P4WJCkE+pjlnNWDwAcwRoJZldSHELbA
   uk0724drSb0rmJeJ9GI6RCExWBQ2n7EhE1KsemaoIc/fco3QOyjbWlW6Z
   +iDlqPaIzhPYnnA93FefKkLPlpRsnt2x4bIoCikq3Y9C8FezhUDP1YyNn
   vKFEuMx8mWkLdXHNA11uVjtjgKnt9A/BjsICzpg4/H2UTpFALDp4oR9o8
   5v//gXupBYTrm0EO5/1Yjs/elVv5yZtP/71SijRX+gTS1KPS1hbXbI4Ou
   j7ywrG1AwdQObgSSawH6jr5B1NTlGsMMLkwlx6eTBNryvCGBvaklgFkQ/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335264709"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="335264709"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 11:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777328236"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="777328236"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2023 11:20:36 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4muZ-0002aY-2s;
	Thu, 01 Jun 2023 18:20:35 +0000
Date: Fri, 2 Jun 2023 02:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 8/8]
 include/linux/led-class-multicolor.h:105: undefined reference to
 `devm_led_classdev_multicolor_register_ext'
Message-ID: <202306020258.rmVVCAGf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   76ef69669605fbb1eefd5d5f432ba90bbc91a264
commit: 9c8074484f9fb7379686d962714d40768288678f [8/8] UPSTREAM: crypto: algboss - compile out test-related code when tests disabled
config: i386-randconfig-i001-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020258.rmVVCAGf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout 9c8074484f9fb7379686d962714d40768288678f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020258.rmVVCAGf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-playstation.o: in function `devm_led_classdev_multicolor_register':
>> include/linux/led-class-multicolor.h:105: undefined reference to `devm_led_classdev_multicolor_register_ext'
   ld: drivers/hid/hid-playstation.o: in function `dualsense_lightbar_set_brightness':
>> drivers/hid/hid-playstation.c:867: undefined reference to `led_mc_calc_color_components'


vim +105 include/linux/led-class-multicolor.h

55d5d3b46b08a4d Dan Murphy 2020-07-16  101  
55d5d3b46b08a4d Dan Murphy 2020-07-16  102  static inline int devm_led_classdev_multicolor_register(struct device *parent,
55d5d3b46b08a4d Dan Murphy 2020-07-16  103  					     struct led_classdev_mc *mcled_cdev)
55d5d3b46b08a4d Dan Murphy 2020-07-16  104  {
55d5d3b46b08a4d Dan Murphy 2020-07-16 @105  	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
55d5d3b46b08a4d Dan Murphy 2020-07-16  106  							 NULL);
55d5d3b46b08a4d Dan Murphy 2020-07-16  107  }
55d5d3b46b08a4d Dan Murphy 2020-07-16  108  

:::::: The code at line 105 was first introduced by commit
:::::: 55d5d3b46b08a4dc0b05343d24640744e7430ed7 leds: multicolor: Introduce a multicolor class definition

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Pavel Machek <pavel@ucw.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
