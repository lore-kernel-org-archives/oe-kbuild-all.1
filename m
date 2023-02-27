Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A52F3A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677516533; x=1709052533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/4u6ehDkGXWV0iCKa4t2KCaW+FTeA3ZUqIPeIbkJU8=;
  b=TsmYHxNvqbuuZs23fWlpYAyw26lgVu/njp//eKWqofGndSAT4r/oqbvK
   IlkEcbbuW7S3PG5AF50+Ujkkb4ve/c86faCQJgVdkyvjFCbDbiYSlqSDt
   Rs+AUd8kwnI70AL4R9G8azRNwPVgAP85MCDdFmmn/nWW7+Ywls4mg75UL
   IGpCXD52vKoFVs9/orXkn1yDDnT+KYegPahvn9YuJpDcpWpF/wuKoBoVO
   5Ol9mJSbtqU4Cg7tae3KWDk3LfouI+ovEQkWBVvKk1+1y/RAYEhCUHdiT
   29DZGnP9pm9YbaFdNHFjMnNaQdCqEiMsBTMXtzLjKLwyaClkSp9R5YHEy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335389721"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="335389721"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 08:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1002843938"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="1002843938"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2023 08:48:51 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWggE-0004bL-2F;
	Mon, 27 Feb 2023 16:48:50 +0000
Date: Tue, 28 Feb 2023 00:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 162/583]
 drivers/video/fbdev/rpisense-fb.c:203:34: error: implicit declaration of
 function 'vzalloc'; did you mean 'kvzalloc'?
Message-ID: <202302280000.lXcxjtP8-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230228/202302280000.lXcxjtP8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/74d3a690bc07324be6f5444090d2e91b7a985f97
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 74d3a690bc07324be6f5444090d2e91b7a985f97
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/char/broadcom/ drivers/gpio/ drivers/media/i2c/ drivers/staging/fbtft/ drivers/staging/vc04_services/ drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280000.lXcxjtP8-lkp@intel.com/

Note: the l1k/rpi-6.2.y-await-linktraining HEAD f3a9201f7f484c1295cdec53c1b9bd2a19ffb231 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/video/fbdev/rpisense-fb.c: In function 'rpisense_fb_probe':
>> drivers/video/fbdev/rpisense-fb.c:203:34: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
     203 |         rpisense_fb_param.vmem = vzalloc(rpisense_fb_param.vmemsize);
         |                                  ^~~~~~~
         |                                  kvzalloc
   drivers/video/fbdev/rpisense-fb.c:203:32: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     203 |         rpisense_fb_param.vmem = vzalloc(rpisense_fb_param.vmemsize);
         |                                ^
>> drivers/video/fbdev/rpisense-fb.c:246:9: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
     246 |         vfree(rpisense_fb_param.vmem);
         |         ^~~~~
         |         kfree
   cc1: some warnings being treated as errors


vim +203 drivers/video/fbdev/rpisense-fb.c

   193	
   194	static int rpisense_fb_probe(struct platform_device *pdev)
   195	{
   196		struct fb_info *info;
   197		int ret = -ENOMEM;
   198		struct rpisense_fb *rpisense_fb;
   199	
   200		rpisense = rpisense_get_dev();
   201		rpisense_fb = &rpisense->framebuffer;
   202	
 > 203		rpisense_fb_param.vmem = vzalloc(rpisense_fb_param.vmemsize);
   204		if (!rpisense_fb_param.vmem)
   205			return ret;
   206	
   207		rpisense_fb_param.vmem_work = devm_kmalloc(&pdev->dev, 193, GFP_KERNEL);
   208		if (!rpisense_fb_param.vmem_work)
   209			goto err_malloc;
   210	
   211		info = framebuffer_alloc(0, &pdev->dev);
   212		if (!info) {
   213			dev_err(&pdev->dev, "Could not allocate framebuffer.\n");
   214			goto err_malloc;
   215		}
   216		rpisense_fb->info = info;
   217	
   218		rpisense_fb_fix.smem_start = (unsigned long)rpisense_fb_param.vmem;
   219		rpisense_fb_fix.smem_len = rpisense_fb_param.vmemsize;
   220	
   221		info->fbops = &rpisense_fb_ops;
   222		info->fix = rpisense_fb_fix;
   223		info->var = rpisense_fb_var;
   224		info->fbdefio = &rpisense_fb_defio;
   225		info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB;
   226		info->screen_base = rpisense_fb_param.vmem;
   227		info->screen_size = rpisense_fb_param.vmemsize;
   228	
   229		if (lowlight)
   230			rpisense_fb_param.gamma = gamma_low;
   231	
   232		fb_deferred_io_init(info);
   233	
   234		ret = register_framebuffer(info);
   235		if (ret < 0) {
   236			dev_err(&pdev->dev, "Could not register framebuffer.\n");
   237			goto err_fballoc;
   238		}
   239	
   240		fb_info(info, "%s frame buffer device\n", info->fix.id);
   241		schedule_delayed_work(&info->deferred_work, rpisense_fb_defio.delay);
   242		return 0;
   243	err_fballoc:
   244		framebuffer_release(info);
   245	err_malloc:
 > 246		vfree(rpisense_fb_param.vmem);
   247		return ret;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
