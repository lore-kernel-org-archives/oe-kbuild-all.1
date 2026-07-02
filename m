Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2515B38E113
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 06:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975582; cv=none; b=KfXya8eqNF/vDfTi/HXSdGnKoTfLjnEq/arsoZQvyVJrxtrZpGpkNj7k6YPPY8xKq0Z7wHirm87wOp0coOmlMvKkejC7+r77xZ6jMkglmiEMMnSkvIiCkCeq5SAolCmxXAm+zzud+8qQ6Mg/mDwJmG6W1ep3DSoCS4wJO6Ycpbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975582; c=relaxed/simple;
	bh=65rnGVBl4AsO51+kUvL5x5sfOuyXQdqt9jSZR60NA00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cKjs0YxsDDKv2qvc2iqRwiDBNGBC2zepXnWs0JlMUwFzEYIPcEnDNwgrrlvZxs/nbdhTWJlWosdSUwL1juArAi4w6lAb/b+u2mtXe4FBlS5KYFzUXbud1D4XGrBXOpD1/vQf3bdOBeZ4INaXjUzSS3NOj9XPCj2r/UehNaEWzsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuFZjeKx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuFZjeKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782975580; x=1814511580;
  h=date:from:to:cc:subject:message-id;
  bh=65rnGVBl4AsO51+kUvL5x5sfOuyXQdqt9jSZR60NA00=;
  b=NuFZjeKxEd8zkZO1eCEEQjwaazxWuvVQgSsCOqROe2ZvQYIpuSgzR8eF
   sLhTc7M70AjLCvzNO9ELPfiy4di2eHZjkLwkYy7N34uapxElnGKFYou7D
   ei0byBWF6/jwuTxEiFo9nOzVo6EyFYV25ibdlw4+auW61bC0JCy3Rlfyt
   2BtuGFDkdJws/drG2Bz6SwTCndPx9ohsN6DACqokUf/J/7V4sSDDYvfyA
   hn42hn0qT/0B031nPD/mtKWkukjhLVV5JsltDfV1C5shSokdv3Jwj5Re1
   JOavXcpU6ve4IPg/8x9THpKvGIIIop9fNrSqqyyk6IMzvY+SyP0+PWVL0
   A==;
X-CSE-ConnectionGUID: pPR/y9t3RiWP4bzdcy16bA==
X-CSE-MsgGUID: pgs6kZ35Qr26GNO4HnKYxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="101260167"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101260167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:59:39 -0700
X-CSE-ConnectionGUID: YVlyg1wQQuCvh12L2lkc/g==
X-CSE-MsgGUID: T8O84bjET7uJcIXLtlCS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256689848"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2026 23:59:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfBOY-00000000A7d-3ulT;
	Thu, 02 Jul 2026 06:59:34 +0000
Date: Thu, 02 Jul 2026 14:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joakim Zhang <joakim.zhang@cixtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>
Subject: sound/hda/controllers/cix-ipbloq.c:223:50: sparse: sparse:
 cast truncates bits from constant value (ffffffff70000000 becomes 70000000)
Message-ID: <202607021456.Dr4wIka4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: d91e9bd10125a9b0427420453b11f56228a6d6d0 ALSA: hda: add CIX IPBLOQ HDA controller support
date:   7 months ago
config: m68k-randconfig-r132-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021456.Dr4wIka4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021456.Dr4wIka4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d91e9bd10125 ("ALSA: hda: add CIX IPBLOQ HDA controller support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021456.Dr4wIka4-lkp@intel.com/

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
