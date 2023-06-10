Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A48836
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686385406; x=1717921406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkRtEjNePR07fnihemhFl7JmTuPcQ8wt5o22dCRqbiw=;
  b=CgfXMBm+w1f0sliKwVi/k9tae0djoY108wEKO2mV5KLA2xFPTuaxm9zK
   eUb9xNgiMkGps1oDNpEahG34o/DudGK+sh1tPTKn6rmdcDM83RpCWSR8J
   fEYR6oe13Wc8MswclnoICXCbpxy+52LulUkNHaETOQxyGL7tqwTerG3Gk
   y3mV73wPcT8dlhCyzZf4ttHk/+dt7cFQV8tSrZsBpuSG8JQkcMgxfVQK6
   GRSWKoZYy7GAWYrqltglyzwJpyu/yWUWwwOtAuxFf6jqGynAC4tsG0wwG
   2u5KrWrxqgadCW5pfgy1WkilSICtDf/3MrWXW4pqopWXshX0ds3kuVLB5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361108532"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="361108532"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 01:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854994070"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="854994070"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2023 01:23:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7tsZ-0009to-1v;
	Sat, 10 Jun 2023 08:23:23 +0000
Date: Sat, 10 Jun 2023 16:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm64:devel/kmalloc-minalign 18/18]
 drivers/media/usb/cx231xx/cx231xx-audio.c:564:20: warning: variable 'devnr'
 set but not used
Message-ID: <202306101605.sgUmz5Gf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/kmalloc-minalign
head:   e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
commit: e5bbe79231baf5cad690c6fc9de3910ad14a2aa6 [18/18] fixup! mm/slab: Decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230610/202306101605.sgUmz5Gf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 devel/kmalloc-minalign
        git checkout e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/usb/cx231xx/ drivers/media/usb/em28xx/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101605.sgUmz5Gf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/time.h:5,
                    from include/linux/videodev2.h:59,
                    from drivers/media/usb/cx231xx/cx231xx.h:13,
                    from drivers/media/usb/cx231xx/cx231xx-audio.c:9:
   include/linux/cache.h:104:38: error: missing binary operator before token "("
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         |                                      ^
   include/linux/slab.h:239:39: note: in expansion of macro 'ARCH_DMA_MINALIGN'
     239 | #if defined(ARCH_HAS_DMA_MINALIGN) && ARCH_DMA_MINALIGN > 8 && \
         |                                       ^~~~~~~~~~~~~~~~~
   drivers/media/usb/cx231xx/cx231xx-audio.c: In function 'cx231xx_audio_init':
>> drivers/media/usb/cx231xx/cx231xx-audio.c:564:20: warning: variable 'devnr' set but not used [-Wunused-but-set-variable]
     564 |         static int devnr;
         |                    ^~~~~
   drivers/media/usb/cx231xx/cx231xx-audio.c: At top level:
   drivers/media/usb/cx231xx/cx231xx-audio.c:29:12: warning: 'index' defined but not used [-Wunused-variable]
      29 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from include/linux/time.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from drivers/media/usb/em28xx/em28xx.h:21,
                    from drivers/media/usb/em28xx/em28xx-audio.c:14:
   include/linux/cache.h:104:38: error: missing binary operator before token "("
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         |                                      ^
   include/linux/slab.h:239:39: note: in expansion of macro 'ARCH_DMA_MINALIGN'
     239 | #if defined(ARCH_HAS_DMA_MINALIGN) && ARCH_DMA_MINALIGN > 8 && \
         |                                       ^~~~~~~~~~~~~~~~~
   drivers/media/usb/em28xx/em28xx-audio.c: In function 'em28xx_audio_init':
>> drivers/media/usb/em28xx/em28xx-audio.c:808:29: warning: variable 'devnr' set but not used [-Wunused-but-set-variable]
     808 |         static int          devnr;
         |                             ^~~~~
   drivers/media/usb/em28xx/em28xx-audio.c: At top level:
   drivers/media/usb/em28xx/em28xx-audio.c:47:12: warning: 'index' defined but not used [-Wunused-variable]
      47 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/devnr +564 drivers/media/usb/cx231xx/cx231xx-audio.c

