Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E82157466
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 23:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723158525; cv=none; b=euq4GhY+5XGuafIXBP2zSKm1SisArHd42d6IPxuyZzrAU51AticNeHU2fMCbe8ta4NGPOpDHKDH+Fvfeg0vReVXaRxjmirijSrJo6oX7YzXn+H0pNh63QvWs4PkZyLhkg/m9qguj9JvceGM4hWg8UcACcjgwrNC1856pPVmoDTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723158525; c=relaxed/simple;
	bh=uKozS3A95G8a2XnTGxABFgSI9yunjEE+wCfjKDM96kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcugSt0reuzGtDnqQbG0JQmFY7m23w3JIKbJuUupu77ieEVSJV40HOilzhyrocnpo0GdH6uC920iO9aDYEHAeT/jV16vzPCH7xRLIPA0INuNaUQkdSgZ7ftX+ea2oCmjLQ2vUa4UTXUFMIAqyrsYcf0EJUZG4mLnnlOGsTC5wjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5RwhzBp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5RwhzBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723158523; x=1754694523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uKozS3A95G8a2XnTGxABFgSI9yunjEE+wCfjKDM96kM=;
  b=Q5RwhzBpx02EWkQ9U9+t6//W1LBW/8rdPMjlvuTKLhXlnFgO9N5IkKZD
   yJUFV2FEiCLsLm8v/h0rhVzLkZ592MbIzWxvGrj9J53pFQdq5n5JkuSB8
   CPrwLwztqrGfNQXjqk36PdlPYTeHNp+P2+OPhgA5E+wQ//lmXmBqpqcYd
   DS+l9OR0hwDQHK1jRxcyMV5Kxgu204WnhSFX/ZDt1oGMVQT1+GolFMbSI
   r5roYYTD7A6r9ZSMYoJVH3bU20n9Kl1hRTs8hLhOwD4lu9kGU7aP0Svoo
   lQqWCuh+jgUkm31K3ArvH12ddYOUrW+MdAGG19q98ojTCNFTt7w4KOxoK
   g==;
X-CSE-ConnectionGUID: ZxSwwun9Qba7C1i7HLs5QA==
X-CSE-MsgGUID: RCpP2w1ISUGpXjB+Zu8VeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21124897"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21124897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 16:08:42 -0700
X-CSE-ConnectionGUID: WYdqR+m+Sei5owT4HXyMWw==
X-CSE-MsgGUID: +kmvO9eBSESaK1lt8+Ysvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57037100"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 08 Aug 2024 16:08:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scCFK-0006ba-2C;
	Thu, 08 Aug 2024 23:08:38 +0000
Date: Fri, 9 Aug 2024 07:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit
Message-ID: <202408090637.Jp34Kwf4-lkp@intel.com>
References: <20240808134857.86749-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808134857.86749-1-jbrunet@baylibre.com>

