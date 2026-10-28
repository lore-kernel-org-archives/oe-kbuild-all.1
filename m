Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210294;
	b=LSiY6qqCwUiivpMiXvJQtYB8wQbADqlG9CrQCkIzg1rAA0PspS7ZreSvOak3iBF7cITY
	 nRfrWthOGVN2YZt6wCl2DjhFjLte0WZlnAfjfhdpPOu99ax/vwfJPwsQBtbElMoiRp/dq
	 NGC4/2i/xHD0p1hn9xYjixvd4G9pdyFpw7vnQWB+du0NG2siXmbBVfIBDpVKNA2UUZEFf
	 u9XqOJVlnpDLNLAxUY32Skf6Pl1QhAvcH4O3ldyIdnSK4J62X5YUPkuJ1ldhaaO+axYB+
	 3jlveyNh2gG0nopyzWa7s0T8JXsWxRI3zYwjCE3PtBRSqPBhrJKppN4Qomg/ayhH94Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tps9g7LgImY/KqW2b2S2EgbXbGvWcD+C+nsD/ORh5Bk=;
	b=Ajjq8DnbRSd8kPFlRY7fPzQCS+3w700gDyf3k++6VBcBJc0rsMdELhZ3NLMVRLT/D3UY
	 UmQAePHrSbQC3zQ6pruyeaMu1tHxZ30KsEu3uPwPTtC6TOZ6T0VKYUlGnPMdqQQmwhtc2
	 1l8giNgWnX9+kk1/TVZaha+Ve/nnv7N4JL9QnVeC4DfU9SWa4TwPulvfY1rKs8H3PM94l
	 XxhEzHVD8xAEoka2V19cgIHKXrPNJtpE4kAXVd/x8fi/01JWFRjWukWjlovzInYzU1Ek/
	 RdxJD2AiorxRqL3Li3ycETmwWqj57IuxOj5wJpme8EJG2O62/5e8vJPevUsSFPce+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gzOx2TQe;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31928606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 17:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31928606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gzOx2TQe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793210291; x=1824746291;
  h=date:from:to:cc:subject:message-id;
  bh=dDQol9jII56lWjo1DU1NDF1LmfttZ9ti0GJiIodAbwU=;
  b=gzOx2TQeeD+B7tIadEg3Vg3ASDTdRrTT6PHDtmYdUqDLRWPKLX7LokXp
   LJ4OmQbl+i5LwRHKvtuky2bik5gF1AnZEAdZGSSDLlDBQaz05Ld27oHTB
   +9t9LF7YK8d6i99SU0FEwVoCdQbYGJtLh2dZFFHWj9kstOPL9BMZFBdWr
   ss2OZyCmybbTW4joxXOu5sSa7ZW8bn+h3JiNix7s7SLsLcUmq815XTEPi
   4HifVsVLDyBbNN4KotW2TYXgTTMsTLyKx0XRNkQaHXnGlC4fX/tzVlIIP
   AVqs7ji1S5mCLF0t1TSif/prSF2Vw0h+s1kWTCbwTNyxYt+oabGh6y6x0
   w==;
X-CSE-ConnectionGUID: iEMPYSTATBWXH2PYWyLRsA==
X-CSE-MsgGUID: DPNiwSwGQQ6FQipUxucAbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1966864"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1966864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 10:58:10 -0700
X-CSE-ConnectionGUID: kKaKgeLJRW6vF28CA0+cLA==
X-CSE-MsgGUID: AJOGBnbJQbqMYeErvFJ7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5246572"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2026 10:58:09 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM7uZ-000000004w9-13tV;
	Wed, 28 Oct 2026 17:58:07 +0000
Date: Wed, 28 Oct 2026 18:57:59 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-28-2 228/344]
 sound/soc/fsl/fsl_qmc_audio.c:206:20: error: incomplete definition of type
 'struct snd_soc_component'
