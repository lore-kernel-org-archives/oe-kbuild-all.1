Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7885E2BD58A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 17:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768065932; cv=none; b=LF9n1SiNRYs8/tJnV4b8tT8a9ovIp2jRaM9iaZkSy8V0r0gMm6p+6BifikfKPa6ACCxq9VjUeWFioBY3BBs33RaFaCRjhs6OM1XG+TAYP0Q2t8yvzcLK8t+nRctM9jjbuuFdQsKVUDrkahTNEHmrghBt9vj7WwhO4q3LGrfzki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768065932; c=relaxed/simple;
	bh=d//GAPNCHhjMCWi3Wo9rdjMxUY+Pk4QjX1FoUPsOjvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SRG3/4fMHq24+CdpeG22oW7aqehiKCvju5e2EIqt/CLCIJlweVb0xGSQrjt/cZlfgQjsxzjkVRjpbMdofkFhJJBAzIGUgQOw+hjk1NJWQ/E1qi8O3+HkwAuEpbO29W5mhLCoqup8lJH5/3ikTTz6gKE+lZwzvC2CiEpNhDBg2qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhAjzBSl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhAjzBSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768065912; x=1799601912;
  h=date:from:to:cc:subject:message-id;
  bh=d//GAPNCHhjMCWi3Wo9rdjMxUY+Pk4QjX1FoUPsOjvA=;
  b=lhAjzBSlkiPa2/Ht+NCtch5Ucib175ApDikguMa4K/nhFoMYG5H4BMft
   5wdRnKtYBCl6DzObQxMzdCC5xfT3X59EQ2MPzAfjtaPBOXcmutYS27/ij
   PfFT2K+KikwKLY/Bl0TLWy8feUnJ8Go+vjOK/0Nj5qEmZ/aH06ceI9N7I
   UKOkeKZjap5h6VxjfnZbsF+Zrfqnqn92q3X4Y54Rvd4VKHlPKK6XV+DQg
   ckHPYhVPfpj4MF4stqCpr2811h4qxFpEpzIZIVWlIAIvQncKhQPW+tkG9
   o9hoYfAo2r1VkA2At8A5iXcMACDKE+PF7Sc5JAuueYJKw9/vTAj3b7JA5
   w==;
X-CSE-ConnectionGUID: eFF15FqISXGdge3KPXfnjQ==
X-CSE-MsgGUID: TQ7yE16fT9eoA+2Wt2JPtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="71985983"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="71985983"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 09:25:12 -0800
X-CSE-ConnectionGUID: ma8f2VmgT26zb50LR/SxpA==
X-CSE-MsgGUID: uf5QTFdiT5STYAXTHN+tQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="234418040"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2026 09:25:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veci3-000000008vQ-2XVN;
	Sat, 10 Jan 2026 17:25:07 +0000
Date: Sun, 11 Jan 2026 01:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 22/22]
 sound/hda/controllers/cix-ipbloq.c:221:50: sparse: sparse: cast truncates
 bits from constant value (ffffffff70000000 becomes 70000000)
Message-ID: <202601110109.JMo53OB4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   d1ec28ccbb7a3c86b11e03944d9231500dad60ae
commit: 9d20897b90b3842f3d30f948173a80ae6bd0eea2 [22/22] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: m68k-randconfig-r134-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110109.JMo53OB4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110109.JMo53OB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601110109.JMo53OB4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/hda/controllers/cix-ipbloq.c:221:50: sparse: sparse: cast truncates bits from constant value (ffffffff70000000 becomes 70000000)

vim +221 sound/hda/controllers/cix-ipbloq.c

