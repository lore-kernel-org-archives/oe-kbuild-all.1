Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3648F56
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 03:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmgK7IHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700105834; x=1731641834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7AyLsMjUoSNJQ59baXaZemUaL8riPE32/6cbF2IbqLA=;
  b=nmgK7IHSjg43+oGqb5zSyIO5IVPBb9Py7rtc5lQIAdBO2ONwOxZ8uTP7
   0ynh4x+8rpJ/fcWzGf7PtU6t3Bq8AjSawxa22J1Ov1unXmYDhLKCZ1M2N
   6/wDtxy5iXdZ16+XSuTQTr+9FhTIuJ+J9EBZoSguyTV254sPqQFxCa+u1
   BP/LsN35jYunagdISSqyzhCUGbmatpkuUlePUa6QoojG5yTUPvFMRMJ7U
   4suMoXGi5KyeJh4b3cm6TygnLLkPYC8KOhEC4dDzXeJWk4ucseBp6jtRw
   LWTG5iyI1ZgdPbbjzTnO90V20O9w2THUJKB/iK9uJWdW+VEVX+jGIySDm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4083594"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="4083594"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 19:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="835609913"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="835609913"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2023 19:37:10 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3TBj-0001FP-2u;
	Thu, 16 Nov 2023 03:37:07 +0000
Date: Thu, 16 Nov 2023 11:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com, perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
Message-ID: <202311161157.L2mvHx68-lkp@intel.com>
References: <20231114201317.1348066-15-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114201317.1348066-15-cezary.rojewski@intel.com>

Hi Cezary,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20231115-041959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20231114201317.1348066-15-cezary.rojewski%40intel.com
patch subject: [PATCH v3 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231116/202311161157.L2mvHx68-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161157.L2mvHx68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161157.L2mvHx68-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/intel/hda-dai-ops.c: In function 'generic_calc_stream_format':
>> sound/soc/sof/intel/hda-dai-ops.c:243:22: error: implicit declaration of function 'snd_hdac_calc_stream_format'; did you mean 'hda_calc_stream_format'? [-Werror=implicit-function-declaration]
     243 |         format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      hda_calc_stream_format
   cc1: some warnings being treated as errors


vim +243 sound/soc/sof/intel/hda-dai-ops.c

d1bf58474d17a77a Pierre-Louis Bossart 2023-06-02  236  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  237  static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  238  					       struct snd_pcm_substream *substream,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  239  					       struct snd_pcm_hw_params *params)
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  240  {
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  241  	unsigned int format_val;
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  242  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07 @243  	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  244  						 params_format(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  245  						 params_physical_width(params),
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  246  						 0);
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  247  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  248  	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  249  		params_rate(params), params_channels(params), params_format(params));
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  250  
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  251  	return format_val;
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  252  }
12547730e5b7c41e Pierre-Louis Bossart 2023-08-07  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