Message-ID: <202610281854.qQgYKUoE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-28-2
head:   3274ffa4355111331c471a7987c5f2af43fac128
commit: af168bdef091990dd6d9c61f73bb5e428e6a2885 [228/344] ASoC: soc-component: capsuling Component
config: powerpc-randconfig-r2310-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281854.qQgYKUoE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281854.qQgYKUoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281854.qQgYKUoE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_qmc_audio.c:206:20: error: incomplete definition of type 'struct snd_soc_component'
     206 |                 dev_err(component->dev, "qmc_dai is not set\n");
         |                         ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:354:12: error: incomplete definition of type 'struct snd_soc_dai'
     354 |         return dai->driver - qmc_audio->dai_drivers;
         |                ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:560:14: error: incomplete definition of type 'struct snd_soc_dai'
     560 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:583:14: error: incomplete definition of type 'struct snd_soc_dai'
     583 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:596:14: error: incomplete definition of type 'struct snd_soc_dai'
     596 |                 dev_err(dai->dev, "Not enough qmc_chans. Need %u, avail %u\n",
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:607:16: error: incomplete definition of type 'struct snd_soc_dai'
     607 |                                 dev_err(dai->dev, "qmc_chans[%u], set param failed %d\n",
         |                                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:632:14: error: incomplete definition of type 'struct snd_soc_dai'
     632 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:949:8: error: call to undeclared function 'devm_snd_soc_component_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     949 |         ret = devm_snd_soc_component_register(qmc_audio->dev,
         |               ^
   sound/soc/fsl/fsl_qmc_audio.c:949:8: note: did you mean 'snd_soc_component_register'?
   include/sound/soc-component.h:230:5: note: 'snd_soc_component_register' declared here
     230 | int snd_soc_component_register(struct snd_soc_component *component,
         |     ^
   8 errors generated.


vim +206 sound/soc/fsl/fsl_qmc_audio.c

075c7125b11c72 Herve Codina 2023-02-17  198  
075c7125b11c72 Herve Codina 2023-02-17  199  static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
075c7125b11c72 Herve Codina 2023-02-17  200  				 struct snd_pcm_substream *substream, int cmd)
075c7125b11c72 Herve Codina 2023-02-17  201  {
075c7125b11c72 Herve Codina 2023-02-17  202  	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
075c7125b11c72 Herve Codina 2023-02-17  203  	int ret;
075c7125b11c72 Herve Codina 2023-02-17  204  
075c7125b11c72 Herve Codina 2023-02-17  205  	if (!prtd->qmc_dai) {
075c7125b11c72 Herve Codina 2023-02-17 @206  		dev_err(component->dev, "qmc_dai is not set\n");
075c7125b11c72 Herve Codina 2023-02-17  207  		return -EINVAL;
075c7125b11c72 Herve Codina 2023-02-17  208  	}
075c7125b11c72 Herve Codina 2023-02-17  209  
075c7125b11c72 Herve Codina 2023-02-17  210  	switch (cmd) {
075c7125b11c72 Herve Codina 2023-02-17  211  	case SNDRV_PCM_TRIGGER_START:
9aa33d5b4a53a1 Herve Codina 2025-04-10  212  		prtd->buffer_ended = 0;
9aa33d5b4a53a1 Herve Codina 2025-04-10  213  		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
9aa33d5b4a53a1 Herve Codina 2025-04-10  214  
075c7125b11c72 Herve Codina 2023-02-17  215  		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
075c7125b11c72 Herve Codina 2023-02-17  216  			/* Submit first chunk ... */
33a6969fbc653f Herve Codina 2024-07-01  217  			ret = qmc_audio_pcm_write_submit(prtd);
33a6969fbc653f Herve Codina 2024-07-01  218  			if (ret)
075c7125b11c72 Herve Codina 2023-02-17  219  				return ret;
075c7125b11c72 Herve Codina 2023-02-17  220  
075c7125b11c72 Herve Codina 2023-02-17  221  			/* ... prepare next one ... */
42212b2ce8b118 Herve Codina 2024-07-01  222  			prtd->ch_dma_addr_current += prtd->ch_dma_size;
42212b2ce8b118 Herve Codina 2024-07-01  223  			if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
42212b2ce8b118 Herve Codina 2024-07-01  224  				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
075c7125b11c72 Herve Codina 2023-02-17  225  
075c7125b11c72 Herve Codina 2023-02-17  226  			/* ... and send it */
33a6969fbc653f Herve Codina 2024-07-01  227  			ret = qmc_audio_pcm_write_submit(prtd);
33a6969fbc653f Herve Codina 2024-07-01  228  			if (ret)
075c7125b11c72 Herve Codina 2023-02-17  229  				return ret;
075c7125b11c72 Herve Codina 2023-02-17  230  		} else {
075c7125b11c72 Herve Codina 2023-02-17  231  			/* Submit first chunk ... */
33a6969fbc653f Herve Codina 2024-07-01  232  			ret = qmc_audio_pcm_read_submit(prtd);
33a6969fbc653f Herve Codina 2024-07-01  233  			if (ret)
075c7125b11c72 Herve Codina 2023-02-17  234  				return ret;
075c7125b11c72 Herve Codina 2023-02-17  235  
075c7125b11c72 Herve Codina 2023-02-17  236  			/* ... prepare next one ... */
42212b2ce8b118 Herve Codina 2024-07-01  237  			prtd->ch_dma_addr_current += prtd->ch_dma_size;
42212b2ce8b118 Herve Codina 2024-07-01  238  			if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
42212b2ce8b118 Herve Codina 2024-07-01  239  				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
075c7125b11c72 Herve Codina 2023-02-17  240  
075c7125b11c72 Herve Codina 2023-02-17  241  			/* ... and send it */
33a6969fbc653f Herve Codina 2024-07-01  242  			ret = qmc_audio_pcm_read_submit(prtd);
33a6969fbc653f Herve Codina 2024-07-01  243  			if (ret)
075c7125b11c72 Herve Codina 2023-02-17  244  				return ret;
075c7125b11c72 Herve Codina 2023-02-17  245  		}
075c7125b11c72 Herve Codina 2023-02-17  246  		break;
075c7125b11c72 Herve Codina 2023-02-17  247  
075c7125b11c72 Herve Codina 2023-02-17  248  	case SNDRV_PCM_TRIGGER_RESUME:
075c7125b11c72 Herve Codina 2023-02-17  249  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
075c7125b11c72 Herve Codina 2023-02-17  250  		break;
075c7125b11c72 Herve Codina 2023-02-17  251  
075c7125b11c72 Herve Codina 2023-02-17  252  	case SNDRV_PCM_TRIGGER_STOP:
075c7125b11c72 Herve Codina 2023-02-17  253  	case SNDRV_PCM_TRIGGER_SUSPEND:
075c7125b11c72 Herve Codina 2023-02-17  254  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
075c7125b11c72 Herve Codina 2023-02-17  255  		break;
075c7125b11c72 Herve Codina 2023-02-17  256  
075c7125b11c72 Herve Codina 2023-02-17  257  	default:
075c7125b11c72 Herve Codina 2023-02-17  258  		return -EINVAL;
075c7125b11c72 Herve Codina 2023-02-17  259  	}
075c7125b11c72 Herve Codina 2023-02-17  260  
075c7125b11c72 Herve Codina 2023-02-17  261  	return 0;
075c7125b11c72 Herve Codina 2023-02-17  262  }
075c7125b11c72 Herve Codina 2023-02-17  263  

:::::: The code at line 206 was first introduced by commit
:::::: 075c7125b11c72e7933401d73000d6d151196072 ASoC: fsl: Add support for QMC audio

:::::: TO: Herve Codina <herve.codina@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
