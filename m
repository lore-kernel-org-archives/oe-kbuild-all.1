Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86230A5C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 18:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694542118; x=1726078118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I7GKH/JHhxBsJTBwT40EaAw7GfHdoFdAFMAVTSn217c=;
  b=b8E4ViHvBlSIV4GJJ2bU/xKG6KfmRymSpwAz+mU8AbJ2CStxPuG4TNOo
   Yw+04PEferT47L5+q7H2VPoni5nMhLbtEiEkmMRA4bjnBAQ7iQxUH++Yk
   fNEoIR5u4Pw7hZreSlAaRpXamw03v7RKji6FP6bOxcQCPa6pKE/KdAg8F
   y9rc9ZACFGsXKssAHlzsVB2vPyLDF+rnfm/hvERrKi+A2JWaHoLXqiOvN
   4S4xZYDDbnIpDnkKuFXPzn446++5j81WZGX1V6Tkz684qOPm0M6z9cWLl
   THs7RYexZ3EBGXJSa1Yr43i6975ZOdZ8TWmGlJrOAsB5gKP5LmkvNNyL2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377369276"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="377369276"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="778900259"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="778900259"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 11:08:37 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg7oM-00005a-1K;
	Tue, 12 Sep 2023 18:08:31 +0000
Date: Wed, 13 Sep 2023 02:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
Message-ID: <202309130126.fy5TJPSr-lkp@intel.com>
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
[also build test WARNING on tiwai-sound/for-linus linus/master v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaroslav-Kysela/ALSA-pcm-Introduce-MSBITS-subformat-API-extension/20230913-003409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230912162526.7138-1-perex%40perex.cz
patch subject: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130126.fy5TJPSr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130126.fy5TJPSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130126.fy5TJPSr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/pcm_lib.c:1451: warning: Excess function parameter 'nmemd' description in 'snd_pcm_hw_constraint_subformats'


vim +1451 sound/core/pcm_lib.c

  1434	
  1435	/**
  1436	 * snd_pcm_hw_constraint_subformats - add a hw constraint subformats rule
  1437	 * @runtime: PCM runtime instance
  1438	 * @cond: condition bits
  1439	 * @subformats: array with struct snd_pcm_subformat elements
  1440	 * @nmemd: size of array with struct snd_pcm_subformat elements
  1441	 *
  1442	 * This constraint will set relation between format and subformats.
  1443	 * The STD and MAX subformats are handled automatically. If the driver
  1444	 * does not set this constraint, only STD and MAX subformats are handled.
  1445	 *
  1446	 * Return: Zero if successful, or a negative error code on failure.
  1447	 */
  1448	int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
  1449					     unsigned int cond,
  1450					     struct snd_pcm_hw_constraint_subformat *subformats)
> 1451	{
  1452		int ret;
  1453	
  1454		ret = snd_pcm_hw_rule_add(runtime, cond, -1,
  1455					  snd_pcm_hw_rule_subformats,
  1456					  (void*) subformats,
  1457					  SNDRV_PCM_HW_PARAM_SUBFORMAT,
  1458					  SNDRV_PCM_HW_PARAM_FORMAT, -1);
  1459		if (ret < 0)
  1460			return ret;
  1461		runtime->subformat_constraint = 1;
  1462		return 0;
  1463	}
  1464	EXPORT_SYMBOL(snd_pcm_hw_constraint_subformats);
  1465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
