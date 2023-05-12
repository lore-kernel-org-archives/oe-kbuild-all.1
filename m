Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E197F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 02:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683857018; x=1715393018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9XyZT77DNIowXaAlvOLKs8TNYJis/bUSv0IXeDyy4M=;
  b=nnVWi3cPHWdtSUf92Wr+N1uBVz8KdPNbBJVGX0mFWsASh78JMhnX54q/
   UpChRtGyA14WOawZkaE6uQJvxquNvBNiT1oIEYhF+hVo2K5gGOeRwW35n
   iYYoKL+m+fEMR4FUUGIPaxKiIqfeARC6M5IcCqKo0V8PhdBnGa1k4Dtir
   g+jaMgTNUnDuf2sJdw348O8iBi+1a4i4Bs6wPqrvAweLxr+c0RPB/6UNF
   FKJ66MO5cSBx5g0QW2odoTH+H25YwULc+g/6mHZDOuBWUZygV1TxZQKrW
   mDaS2PvSBosudp1gMl35jrFmFIYbE1jg64PZpe9DQQ2S7ZxycLDvCWqfB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353807747"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353807747"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 19:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824195837"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="824195837"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 May 2023 19:03:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxI84-0004PK-3C;
	Fri, 12 May 2023 02:03:32 +0000
Date: Fri, 12 May 2023 10:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 8/30]
 drivers/media/usb/cx231xx/cx231xx-audio.c:564:20: warning: variable 'devnr'
 set but not used
Message-ID: <202305121002.j5pUJemd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 7d709841b48071e203642a18aef6b5e7ff850fe4 [8/30] acpi: tables: Add CDAT table parsing support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230512/202305121002.j5pUJemd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=7d709841b48071e203642a18aef6b5e7ff850fe4
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 7d709841b48071e203642a18aef6b5e7ff850fe4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/media/usb/cx231xx/ drivers/media/usb/em28xx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121002.j5pUJemd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/i2c.h:13,
                    from drivers/media/usb/cx231xx/cx231xx.h:16,
                    from drivers/media/usb/cx231xx/cx231xx-audio.c:9:
   include/linux/acpi.h:1540:56: warning: 'struct acpi_subtable_proc' declared inside parameter list will not be visible outside of this definition or declaration
    1540 |         struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
         |                                                        ^~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1547:27: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1547 |                           acpi_tbl_entry_handler_arg handler, void *arg,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           acpi_gbl_event_handler
   drivers/media/usb/cx231xx/cx231xx-audio.c: In function 'cx231xx_audio_init':
>> drivers/media/usb/cx231xx/cx231xx-audio.c:564:20: warning: variable 'devnr' set but not used [-Wunused-but-set-variable]
     564 |         static int devnr;
         |                    ^~~~~
   drivers/media/usb/cx231xx/cx231xx-audio.c: At top level:
   drivers/media/usb/cx231xx/cx231xx-audio.c:29:12: warning: 'index' defined but not used [-Wunused-variable]
      29 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from include/linux/i2c.h:13,
                    from drivers/media/usb/em28xx/em28xx.h:22,
                    from drivers/media/usb/em28xx/em28xx-audio.c:14:
   include/linux/acpi.h:1540:56: warning: 'struct acpi_subtable_proc' declared inside parameter list will not be visible outside of this definition or declaration
    1540 |         struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
         |                                                        ^~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1547:27: error: unknown type name 'acpi_tbl_entry_handler_arg'; did you mean 'acpi_gbl_event_handler'?
    1547 |                           acpi_tbl_entry_handler_arg handler, void *arg,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           acpi_gbl_event_handler
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
https://github.com/intel/lkp-tests
