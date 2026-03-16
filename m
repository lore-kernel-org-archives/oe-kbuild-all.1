Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3522765E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659400; cv=none; b=jSpNw8zGjZF+udUs1bLGwVxxudjagddHEh7faQ5iP8gHdjsiav1s1d4dJv0vU1UWjPatfzsD8dSZX9VT0PUoABUAEGhFmjhR5Kj6CByjb6W6DochmEM7UsRl+nIFuOtKhVH8rpPk/qTwdOxYltCFHqiYRK9cuOLovAcKObJzE8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659400; c=relaxed/simple;
	bh=I8/z1zpk4jz19N5PcUmBkRIuWDod+5H+VGdkHhoYokk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FnGQFnWboCvp8Zxb98cmekFGjxOFlLhBqzmdkG8+CVvgAOy+aIEltS3nv9AtNWSpEfdw4FHlwSIY/DC2HC4EHx12+hTZhLpa9VTRgnTZpyDc3ezBvekmTRtgM2bFtY/qze887pH6gjY0Y28ZY2rdU5tTPAivhsNVMJoGW66vcZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhSlXjzf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhSlXjzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773659399; x=1805195399;
  h=date:from:to:cc:subject:message-id;
  bh=I8/z1zpk4jz19N5PcUmBkRIuWDod+5H+VGdkHhoYokk=;
  b=mhSlXjzfBRk9d2YUbv3eMJOgo7s+NOFp4rSaHDHwQi5hROVm56IkmyHj
   vaQY7B+/bymyZm4Z3JSHrBgun2M2lhg6TpnLFMN5Rie9OyVFEQ1DmR9cB
   BthGlVkoOpf8y4poM9+UeD7IWYEOo19/b1T66CI8w82pEBSz7jqbW9ITn
   8QsEqXXHHd3zsypTmNxqkyQnY4RvDTeD/tukYq1+ysE4xWXZHWJrKzq7u
   jp4EAAiziUHFOHsaYY8WOk6aQx6vu0azH7TWJcTWcPm+JwutTlHoOET5K
   vQjvSZ43kXZ1Gvw+nrskT9G3R8x1Dl1pbYqfWxVTuzuXicpe25jJvaXSv
   Q==;
X-CSE-ConnectionGUID: z1y1objrQiSmBnJNjR+1BA==
X-CSE-MsgGUID: NBy13zfiTBKkgr4AuHMHwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74786634"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74786634"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 04:09:58 -0700
X-CSE-ConnectionGUID: zPTt+oSmTYabvaJ8CZv3aA==
X-CSE-MsgGUID: 8LgjJiGnRNu28vLdkCZBdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221118812"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Mar 2026 04:09:56 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w25pZ-000000000Z8-1X91;
	Mon, 16 Mar 2026 11:09:53 +0000
Date: Mon, 16 Mar 2026 19:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joakim Zhang <joakim.zhang@cixtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>
Subject: sound/hda/controllers/cix-ipbloq.c:223:50: sparse: sparse:
 cast truncates bits from constant value (ffffffff70000000 becomes 70000000)
Message-ID: <202603161916.hSwLiB3N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
commit: d91e9bd10125a9b0427420453b11f56228a6d6d0 ALSA: hda: add CIX IPBLOQ HDA controller support
date:   3 months ago
config: nios2-randconfig-r112-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161916.hSwLiB3N-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161916.hSwLiB3N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161916.hSwLiB3N-lkp@intel.com/

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
