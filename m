Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61420612E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695466522; x=1727002522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LSPrOzzBJSALfxsi/TkmBkbdCdUmFs6Rujo4buJXlPI=;
  b=EdHa3079t4k8mEX5IOSWS6nfJ/VjoJJhbbx2w9qNQ4hqProIubvBTGBi
   t7sfIzt5vGlY4TGXiTwb63za6NoD3E3Kc5sD/X/rgdsnoUibodsY+nnVH
   R5ycstDXo0vrJOmK5qUaDOn1vsUdVFIm7NTc5x7uMSjQCUUBJPOSE38Q2
   ar9LVwviPrhveebKQ65Jrtdnqs61uBP9IyxYNGe0PzQ2nvifN9dMNeUQm
   Iid3W1jR3G8m0wPlsXKb/ztVghk2zXr4mSEQWSJtK2ceyaoawm8oDox5g
   bVV5YjNt7pifH2WbIpfXQEJ0TAJJ4gRYbF4P+0LlMU9J/L1S517hiyqaq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="378290312"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="378290312"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 03:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="697493257"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="697493257"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Sep 2023 03:55:18 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk0I8-0002AH-0s;
	Sat, 23 Sep 2023 10:55:16 +0000
Date: Sat, 23 Sep 2023 18:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com, perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 02/17] ALSA: pcm: Honor subformat when configuring
 substream
Message-ID: <202309231825.17qi62Yr-lkp@intel.com>
References: <20230918133940.3676091-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918133940.3676091-3-cezary.rojewski@intel.com>

Hi Cezary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 564ee9ac788b680e4ec4a6cb3a4a953dc61d5da8]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20230918-214758
base:   564ee9ac788b680e4ec4a6cb3a4a953dc61d5da8
patch link:    https://lore.kernel.org/r/20230918133940.3676091-3-cezary.rojewski%40intel.com
patch subject: [PATCH v2 02/17] ALSA: pcm: Honor subformat when configuring substream
config: x86_64-randconfig-121-20230923 (https://download.01.org/0day-ci/archive/20230923/202309231825.17qi62Yr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231825.17qi62Yr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231825.17qi62Yr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/core/pcm_native.c:2523:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int val @@     got restricted snd_pcm_format_t [assigned] [usertype] f @@
   sound/core/pcm_native.c:2523:43: sparse:     expected unsigned int val
   sound/core/pcm_native.c:2523:43: sparse:     got restricted snd_pcm_format_t [assigned] [usertype] f
   sound/core/pcm_native.c:95:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock' - different lock contexts for basic block
   sound/core/pcm_native.c:96:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock' - unexpected unlock
   sound/core/pcm_native.c:97:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock_irq' - different lock contexts for basic block
   sound/core/pcm_native.c:98:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock_irq' - unexpected unlock
   sound/core/pcm_native.c:145:9: sparse: sparse: context imbalance in 'snd_pcm_stream_lock_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:171:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave' - different lock contexts for basic block
   sound/core/pcm_native.c:184:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:201:39: sparse: sparse: context imbalance in 'snd_pcm_stream_unlock_irqrestore' - unexpected unlock
   sound/core/pcm_native.c:1279:44: sparse: sparse: context imbalance in 'snd_pcm_action_group' - unexpected unlock
   sound/core/pcm_native.c:1349:37: sparse: sparse: context imbalance in 'snd_pcm_stream_group_ref' - different lock contexts for basic block
   sound/core/pcm_native.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +2523 sound/core/pcm_native.c

  2503	
  2504	static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
  2505					      struct snd_pcm_hw_rule *rule)
  2506	{
  2507		struct snd_mask *sfmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
  2508		struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
  2509		struct snd_pcm_hardware *hw = rule->private;
  2510		struct snd_pcm_subformat *sf;
  2511		snd_pcm_format_t f;
  2512		struct snd_mask m;
  2513		bool found;
  2514	
  2515		snd_mask_none(&m);
  2516		/* All PCMs support at least the default STD subformat. */
  2517		snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
  2518	
  2519		if (!hw->subformats)
  2520			goto exit;
  2521	
  2522		pcm_for_each_format(f) {
> 2523			if (!snd_mask_test(fmask, f))
  2524				continue;
  2525	
  2526			found = false;
  2527			for (sf = hw->subformats; sf->mask && !found; sf++) {
  2528				if (sf->format != f)
  2529					continue;
  2530				m.bits[0] |= sf->mask;
  2531				found = true;
  2532			}
  2533			if (!found && snd_pcm_format_linear(f))
  2534				snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
  2535		}
  2536	exit:
  2537		return snd_mask_refine(sfmask, &m);
  2538	}
  2539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
