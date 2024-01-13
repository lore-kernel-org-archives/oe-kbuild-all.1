Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5AF5223
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9oV/hLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705166875; x=1736702875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vyy8MRurRXmWBo4kw4shrvgK55TSDdypJmjKSWFuTc=;
  b=d9oV/hLz2YOlZ05jfz1cnR4rlsl8Gpggpy7glQurLryUBL+cCKcN0h//
   6ArGVkvEk5IVwXwS4zQHD1VAUrqu7D14rgIhRE+1B8IZyuv3kzcX2t98z
   WTyCsI5kIO8bp7aSseAXEbnC8iw69TruNnX3+z7S5j0U4Bnn0p19v0oiS
   BUbIzMGK+8CpJjHHsXyFaKYddFTo0WwWg7KEcAGQy9HF36uj/4q8yQeY0
   XSn8B3o8l9WKlkf+AiBffsnaZtSEb+uSWG+1rwtKbkkVQbddVV7gbIyds
   QdVbSg02tyLTolIsL3s2xmViSvZ+GvE7nHUebhIx/Mqq1r30dqm2Ti+CL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="403160139"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="403160139"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 09:27:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="956405203"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="956405203"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Jan 2024 09:27:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOhnT-000Ake-1f;
	Sat, 13 Jan 2024 17:27:51 +0000
Date: Sun, 14 Jan 2024 01:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21258/21544]
 sound/pci/hda/hda_phytium.c:431:17: warning: variable 'hda' set but not used
Message-ID: <202401140158.GtwcKIJG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: f828b65afdf2bda865c9eb3d8671a687adace842 [21258/21544] hda: add phytium hda driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240114/202401140158.GtwcKIJG-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140158.GtwcKIJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140158.GtwcKIJG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/hda_phytium.c:431:17: warning: variable 'hda' set but not used [-Wunused-but-set-variable]
     431 |         struct hda_ft *hda;
         |                        ^
>> sound/pci/hda/hda_phytium.c:460:6: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     460 |         int index;
         |             ^
>> sound/pci/hda/hda_phytium.c:462:18: warning: variable 'azx_dev' set but not used [-Wunused-but-set-variable]
     462 |         struct azx_dev *azx_dev;
         |                         ^
   sound/pci/hda/hda_phytium.c:511:17: warning: variable 'hda' set but not used [-Wunused-but-set-variable]
     511 |         struct hda_ft *hda;
         |                        ^
   sound/pci/hda/hda_phytium.c:535:17: warning: variable 'hda' set but not used [-Wunused-but-set-variable]
     535 |         struct hda_ft *hda;
         |                        ^
   sound/pci/hda/hda_phytium.c:539:6: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     539 |         int index;
         |             ^
   sound/pci/hda/hda_phytium.c:577:17: warning: variable 'hda' set but not used [-Wunused-but-set-variable]
     577 |         struct hda_ft *hda;
         |                        ^
   7 warnings generated.


vim +/hda +431 sound/pci/hda/hda_phytium.c

   424	
   425	#if defined(CONFIG_PM_SLEEP)
   426	/* power management */
   427	static int azx_suspend(struct device *dev)
   428	{
   429		struct snd_card *card = dev_get_drvdata(dev);
   430		struct azx *chip;
 > 431		struct hda_ft *hda;
   432		struct hdac_bus *bus;
   433	
   434		if (!card)
   435			return 0;
   436	
   437		chip = card->private_data;
   438		hda = container_of(chip, struct hda_ft, chip);
   439		if (chip->disabled || !chip->running)
   440			return 0;
   441	
   442		bus = azx_bus(chip);
   443		snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
   444		azx_clear_irq_pending(chip);
   445		azx_stop_chip(chip);
   446		if (bus->irq >= 0) {
   447			free_irq(bus->irq, chip);
   448			bus->irq = -1;
   449		}
   450	
   451		return 0;
   452	}
   453	
   454	static int azx_resume(struct device *dev)
   455	{
   456		struct snd_card *card = dev_get_drvdata(dev);
   457		struct azx *chip;
   458		struct hda_ft *hda;
   459		struct hdac_bus *bus;
 > 460		int index;
   461		struct snd_pcm_substream *substream;
 > 462		struct azx_dev *azx_dev;
   463		int err;
   464	
   465		if (!card)
   466			return 0;
   467	
   468		chip = card->private_data;
   469		hda = container_of(chip, struct hda_ft, chip);
   470		bus = azx_bus(chip);
   471		if (chip->disabled || !chip->running)
   472			return 0;
   473	
   474		if (azx_acquire_irq(chip, 1) < 0)
   475			return -EIO;
   476	
   477		index = chip->dev_index;
   478	
   479		snd_hdac_bus_exit_link_reset(bus);
   480		usleep_range(1000, 1200);
   481	
   482		azx_init_chip(chip, 0);
   483	
   484		snd_power_change_state(card, SNDRV_CTL_POWER_D0);
   485	
   486		if (hda->substream && hda->substream->runtime) {
   487			substream = hda->substream;
   488	
   489			if (substream->runtime->status->state ==
   490					SNDRV_PCM_STATE_SUSPENDED) {
   491				substream->runtime->status->state =
   492					substream->runtime->status->suspended_state;
   493				err = substream->ops->prepare(substream);
   494				if (err < 0)
   495					return err;
   496			}
   497	
   498			azx_dev = get_azx_dev(substream);
   499			hda->substream = NULL;
   500		}
   501	
   502		return 0;
   503	}
   504	#endif /* CONFIG_PM_SLEEP */
   505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
