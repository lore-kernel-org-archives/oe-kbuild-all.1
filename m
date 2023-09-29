Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E5941216
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695995560; x=1727531560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xMAZJI/NpFNt0FZUnQl6CZ+hY2r9DBoITtN7wphELAY=;
  b=NUD8zEM6Kfh9JCwOa+68y5oFPGuwBedcN7uW3hvf4jbe1PVJZpz+0rFH
   vJqzM0j85Y7h27sE/0eoi/Qn+Q47z+xt3T9LUQRkrGobWgzP9EO81r+0S
   +wG+wrruBa6SnuhaDyGNrul2xV5C3AOUgInnHoWHJ7qhT0iiq56SNHo6J
   l3ohDCyV0E74TdYw7tCYxVnLuxAzKj1OHa/VPLVvKnIsLLyptcStE8ysR
   9ebYwUresuSgikqPRj4BcETZhzpK3Oh3mfO2YgRDrEr934U3DhL13bo1s
   0ogZkj4Gh4UVGbCqGP+aPqqB/oI3b6JtImyRUXdgFRuQBkxNHxQVko/GI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="386166880"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="386166880"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 06:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="923596958"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="923596958"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Sep 2023 06:52:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmDv2-0002ur-1W;
	Fri, 29 Sep 2023 13:52:36 +0000
Date: Fri, 29 Sep 2023 21:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/6] ASoC: Intel: avs: Drop superfluous stream decoupling
Message-ID: <202309292121.5DdaNpLj-lkp@intel.com>
References: <20230929112436.787058-7-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929112436.787058-7-amadeuszx.slawinski@linux.intel.com>

Hi Amadeusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amadeusz-S-awi-ski/ASoC-Intel-avs-Move-IPC-error-messages-one-level-down/20230929-192935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230929112436.787058-7-amadeuszx.slawinski%40linux.intel.com
patch subject: [PATCH 6/6] ASoC: Intel: avs: Drop superfluous stream decoupling
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309292121.5DdaNpLj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309292121.5DdaNpLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309292121.5DdaNpLj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/intel/avs/pcm.c: In function 'avs_dai_fe_prepare':
>> sound/soc/intel/avs/pcm.c:606:26: warning: variable 'bus' set but not used [-Wunused-but-set-variable]
     606 |         struct hdac_bus *bus;
         |                          ^~~


vim +/bus +606 sound/soc/intel/avs/pcm.c

9114700b496c6c Cezary Rojewski 2022-05-16  599  
9114700b496c6c Cezary Rojewski 2022-05-16  600  static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
9114700b496c6c Cezary Rojewski 2022-05-16  601  {
9114700b496c6c Cezary Rojewski 2022-05-16  602  	struct snd_pcm_runtime *runtime = substream->runtime;
9114700b496c6c Cezary Rojewski 2022-05-16  603  	struct avs_dma_data *data;
9114700b496c6c Cezary Rojewski 2022-05-16  604  	struct avs_dev *adev = to_avs_dev(dai->dev);
9114700b496c6c Cezary Rojewski 2022-05-16  605  	struct hdac_ext_stream *host_stream;
9114700b496c6c Cezary Rojewski 2022-05-16 @606  	struct hdac_bus *bus;
9114700b496c6c Cezary Rojewski 2022-05-16  607  	unsigned int format_val;
9114700b496c6c Cezary Rojewski 2022-05-16  608  	int ret;
9114700b496c6c Cezary Rojewski 2022-05-16  609  
9114700b496c6c Cezary Rojewski 2022-05-16  610  	data = snd_soc_dai_get_dma_data(dai, substream);
9114700b496c6c Cezary Rojewski 2022-05-16  611  	host_stream = data->host_stream;
9114700b496c6c Cezary Rojewski 2022-05-16  612  
9114700b496c6c Cezary Rojewski 2022-05-16  613  	if (hdac_stream(host_stream)->prepared)
9114700b496c6c Cezary Rojewski 2022-05-16  614  		return 0;
9114700b496c6c Cezary Rojewski 2022-05-16  615  
9114700b496c6c Cezary Rojewski 2022-05-16  616  	bus = hdac_stream(host_stream)->bus;
9114700b496c6c Cezary Rojewski 2022-05-16  617  	snd_hdac_stream_reset(hdac_stream(host_stream));
9114700b496c6c Cezary Rojewski 2022-05-16  618  
9114700b496c6c Cezary Rojewski 2022-05-16  619  	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
9114700b496c6c Cezary Rojewski 2022-05-16  620  						 runtime->sample_bits, 0);
9114700b496c6c Cezary Rojewski 2022-05-16  621  
9114700b496c6c Cezary Rojewski 2022-05-16  622  	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
9114700b496c6c Cezary Rojewski 2022-05-16  623  	if (ret < 0)
9114700b496c6c Cezary Rojewski 2022-05-16  624  		return ret;
9114700b496c6c Cezary Rojewski 2022-05-16  625  
9114700b496c6c Cezary Rojewski 2022-05-16  626  	ret = snd_hdac_stream_setup(hdac_stream(host_stream));
9114700b496c6c Cezary Rojewski 2022-05-16  627  	if (ret < 0)
9114700b496c6c Cezary Rojewski 2022-05-16  628  		return ret;
9114700b496c6c Cezary Rojewski 2022-05-16  629  
9114700b496c6c Cezary Rojewski 2022-05-16  630  	ret = avs_dai_prepare(adev, substream, dai);
9114700b496c6c Cezary Rojewski 2022-05-16  631  	if (ret)
9114700b496c6c Cezary Rojewski 2022-05-16  632  		return ret;
9114700b496c6c Cezary Rojewski 2022-05-16  633  
9114700b496c6c Cezary Rojewski 2022-05-16  634  	hdac_stream(host_stream)->prepared = true;
9114700b496c6c Cezary Rojewski 2022-05-16  635  	return 0;
9114700b496c6c Cezary Rojewski 2022-05-16  636  }
9114700b496c6c Cezary Rojewski 2022-05-16  637  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
