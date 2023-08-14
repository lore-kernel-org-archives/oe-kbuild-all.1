Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B616AD47
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692013462; x=1723549462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zD7OjFUHvl8eC+cs3PdJHKa+jTcvEu1sNerhr47CGNs=;
  b=SvoM3qqSZyr7z2kmjBjSmY9ETtDvvCtw4tc5Nrx3q3f3JAlVKO3MA8BT
   EqeRoOFsSd8878lwd+IivdaAqI+41NLZHtQoY9+C1F/WZT3zXdFWW6JN1
   YrU8tmYFGUc9/bSllWs2KQyDmjOhm9rh/Avh08uy1jPPjh5APdYI47nlL
   22+vqvArQq7xTESeqs6WkMY7WddLJqfEAGI1bm0IERQ+/NFq4ZUpxMM+H
   UCPQ6EryHa0Aa/FaFs/ORDxg6QTPZUqhuqWXjvP6zKAcMsq27E7veQpO9
   yfoCV/ljsxzJyydViTJ5LK5O1EfJjSUIwaU30qr+BZOZBsx5rmmZs9gjs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="351616400"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="351616400"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 04:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="768422731"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="768422731"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Aug 2023 04:44:19 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVVze-00007j-20;
	Mon, 14 Aug 2023 11:44:18 +0000
Date: Mon, 14 Aug 2023 19:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: WANG Xuerui <git@xen0n.name>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 7415/8441]
 drivers/media/usb/em28xx/em28xx-audio.c:808:29: warning: variable 'devnr'
 set but not used
