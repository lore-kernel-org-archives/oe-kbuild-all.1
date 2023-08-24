Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D29AD2C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 22:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692915866; x=1724451866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kFt+ci+UMA4Sg/4WTvYN3a+oQZtymEUWVBRzt5wwQ6k=;
  b=Er4Pc9+cz7Wm4cmNj1s1+H8B5QUQohsp2FlHsC5OMwj3WBu2SSnBf4Rb
   /vDC8Sq3ZwiLa7mmK6z3+NZrP8VZbTfmgtPg1zZQdm0At2SJzp7jeewa/
   HtvtLUyaoKUGOHiGfwTRSRAlsogSr9pNO8xxvv52nvkZNtIcxkrK5gFny
   r3mSl20+L2wjMUMNzDTapT6FjTpFnQtzDghpNBHfozRKRuB2lXEk5FaBZ
   zmIIoPr9eWOwiJdgEKXn399L47p0zAk1camhEtlV7Tan+gzL46sMWuUTp
   YOOrjT0BwvjEkghpDgMbCsccbZJ/EJiIRLt4h9ttcSYNZZr5gtedk/y3N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438516279"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="438516279"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="714129518"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="714129518"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Aug 2023 15:24:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZIkZ-00030Z-0b;
	Thu, 24 Aug 2023 22:24:23 +0000
Date: Fri, 25 Aug 2023 06:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev,
	Curtis Malainey <cujomalainey@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <treding@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH 1/2] ALSA: core: add snd_device_init
Message-ID: <202308250609.8A2yaCZs-lkp@intel.com>
References: <20230824210339.1126993-2-cujomalainey@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824210339.1126993-2-cujomalainey@chromium.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230824]
[cannot apply to tiwai-sound/for-linus broonie-sound/for-next linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cujomalainey-chromium-org/ALSA-core-add-snd_device_init/20230825-050745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230824210339.1126993-2-cujomalainey%40chromium.org
patch subject: [PATCH 1/2] ALSA: core: add snd_device_init
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308250609.8A2yaCZs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250609.8A2yaCZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250609.8A2yaCZs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/init.c:149: warning: Function parameter or member 'dev' not described in 'snd_device_init'
>> sound/core/init.c:149: warning: Excess function parameter 'dev_p' description in 'snd_device_init'


vim +149 sound/core/init.c

   140	
   141	/**
   142	 * snd_device_init - Initialize struct device for sound devices
   143	 * @dev_p: pointer to store the allocated device
   144	 * @card: card to assign, optional
   145	 *
   146	 * For releasing the allocated device, call put_device().
   147	 */
   148	void snd_device_init(struct device *dev, struct snd_card *card)
 > 149	{
   150		device_initialize(dev);
   151		if (card)
   152			dev->parent = &card->card_dev;
   153		dev->class = &sound_class;
   154		dev->release = default_release_alloc;
   155	}
   156	EXPORT_SYMBOL_GPL(snd_device_init);
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
