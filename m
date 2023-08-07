Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A315ACD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691438233; x=1722974233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EGWTvH3BtEoo3bJ/y3xWDVF+B+lf4EKOQrmRmsoPVzI=;
  b=ZMCDr2eLX1luw4ZzJNtLuduc2A2shGSlia1/fGUva74KmtLmsWTjpuzG
   1NHxiAjV53MJ5mk6vtljPskt4U8nAPKgk7nGRguPIyPSDfB1whOVHG1Dg
   2T4k26L8qy9Bm7vRlTCEKDBSiz/FM5e2eUmXQaPrF6BQsCViyyGFbk+jh
   V7I84pN2yph8dwonT5T9M4E/+ulpxSTBmPmW4G8D2Tb8MYQTvCZIletPy
   Ox0HuOI7FH/uotubhTeaaMwTk/1XVKqE4lRESaF5gw5Pm1r6K/CCI0G5y
   3L9oVfZrpt74+78+dp8E+q7imt4MAvnNbNdU1WatvdEKFmjed3UeTQxN8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369537707"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="369537707"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 12:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="707990772"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="707990772"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Aug 2023 12:57:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT6Lm-0004qo-2w;
	Mon, 07 Aug 2023 19:57:10 +0000
Date: Tue, 8 Aug 2023 03:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 38/38] ASoC: soc-dai.h: remove unused call back functions
Message-ID: <202308080309.UN2MfAcQ-lkp@intel.com>
References: <87r0oms1iy.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0oms1iy.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20230807]
[cannot apply to tegra/for-next sunxi/sunxi/for-next rockchip/for-next linus/master v6.5-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-ti-merge-DAI-call-back-functions-into-ops/20230802-095312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/87r0oms1iy.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 38/38] ASoC: soc-dai.h: remove unused call back functions
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20230808/202308080309.UN2MfAcQ-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080309.UN2MfAcQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080309.UN2MfAcQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/au1x/psc-ac97.c: In function 'au1xpsc_ac97_hw_params':
   sound/soc/au1x/psc-ac97.c:213:13: warning: variable 'chans' set but not used [-Wunused-but-set-variable]
     213 |         int chans, t, stype = substream->stream;
         |             ^~~~~
   sound/soc/au1x/psc-ac97.c: At top level:
>> sound/soc/au1x/psc-ac97.c:342:10: error: 'const struct snd_soc_dai_driver' has no member named 'probe'
     342 |         .probe                  = au1xpsc_ac97_probe,
         |          ^~~~~
>> sound/soc/au1x/psc-ac97.c:342:35: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct snd_soc_dai *)' [-Werror=incompatible-pointer-types]
     342 |         .probe                  = au1xpsc_ac97_probe,
         |                                   ^~~~~~~~~~~~~~~~~~
   sound/soc/au1x/psc-ac97.c:342:35: note: (near initialization for 'au1xpsc_ac97_dai_template.name')
   cc1: some warnings being treated as errors
--
>> sound/soc/au1x/ac97c.c:209:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     209 |         .probe                  = au1xac97c_dai_probe,
         |          ^~~~~
>> sound/soc/au1x/ac97c.c:209:35: warning: initialization of 'unsigned int' from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a cast [-Wint-conversion]
     209 |         .probe                  = au1xac97c_dai_probe,
         |                                   ^~~~~~~~~~~~~~~~~~~
   sound/soc/au1x/ac97c.c:209:35: note: (near initialization for 'au1xac97c_dai_driver.id')


vim +342 sound/soc/au1x/psc-ac97.c

0f83d639d84c99 Manuel Lauss 2009-10-31  340  
ffc4fdbbe1b4be Manuel Lauss 2010-08-26  341  static const struct snd_soc_dai_driver au1xpsc_ac97_dai_template = {
0f83d639d84c99 Manuel Lauss 2009-10-31 @342  	.probe			= au1xpsc_ac97_probe,
0f83d639d84c99 Manuel Lauss 2009-10-31  343  	.playback = {
0f83d639d84c99 Manuel Lauss 2009-10-31  344  		.rates		= AC97_RATES,
0f83d639d84c99 Manuel Lauss 2009-10-31  345  		.formats	= AC97_FMTS,
0f83d639d84c99 Manuel Lauss 2009-10-31  346  		.channels_min	= 2,
0f83d639d84c99 Manuel Lauss 2009-10-31  347  		.channels_max	= 2,
0f83d639d84c99 Manuel Lauss 2009-10-31  348  	},
0f83d639d84c99 Manuel Lauss 2009-10-31  349  	.capture = {
0f83d639d84c99 Manuel Lauss 2009-10-31  350  		.rates		= AC97_RATES,
0f83d639d84c99 Manuel Lauss 2009-10-31  351  		.formats	= AC97_FMTS,
0f83d639d84c99 Manuel Lauss 2009-10-31  352  		.channels_min	= 2,
0f83d639d84c99 Manuel Lauss 2009-10-31  353  		.channels_max	= 2,
0f83d639d84c99 Manuel Lauss 2009-10-31  354  	},
0f83d639d84c99 Manuel Lauss 2009-10-31  355  	.ops = &au1xpsc_ac97_dai_ops,
0f83d639d84c99 Manuel Lauss 2009-10-31  356  };
0f83d639d84c99 Manuel Lauss 2009-10-31  357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
