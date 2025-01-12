Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71161B6D06
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 23:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736724503; cv=none; b=oXNx+1MYWZ08oyHkDflez2OI2w1fxtSZB2z3k3aa0vbPX7ZpaTnhyNnPgY8k3y/Q4RF47hAbSf7yfQ6yXAP51u11tKewoI6CjAs6sAMNSkv8528N8UJ6Ir6+40u2kmIernruCt0FVAo97TJ/MMBBTlXQlYHjNpLaoAQgoqeVwJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736724503; c=relaxed/simple;
	bh=ftdN+CN1O6W0PCiw3kmErjSoMKGwRfIzdbWc0pZGCQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBb6vcRkV384Nk2eIROfKDa7WbrEd0ksqBf82mDc+L9CvlvNFVhc3KAQ0ez+RyeYBBKKaXApLepDdwt9Pyd1TU+GR+0K6XW9qxM4+iFu4XBlvDSGinvItG8lO8CTJnhs4dmpdl1bQQtZDp4ddc6bANq+CafFa9DIB5EQ60vGDd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehrsZNok; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehrsZNok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736724501; x=1768260501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftdN+CN1O6W0PCiw3kmErjSoMKGwRfIzdbWc0pZGCQI=;
  b=ehrsZNokeC6GwK9gNz2M88AaxJACvBMqumfZSbsUQeQrLoNidyqkeg9S
   +0+ha2LMwIYrlkvMqaNsTqBywLWqVs1xTkU0CEghA63mwUzZIdjgsbK23
   TNdPyyQlc533Rx2SYpiAEGho95tu1eHGEb+hrTKwbmepy55rcMBlU2KM/
   zmTZDcW87MTOe7zttzt2IJIvnSy8gjvbHUEoV9Z1RMWm+tPP9u9rrb/iF
   hqpLEkTR/YykcKHwSN/9QiupVGm2YA8Yw9mJsdcTPr1KCay4mCaVxzEMy
   +jWqPzIC+3+xvxjyJSsp5vz4QdObjBAImIFP74NlB0lSwYl5oheX5jkYQ
   g==;
X-CSE-ConnectionGUID: enps7eWwT/eMyws0fF2unQ==
X-CSE-MsgGUID: WM6/x6HrS/GZKbf9IIeHDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="37125066"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37125066"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 15:28:21 -0800
X-CSE-ConnectionGUID: RrMS2rOCTYCbzDNBelvKjQ==
X-CSE-MsgGUID: KVGszjrDQ22l79E43KUinw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108917094"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2025 15:28:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX7NR-000MVf-2f;
	Sun, 12 Jan 2025 23:28:17 +0000
Date: Mon, 13 Jan 2025 07:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gerecke <jason.gerecke@wacom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: drivers/input/touchscreen/wacom_w8001.c:637:29: warning: ' Pen'
 directive output may be truncated writing 4 bytes into a region of size
 between 1 and 64
Message-ID: <202501130717.VptPQT0W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be548645527a131a097fdc884b7fca40c8b86231
commit: 6c7cc1a29d1e679be4a98b01141f1ba491e5775e Input: wacom_w8001 - simplify device name generation
date:   8 months ago
config: sparc-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20250113/202501130717.VptPQT0W-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130717.VptPQT0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501130717.VptPQT0W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/wacom_w8001.c: In function 'w8001_connect':
>> drivers/input/touchscreen/wacom_w8001.c:637:29: warning: ' Pen' directive output may be truncated writing 4 bytes into a region of size between 1 and 64 [-Wformat-truncation=]
     637 |                          "%s Pen", basename);
         |                             ^~~~
   drivers/input/touchscreen/wacom_w8001.c:636:17: note: 'snprintf' output between 5 and 68 bytes into a destination of size 64
     636 |                 snprintf(w8001->pen_name, sizeof(w8001->pen_name),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     637 |                          "%s Pen", basename);
         |                          ~~~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/wacom_w8001.c:653:29: warning: ' Finger' directive output may be truncated writing 7 bytes into a region of size between 1 and 64 [-Wformat-truncation=]
     653 |                          "%s Finger", basename);
         |                             ^~~~~~~
   drivers/input/touchscreen/wacom_w8001.c:652:17: note: 'snprintf' output between 8 and 71 bytes into a destination of size 64
     652 |                 snprintf(w8001->pen_name, sizeof(w8001->pen_name),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     653 |                          "%s Finger", basename);
         |                          ~~~~~~~~~~~~~~~~~~~~~~