e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  558  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  559  static int cx231xx_audio_init(struct cx231xx *dev)
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  560  {
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  561  	struct cx231xx_audio *adev = &dev->adev;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  562  	struct snd_pcm *pcm;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  563  	struct snd_card *card;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03 @564  	static int devnr;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  565  	int err;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  566  	struct usb_interface *uif;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  567  	int i, isoc_pipe = 0;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  568  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  569  	if (dev->has_alsa_audio != 1) {
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  570  		/* This device does not support the extension (in this case
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  571  		   the device is expecting the snd-usb-audio module or
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  572  		   doesn't have analog audio support at all) */
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  573  		return 0;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  574  	}
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  575  
336fea922936c1 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2014-11-03  576  	dev_dbg(dev->dev,
b7085c08647598 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2014-11-02  577  		"probing for cx231xx non standard usbaudio\n");
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  578  
336fea922936c1 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2014-11-03  579  	err = snd_card_new(dev->dev, index[devnr], "Cx231xx Audio",
e735688875208f drivers/media/usb/cx231xx/cx231xx-audio.c   Takashi Iwai          2014-01-29  580  			   THIS_MODULE, 0, &card);
a938b8c5be8fe5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-04-06  581  	if (err < 0)
a938b8c5be8fe5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-04-06  582  		return err;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  583  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  584  	spin_lock_init(&adev->slock);
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  585  	err = snd_pcm_new(card, "Cx231xx Audio", 0, 0, 1, &pcm);
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  586  	if (err < 0)
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  587  		goto err_free_card;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  588  
84b5dbf39ed2f5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-03-03  589  	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
84b5dbf39ed2f5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-03-03  590  			&snd_cx231xx_pcm_capture);
355b9a0c585669 drivers/media/usb/cx231xx/cx231xx-audio.c   Takashi Iwai          2019-12-10  591  	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  592  	pcm->info_flags = 0;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  593  	pcm->private_data = dev;
cc1e6315e83db0 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2018-09-10  594  	strscpy(pcm->name, "Conexant cx231xx Capture", sizeof(pcm->name));
cc1e6315e83db0 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2018-09-10  595  	strscpy(card->driver, "Cx231xx-Audio", sizeof(card->driver));
cc1e6315e83db0 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2018-09-10  596  	strscpy(card->shortname, "Cx231xx Audio", sizeof(card->shortname));
cc1e6315e83db0 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2018-09-10  597  	strscpy(card->longname, "Conexant cx231xx Audio", sizeof(card->longname));
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  598  
61b04cb24a129f drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2010-09-27  599  	INIT_WORK(&dev->wq_trigger, audio_trigger);
61b04cb24a129f drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2010-09-27  600  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  601  	err = snd_card_register(card);
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  602  	if (err < 0)
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  603  		goto err_free_card;
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  604  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  605  	adev->sndcard = card;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  606  	adev->udev = dev->udev;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  607  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  608  	/* compute alternate max packet sizes for Audio */
84b5dbf39ed2f5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-03-03  609  	uif =
84b5dbf39ed2f5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-03-03  610  	    dev->udev->actconfig->interface[dev->current_pcb_config.
84b5dbf39ed2f5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-03-03  611  					    hs_config_info[0].interface_info.
84b5dbf39ed2f5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-03-03  612  					    audio_index + 1];
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  613  
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  614  	if (uif->altsetting[0].desc.bNumEndpoints < isoc_pipe + 1) {
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  615  		err = -ENODEV;
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  616  		goto err_free_card;
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  617  	}
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  618  
84b5dbf39ed2f5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-03-03  619  	adev->end_point_addr =
69a11a32643bda drivers/media/usb/cx231xx/cx231xx-audio.c   Hans Verkuil          2013-02-07  620  	    uif->altsetting[0].endpoint[isoc_pipe].desc.
69a11a32643bda drivers/media/usb/cx231xx/cx231xx-audio.c   Hans Verkuil          2013-02-07  621  			bEndpointAddress;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  622  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  623  	adev->num_alt = uif->num_altsetting;
336fea922936c1 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2014-11-03  624  	dev_info(dev->dev,
b7085c08647598 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2014-11-02  625  		"audio EndPoint Addr 0x%x, Alternate settings: %i\n",
84b5dbf39ed2f5 drivers/media/video/cx231xx/cx231xx-audio.c Mauro Carvalho Chehab 2009-03-03  626  		adev->end_point_addr, adev->num_alt);
6da2ec56059c3c drivers/media/usb/cx231xx/cx231xx-audio.c   Kees Cook             2018-06-12  627  	adev->alt_max_pkt_size = kmalloc_array(32, adev->num_alt, GFP_KERNEL);
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  628  	if (!adev->alt_max_pkt_size) {
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  629  		err = -ENOMEM;
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  630  		goto err_free_card;
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  631  	}
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  632  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  633  	for (i = 0; i < adev->num_alt; i++) {
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  634  		u16 tmp;
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  635  
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  636  		if (uif->altsetting[i].desc.bNumEndpoints < isoc_pipe + 1) {
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  637  			err = -ENODEV;
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  638  			goto err_free_pkt_size;
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  639  		}
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  640  
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  641  		tmp = le16_to_cpu(uif->altsetting[i].endpoint[isoc_pipe].desc.
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  642  				wMaxPacketSize);
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  643  		adev->alt_max_pkt_size[i] =
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  644  		    (tmp & 0x07ff) * (((tmp & 0x1800) >> 11) + 1);
336fea922936c1 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2014-11-03  645  		dev_dbg(dev->dev,
b7085c08647598 drivers/media/usb/cx231xx/cx231xx-audio.c   Mauro Carvalho Chehab 2014-11-02  646  			"audio alternate setting %i, max size= %i\n", i,
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  647  			adev->alt_max_pkt_size[i]);
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  648  	}
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  649  
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  650  	return 0;
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  651  
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  652  err_free_pkt_size:
65f921647f4c89 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  653  	kfree(adev->alt_max_pkt_size);
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  654  err_free_card:
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  655  	snd_card_free(card);
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  656  
fff1abc4d54e46 drivers/media/usb/cx231xx/cx231xx-audio.c   Johan Hovold          2017-03-13  657  	return err;
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  658  }
e0d3bafd02586c drivers/media/video/cx231xx/cx231xx-audio.c Sri Deevi             2009-03-03  659  

:::::: The code at line 564 was first introduced by commit
:::::: e0d3bafd02586cfde286c320f56906fd9fa8d256 V4L/DVB (10954): Add cx231xx USB driver

:::::: TO: Sri Deevi <Srinivasa.Deevi@conexant.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
