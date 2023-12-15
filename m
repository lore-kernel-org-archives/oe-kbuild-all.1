Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54867EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHC6Jdhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702606563; x=1734142563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SGVGhxVvHYG2EO3/fmx9wbh+5NzMJO37KO0EE6YbvyM=;
  b=UHC6JdhqQDhB3KtC7aO/XP0kM3nmeOpSwKXGBo5Hhe4QVvaTWOgieBY9
   sxqmZ044p46c5PRwswTU0WT7v3Wd937LLUQ2nEySK4Yx+6OAOIrxd7s1z
   9nR5ONDf2BsnK7r0chbaa6VZHGF2Iet/0oWZYFKuWT8QkID79l12Yhbe8
   aus7GeEdy71QNaCxxL+N3VR5FZGBYeqnambiw/wQZsXPxBYtNFK/Tbr5M
   q/MsuZlQusOIpwnXhtSVzFIZrLXTGEP57XEeS7P0hjc1C+CG5KZP2CF2C
   A/yJd1TxuNnDBtpVYpoUGtFQFULeY/G0F5hrfp+Grnuev66bmg0+i3rA1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="392394935"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="392394935"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021781459"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="1021781459"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Dec 2023 18:16:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDxk6-000Myh-1w;
	Fri, 15 Dec 2023 02:15:58 +0000
Date: Fri, 15 Dec 2023 10:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC, PATCH v2 1/2] ASoC: qcom: sdw: Add TDM support
Message-ID: <202312150920.6f0xcy0y-lkp@intel.com>
References: <20231212095850.26482-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212095850.26482-1-lujianhua000@gmail.com>

Hi Jianhua,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianhua-Lu/ASoC-qcom-sm8250-Add-TERTIARY_TDM_RX_0-support/20231212-180109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231212095850.26482-1-lujianhua000%40gmail.com
patch subject: [RFC, PATCH v2 1/2] ASoC: qcom: sdw: Add TDM support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231215/202312150920.6f0xcy0y-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150920.6f0xcy0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150920.6f0xcy0y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/sdw.c:105:5: warning: no previous prototype for 'qcom_snd_tdm_hw_params' [-Wmissing-prototypes]
     105 | int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/sdw.c: In function 'qcom_snd_tdm_hw_params':
>> sound/soc/qcom/sdw.c:162:1: warning: control reaches end of non-void function [-Wreturn-type]
     162 | }
         | ^


vim +/qcom_snd_tdm_hw_params +105 sound/soc/qcom/sdw.c

   104	
 > 105	int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
   106				   struct snd_pcm_hw_params *params)
   107	{
   108		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   109		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   110		unsigned int tdm_slot_offset[8] = { 0, 4, 8, 12, 16, 20, 24, 28 };
   111		int channels, slot_width;
   112		int ret;
   113	
   114		switch (params_format(params)) {
   115		case SNDRV_PCM_FORMAT_S16_LE:
   116			slot_width = 16;
   117			break;
   118		case SNDRV_PCM_FORMAT_S24_LE:
   119			slot_width = 24;
   120			break;
   121		case SNDRV_PCM_FORMAT_S32_LE:
   122			slot_width = 32;
   123			break;
   124		default:
   125			dev_err(rtd->dev, "%s: invalid param format 0x%x\n", __func__,
   126				params_format(params));
   127			return -EINVAL;
   128		}
   129	
   130		channels = params_channels(params);
   131		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
   132			ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3, 8, slot_width);
   133			if (ret < 0) {
   134				dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
   135					__func__, ret);
   136				return ret;
   137			}
   138	
   139			ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL, channels,
   140							  tdm_slot_offset);
   141			if (ret < 0) {
   142				dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
   143					__func__, ret);
   144				return ret;
   145			}
   146		} else {
   147			ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0, 8, slot_width);
   148			if (ret < 0) {
   149				dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
   150					__func__, ret);
   151				return ret;
   152			}
   153	
   154			ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
   155							  tdm_slot_offset, 0, NULL);
   156			if (ret < 0) {
   157				dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
   158					__func__, ret);
   159				return ret;
   160			}
   161		}
 > 162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