vim +637 drivers/input/touchscreen/wacom_w8001.c

   586	
   587	/*
   588	 * w8001_connect() is the routine that is called when someone adds a
   589	 * new serio device that supports the w8001 protocol and registers it as
   590	 * an input device.
   591	 */
   592	
   593	static int w8001_connect(struct serio *serio, struct serio_driver *drv)
   594	{
   595		struct w8001 *w8001;
   596		struct input_dev *input_dev_pen;
   597		struct input_dev *input_dev_touch;
   598		char basename[64] = "Wacom Serial";
   599		int err, err_pen, err_touch;
   600	
   601		w8001 = kzalloc(sizeof(struct w8001), GFP_KERNEL);
   602		input_dev_pen = input_allocate_device();
   603		input_dev_touch = input_allocate_device();
   604		if (!w8001 || !input_dev_pen || !input_dev_touch) {
   605			err = -ENOMEM;
   606			goto fail1;
   607		}
   608	
   609		w8001->serio = serio;
   610		w8001->pen_dev = input_dev_pen;
   611		w8001->touch_dev = input_dev_touch;
   612		mutex_init(&w8001->mutex);
   613		init_completion(&w8001->cmd_done);
   614		snprintf(w8001->phys, sizeof(w8001->phys), "%s/input0", serio->phys);
   615	
   616		serio_set_drvdata(serio, w8001);
   617		err = serio_open(serio, drv);
   618		if (err)
   619			goto fail2;
   620	
   621		err = w8001_detect(w8001);
   622		if (err)
   623			goto fail3;
   624	
   625		/* For backwards-compatibility we compose the basename based on
   626		 * capabilities and then just append the tool type
   627		 */
   628		err_pen = w8001_setup_pen(w8001, basename, sizeof(basename));
   629		err_touch = w8001_setup_touch(w8001, basename, sizeof(basename));
   630		if (err_pen && err_touch) {
   631			err = -ENXIO;
   632			goto fail3;
   633		}
   634	
   635		if (!err_pen) {
   636			snprintf(w8001->pen_name, sizeof(w8001->pen_name),
 > 637				 "%s Pen", basename);
   638			input_dev_pen->name = w8001->pen_name;
   639	
   640			w8001_set_devdata(input_dev_pen, w8001, serio);
   641	
   642			err = input_register_device(w8001->pen_dev);
   643			if (err)
   644				goto fail3;
   645		} else {
   646			input_free_device(input_dev_pen);
   647			input_dev_pen = NULL;
   648			w8001->pen_dev = NULL;
   649		}
   650	
   651		if (!err_touch) {
   652			snprintf(w8001->pen_name, sizeof(w8001->pen_name),
 > 653				 "%s Finger", basename);
   654			input_dev_touch->name = w8001->touch_name;
   655	
   656			w8001_set_devdata(input_dev_touch, w8001, serio);
   657	
   658			err = input_register_device(w8001->touch_dev);
   659			if (err)
   660				goto fail4;
   661		} else {
   662			input_free_device(input_dev_touch);
   663			input_dev_touch = NULL;
   664			w8001->touch_dev = NULL;
   665		}
   666	
   667		return 0;
   668	
   669	fail4:
   670		if (w8001->pen_dev)
   671			input_unregister_device(w8001->pen_dev);
   672	fail3:
   673		serio_close(serio);
   674	fail2:
   675		serio_set_drvdata(serio, NULL);
   676	fail1:
   677		input_free_device(input_dev_pen);
   678		input_free_device(input_dev_touch);
   679		kfree(w8001);
   680		return err;
   681	}
   682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
