Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A417FD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLrva0rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701583671; x=1733119671;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hAnifYstPsZ4fTMFdYWigXDFIFhd02KTYYDx3BLUEN4=;
  b=NLrva0rclOFDod4OeQU7g09l9hWkLoymVADspkXXWBwleRfrBlpmT6OF
   KTVvIC0OlgwRCTX1BHekeq2K91/2flaT+uIavZP6GWHZ9Cb/Ep4vdWACg
   3taJqKiVLqgR7rF9y7glPhJWsWljnBKEIvC+d2BbTacITVUP6wAr5c6f7
   6otp4EWrt7wkaWAVTK7Oz8VqGmzF8fUbH6ZjvcNqmaW6FtCaaFzH/UKnn
   hgGDtOdP98ZSuakagf5un5BX/gRL2HgPBzpRE9vUmJSAvxO7bnTq9oiUO
   EVPyiA0PUpF0EDuxLYpzGxG8ipA1Lfi62BV/bZs7P7YPXPgUpuXNh3k6/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="373049291"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="373049291"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770187876"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770187876"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:07:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9fdk-0006I4-2o;
	Sun, 03 Dec 2023 06:07:40 +0000
Date: Sun, 3 Dec 2023 14:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?B?QvZzevZybelueWkgWm9sdOFu?= <zboszormenyi@sicom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: drivers/input/touchscreen/egalax_ts_serial.c:116:21: warning:
 '/input0' directive output may be truncated writing 7 bytes into a region of
 size between 1 and 32
Message-ID: <202312021646.cwwvptuB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Böszörményi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 6b0f8f9c52efe24d6dac06ab963b7bd91c723751 Input: add eGalaxTouch serial touchscreen driver
date:   8 years ago
config: x86_64-randconfig-r032-20230515 (https://download.01.org/0day-ci/archive/20231202/202312021646.cwwvptuB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312021646.cwwvptuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312021646.cwwvptuB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/module.h:17,
                    from drivers/input/touchscreen/egalax_ts_serial.c:19:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:517:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     517 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:428:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     428 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/input/touchscreen/egalax_ts_serial.c: In function 'egalax_connect':
>> drivers/input/touchscreen/egalax_ts_serial.c:116:21: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     116 |                  "%s/input0", serio->phys);
         |                     ^~~~~~~
   drivers/input/touchscreen/egalax_ts_serial.c:115:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     115 |         snprintf(egalax->phys, sizeof(egalax->phys),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 |                  "%s/input0", serio->phys);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~


vim +116 drivers/input/touchscreen/egalax_ts_serial.c

    94	
    95	/*
    96	 * egalax_connect() is the routine that is called when someone adds a
    97	 * new serio device that supports egalax protocol and registers it as
    98	 * an input device. This is usually accomplished using inputattach.
    99	 */
   100	static int egalax_connect(struct serio *serio, struct serio_driver *drv)
   101	{
   102		struct egalax *egalax;
   103		struct input_dev *input_dev;
   104		int error;
   105	
   106		egalax = kzalloc(sizeof(struct egalax), GFP_KERNEL);
   107		input_dev = input_allocate_device();
   108		if (!egalax) {
   109			error = -ENOMEM;
   110			goto err_free_mem;
   111		}
   112	
   113		egalax->serio = serio;
   114		egalax->input = input_dev;
   115		snprintf(egalax->phys, sizeof(egalax->phys),
 > 116			 "%s/input0", serio->phys);
   117	
   118		input_dev->name = "EETI eGalaxTouch Serial TouchScreen";
   119		input_dev->phys = egalax->phys;
   120		input_dev->id.bustype = BUS_RS232;
   121		input_dev->id.vendor = SERIO_EGALAX;
   122		input_dev->id.product = 0;
   123		input_dev->id.version = 0x0001;
   124		input_dev->dev.parent = &serio->dev;
   125	
   126		input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
   127		input_set_abs_params(input_dev, ABS_X,
   128				     EGALAX_MIN_XC, EGALAX_MAX_XC, 0, 0);
   129		input_set_abs_params(input_dev, ABS_Y,
   130				     EGALAX_MIN_YC, EGALAX_MAX_YC, 0, 0);
   131	
   132		serio_set_drvdata(serio, egalax);
   133	
   134		error = serio_open(serio, drv);
   135		if (error)
   136			goto err_reset_drvdata;
   137	
   138		error = input_register_device(input_dev);
   139		if (error)
   140			goto err_close_serio;
   141	
   142		return 0;
   143	
   144	err_close_serio:
   145		serio_close(serio);
   146	err_reset_drvdata:
   147		serio_set_drvdata(serio, NULL);
   148	err_free_mem:
   149		input_free_device(input_dev);
   150		kfree(egalax);
   151		return error;
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
