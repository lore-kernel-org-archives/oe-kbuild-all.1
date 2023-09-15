Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F042919BDC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 19:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694806982; x=1726342982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p5dxCj8m+o3bcQNdxYq6+sBBwlen2lzwTq5/OzH8ZtA=;
  b=IHThAgsPUG+tDNKn7PWSEzfbecgxVHfDPI3DEISAbuWYg13meKMGAmDH
   k4ZsbojCoXsY1qQca59WJwQdXKkBf/6+n2uh2bKJTNxs22amFf3dRDE69
   ERyesQsCHmzOA+Dxv8UiCXtIGj7bn4E9Gp/+WRALSC7aaB8G2/+CKbHQ2
   sZMiwrXmDCjm8zxICo/vkr/1X/fx831keIrBSL45o8dGmP+HnRi+iR7s6
   WmnOfXymJHnEIOYaZO132ZUgduSbfRgW3Yr8oEsctzC6k2XgZRK6WdBFF
   SJHS47TEVM5X3pKRV+30GWixFHofZzYwhsFPQPaXJItpcNiDTuN0ExK2L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="443393747"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="443393747"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 12:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810632807"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="810632807"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Sep 2023 12:43:00 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhEhK-0003L0-2G;
	Fri, 15 Sep 2023 19:42:18 +0000
Date: Sat, 16 Sep 2023 03:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 25/34]
 sound/aoa/soundbus/i2sbus/pcm.c:975:61: error: invalid type argument of '->'
 (have 'struct snd_pcm_str')
Message-ID: <202309160349.OGCTf8KS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d40af3977b3142766b5f13198eef7dbb4c1c431c
commit: 75d08428462fae6c019fd776d8efd68806a2bc86 [25/34] UPSTREAM: ALSA: pcm: Don't embed device
config: powerpc-randconfig-003-20230916 (https://download.01.org/0day-ci/archive/20230916/202309160349.OGCTf8KS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160349.OGCTf8KS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160349.OGCTf8KS-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/aoa/soundbus/i2sbus/pcm.c: In function 'i2sbus_attach_codec':
>> sound/aoa/soundbus/i2sbus/pcm.c:975:61: error: invalid type argument of '->' (have 'struct snd_pcm_str')
     975 |                 dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]->dev.parent =
         |                                                             ^~
   sound/aoa/soundbus/i2sbus/pcm.c:992:60: error: invalid type argument of '->' (have 'struct snd_pcm_str')
     992 |                 dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE]->dev.parent =
         |                                                            ^~