d91e9bd10125a9 Joakim Zhang 2025-12-05  177  
d91e9bd10125a9 Joakim Zhang 2025-12-05  178  static int cix_ipbloq_hda_create(struct cix_ipbloq_hda *hda,
d91e9bd10125a9 Joakim Zhang 2025-12-05  179  				 struct snd_card *card,
d91e9bd10125a9 Joakim Zhang 2025-12-05  180  				 unsigned int driver_caps)
d91e9bd10125a9 Joakim Zhang 2025-12-05  181  {
d91e9bd10125a9 Joakim Zhang 2025-12-05  182  	static const struct snd_device_ops ops = {
d91e9bd10125a9 Joakim Zhang 2025-12-05  183  		.dev_disconnect = cix_ipbloq_hda_dev_disconnect,
d91e9bd10125a9 Joakim Zhang 2025-12-05  184  		.dev_free = cix_ipbloq_hda_dev_free,
d91e9bd10125a9 Joakim Zhang 2025-12-05  185  	};
d91e9bd10125a9 Joakim Zhang 2025-12-05  186  	struct azx *chip;
d91e9bd10125a9 Joakim Zhang 2025-12-05  187  	int err;
d91e9bd10125a9 Joakim Zhang 2025-12-05  188  
d91e9bd10125a9 Joakim Zhang 2025-12-05  189  	chip = &hda->chip;
d91e9bd10125a9 Joakim Zhang 2025-12-05  190  	chip->card = card;
d91e9bd10125a9 Joakim Zhang 2025-12-05  191  	chip->ops = &cix_ipbloq_hda_ops;
d91e9bd10125a9 Joakim Zhang 2025-12-05  192  	chip->driver_caps = driver_caps;
d91e9bd10125a9 Joakim Zhang 2025-12-05  193  	chip->driver_type = driver_caps & 0xff;
d91e9bd10125a9 Joakim Zhang 2025-12-05  194  	chip->dev_index = 0;
d91e9bd10125a9 Joakim Zhang 2025-12-05  195  	chip->single_cmd = 0;
d91e9bd10125a9 Joakim Zhang 2025-12-05  196  	chip->codec_probe_mask = -1;
d91e9bd10125a9 Joakim Zhang 2025-12-05  197  	chip->align_buffer_size = 1;
d91e9bd10125a9 Joakim Zhang 2025-12-05  198  	chip->jackpoll_interval = msecs_to_jiffies(CIX_IPBLOQ_JACKPOLL_DEFAULT_TIME_MS);
d91e9bd10125a9 Joakim Zhang 2025-12-05  199  	mutex_init(&chip->open_mutex);
d91e9bd10125a9 Joakim Zhang 2025-12-05  200  	INIT_LIST_HEAD(&chip->pcm_list);
d91e9bd10125a9 Joakim Zhang 2025-12-05  201  
d91e9bd10125a9 Joakim Zhang 2025-12-05  202  	/*
d91e9bd10125a9 Joakim Zhang 2025-12-05  203  	 * HD-audio controllers appear pretty inaccurate about the update-IRQ timing.
d91e9bd10125a9 Joakim Zhang 2025-12-05  204  	 * The IRQ is issued before actually the data is processed. So use stream
d91e9bd10125a9 Joakim Zhang 2025-12-05  205  	 * link position by default instead of dma position buffer.
d91e9bd10125a9 Joakim Zhang 2025-12-05  206  	 */
d91e9bd10125a9 Joakim Zhang 2025-12-05  207  	chip->get_position[0] = chip->get_position[1] = azx_get_pos_lpib;
d91e9bd10125a9 Joakim Zhang 2025-12-05  208  
d91e9bd10125a9 Joakim Zhang 2025-12-05  209  	err = azx_bus_init(chip, NULL);
d91e9bd10125a9 Joakim Zhang 2025-12-05  210  	if (err < 0) {
d91e9bd10125a9 Joakim Zhang 2025-12-05  211  		dev_err(hda->dev, "failed to init bus, err = %d\n", err);
d91e9bd10125a9 Joakim Zhang 2025-12-05  212  		return err;
d91e9bd10125a9 Joakim Zhang 2025-12-05  213  	}
d91e9bd10125a9 Joakim Zhang 2025-12-05  214  
d91e9bd10125a9 Joakim Zhang 2025-12-05  215  	/* RIRBSTS.RINTFL cannot be cleared, cause interrupt storm */
d91e9bd10125a9 Joakim Zhang 2025-12-05  216  	chip->bus.core.polling_mode = 1;
d91e9bd10125a9 Joakim Zhang 2025-12-05  217  	chip->bus.core.not_use_interrupts = 1;
d91e9bd10125a9 Joakim Zhang 2025-12-05  218  
d91e9bd10125a9 Joakim Zhang 2025-12-05  219  	chip->bus.core.aligned_mmio = 1;
d91e9bd10125a9 Joakim Zhang 2025-12-05  220  	chip->bus.core.dma_stop_delay = 100;
d91e9bd10125a9 Joakim Zhang 2025-12-05 @221  	chip->bus.core.addr_offset = (dma_addr_t)CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
d91e9bd10125a9 Joakim Zhang 2025-12-05  222  
d91e9bd10125a9 Joakim Zhang 2025-12-05  223  	chip->bus.jackpoll_in_suspend = 1;
d91e9bd10125a9 Joakim Zhang 2025-12-05  224  
d91e9bd10125a9 Joakim Zhang 2025-12-05  225  	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
d91e9bd10125a9 Joakim Zhang 2025-12-05  226  	if (err < 0) {
d91e9bd10125a9 Joakim Zhang 2025-12-05  227  		dev_err(card->dev, "failed to create device, err = %d\n", err);
d91e9bd10125a9 Joakim Zhang 2025-12-05  228  		return err;
d91e9bd10125a9 Joakim Zhang 2025-12-05  229  	}
d91e9bd10125a9 Joakim Zhang 2025-12-05  230  
d91e9bd10125a9 Joakim Zhang 2025-12-05  231  	return 0;
d91e9bd10125a9 Joakim Zhang 2025-12-05  232  }
d91e9bd10125a9 Joakim Zhang 2025-12-05  233  

:::::: The code at line 221 was first introduced by commit
:::::: d91e9bd10125a9b0427420453b11f56228a6d6d0 ALSA: hda: add CIX IPBLOQ HDA controller support

:::::: TO: Joakim Zhang <joakim.zhang@cixtech.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
