Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB4C6BB5B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901068; cv=none; b=lQdnTCo6Xv8rbkbcpM7tjcIszR4hEMYGsAlx0uaDxa+pyxY8zPTGH/799VMsfZOIpklEWWXIDTUWWCx4GeEjzd83Jypi32ATGyplabwheD8oRV6X2uZ+hVZdBYqW8KkGagmjEXkxNvIUsFd39385URAqX+EJ7f0eJNfpSDvQsiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901068; c=relaxed/simple;
	bh=oz5t/3PoUdgcuh7MkFNUy4hTBTU006ytkt+UvCqUgRE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SQZvXX8X38iSLngMnBmCsaAcS42e05SNUrf7wOyE+2xBKg6d/dPkCMg74XkTCZ2VFCzNj3gPokjVrTVIbS+LXwe8t3V6yeuZvM6kgOp8AujyabCPexhINiVz681w0OTwWNnt8aTfANHYrCLjszuXHyjD7WZlXQQu6UfzD1PJg2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcMERbe3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcMERbe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785901066; x=1817437066;
  h=date:from:to:cc:subject:message-id;
  bh=oz5t/3PoUdgcuh7MkFNUy4hTBTU006ytkt+UvCqUgRE=;
  b=XcMERbe3hspfpC4iTYDTG2f4ym3dXdw2rAmQB2H+geeJdd6xxGLvbc5w
   V2HNzQnHiZW9NmA1L6Wq+K00DJgUxHDOIzNzxtTD54EXMLIFo35jZYihH
   F/cxW9EmNRcgeb2FFBULa+EAMusWeXRt7wLY6Hw09LVlxqVv2mGS9s6sL
   TNPHqOB0Q6+cFQchDqcXIeX11Qmmo7rN935qYxrBX7E5c5ogBmnktVyqk
   PqBnkBIZPmHBiYpTsQu22swZzXygv6dsZvc6bc4CTfgvnh7BkretkXbUB
   KKr4THA73TF2Y2piY7+Q3Bm9xWlXAaVhwzXU7foKup3qGNrsyUlazYG4G
   g==;
X-CSE-ConnectionGUID: C28pJfN1ReeOfOzJJqmCwQ==
X-CSE-MsgGUID: CDzFjMh8RtuqrW1FcfTVuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86495333"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86495333"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 20:37:45 -0700
X-CSE-ConnectionGUID: JUUGbgckR+WYfFWJH30NrA==
X-CSE-MsgGUID: W4V4B8HVQ5ejah5PsO29Ow==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2026 20:37:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrSRp-00000000BPN-0LlK;
	Wed, 05 Aug 2026 03:37:41 +0000
Date: Wed, 05 Aug 2026 11:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:asoc-7.3 9/9]
 sound/soc/codecs/rt766-sdca.c:925:33: warning: variable 'direction' set but
 not used
Message-ID: <202608051127.yoW7u3Lv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.3
head:   99ddfbba9e71617494c14b95ed85b9d25bc3202c
commit: 64adc3cec7e237e8d168b8614d11b27b7f83bdb0 [9/9] ASoC: rt766: add RT766/RT767 SDCA driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608051127.yoW7u3Lv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051127.yoW7u3Lv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051127.yoW7u3Lv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rt766-sdca.c: In function 'rt766_sdca_irq_ctl':
   sound/soc/codecs/rt766-sdca.c:240:41: error: implicit declaration of function 'sdca_irq_cleanup_late'; did you mean 'sdca_irq_cleanup'? [-Wimplicit-function-declaration]
     240 |                                         sdca_irq_cleanup_late(dev, function, info);
         |                                         ^~~~~~~~~~~~~~~~~~~~~
         |                                         sdca_irq_cleanup
   sound/soc/codecs/rt766-sdca.c: In function 'rt766_sdca_probe':
   sound/soc/codecs/rt766-sdca.c:858:35: error: implicit declaration of function 'devm_sdca_irq_allocate'; did you mean 'sdca_irq_allocate'? [-Wimplicit-function-declaration]
     858 |                 rt766->irq_info = devm_sdca_irq_allocate(dev, rt766->regmap, rt766->slave->irq);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
         |                                   sdca_irq_allocate
   sound/soc/codecs/rt766-sdca.c:858:33: error: assignment to 'struct sdca_interrupt_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     858 |                 rt766->irq_info = devm_sdca_irq_allocate(dev, rt766->regmap, rt766->slave->irq);
         |                                 ^
   sound/soc/codecs/rt766-sdca.c: In function 'rt766_sdca_pcm_hw_params':
