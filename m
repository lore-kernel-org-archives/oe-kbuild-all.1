Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59D63DDB0B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002729; cv=none; b=QTN+8h4RljWxVTrAK+XizkCpw11g5+i6nht0lBvPOrYRylTN90MbPiaYqNWiEYfo6DoTuXOto/G4q8DLs1ZjmyjzKa2qWxuoL3tUdpNv7+3xBBSSuGz4YdVBJM7JjZnJqEBlZtz2edef6EwfLc9wnkZSWtMSh6HNGxKBI0kF1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002729; c=relaxed/simple;
	bh=GrEL5XeelyF+1rt7jGp8/8XXh2fxl0WM1bFtx/MXMiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ftw4wJdLxOjkdAEpcuemQMZisvB/EOeVvBM3ITDTLzDrLsnOuVeniVKLYAHo/LLMjlWg3K7MnvP6lD4Gg2xjjiOBx+M9MZ6IktzLwXY2UxbX27+eGZ5N82bebqX0JEAzCxePrFz9kJqHpmpFkPVOvDWOK//VFWJPTi0L1JXqmCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRM9wFyc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRM9wFyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786002728; x=1817538728;
  h=date:from:to:cc:subject:message-id;
  bh=GrEL5XeelyF+1rt7jGp8/8XXh2fxl0WM1bFtx/MXMiU=;
  b=MRM9wFycW6VYCYdYyhp0VR7V6yq3K07OIMOXg2fC8nA9/ubLV6zGoeV/
   CDm03UlNWr1NHW5y/ch5jCi/XtY6daRmTg9QnTFYv5fpdS9EFHQ6GMLog
   D+6oysjCvjkIiwkvZOaTHNZUy7TqM3IMW1xDAAs00wmXBkWfhxTzdk0D5
   C3PL+jEOv0qch/+IVAiYd4a59TXtMP1MbuSZbl/al1ELqw2v10VPAJS9l
   LFnKsa0QqtP8S5fFZRhVSV6oO233nFvZdOtD+Jhj0IHEPtr2saUzYeABI
   c9tZ664ASmic7etbF/7F/Je3m7s3f13yBJzIDVXMI0xKhlA/IKwkt/XDf
   A==;
X-CSE-ConnectionGUID: CcfIq/oqQRmIN3RsRO6ATQ==
X-CSE-MsgGUID: ACkWC5TuS9W0wfOGvUnEuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97234621"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97234621"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:52:05 -0700
X-CSE-ConnectionGUID: +I+f7vv/T12JUIsCa/vMVw==
X-CSE-MsgGUID: 32CFD1IJSMub3G6DY4bGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="266253624"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2026 00:52:03 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrstU-00000000EZD-3QVB;
	Thu, 06 Aug 2026 07:52:00 +0000
Date: Thu, 06 Aug 2026 15:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joakim Zhang <joakim.zhang@cixtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>
Subject: sound/hda/controllers/cix-ipbloq.c:223:50: sparse: sparse:
 cast truncates bits from constant value (ffffffff70000000 becomes 70000000)
Message-ID: <202608061559.Kxqvi5LZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: d91e9bd10125a9b0427420453b11f56228a6d6d0 ALSA: hda: add CIX IPBLOQ HDA controller support
date:   8 months ago
config: openrisc-randconfig-r112-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061559.Kxqvi5LZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061559.Kxqvi5LZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d91e9bd10125 ("ALSA: hda: add CIX IPBLOQ HDA controller support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061559.Kxqvi5LZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/hda/controllers/cix-ipbloq.c:223:50: sparse: sparse: cast truncates bits from constant value (ffffffff70000000 becomes 70000000)

vim +223 sound/hda/controllers/cix-ipbloq.c

   179	
   180	static int cix_ipbloq_hda_create(struct cix_ipbloq_hda *hda,
   181					 struct snd_card *card,
   182					 unsigned int driver_caps)
   183	{
   184		static const struct snd_device_ops ops = {
   185			.dev_disconnect = cix_ipbloq_hda_dev_disconnect,
   186			.dev_free = cix_ipbloq_hda_dev_free,
   187		};
   188		struct azx *chip;
   189		int err;
   190	
   191		chip = &hda->chip;
   192		chip->card = card;
   193		chip->ops = &cix_ipbloq_hda_ops;
   194		chip->driver_caps = driver_caps;
   195		chip->driver_type = driver_caps & 0xff;
   196		chip->dev_index = 0;
   197		chip->single_cmd = 0;
   198		chip->codec_probe_mask = -1;
   199		chip->align_buffer_size = 1;
   200		chip->jackpoll_interval = msecs_to_jiffies(CIX_IPBLOQ_JACKPOLL_DEFAULT_TIME_MS);
   201		mutex_init(&chip->open_mutex);
   202		INIT_LIST_HEAD(&chip->pcm_list);
   203	
   204		/*
   205		 * HD-audio controllers appear pretty inaccurate about the update-IRQ timing.
   206		 * The IRQ is issued before actually the data is processed. So use stream
   207		 * link position by default instead of dma position buffer.
   208		 */
   209		chip->get_position[0] = chip->get_position[1] = azx_get_pos_lpib;
   210	
   211		err = azx_bus_init(chip, NULL);
   212		if (err < 0) {
   213			dev_err(hda->dev, "failed to init bus, err = %d\n", err);
   214			return err;
   215		}
   216	
   217		/* RIRBSTS.RINTFL cannot be cleared, cause interrupt storm */
   218		chip->bus.core.polling_mode = 1;
   219		chip->bus.core.not_use_interrupts = 1;
   220	
   221		chip->bus.core.aligned_mmio = 1;
   222		chip->bus.core.dma_stop_delay = 100;
 > 223		chip->bus.core.addr_offset = (dma_addr_t)CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
   224	
   225		chip->bus.jackpoll_in_suspend = 1;
   226	
   227		err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
   228		if (err < 0) {
   229			dev_err(card->dev, "failed to create device, err = %d\n", err);
   230			return err;
   231		}
   232	
   233		return 0;
   234	}
   235	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
