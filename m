Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB71170A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695049970; x=1726585970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PuPVH6kC0OL/jK1UXKYb9C1jeOY57YJIinFY/4p/zkY=;
  b=N3+dpRCWajbSdw2orwKQhCQB9UZx7G6kaXBSMCMuVvwlk8BKgYySuc0/
   6vZ7wKIbgLP7DfcSgfEJgpm6Scb+QcW23vl8wZ3qwcbxlTDFgoibzulRQ
   4HAFU0fS3R0TeNeCn7OZYTL9FYe40V1ZIO50EpAm7Zme0GEG559xaDpiZ
   /E/k+ISIK0a80lw7D9Ca7r6b6SQ2pOLXiidpAHuHlMdoE69hC1x2bZrSB
   PjzS0/OpsjIJ6T1vUM+8rwvwSh2ez0hTkGL76SD5wFPRRO+0B1vv8AxNJ
   1JnkSuBazaX9ADhOMshTKOUPm1x57gu4qB1JU8Bk64bcE4l+JdIyBlw/o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="370000919"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="370000919"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 08:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811387869"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811387869"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2023 08:12:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiFvZ-0006DI-0K;
	Mon, 18 Sep 2023 15:12:45 +0000
Date: Mon, 18 Sep 2023 23:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com, perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 15/17] ALSA: hda: Drop snd_hdac_calc_stream_format()
Message-ID: <202309182301.K9lVpMbl-lkp@intel.com>
References: <20230918133940.3676091-16-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918133940.3676091-16-cezary.rojewski@intel.com>

Hi Cezary,

kernel test robot noticed the following build errors:

[auto build test ERROR on 564ee9ac788b680e4ec4a6cb3a4a953dc61d5da8]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20230918-214758
base:   564ee9ac788b680e4ec4a6cb3a4a953dc61d5da8
patch link:    https://lore.kernel.org/r/20230918133940.3676091-16-cezary.rojewski%40intel.com
patch subject: [PATCH v2 15/17] ALSA: hda: Drop snd_hdac_calc_stream_format()
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20230918/202309182301.K9lVpMbl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309182301.K9lVpMbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309182301.K9lVpMbl-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/intel/hda-dai-ops.c: In function 'generic_calc_stream_format':
>> sound/soc/sof/intel/hda-dai-ops.c:243:22: error: implicit declaration of function 'snd_hdac_calc_stream_format'; did you mean 'hda_calc_stream_format'? [-Werror=implicit-function-declaration]
     243 |         format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      hda_calc_stream_format
   cc1: some warnings being treated as errors


vim +243 sound/soc/sof/intel/hda-dai-ops.c

d1bf58474d17a7 Pierre-Louis Bossart 2023-06-02  236  
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  237  static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  238  					       struct snd_pcm_substream *substream,
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  239  					       struct snd_pcm_hw_params *params)
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  240  {
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  241  	unsigned int format_val;
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  242  
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07 @243  	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  244  						 params_format(params),
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  245  						 params_physical_width(params),
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  246  						 0);
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  247  
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  248  	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  249  		params_rate(params), params_channels(params), params_format(params));
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  250  
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  251  	return format_val;
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  252  }
12547730e5b7c4 Pierre-Louis Bossart 2023-08-07  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