>> sound/soc/codecs/rt766-sdca.c:925:33: warning: variable 'direction' set but not used [-Wunused-but-set-variable]
     925 |         enum sdw_data_direction direction;
         |                                 ^~~~~~~~~


vim +/direction +925 sound/soc/codecs/rt766-sdca.c

   916	
   917	static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
   918					struct snd_pcm_hw_params *params,
   919					struct snd_soc_dai *dai)
   920	{
   921		struct snd_soc_component *component = dai->component;
   922		struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
   923		struct sdw_stream_config stream_config;
   924		struct sdw_port_config port_config;
 > 925		enum sdw_data_direction direction;
   926		struct sdw_stream_runtime *sdw_stream;
   927		unsigned int sampling_rate;
   928		int retval, port;
   929	
   930		dev_dbg(dai->dev, "%s %s id %d", __func__, dai->name, dai->id);
   931		sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
   932	
   933		if (!sdw_stream)
   934			return -EINVAL;
   935	
   936		if (!rt766->slave)
   937			return -EINVAL;
   938	
   939		/* SoundWire specific configuration */
   940		snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
   941	
   942		/* SoundWire specific configuration */
   943		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
   944			direction = SDW_DATA_DIR_RX;
   945			if (dai->id == RT766_AIF1)
   946				port = 3;
   947			else if (dai->id == RT766_AIF2)
   948				port = 1;
   949			else
   950				return -EINVAL;
   951		} else {
   952			direction = SDW_DATA_DIR_TX;
   953			if (dai->id == RT766_AIF1)
   954				port = 12;
   955			else if (dai->id == RT766_AIF3)
   956				port = 8;
   957			else
   958				return -EINVAL;
   959		}
   960	
   961		port_config.num = port;
   962		retval = sdw_stream_add_slave(rt766->slave, &stream_config,
   963						&port_config, 1, sdw_stream);
   964		if (retval) {
   965			dev_err(dai->dev, "%s: Unable to configure port\n", __func__);
   966			return retval;
   967		}
   968	
   969		if (params_channels(params) > 16) {
   970			dev_err(component->dev, "%s: Unsupported channels %d\n",
   971				__func__, params_channels(params));
   972			return -EINVAL;
   973		}
   974	
   975		/* sampling rate configuration */
   976		switch (params_rate(params)) {
   977		case 44100:
   978			sampling_rate = RT766_SDCA_RATE_44100HZ;
   979			break;
   980		case 48000:
   981			sampling_rate = RT766_SDCA_RATE_48000HZ;
   982			break;
   983		case 96000:
   984			sampling_rate = RT766_SDCA_RATE_96000HZ;
   985			break;
   986		case 192000:
   987			sampling_rate = RT766_SDCA_RATE_192000HZ;
   988			break;
   989		default:
   990			dev_err(component->dev, "%s: Rate %d is not supported\n",
   991				__func__, params_rate(params));
   992			return -EINVAL;
   993		}
   994	
   995		/* set sampling frequency */
   996		switch (dai->id) {
   997		case RT766_AIF1:
   998			regmap_write(rt766->regmap,
   999				RT766_SDCA_CTL(UAJ, CS41, SDCA_CTL_CS_SAMPLERATEINDEX),
  1000				sampling_rate);
  1001			regmap_write(rt766->regmap,
  1002				RT766_SDCA_CTL(UAJ, CS36, SDCA_CTL_CS_SAMPLERATEINDEX),
  1003				sampling_rate);
  1004			break;
  1005		case RT766_AIF2:
  1006			regmap_write(rt766->regmap,
  1007				RT766_SDCA_CTL(AMP, CS21, SDCA_CTL_CS_SAMPLERATEINDEX),
  1008				sampling_rate);
  1009			break;
  1010		case RT766_AIF3:
  1011			regmap_write(rt766->regmap,
  1012				RT766_SDCA_CTL(MIC, CS113, SDCA_CTL_CS_SAMPLERATEINDEX),
  1013				sampling_rate);
  1014			break;
  1015		default:
  1016			dev_err(component->dev, "%s: Wrong DAI id\n", __func__);
  1017			return -EINVAL;
  1018		}
  1019	
  1020		return 0;
  1021	}
  1022	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