vim +975 sound/aoa/soundbus/i2sbus/pcm.c

   866	
   867	int
   868	i2sbus_attach_codec(struct soundbus_dev *dev, struct snd_card *card,
   869			    struct codec_info *ci, void *data)
   870	{
   871		int err, in = 0, out = 0;
   872		struct transfer_info *tmp;
   873		struct i2sbus_dev *i2sdev = soundbus_dev_to_i2sbus_dev(dev);
   874		struct codec_info_item *cii;
   875	
   876		if (!dev->pcmname || dev->pcmid == -1) {
   877			printk(KERN_ERR "i2sbus: pcm name and id must be set!\n");
   878			return -EINVAL;
   879		}
   880	
   881		list_for_each_entry(cii, &dev->codec_list, list) {
   882			if (cii->codec_data == data)
   883				return -EALREADY;
   884		}
   885	
   886		if (!ci->transfers || !ci->transfers->formats
   887		    || !ci->transfers->rates || !ci->usable)
   888			return -EINVAL;
   889	
   890		/* we currently code the i2s transfer on the clock, and support only
   891		 * 32 and 64 */
   892		if (ci->bus_factor != 32 && ci->bus_factor != 64)
   893			return -EINVAL;
   894	
   895		/* If you want to fix this, you need to keep track of what transport infos
   896		 * are to be used, which codecs they belong to, and then fix all the
   897		 * sysclock/busclock stuff above to depend on which is usable */
   898		list_for_each_entry(cii, &dev->codec_list, list) {
   899			if (cii->codec->sysclock_factor != ci->sysclock_factor) {
   900				printk(KERN_DEBUG
   901				       "cannot yet handle multiple different sysclocks!\n");
   902				return -EINVAL;
   903			}
   904			if (cii->codec->bus_factor != ci->bus_factor) {
   905				printk(KERN_DEBUG
   906				       "cannot yet handle multiple different bus clocks!\n");
   907				return -EINVAL;
   908			}
   909		}
   910	
   911		tmp = ci->transfers;
   912		while (tmp->formats && tmp->rates) {
   913			if (tmp->transfer_in)
   914				in = 1;
   915			else
   916				out = 1;
   917			tmp++;
   918		}
   919	
   920		cii = kzalloc(sizeof(struct codec_info_item), GFP_KERNEL);
   921		if (!cii)
   922			return -ENOMEM;
   923	
   924		/* use the private data to point to the codec info */
   925		cii->sdev = soundbus_dev_get(dev);
   926		cii->codec = ci;
   927		cii->codec_data = data;
   928	
   929		if (!cii->sdev) {
   930			printk(KERN_DEBUG
   931			       "i2sbus: failed to get soundbus dev reference\n");
   932			err = -ENODEV;
   933			goto out_free_cii;
   934		}
   935	
   936		if (!try_module_get(THIS_MODULE)) {
   937			printk(KERN_DEBUG "i2sbus: failed to get module reference!\n");
   938			err = -EBUSY;
   939			goto out_put_sdev;
   940		}
   941	
   942		if (!try_module_get(ci->owner)) {
   943			printk(KERN_DEBUG
   944			       "i2sbus: failed to get module reference to codec owner!\n");
   945			err = -EBUSY;
   946			goto out_put_this_module;
   947		}
   948	
   949		if (!dev->pcm) {
   950			err = snd_pcm_new(card, dev->pcmname, dev->pcmid, 0, 0,
   951					  &dev->pcm);
   952			if (err) {
   953				printk(KERN_DEBUG "i2sbus: failed to create pcm\n");
   954				goto out_put_ci_module;
   955			}
   956		}
   957	
   958		/* ALSA yet again sucks.
   959		 * If it is ever fixed, remove this line. See below. */
   960		out = in = 1;
   961	
   962		if (!i2sdev->out.created && out) {
   963			if (dev->pcm->card != card) {
   964				/* eh? */
   965				printk(KERN_ERR
   966				       "Can't attach same bus to different cards!\n");
   967				err = -EINVAL;
   968				goto out_put_ci_module;
   969			}
   970			err = snd_pcm_new_stream(dev->pcm, SNDRV_PCM_STREAM_PLAYBACK, 1);
   971			if (err)
   972				goto out_put_ci_module;
   973			snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_PLAYBACK,
   974					&i2sbus_playback_ops);
 > 975			dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]->dev.parent =
   976				&dev->ofdev.dev;
   977			i2sdev->out.created = 1;
   978		}
   979	
   980		if (!i2sdev->in.created && in) {
   981			if (dev->pcm->card != card) {
   982				printk(KERN_ERR
   983				       "Can't attach same bus to different cards!\n");
   984				err = -EINVAL;
   985				goto out_put_ci_module;
   986			}
   987			err = snd_pcm_new_stream(dev->pcm, SNDRV_PCM_STREAM_CAPTURE, 1);
   988			if (err)
   989				goto out_put_ci_module;
   990			snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_CAPTURE,
   991					&i2sbus_record_ops);
   992			dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE]->dev.parent =
   993				&dev->ofdev.dev;
   994			i2sdev->in.created = 1;
   995		}
   996	
   997		/* so we have to register the pcm after adding any substream
   998		 * to it because alsa doesn't create the devices for the
   999		 * substreams when we add them later.
  1000		 * Therefore, force in and out on both busses (above) and
  1001		 * register the pcm now instead of just after creating it.
  1002		 */
  1003		err = snd_device_register(card, dev->pcm);
  1004		if (err) {
  1005			printk(KERN_ERR "i2sbus: error registering new pcm\n");
  1006			goto out_put_ci_module;
  1007		}
  1008		/* no errors any more, so let's add this to our list */
  1009		list_add(&cii->list, &dev->codec_list);
  1010	
  1011		dev->pcm->private_data = i2sdev;
  1012		dev->pcm->private_free = i2sbus_private_free;
  1013	
  1014		/* well, we really should support scatter/gather DMA */
  1015		snd_pcm_set_managed_buffer_all(
  1016			dev->pcm, SNDRV_DMA_TYPE_DEV,
  1017			&macio_get_pci_dev(i2sdev->macio)->dev,
  1018			64 * 1024, 64 * 1024);
  1019	
  1020		return 0;
  1021	 out_put_ci_module:
  1022		module_put(ci->owner);
  1023	 out_put_this_module:
  1024		module_put(THIS_MODULE);
  1025	 out_put_sdev:
  1026		soundbus_dev_put(dev);
  1027	 out_free_cii:
  1028		kfree(cii);
  1029		return err;
  1030	}
  1031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
