Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334C5A5C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 18:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694542106; x=1726078106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZT0WowJ6uW13UMD/Oz1CpBr+CyvI+f5mCg6AErZJq+k=;
  b=ICWXKi6gx+Lq7yFXOyGqSB/EhvxYGRzR39X+d2tYcgNTZRhT/KEAdm7s
   kc/AXT0/vnV2J8Ac6krdGnr1qnCSJBl9qYmVoNQG5l/SVg1O1CmlYk7B8
   i6Yy9xIVwI6lzdAHGjGHURL3j4ltKK45j1Uo/Jk/SM0ibdJ9b0kHo/qWr
   7Q56fw2LW9OpGC9P1VVpPtXDSUgQ7yTeN4qjQXme1sCRoBZewnycy8eEK
   OZvGs5JbgjuSY0/eHdeAJcw9DtLl+Ce7nnon3BzjVQvzUDeJRwfpeaAgk
   Nx1ePu02f8GIqX6/l4SILxGjmjCwiy0qw1pOhC+RhJxCR8eG0PZrzWhME
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377369224"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="377369224"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="778900226"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="778900226"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 11:08:23 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg7o9-00005R-01;
	Tue, 12 Sep 2023 18:08:18 +0000
Date: Wed, 13 Sep 2023 02:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/format-truncation-fixes 20/23]
 sound/pci/cmipci.c:3106:35: warning: '%d' directive output may be truncated
 writing between 1 and 11 bytes into a region of size 8
