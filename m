Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3142F142E63
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 08:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717491030; cv=none; b=NyImf6T7cWq21pzIbkHSFTQI0KISOVR6Ob6VPAn3HiEOE5SLbyuaJhww1Q/5VwczQeRxO2UiJPnY2n+m4j6K0EEeMlo7t4w0MTAlSsk1GV7I00vipSRrnA+bbLXIXhabUWbSCVKVCT62wQu7Pq8aMRha4a/yXvAKIhuAZ3Jh7ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717491030; c=relaxed/simple;
	bh=VLMKmnLD7S9ACeqiKTuZtjwkKOTwOqaA+qWiGLt8xlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JmN2nEAXNrs92peH310AdwgElUDjF00lo81D/gQEnLKabGEwf1xl1GEcyFIMIfQSOXz6cjjctcSGqKg+7zOW/iyykwZ/PrhiGwJr+bWJtF4Cr3MimgmD+M2N+a7u7TO0r8vXBOrJPDGx0RGF5BKEbdnFGyDfz1bSIfkTfEbZRc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICrRHICu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICrRHICu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717491028; x=1749027028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLMKmnLD7S9ACeqiKTuZtjwkKOTwOqaA+qWiGLt8xlM=;
  b=ICrRHICukqxNCtyPhTalqU/8fGESmkJvJ+yYMc4q3qgsGie0jWQZkspT
   nqO0/WckgrGj2+e93FXnt0t5WTdjvG+7CQtpt0YlwmT9j87dvWtD8c/Ev
   6OUsJxjk1OUnFN0QH0o3FqNwxOkC76QO1nrwSxHM9VmJ9zLxWhAZiZvUK
   PcsQoKP3hRh2gZ0hBnMN+1igCH9aL/UoG7114jopr/MUXuX2vjvcE31S0
   F04dsBWpXqoscZwthFHg18kfT17ipPA6q8+xNOYsY5z3bp77Ns0VTPcow
   xOxvHBXuLX+oxrHp5TPVH1S8osCNCkZVH01laaOWaIYTH69qTSvez4LAB
   g==;
X-CSE-ConnectionGUID: MYnX9hD5QJ2guQyBtQCS7g==
X-CSE-MsgGUID: JGxkdfSyQpaFTqDlXqmYxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25422146"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="25422146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:50:19 -0700
X-CSE-ConnectionGUID: h4mOgW0pSAGSlb9CFF8wOA==
X-CSE-MsgGUID: IiAPboChS1ib6gE5KsgmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37038317"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2024 01:50:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEPrx-000Myh-1e;
	Tue, 04 Jun 2024 08:50:13 +0000
Date: Tue, 4 Jun 2024 16:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gerecke <jason.gerecke@wacom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [linux-next:master 2302/3381]
 drivers/input/touchscreen/wacom_w8001.c:637:29: warning: ' Pen' directive
 output may be truncated writing 4 bytes into a region of size between 1 and
 64
Message-ID: <202406041641.wE3cCT4C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d97496ca23a2d4ee80b7302849404859d9058bcd
commit: 6c7cc1a29d1e679be4a98b01141f1ba491e5775e [2302/3381] Input: wacom_w8001 - simplify device name generation
config: microblaze-randconfig-r006-20230312 (https://download.01.org/0day-ci/archive/20240604/202406041641.wE3cCT4C-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041641.wE3cCT4C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041641.wE3cCT4C-lkp@intel.com/

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
