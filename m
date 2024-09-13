Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776231E884
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 03:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726197276; cv=none; b=NZxCYbu5WCrr2R+UNaH+PC7SqlH/orHUXyxj9aBlDJ2iztsbBGkn5x1tWp01LY20D2avjMtKZeOHIdCpEU/7GbV/A/ckvIVhI+Sma7n1BItuzk2RAS8E7Ep+s/8oGnOaV3NOQflfi4xa9IhLSMANUsXiTTZTRs+WxgMxx0B+EHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726197276; c=relaxed/simple;
	bh=UF45bnjN7xTRiQ2CNcZl8S9F997vPgP/Ef6Vzltetw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWn2buWhU8+qzhMrr7LFFRXQwGhWDJiqD3kR62fDokaQlYZO2ROeZ8mG+PV9ZABM9LIy9/9ZjpgHiMOje1EbXTa8rvJHShWue7JLoswXk/C4mqLBH0EKqwys3DUklFYnqeceTfqxXZB1LQfLLzD9+oSVnTWAskJrLA7KWIH1aXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzyTWW6c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzyTWW6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726197274; x=1757733274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UF45bnjN7xTRiQ2CNcZl8S9F997vPgP/Ef6Vzltetw8=;
  b=kzyTWW6c5oagkveSWGcMvoWdckxcZ5CINmtwYhU+b04wYQjC1vkDCCEL
   NkpYolg7HF5Ifq1c/Mw/5LkkRssgzRt4nZuLqD0I8efZNFgEKC9GdvPlJ
   lucIOHvY2WhjZSW4u7jFCodfTAkBSnhAG3EjhO4zVPgUtCOJgUMyyDuoq
   /qwbX+uQzUxEMtMrk6H6VbKdKIYIVTrKZfPWNlEZfMVVPi8PHNdPehARG
   CvB+24hrx564ApJS8tbmRnJZJQg/PWuGRcIq0V57nF+2F4Ix7gZ4njil3
   JmYPEp49hrrvIM+xvz8V7fdM0rxyprv/u8D1mOftmJOZCrzAhvyZZAc1P
   A==;
X-CSE-ConnectionGUID: YtMUb3PyQViGIbRCxIRd+Q==
X-CSE-MsgGUID: apb9X+D9RG+FZ+eHgWcBPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24908594"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="24908594"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 20:14:33 -0700
X-CSE-ConnectionGUID: DaNXnFwKSRut9B0sPBnkWw==
X-CSE-MsgGUID: tSsqDzH6SGqCYKZkblP9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="68419447"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 20:14:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sowlR-0005x0-1z;
	Fri, 13 Sep 2024 03:14:29 +0000
Date: Fri, 13 Sep 2024 11:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-error-cleanup-2024-09-10 17/31]
 sound/soc/fsl/imx-audmix.c:113:24: warning: unused variable 'dev'
Message-ID: <202409131123.k0jLcDSi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-10
head:   df81764a514843b316e76c4bc95d2f97a31297f5
commit: c329ff407425a195a664d14e72cc82be93f2b75f [17/31] snd_soc_dai_set_fmt
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240913/202409131123.k0jLcDSi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131123.k0jLcDSi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131123.k0jLcDSi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/fsl/imx-audmix.c: In function 'imx_audmix_be_hw_params':
>> sound/soc/fsl/imx-audmix.c:113:24: warning: unused variable 'dev' [-Wunused-variable]
     113 |         struct device *dev = rtd->card->dev;
         |                        ^~~


vim +/dev +113 sound/soc/fsl/imx-audmix.c

b86ef536776160 Viorel Suman      2019-01-22  108  
b86ef536776160 Viorel Suman      2019-01-22  109  static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
b86ef536776160 Viorel Suman      2019-01-22  110  				   struct snd_pcm_hw_params *params)
b86ef536776160 Viorel Suman      2019-01-22  111  {
14ec63f678e8be Kuninori Morimoto 2023-09-11  112  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
b86ef536776160 Viorel Suman      2019-01-22 @113  	struct device *dev = rtd->card->dev;
b86ef536776160 Viorel Suman      2019-01-22  114  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
b86ef536776160 Viorel Suman      2019-01-22  115  	unsigned int fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF;
b86ef536776160 Viorel Suman      2019-01-22  116  	int ret;
b86ef536776160 Viorel Suman      2019-01-22  117  
b86ef536776160 Viorel Suman      2019-01-22  118  	if (!tx)
b86ef536776160 Viorel Suman      2019-01-22  119  		return 0;
b86ef536776160 Viorel Suman      2019-01-22  120  
bf101022487091 Mark Brown        2021-09-21  121  	/* For playback the AUDMIX is consumer */
3b14c15a333b82 Charles Keepax    2022-05-19  122  	fmt |= SND_SOC_DAIFMT_BC_FC;
b86ef536776160 Viorel Suman      2019-01-22  123  
b86ef536776160 Viorel Suman      2019-01-22  124  	/* set AUDMIX DAI configuration */
14ec63f678e8be Kuninori Morimoto 2023-09-11  125  	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0), fmt);
b86ef536776160 Viorel Suman      2019-01-22  126  
b86ef536776160 Viorel Suman      2019-01-22  127  	return ret;
b86ef536776160 Viorel Suman      2019-01-22  128  }
b86ef536776160 Viorel Suman      2019-01-22  129  

:::::: The code at line 113 was first introduced by commit
:::::: b86ef5367761603df5f66ce08fb014b991f6b51d ASoC: fsl: Add Audio Mixer machine driver

:::::: TO: Viorel Suman <viorel.suman@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