Message-ID: <202309130112.VUtCZ4wu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/format-truncation-fixes
head:   5eb64dfc2dc9c05e50f2f122d77b28cede293b6b
commit: 1c87c035c832a55414b42288df76bb10a5b11b34 [20/23] ALSA: cmipci: Fix -Wformat-truncation warning
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130112.VUtCZ4wu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130112.VUtCZ4wu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130112.VUtCZ4wu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/cmipci.c: In function 'snd_cmipci_create':
>> sound/pci/cmipci.c:3106:35: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
    3106 |                          " (model %d)", cm->chip_version);
         |                                   ^~
   sound/pci/cmipci.c:3106:26: note: directive argument in the range [-2147483648, 67]
    3106 |                          " (model %d)", cm->chip_version);
         |                          ^~~~~~~~~~~~~
   sound/pci/cmipci.c:3105:17: note: 'snprintf' output between 11 and 21 bytes into a destination of size 16
    3105 |                 snprintf(modelstr, sizeof(modelstr),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3106 |                          " (model %d)", cm->chip_version);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +3106 sound/pci/cmipci.c

  3041	
  3042		/* initialize codec registers */
  3043		snd_cmipci_set_bit(cm, CM_REG_MISC_CTRL, CM_RESET);
  3044		snd_cmipci_clear_bit(cm, CM_REG_MISC_CTRL, CM_RESET);
  3045		snd_cmipci_write(cm, CM_REG_INT_HLDCLR, 0);	/* disable ints */
  3046		snd_cmipci_ch_reset(cm, CM_CH_PLAY);
  3047		snd_cmipci_ch_reset(cm, CM_CH_CAPT);
  3048		snd_cmipci_write(cm, CM_REG_FUNCTRL0, 0);	/* disable channels */
  3049		snd_cmipci_write(cm, CM_REG_FUNCTRL1, 0);
  3050	
  3051		snd_cmipci_write(cm, CM_REG_CHFORMAT, 0);
  3052		snd_cmipci_set_bit(cm, CM_REG_MISC_CTRL, CM_ENDBDAC|CM_N4SPK3D);
  3053	#if CM_CH_PLAY == 1
  3054		snd_cmipci_set_bit(cm, CM_REG_MISC_CTRL, CM_XCHGDAC);
  3055	#else
  3056		snd_cmipci_clear_bit(cm, CM_REG_MISC_CTRL, CM_XCHGDAC);
  3057	#endif
  3058		if (cm->chip_version) {
  3059			snd_cmipci_write_b(cm, CM_REG_EXT_MISC, 0x20); /* magic */
  3060			snd_cmipci_write_b(cm, CM_REG_EXT_MISC + 1, 0x09); /* more magic */
  3061		}
  3062		/* Set Bus Master Request */
  3063		snd_cmipci_set_bit(cm, CM_REG_FUNCTRL1, CM_BREQ);
  3064	
  3065		/* Assume TX and compatible chip set (Autodetection required for VX chip sets) */
  3066		switch (pci->device) {
  3067		case PCI_DEVICE_ID_CMEDIA_CM8738:
  3068		case PCI_DEVICE_ID_CMEDIA_CM8738B:
  3069			if (!pci_dev_present(intel_82437vx)) 
  3070				snd_cmipci_set_bit(cm, CM_REG_MISC_CTRL, CM_TXVX);
  3071			break;
  3072		default:
  3073			break;
  3074		}
  3075	
  3076		if (cm->chip_version < 68) {
  3077			val = pci->device < 0x110 ? 8338 : 8738;
  3078		} else {
  3079			switch (snd_cmipci_read_b(cm, CM_REG_INT_HLDCLR + 3) & 0x03) {
  3080			case 0:
  3081				val = 8769;
  3082				break;
  3083			case 2:
  3084				val = 8762;
  3085				break;
  3086			default:
  3087				switch ((pci->subsystem_vendor << 16) |
  3088					pci->subsystem_device) {
  3089				case 0x13f69761:
  3090				case 0x584d3741:
  3091				case 0x584d3751:
  3092				case 0x584d3761:
  3093				case 0x584d3771:
  3094				case 0x72848384:
  3095					val = 8770;
  3096					break;
  3097				default:
  3098					val = 8768;
  3099					break;
  3100				}
  3101			}
  3102		}
  3103		sprintf(card->shortname, "C-Media CMI%d", val);
  3104		if (cm->chip_version < 68)
  3105			snprintf(modelstr, sizeof(modelstr),
> 3106				 " (model %d)", cm->chip_version);
  3107		else
  3108			modelstr[0] = '\0';
  3109		scnprintf(card->longname, sizeof(card->longname),
  3110			  "%s%s at %#lx, irq %i",
  3111			  card->shortname, modelstr, cm->iobase, cm->irq);
  3112	
  3113		if (cm->chip_version >= 39) {
  3114			val = snd_cmipci_read_b(cm, CM_REG_MPU_PCI + 1);
  3115			if (val != 0x00 && val != 0xff) {
  3116				if (mpu_port[dev])
  3117					iomidi = cm->iobase + CM_REG_MPU_PCI;
  3118				integrated_midi = 1;
  3119			}
  3120		}
  3121		if (!integrated_midi) {
  3122			val = 0;
  3123			iomidi = mpu_port[dev];
  3124			switch (iomidi) {
  3125			case 0x320: val = CM_VMPU_320; break;
  3126			case 0x310: val = CM_VMPU_310; break;
  3127			case 0x300: val = CM_VMPU_300; break;
  3128			case 0x330: val = CM_VMPU_330; break;
  3129			default:
  3130				    iomidi = 0; break;
  3131			}
  3132			if (iomidi > 0) {
  3133				snd_cmipci_write(cm, CM_REG_LEGACY_CTRL, val);
  3134				/* enable UART */
  3135				snd_cmipci_set_bit(cm, CM_REG_FUNCTRL1, CM_UART_EN);
  3136				if (inb(iomidi + 1) == 0xff) {
  3137					dev_err(cm->card->dev,
  3138						"cannot enable MPU-401 port at %#lx\n",
  3139						iomidi);
  3140					snd_cmipci_clear_bit(cm, CM_REG_FUNCTRL1,
  3141							     CM_UART_EN);
  3142					iomidi = 0;
  3143				}
  3144			}
  3145		}
  3146	
  3147		if (cm->chip_version < 68) {
  3148			err = snd_cmipci_create_fm(cm, fm_port[dev]);
  3149			if (err < 0)
  3150				return err;
  3151		}
  3152	
  3153		/* reset mixer */
  3154		snd_cmipci_mixer_write(cm, 0, 0);
  3155	
  3156		snd_cmipci_proc_init(cm);
  3157	
  3158		/* create pcm devices */
  3159		pcm_index = pcm_spdif_index = 0;
  3160		err = snd_cmipci_pcm_new(cm, pcm_index);
  3161		if (err < 0)
  3162			return err;
  3163		pcm_index++;
  3164		err = snd_cmipci_pcm2_new(cm, pcm_index);
  3165		if (err < 0)
  3166			return err;
  3167		pcm_index++;
  3168		if (cm->can_ac3_hw || cm->can_ac3_sw) {
  3169			pcm_spdif_index = pcm_index;
  3170			err = snd_cmipci_pcm_spdif_new(cm, pcm_index);
  3171			if (err < 0)
  3172				return err;
  3173		}
  3174	
  3175		/* create mixer interface & switches */
  3176		err = snd_cmipci_mixer_new(cm, pcm_spdif_index);
  3177		if (err < 0)
  3178			return err;
  3179	
  3180		if (iomidi > 0) {
  3181			err = snd_mpu401_uart_new(card, 0, MPU401_HW_CMIPCI,
  3182						  iomidi,
  3183						  (integrated_midi ?
  3184						   MPU401_INFO_INTEGRATED : 0) |
  3185						  MPU401_INFO_IRQ_HOOK,
  3186						  -1, &cm->rmidi);
  3187			if (err < 0)
  3188				dev_err(cm->card->dev,
  3189					"no UART401 device at 0x%lx\n", iomidi);
  3190		}
  3191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
