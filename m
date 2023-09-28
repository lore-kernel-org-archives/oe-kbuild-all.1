Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887F1A5A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695902352; x=1727438352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8iIEOGcod2tTGXwWpLaOlPGHo8+3kJG+MbLtk1y5Fg=;
  b=grxbjmeWbwQlLCN3swUvp3UZYdWAAbVZnBJSZ5rgbOrKar+wmWrez24s
   TB7itJ7dCksBzAzlKx7KE/HjQOw+0zuNsUzlHr6zjTabcZ09NwXUdts/c
   3ONgy+kxl6JJq3MJYLeaSAzCY00rCx72NUbjXkHhEDDn1p8L24Tfd3WQl
   SDyab2UvJLA2Bz+9ABqP/VGYxYZAum9cn7pexOTCKGgiBjKU71r2fReAz
   KNJd9ofzGrpnQSsBFtbHLPqRyJ0aH9thqaQ4C6sOFbCNnfPrALPOIV9HA
   XxYzgkeCZ7EL4aRaLD9zZgZzhmlNA6zC24/vwDVXnqFR9x+OmlPUF1CIE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372397941"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="372397941"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 04:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="815201450"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="815201450"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2023 04:59:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlpff-0001QL-0m;
	Thu, 28 Sep 2023 11:59:07 +0000
Date: Thu, 28 Sep 2023 19:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yuan Liu <yuan1.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Zhao Yakui <yakui.zhao@intel.com>, Yu Wang <yu1.wang@intel.com>
Subject: [intel-lts:4.19/android_s 4154/30000]
 drivers/gpio/gpio-virtio.c:408:17: warning: format '%d' expects argument of
 type 'int', but argument 3 has type 'long unsigned int'
Message-ID: <202309281939.QcUIf5p6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yuan,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   6bfae51123c09ed71d82cfc739c5ccbeac60c4aa
commit: 6ec553fcaa1f7b11a7c38d7002d729e3a9fe17f9 [4154/30000] add an IRQ chip to gpio-virtio GPIO chip.
config: i386-randconfig-006-20230906 (https://download.01.org/0day-ci/archive/20230928/202309281939.QcUIf5p6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281939.QcUIf5p6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281939.QcUIf5p6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/gpio/gpio-virtio.c:10:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from include/linux/acpi.h:27,
                    from drivers/gpio/gpio-virtio.c:12:
   drivers/gpio/gpio-virtio.c: In function 'gpio_virtio_irq_update':
>> drivers/gpio/gpio-virtio.c:408:17: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
     408 |                 "failed to alloc buffer for irq, ignore pin %d, action %u\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1359:22: note: in definition of macro 'dev_fmt'
    1359 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/gpio/gpio-virtio.c:407:17: note: in expansion of macro 'dev_err'
     407 |                 dev_err(&vgpio->vdev->dev,
         |                 ^~~~~~~
   drivers/gpio/gpio-virtio.c:408:62: note: format string is defined here
     408 |                 "failed to alloc buffer for irq, ignore pin %d, action %u\n",
         |                                                             ~^
         |                                                              |
         |                                                              int
         |                                                             %ld
   drivers/gpio/gpio-virtio.c:423:17: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
     423 |                 "failed to add outbuf for irq, ignore pin %d, action %u\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1359:22: note: in definition of macro 'dev_fmt'
    1359 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/gpio/gpio-virtio.c:422:17: note: in expansion of macro 'dev_err'
     422 |                 dev_err(&vgpio->vdev->dev,
         |                 ^~~~~~~
   drivers/gpio/gpio-virtio.c:423:60: note: format string is defined here
     423 |                 "failed to add outbuf for irq, ignore pin %d, action %u\n",
         |                                                           ~^
         |                                                            |
         |                                                            int
         |                                                           %ld
>> drivers/gpio/gpio-virtio.c:401:18: warning: unused variable 'len' [-Wunused-variable]
     401 |         int err, len;
         |                  ^~~
>> drivers/gpio/gpio-virtio.c:400:23: warning: unused variable 'timeout' [-Wunused-variable]
     400 |         unsigned long timeout;
         |                       ^~~~~~~


vim +408 drivers/gpio/gpio-virtio.c

   393	
   394	static void gpio_virtio_irq_update(struct irq_data *d, unsigned int action)
   395	{
   396		struct gpio_virtio *vgpio;
   397		struct gpio_chip *chip;
   398		struct gpio_virtio_irq_request *req;
   399		struct scatterlist sg;
 > 400		unsigned long timeout;
 > 401		int err, len;
   402	
   403		chip = irq_data_get_irq_chip_data(d);
   404		vgpio = gpiochip_get_data(chip);
   405		req = kzalloc(sizeof(*req), GFP_ATOMIC);
   406		if (!req) {
   407			dev_err(&vgpio->vdev->dev,
 > 408			"failed to alloc buffer for irq, ignore pin %d, action %u\n",
   409			d->hwirq, action);
   410			return;
   411		}
   412	
   413		req->action = action;
   414		req->pin = d->hwirq;
   415		if (action == GPIO_IRQ_ACTION_ENABLE)
   416			req->mode = irq_get_trigger_type(d->irq);
   417	
   418		sg_init_one(&sg, req, sizeof(*req));
   419		spin_lock(&vgpio->irq_lock);
   420		err = virtqueue_add_outbuf(vgpio->irq_vq, &sg, 1, req, GFP_ATOMIC);
   421		if (err) {
   422			dev_err(&vgpio->vdev->dev,
   423			"failed to add outbuf for irq, ignore pin %d, action %u\n",
   424			d->hwirq, action);
   425			spin_unlock(&vgpio->irq_lock);
   426			goto out;
   427		}
   428		virtqueue_kick(vgpio->irq_vq);
   429		spin_unlock(&vgpio->irq_lock);
   430	
   431		return;
   432	out:
   433		kfree(req);
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
