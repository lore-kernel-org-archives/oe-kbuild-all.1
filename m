Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9CF17758
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694593208; x=1726129208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UF3DkBbL5/rF4vH6HCq5fiWrs8RQkO3mgkDiwoTY6QU=;
  b=PlJeCbYjpZKj4BOS5/PcqcnObDzinhgaz37c6r/gZqQaBWoJXtUpjZF0
   AwFfobskiiQcbX5LncfE0EhcPcu8hOJ0vfW5N0/Ch+bita20U6sj+dynf
   jQsYmC60qnnRTgKGd7ZkxcIvjqVHLtmmd61UNfsVdBPpw0dpTNidy6Coj
   Hz9fneTILroGloOfZmJHQoF6hjumeGOkQoPB2EqRZq+8VRR1EtkmtQbG9
   lk6aqL4UVpgRPgi4TvaQVCYxP5GpULSfJbq5DhI159MVXmXDMuDY/68qJ
   3VS0N42T+jdqDrT1UUHOx6fMdkYypqHZBhLkz2fBBkeBFRc7FWFvxXbaJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409546873"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="409546873"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 01:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="744040037"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="744040037"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Sep 2023 01:20:04 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgL6P-0000GV-2l;
	Wed, 13 Sep 2023 08:20:01 +0000
Date: Wed, 13 Sep 2023 16:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
Message-ID: <202309131642.O7sFCrQQ-lkp@intel.com>
References: <20230912162526.7138-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912162526.7138-1-perex@perex.cz>

Hi Jaroslav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaroslav-Kysela/ALSA-pcm-Introduce-MSBITS-subformat-API-extension/20230913-003409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230912162526.7138-1-perex%40perex.cz
patch subject: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
config: i386-randconfig-063-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131642.O7sFCrQQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131642.O7sFCrQQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131642.O7sFCrQQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/core/pcm_native.c:493:76: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int @@
   sound/core/pcm_native.c:493:76: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/pcm_native.c:493:76: sparse:     got unsigned int
   sound/core/pcm_native.c:95:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock' - different lock contexts for basic block
   sound/core/pcm_native.c:96:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock' - unexpected unlock
   sound/core/pcm_native.c:97:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock_irq' - different lock contexts for basic block
   sound/core/pcm_native.c:98:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock_irq' - unexpected unlock
   sound/core/pcm_native.c:145:9: sparse: sparse: context imbalance in 'snd_pcm_stream_lock_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:171:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave' - different lock contexts for basic block
   sound/core/pcm_native.c:184:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:201:39: sparse: sparse: context imbalance in 'snd_pcm_stream_unlock_irqrestore' - unexpected unlock
   sound/core/pcm_native.c:1270:44: sparse: sparse: context imbalance in 'snd_pcm_action_group' - unexpected unlock
   sound/core/pcm_native.c:1340:37: sparse: sparse: context imbalance in 'snd_pcm_stream_group_ref' - different lock contexts for basic block
--
>> sound/core/pcm_lib.c:1419:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int val @@     got restricted snd_pcm_format_t [assigned] [usertype] k @@
   sound/core/pcm_lib.c:1419:43: sparse:     expected unsigned int val
   sound/core/pcm_lib.c:1419:43: sparse:     got restricted snd_pcm_format_t [assigned] [usertype] k
>> sound/core/pcm_lib.c:1422:50: sparse: sparse: restricted snd_pcm_format_t degrades to integer

vim +493 sound/core/pcm_native.c

   476	
   477	static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
   478					     struct snd_pcm_hw_params *params)
   479	{
   480		const struct snd_interval *i;
   481		const struct snd_mask *m;
   482		struct snd_mask *m_rw;
   483		int err;
   484	
   485		if (!params->msbits) {
   486			i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
   487			if (snd_interval_single(i))
   488				params->msbits = snd_interval_value(i);
   489		}
   490	
   491		if (params->msbits) {
   492			m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
 > 493			if (snd_mask_single(m) && snd_pcm_format_width(snd_mask_min(m)) != params->msbits) {
   494				m_rw = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
   495				snd_mask_reset(m_rw, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
   496			}
   497		}
   498	
   499		if (!params->rate_den) {
   500			i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_RATE);
   501			if (snd_interval_single(i)) {
   502				params->rate_num = snd_interval_value(i);
   503				params->rate_den = 1;
   504			}
   505		}
   506	
   507		if (!params->fifo_size) {
   508			m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
   509			i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS);
   510			if (snd_mask_single(m) && snd_interval_single(i)) {
   511				err = snd_pcm_ops_ioctl(substream,
   512							SNDRV_PCM_IOCTL1_FIFO_SIZE,
   513							params);
   514				if (err < 0)
   515					return err;
   516			}
   517		}
   518	
   519		if (!params->info) {
   520			params->info = substream->runtime->hw.info;
   521			params->info &= ~(SNDRV_PCM_INFO_FIFO_IN_FRAMES |
   522					  SNDRV_PCM_INFO_DRAIN_TRIGGER);
   523			if (!hw_support_mmap(substream))
   524				params->info &= ~(SNDRV_PCM_INFO_MMAP |
   525						  SNDRV_PCM_INFO_MMAP_VALID);
   526		}
   527	
   528		return 0;
   529	}
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
