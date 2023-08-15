Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909F1FA8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 03:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692071327; x=1723607327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7YJZSsJMqsCzmYSKYdYwJqKjYpYEto+3DDk7w4Eb65s=;
  b=lZH8MTxx5EZT2up6Xlmxz4dcKpSsz41YFejnODlbexQGGn1F25g+3+8J
   tjgzIEf+tfFME281Zdtp0BZ8qNsvyeRQexX7XNhCafD5Q/tuvSwzIHuTs
   w8UzJZucluE4O89hNn1ilzuA3htPJE0qpjPdDdeG3kP/dxcdE4mQR+iE+
   KD9OijgNC/jfEGpeqwcaETazcAb86HplyafnR38xVtvwlEwFMIStH/vI1
   wM3ItMcobQfcwrg/iH4WTl5QgfSm3CbJjKrp9eCLTA7p4Ga7+nDEu0W/X
   tViAa/KursWuDPQvmcuUWrg5GmuPLpLPXgxidcSr9qGije3EzUujoxCs3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372191425"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="372191425"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 20:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980253315"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="980253315"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 20:48:42 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVl2w-0000da-0R;
	Tue, 15 Aug 2023 03:48:42 +0000
Date: Tue, 15 Aug 2023 11:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-6.6 218/221] sound/soc/pxa/pxa2xx-i2s.c:341:10:
 error: 'struct snd_soc_dai_driver' has no member named 'probe'
Message-ID: <202308151142.hoM5o9LV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.6
head:   56f6ee6d5373406df9f60a870f470ab4b3e6d967
commit: 446b31e894935ebbcf84302061a4e0e2efb2368f [218/221] ASoC: soc-dai.h: remove unused call back functions
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20230815/202308151142.hoM5o9LV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151142.hoM5o9LV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151142.hoM5o9LV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/pxa/pxa2xx-i2s.c:341:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     341 |         .probe = pxa2xx_i2s_probe,
         |          ^~~~~
>> sound/soc/pxa/pxa2xx-i2s.c:341:18: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct snd_soc_dai *)' [-Werror=incompatible-pointer-types]
     341 |         .probe = pxa2xx_i2s_probe,
         |                  ^~~~~~~~~~~~~~~~
   sound/soc/pxa/pxa2xx-i2s.c:341:18: note: (near initialization for 'pxa_i2s_dai.name')
>> sound/soc/pxa/pxa2xx-i2s.c:342:10: error: 'struct snd_soc_dai_driver' has no member named 'remove'
     342 |         .remove = pxa2xx_i2s_remove,
         |          ^~~~~~
>> sound/soc/pxa/pxa2xx-i2s.c:342:19: warning: initialization of 'unsigned int' from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a cast [-Wint-conversion]
     342 |         .remove = pxa2xx_i2s_remove,
         |                   ^~~~~~~~~~~~~~~~~
   sound/soc/pxa/pxa2xx-i2s.c:342:19: note: (near initialization for 'pxa_i2s_dai.id')
   cc1: some warnings being treated as errors


vim +341 sound/soc/pxa/pxa2xx-i2s.c

6335d05548eece Eric Miao         2009-03-03  339  
f0fba2ad1b6b53 Liam Girdwood     2010-03-17  340  static struct snd_soc_dai_driver pxa_i2s_dai = {
f0fba2ad1b6b53 Liam Girdwood     2010-03-17 @341  	.probe = pxa2xx_i2s_probe,
f0fba2ad1b6b53 Liam Girdwood     2010-03-17 @342  	.remove = pxa2xx_i2s_remove,
3e7cc3d3d1c435 Liam Girdwood     2006-10-12  343  	.playback = {
3e7cc3d3d1c435 Liam Girdwood     2006-10-12  344  		.channels_min = 2,
eaff2ae702f937 Philipp Zabel     2007-02-02  345  		.channels_max = 2,
eaff2ae702f937 Philipp Zabel     2007-02-02  346  		.rates = PXA2XX_I2S_RATES,
eaff2ae702f937 Philipp Zabel     2007-02-02  347  		.formats = SNDRV_PCM_FMTBIT_S16_LE,},
3e7cc3d3d1c435 Liam Girdwood     2006-10-12  348  	.capture = {
3e7cc3d3d1c435 Liam Girdwood     2006-10-12  349  		.channels_min = 2,
eaff2ae702f937 Philipp Zabel     2007-02-02  350  		.channels_max = 2,
eaff2ae702f937 Philipp Zabel     2007-02-02  351  		.rates = PXA2XX_I2S_RATES,
eaff2ae702f937 Philipp Zabel     2007-02-02  352  		.formats = SNDRV_PCM_FMTBIT_S16_LE,},
6335d05548eece Eric Miao         2009-03-03  353  	.ops = &pxa_i2s_dai_ops,
c658b2185818ac Kuninori Morimoto 2021-01-15  354  	.symmetric_rate = 1,
3e7cc3d3d1c435 Liam Girdwood     2006-10-12  355  };
3e7cc3d3d1c435 Liam Girdwood     2006-10-12  356  

:::::: The code at line 341 was first introduced by commit
:::::: f0fba2ad1b6b53d5360125c41953b7afcd6deff0 ASoC: multi-component - ASoC Multi-Component Support

:::::: TO: Liam Girdwood <lrg@slimlogic.co.uk>
:::::: CC: Liam Girdwood <lrg@slimlogic.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
