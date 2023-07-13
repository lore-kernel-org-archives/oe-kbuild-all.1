Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06379366
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 07:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689231943; x=1720767943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yejpDoq9sn8s5MSn4np13ruX7nwHc14oiQk17fW+K44=;
  b=nSN+KGGsLbNCA0QvD9I3Ppn969Zf8T1pa2RT19zx4ZYotzOkAzzYI+Mt
   QcWEO32exbAZWc+vLSfcvz4L5W4/rJ2JcT2H97Q3548+Zz8XO1ZbNlLnA
   rSyxva3U7nQrJl606RCZPxaxDy2pyY2q91/S9MhDcItNqbFWynx4VCXiO
   kv6Ub/IEQldPJd76rZ/1jV9MYERn2CK3R4qrh07IulCjtckKUIZj32mHZ
   iZ7rZQaBDq1wjgtNz76bEh9WeygoKHCK1Lrk8NQc4aiq4KTzR1iGjtmvN
   Oitm/11ZMLsBSc1wkbV+VIXA6R/4Wig4w3Tt16/NElZRUdC7Km1X7gCPd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="345419691"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="345419691"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 00:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="1052491207"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="1052491207"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2023 00:05:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJqOR-0006Ln-2S;
	Thu, 13 Jul 2023 07:05:39 +0000
Date: Thu, 13 Jul 2023 15:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yuan Liu <yuan1.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Zhao Yakui <yakui.zhao@intel.com>, Yu Wang <yu1.wang@intel.com>
Subject: [intel-lts:4.19/android_t 4686/30000]
 drivers/gpio/gpio-virtio.c:408:17: warning: format '%d' expects argument of
 type 'int', but argument 3 has type 'long unsigned int'
Message-ID: <202307131400.5WOCmYLf-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   0f6dab7d9f97996aec10a8e2e854ec3bd628d550
commit: 6ec553fcaa1f7b11a7c38d7002d729e3a9fe17f9 [4686/30000] add an IRQ chip to gpio-virtio GPIO chip.
config: x86_64-randconfig-x004-20230713 (https://download.01.org/0day-ci/archive/20230713/202307131400.5WOCmYLf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131400.5WOCmYLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131400.5WOCmYLf-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
