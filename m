Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33533C070
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpQmGihP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700862890; x=1732398890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nAsCbSss/mMzDj1aIwu47vkmuYxjZt3HCXmxSOIU848=;
  b=MpQmGihPscP4bVbydAjlKb8xTf1zvcAcnUuhAr1Md1qmeP8AVUpP6HNT
   P7p2O17d+gEkAKl/mfv57m/hhJopVI/iTMwNlthlx23DfsvkxN6x7pUdJ
   E3hVZfKFRgx5EHRbrE/kDgr0fknbqH5Urg3UzzLA8vX2b5AlJ0wCerNF/
   wQtbS4UjS0JLNDl6rEsaIAfSj65lZNjRtG3Iq0xXuNVo+zmo3NVb2b8tu
   yFhlu2ocu1BgoG6qt6eCuDT8qyoAfvxbg7nwdtu8PGpOD6tv43IssrZuI
   I9fh/YBvA5AuLi09Ku2wyR9nEAPZ/YHWX7KuqvYaB0u1Wdjb08zvBOsxu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391344080"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391344080"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 13:54:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="802229618"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="802229618"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Nov 2023 13:54:47 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6e8L-0003JU-13;
	Fri, 24 Nov 2023 21:54:45 +0000
Date: Sat, 25 Nov 2023 05:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Yan <michael.yan@starfivetech.com>,
	Jenny Zhang <jenny.zhang@starfivetech.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [esmil:visionfive 40/47] sound/soc/starfive/spdif.c:147:16: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202311250200.fU0qPx4X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   f7c19b2d41e07d930d09b40751161839e067fda2
commit: 20a6ebed8151ebd4c14fb8b7847b83efc31a3652 [40/47] ASoC: starfive: Add StarFive JH7100 audio drivers
config: csky-randconfig-r113-20231124 (https://download.01.org/0day-ci/archive/20231125/202311250200.fU0qPx4X-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250200.fU0qPx4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250200.fU0qPx4X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/starfive/spdif.c:147:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int format @@     got restricted snd_pcm_format_t @@
   sound/soc/starfive/spdif.c:147:16: sparse:     expected unsigned int format
   sound/soc/starfive/spdif.c:147:16: sparse:     got restricted snd_pcm_format_t
>> sound/soc/starfive/spdif.c:158:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/starfive/spdif.c:159:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/starfive/spdif.c:160:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/starfive/spdif.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +147 sound/soc/starfive/spdif.c

   135	
   136	static int sf_spdif_hw_params(struct snd_pcm_substream *substream,
   137		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
   138	{
   139		struct sf_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
   140		unsigned int channels;
   141		unsigned int rate;
   142		unsigned int format;
   143		unsigned int tsamplerate;
   144	
   145		channels = params_channels(params);
   146		rate = params_rate(params);
 > 147		format = params_format(params);
   148	
   149		switch (channels) {
   150		case 2:
   151			break;
   152		default:
   153			dev_err(dai->dev, "invalid channels number\n");
   154			return -EINVAL;
   155		}
   156	
   157		switch (format) {
 > 158		case SNDRV_PCM_FORMAT_S16_LE:
   159		case SNDRV_PCM_FORMAT_S24_LE:
   160		case SNDRV_PCM_FORMAT_S32_LE:
   161			break;
   162		default:
   163			dev_err(spdif->dev, "invalid format\n");
   164			return -EINVAL;
   165		}
   166	
   167		switch (rate) {
   168		case 8000:
   169		case 11025:
   170		case 16000:
   171		case 22050:
   172			break;
   173		default:
   174			printk(KERN_ERR "channel:%d sample rate:%d\n", channels, rate);
   175			return -EINVAL;
   176		}
   177	
   178		/* 12288000/128=96000 */
   179		tsamplerate = (96000 + rate/2)/rate - 1;
   180	
   181		if (rate < 3) {
   182			return -EINVAL;
   183		}
   184	
   185		/* transmission sample rate */
   186		regmap_update_bits(spdif->regmap, SPDIF_CTRL, 0xFF, tsamplerate);
   187	
   188		return 0;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