Message-ID: <202308141950.e9QIQKIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: e2843c7596e77f4f9b006a1417546231395d0986 [7415/8441] LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's
config: loongarch-randconfig-r012-20230814 (https://download.01.org/0day-ci/archive/20230814/202308141950.e9QIQKIT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308141950.e9QIQKIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308141950.e9QIQKIT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/workqueue.h:9,
                    from drivers/media/usb/em28xx/em28xx.h:21,
                    from drivers/media/usb/em28xx/em28xx-audio.c:14:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   drivers/media/usb/em28xx/em28xx-audio.c: In function 'em28xx_audio_init':
>> drivers/media/usb/em28xx/em28xx-audio.c:808:29: warning: variable 'devnr' set but not used [-Wunused-but-set-variable]
     808 |         static int          devnr;
         |                             ^~~~~
   drivers/media/usb/em28xx/em28xx-audio.c: At top level:
   drivers/media/usb/em28xx/em28xx-audio.c:47:12: warning: 'index' defined but not used [-Wunused-variable]
      47 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/media/usb/cx231xx/cx231xx.h:16,
                    from drivers/media/usb/cx231xx/cx231xx-audio.c:9:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   drivers/media/usb/cx231xx/cx231xx-audio.c: In function 'cx231xx_audio_init':
>> drivers/media/usb/cx231xx/cx231xx-audio.c:564:20: warning: variable 'devnr' set but not used [-Wunused-but-set-variable]
     564 |         static int devnr;
         |                    ^~~~~
   drivers/media/usb/cx231xx/cx231xx-audio.c: At top level:
   drivers/media/usb/cx231xx/cx231xx-audio.c:29:12: warning: 'index' defined but not used [-Wunused-variable]
      29 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/devnr +808 drivers/media/usb/em28xx/em28xx-audio.c

966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  801  
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  802  static int em28xx_audio_init(struct em28xx *dev)
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  803  {
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  804  	struct em28xx_audio *adev = &dev->adev;
c6d48134cb2682 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-12-07  805  	struct usb_device *udev = interface_to_usbdev(dev->intf);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  806  	struct snd_pcm      *pcm;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  807  	struct snd_card     *card;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12 @808  	static int          devnr;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  809  	int		    err;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  810  
c5874208ff78a5 drivers/media/usb/em28xx/em28xx-audio.c   Frank Schaefer        2014-09-13  811  	if (dev->usb_audio_type != EM28XX_USB_AUDIO_VENDOR) {
9f90f5371f52b4 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-03-03  812  		/*
9f90f5371f52b4 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-03-03  813  		 * This device does not support the extension (in this case
9f90f5371f52b4 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-03-03  814  		 * the device is expecting the snd-usb-audio module or
9f90f5371f52b4 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-03-03  815  		 * doesn't have analog audio support at all)
9f90f5371f52b4 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-03-03  816  		 */
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  817  		return 0;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  818  	}
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  819  
29b05e22f5c68c drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-12-07  820  	dev_info(&dev->intf->dev, "Binding audio extension\n");
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  821  
47677e51e2a404 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-03-05  822  	kref_get(&dev->ref);
47677e51e2a404 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-03-05  823  
29b05e22f5c68c drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-12-07  824  	dev_info(&dev->intf->dev,
ce8591ff023ef8 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-10-20  825  		 "em28xx-audio.c: Copyright (C) 2006 Markus Rechberger\n");
29b05e22f5c68c drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-12-07  826  	dev_info(&dev->intf->dev,
ce8591ff023ef8 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-10-20  827  		 "em28xx-audio.c: Copyright (C) 2007-2016 Mauro Carvalho Chehab\n");
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  828  
29b05e22f5c68c drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-12-07  829  	err = snd_card_new(&dev->intf->dev, index[devnr], "Em28xx Audio",
e735688875208f drivers/media/usb/em28xx/em28xx-audio.c   Takashi Iwai          2014-01-29  830  			   THIS_MODULE, 0, &card);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  831  	if (err < 0)
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  832  		return err;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  833  
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  834  	spin_lock_init(&adev->slock);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  835  	adev->sndcard = card;
c6d48134cb2682 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-12-07  836  	adev->udev = udev;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  837  
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  838  	err = snd_pcm_new(card, "Em28xx Audio", 0, 0, 1, &pcm);
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  839  	if (err < 0)
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  840  		goto card_free;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  841  
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  842  	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_em28xx_pcm_capture);
2abb1b2daf88ee drivers/media/usb/em28xx/em28xx-audio.c   Takashi Iwai          2019-12-10  843  	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  844  	pcm->info_flags = 0;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  845  	pcm->private_data = dev;
cc1e6315e83db0 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-09-10  846  	strscpy(pcm->name, "Empia 28xx Capture", sizeof(pcm->name));
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  847  
cc1e6315e83db0 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-09-10  848  	strscpy(card->driver, "Em28xx-Audio", sizeof(card->driver));
cc1e6315e83db0 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-09-10  849  	strscpy(card->shortname, "Em28xx Audio", sizeof(card->shortname));
cc1e6315e83db0 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2018-09-10  850  	strscpy(card->longname, "Empia Em28xx Audio", sizeof(card->longname));
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  851  
a5c075cfd2386a drivers/media/usb/em28xx/em28xx-audio.c   Frank Schaefer        2014-03-24  852  	INIT_WORK(&adev->wq_trigger, audio_trigger);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  853  
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  854  	if (dev->audio_mode.ac97 != EM28XX_NO_AC97) {
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  855  		em28xx_cvol_new(card, dev, "Video", AC97_VIDEO);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  856  		em28xx_cvol_new(card, dev, "Line In", AC97_LINE);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  857  		em28xx_cvol_new(card, dev, "Phone", AC97_PHONE);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  858  		em28xx_cvol_new(card, dev, "Microphone", AC97_MIC);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  859  		em28xx_cvol_new(card, dev, "CD", AC97_CD);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  860  		em28xx_cvol_new(card, dev, "AUX", AC97_AUX);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  861  		em28xx_cvol_new(card, dev, "PCM", AC97_PCM);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  862  
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  863  		em28xx_cvol_new(card, dev, "Master", AC97_MASTER);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  864  		em28xx_cvol_new(card, dev, "Line", AC97_HEADPHONE);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  865  		em28xx_cvol_new(card, dev, "Mono", AC97_MASTER_MONO);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  866  		em28xx_cvol_new(card, dev, "LFE", AC97_CENTER_LFE_MASTER);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  867  		em28xx_cvol_new(card, dev, "Surround", AC97_SURROUND_MASTER);
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  868  	}
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  869  
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  870  	err = em28xx_audio_urb_init(dev);
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  871  	if (err)
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  872  		goto card_free;
966f4163751b45 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  873  
6d79468dd85375 drivers/media/video/em28xx/em28xx-audio.c Mauro Carvalho Chehab 2008-01-05  874  	err = snd_card_register(card);
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  875  	if (err < 0)
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  876  		goto urb_free;
6d79468dd85375 drivers/media/video/em28xx/em28xx-audio.c Mauro Carvalho Chehab 2008-01-05  877  
29b05e22f5c68c drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2016-12-07  878  	dev_info(&dev->intf->dev, "Audio extension successfully initialized\n");
a52932b405f230 drivers/media/video/em28xx/em28xx-audio.c Markus Rechberger     2008-01-05  879  	return 0;
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  880  
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  881  urb_free:
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  882  	em28xx_audio_free_urb(dev);
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  883  
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  884  card_free:
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  885  	snd_card_free(card);
452f236fcf845b drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-14  886  	adev->sndcard = NULL;
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  887  
0cd03a0cb20c75 drivers/media/usb/em28xx/em28xx-audio.c   Mauro Carvalho Chehab 2014-01-12  888  	return err;
a52932b405f230 drivers/media/video/em28xx/em28xx-audio.c Markus Rechberger     2008-01-05  889  }
a52932b405f230 drivers/media/video/em28xx/em28xx-audio.c Markus Rechberger     2008-01-05  890  

:::::: The code at line 808 was first introduced by commit
:::::: 966f4163751b456f526a0b0dc8e6a9814df6abd9 [media] em28xx-audio: split URB initialization code

:::::: TO: Mauro Carvalho Chehab <m.chehab@samsung.com>
:::::: CC: Mauro Carvalho Chehab <m.chehab@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