Hi Jerome,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.11-rc2 next-20240808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/ALSA-snd-usb-caiaq-use-snd_pcm_rate_to_rate_bit/20240808-215111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240808134857.86749-1-jbrunet%40baylibre.com
patch subject: [PATCH] ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit
config: arc-randconfig-001-20240809 (https://download.01.org/0day-ci/archive/20240809/202408090637.Jp34Kwf4-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090637.Jp34Kwf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090637.Jp34Kwf4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/usb/caiaq/audio.c: In function 'snd_usb_caiaq_pcm_prepare':
>> sound/usb/caiaq/audio.c:179:41: warning: unused variable 'i' [-Wunused-variable]
     179 |         int bytes_per_sample, bpp, ret, i;
         |                                         ^


vim +/i +179 sound/usb/caiaq/audio.c

523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  176  
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  177  static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  178  {
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26 @179  	int bytes_per_sample, bpp, ret, i;
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  180  	int index = substream->number;
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  181  	struct snd_usb_caiaqdev *cdev = snd_pcm_substream_chip(substream);
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  182  	struct snd_pcm_runtime *runtime = substream->runtime;
f1f6b8f65ff08a sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  183  	struct device *dev = caiaqdev_to_dev(cdev);
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  184  
f1f6b8f65ff08a sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  185  	dev_dbg(dev, "%s(%p)\n", __func__, substream);
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  186  
a9b487fa1e00b4 sound/usb/caiaq/audio.c       Daniel Mack   2009-04-27  187  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  188  		int out_pos;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  189  
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  190  		switch (cdev->spec.data_alignment) {
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  191  		case 0:
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  192  		case 2:
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  193  			out_pos = BYTES_PER_SAMPLE + 1;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  194  			break;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  195  		case 3:
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  196  		default:
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  197  			out_pos = 0;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  198  			break;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  199  		}
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  200  
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  201  		cdev->period_out_count[index] = out_pos;
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  202  		cdev->audio_out_buf_pos[index] = out_pos;
a9b487fa1e00b4 sound/usb/caiaq/audio.c       Daniel Mack   2009-04-27  203  	} else {
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  204  		int in_pos;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  205  
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  206  		switch (cdev->spec.data_alignment) {
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  207  		case 0:
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  208  			in_pos = BYTES_PER_SAMPLE + 2;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  209  			break;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  210  		case 2:
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  211  			in_pos = BYTES_PER_SAMPLE;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  212  			break;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  213  		case 3:
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  214  		default:
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  215  			in_pos = 0;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  216  			break;
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  217  		}
15c5ab607045e2 sound/usb/caiaq/audio.c       Daniel Mack   2010-09-10  218  
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  219  		cdev->period_in_count[index] = in_pos;
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  220  		cdev->audio_in_buf_pos[index] = in_pos;
a9b487fa1e00b4 sound/usb/caiaq/audio.c       Daniel Mack   2009-04-27  221  	}
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  222  
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  223  	if (cdev->streaming)
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  224  		return 0;
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  225  
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  226  	/* the first client that opens a stream defines the sample rate
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  227  	 * setting for all subsequent calls, until the last client closed. */
fcb26c77ddb6a1 sound/usb/caiaq/audio.c       Jerome Brunet 2024-08-08  228  	cdev->pcm_info.rates = snd_pcm_rate_to_rate_bit(runtime->rate);
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  229  	snd_pcm_limit_hw_rates(runtime);
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  230  
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  231  	bytes_per_sample = BYTES_PER_SAMPLE;
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  232  	if (cdev->spec.data_alignment >= 2)
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  233  		bytes_per_sample++;
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  234  
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  235  	bpp = ((runtime->rate / 8000) + CLOCK_DRIFT_TOLERANCE)
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  236  		* bytes_per_sample * CHANNELS_PER_STREAM * cdev->n_streams;
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  237  
6e9fc6bd5db34a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2008-04-14  238  	if (bpp > MAX_ENDPOINT_SIZE)
6e9fc6bd5db34a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2008-04-14  239  		bpp = MAX_ENDPOINT_SIZE;
6e9fc6bd5db34a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2008-04-14  240  
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  241  	ret = snd_usb_caiaq_set_audio_params(cdev, runtime->rate,
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  242  					     runtime->sample_bits, bpp);
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  243  	if (ret)
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  244  		return ret;
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  245  
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  246  	ret = stream_start(cdev);
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  247  	if (ret)
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  248  		return ret;
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  249  
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  250  	cdev->output_running = 0;
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  251  	wait_event_timeout(cdev->prepare_wait_queue, cdev->output_running, HZ);
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  252  	if (!cdev->output_running) {
1c8470ce311c6b sound/usb/caiaq/audio.c       Daniel Mack   2013-03-03  253  		stream_stop(cdev);
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  254  		return -EPIPE;
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  255  	}
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  256  
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  257  	return 0;
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  258  }
523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack   2007-03-26  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
