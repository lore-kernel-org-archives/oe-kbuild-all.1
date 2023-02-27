Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0506A6D18
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677506807; x=1709042807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U447WiEhGUcWazL7gVCFthlL8DrTdQqCI73rby6fhg8=;
  b=jjmMJJv638r5iMlYljMTPeT92BKUogB3rxZHgGFw+Nx98B9Tt0bBj6Jg
   9aFdjmPA/BhJrCafQeHGuXyh+DjeiGwpgOW/kgfqWTBCeTjsLHtH7pQ18
   muROgCE0efI4i+M3G6jwfJHkXSnTofBonQNGKBGwvk2DhskZGYMqIg+6U
   Srm5RpSa5Nqm7I82DFUU64BMstdbAUP++yQ8R45wFlBkYm/kCiDoBc6L1
   GpLYTk1qRY/QKAQPfnYKu7VEEhz9GTFnDi41ODVeNeV0SatmBI+gPbD9D
   dobje81nWhPeyP/PlazgbnkXowTDOyG0gzhQEHWzESCVhRGJfQT/orVcW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="331337486"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="331337486"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 06:06:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="797647369"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="797647369"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Feb 2023 06:06:44 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWe9L-0004Tt-2i;
	Mon, 27 Feb 2023 14:06:43 +0000
Date: Mon, 27 Feb 2023 22:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 162/583]
 drivers/mfd/rpisense-core.c:141:34: warning: 'rpisense_core_id' defined but
 not used
Message-ID: <202302272156.eWeHdwWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 74d3a690bc07324be6f5444090d2e91b7a985f97 [162/583] mfd: Add Raspberry Pi Sense HAT core driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230227/202302272156.eWeHdwWV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/l1k/linux/commit/74d3a690bc07324be6f5444090d2e91b7a985f97
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 74d3a690bc07324be6f5444090d2e91b7a985f97
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/char/broadcom/ drivers/input/joystick/ drivers/mfd/ drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272156.eWeHdwWV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/rpisense-core.c:141:34: warning: 'rpisense_core_id' defined but not used [-Wunused-const-variable=]
     141 | static const struct of_device_id rpisense_core_id[] = {
         |                                  ^~~~~~~~~~~~~~~~
--
>> drivers/video/fbdev/rpisense-fb.c:273:34: warning: 'rpisense_fb_device_id' defined but not used [-Wunused-variable]
     273 | static struct platform_device_id rpisense_fb_device_id[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/rpisense-fb.c:266:34: warning: 'rpisense_fb_id' defined but not used [-Wunused-const-variable=]
     266 | static const struct of_device_id rpisense_fb_id[] = {
         |                                  ^~~~~~~~~~~~~~
--
>> drivers/input/joystick/rpisense-js.c:134:34: warning: 'rpisense_js_device_id' defined but not used [-Wunused-variable]
     134 | static struct platform_device_id rpisense_js_device_id[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
>> drivers/input/joystick/rpisense-js.c:127:34: warning: 'rpisense_js_id' defined but not used [-Wunused-const-variable=]
     127 | static const struct of_device_id rpisense_js_id[] = {
         |                                  ^~~~~~~~~~~~~~


vim +/rpisense_core_id +141 drivers/mfd/rpisense-core.c

   139	
   140	#ifdef CONFIG_OF
 > 141	static const struct of_device_id rpisense_core_id[] = {
   142		{ .compatible = "rpi,rpi-sense" },
   143		{ },
   144	};
   145	MODULE_DEVICE_TABLE(of, rpisense_core_id);
   146	#endif
   147	
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
