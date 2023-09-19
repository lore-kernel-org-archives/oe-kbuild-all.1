Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11FFEBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 03:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695094997; x=1726630997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FmJ2Jkuktoi/4h8QlHnlZU4IWKrI2nLnMkgQEyEoozA=;
  b=RqhWrp/9dNhYQxPs+JjIM5v2fjJCau6NpoM38/djhy4/oQzDqo0xtgAu
   gNaciiJGdTwfmicDt2uj0r2GAnAwnaWQ3sFM8z+YBMzJ8uVv6UJlLryPj
   2/kSRZBf+fUNTcoXo3s1Z12o+MlpAoMykX0Kdr0gFlvpvMYj3yqJneBr4
   7GGtcEPPgenL5dg7TEdB8eyigi5esGbLKCN+L/sYK22eR8VFVcUuwqeUZ
   iC5SMBvq4PtfeF0EyUwqJtbM0N3gh0TBx1QOzKi3rYCsmn1Njy1DD5wq+
   zjdAqHKT4tg69UMgIEzidGE1dq/XvRj192HVqyZXBDu+pPKDcExn7F8GL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382595208"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="382595208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 20:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="781158134"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="781158134"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 18 Sep 2023 20:43:14 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiRd3-0006qq-1S;
	Tue, 19 Sep 2023 03:43:02 +0000
Date: Tue, 19 Sep 2023 11:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>, perex@perex.cz, tiwai@suse.com,
	corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
Message-ID: <202309191140.FdOk1qDx-lkp@intel.com>
References: <20230918181044.7257-2-ivan.orlov0322@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918181044.7257-2-ivan.orlov0322@gmail.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.6-rc2 next-20230918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Orlov/ALSA-Add-new-driver-for-Marian-M2-sound-card/20230919-021236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230918181044.7257-2-ivan.orlov0322%40gmail.com
patch subject: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20230919/202309191140.FdOk1qDx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191140.FdOk1qDx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191140.FdOk1qDx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/marianm2.c: In function 'snd_marian_hw_params':
>> sound/pci/marianm2.c:466:13: warning: variable 'buffer_frames' set but not used [-Wunused-but-set-variable]
     466 |         int buffer_frames;
         |             ^~~~~~~~~~~~~


vim +/buffer_frames +466 sound/pci/marianm2.c

   460	
   461	static int snd_marian_hw_params(struct snd_pcm_substream *substream,
   462					struct snd_pcm_hw_params *params)
   463	{
   464		struct marian_card *marian = snd_pcm_substream_chip(substream);
   465		unsigned int speedmode;
 > 466		int buffer_frames;
   467	
   468		buffer_frames = SUBSTREAM_BUF_SIZE / M2_FRAME_SIZE;
   469	
   470		if (params_rate(params) < RATE_SLOW)
   471			speedmode = SPEEDMODE_SLOW;
   472		else if (params_rate(params) < RATE_FAST)
   473			speedmode = SPEEDMODE_FAST;
   474	
   475		if (speedmode > marian->desc->speedmode_max) {
   476			dev_err(marian->card->dev,
   477				"Requested rate (%u Hz) higher than card's maximum\n",
   478				params_rate(params));
   479			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
   480			return -EBUSY;
   481		}
   482	
   483		spin_lock(&marian->reglock);
   484		if (marian->desc->set_speedmode)
   485			marian->desc->set_speedmode(marian, speedmode);
   486		else
   487			marian_generic_set_speedmode(marian, speedmode);
   488	
   489		marian->detune = 0;
   490	
   491		marian_generic_set_dco(marian, params_rate(params), 0);
   492		spin_unlock(&marian->reglock);
   493	
   494		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
   495			snd_pcm_set_runtime_buffer(substream, &marian->playback_buf);
   496		else
   497			snd_pcm_set_runtime_buffer(substream, &marian->capture_buf);
   498	
   499		// apply optional card specific hw constraints
   500		if (marian->desc->hw_constraints_func)
   501			marian->desc->hw_constraints_func(marian, substream, params);
   502	
   503		return 0;
   504	}
   505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
