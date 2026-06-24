Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8049D137923
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306848; cv=none; b=FGilm0atqBNlNVz1aivvpFY4IiEjqfgC59kRPG8of+n6z7ZsV/bT+gT7IIB5eAk2yWr0WPrsdgGUhvdEXhC8YquZPC9Hx7Nf5CMhfFxU/SjuqFAmyM8jWRYOzrjl6/xD39X2EokTW4B6y6DPpozFuSAXvCfd58kZ/mhU7Tz4pO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306848; c=relaxed/simple;
	bh=Fhjilxt36FmyA1zY0Jm/uMDhAWYo6ZP4DjaZRb6SwQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AXIkPvCsJcJSdrJFqwu3qN7s3VxuVcgrBjxAdGS9SzPCFV1J2WywGIReYXB63MLRFBO5Z+HYjeZ8ZkIzVPjvDskvEP+l95BHlb0fUMLsoEfizT0DrmDoEPyO7oUZE97+tjXfj7/d6FwfFppG/wDD7wQxJPKX55I2ILqtH+JWlKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqKudrR3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqKudrR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782306846; x=1813842846;
  h=date:from:to:cc:subject:message-id;
  bh=Fhjilxt36FmyA1zY0Jm/uMDhAWYo6ZP4DjaZRb6SwQE=;
  b=RqKudrR3ngOhs8hoT2WoQ2H1QouOhguJiXchE36tciKzDs4FYA++Pfi5
   EfJQGsuHuHCYqBo9qQiRgtQDoGtdE8Pn98bgTYbqlZTwrelbJiq0kdqOR
   yn1NiImf4OvKqV28zh4EbjnjYzooUyiU0kff7SLz+dlkq+HPs/EsMYlJ/
   46pEFcw3riN+hNPhUtPuvFsT9F0FmQgTjJbmOZHJHSKt//I6ebTIjkG9t
   Z4NV5wK1FmWoXC5w1iG0GHxxdOsr6HFSjqeQFxb4EgZxZ33bt9y43I6b/
   2KGoDZUbjBv13Tt96q9J9yLckyUfTzQUkjs8/qNNnQ2iTsP+VY/gqiCyF
   w==;
X-CSE-ConnectionGUID: VS8/Y771Q1uSY9YdPLITTQ==
X-CSE-MsgGUID: luZKeYgNRNuyeLH6dDOkyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93425542"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="93425542"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 06:14:05 -0700
X-CSE-ConnectionGUID: j5PAsT1ORduQizfqAcenZQ==
X-CSE-MsgGUID: YhxTmEkxSNaQxaA+k1dAfg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jun 2026 06:14:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcNQV-000000003NX-45gi;
	Wed, 24 Jun 2026 13:14:00 +0000
Date: Wed, 24 Jun 2026 21:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-19 319/326]
 sound/soc/pxa/pxa2xx-ac97.c:104:2: error: call to undeclared function
 'snd_soc_dai_set_dma_data'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202606242123.84ypu2tI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-19
head:   885feafb1fe92b67450ae8ac4996368e3a6dd242
commit: 9a70f5b9284a3f7bee5108779ab4e58a8480d6fd [319/326] ASoC: soc-dai: remove compatible definition
config: sparc64-randconfig-r123-20260624 (https://download.01.org/0day-ci/archive/20260624/202606242123.84ypu2tI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606242123.84ypu2tI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606242123.84ypu2tI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/pxa/pxa2xx-ac97.c:104:2: error: call to undeclared function 'snd_soc_dai_set_dma_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |         snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
         |         ^
   sound/soc/pxa/pxa2xx-ac97.c:119:2: error: call to undeclared function 'snd_soc_dai_set_dma_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     119 |         snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
         |         ^
   sound/soc/pxa/pxa2xx-ac97.c:129:2: error: call to undeclared function 'snd_soc_dai_set_dma_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |         snd_soc_dai_set_dma_data(cpu_dai, substream,
         |         ^
   3 errors generated.


vim +/snd_soc_dai_set_dma_data +104 sound/soc/pxa/pxa2xx-ac97.c

75b41027662e29 Liam Girdwood 2006-10-12   93  
58ceb57ec1be92 Daniel Mack   2015-09-30   94  static int pxa2xx_ac97_hifi_startup(struct snd_pcm_substream *substream,
f0fba2ad1b6b53 Liam Girdwood 2010-03-17   95  				    struct snd_soc_dai *cpu_dai)
75b41027662e29 Liam Girdwood 2006-10-12   96  {
d65a14587a9be8 Daniel Mack   2013-08-12   97  	struct snd_dmaengine_dai_dma_data *dma_data;
75b41027662e29 Liam Girdwood 2006-10-12   98  
75b41027662e29 Liam Girdwood 2006-10-12   99  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
5f712b2b73a9fc Daniel Mack   2010-03-22  100  		dma_data = &pxa2xx_ac97_pcm_stereo_out;
75b41027662e29 Liam Girdwood 2006-10-12  101  	else
5f712b2b73a9fc Daniel Mack   2010-03-22  102  		dma_data = &pxa2xx_ac97_pcm_stereo_in;
5f712b2b73a9fc Daniel Mack   2010-03-22  103  
5f712b2b73a9fc Daniel Mack   2010-03-22 @104  	snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
75b41027662e29 Liam Girdwood 2006-10-12  105  
75b41027662e29 Liam Girdwood 2006-10-12  106  	return 0;
75b41027662e29 Liam Girdwood 2006-10-12  107  }
75b41027662e29 Liam Girdwood 2006-10-12  108  

:::::: The code at line 104 was first introduced by commit
:::::: 5f712b2b73a9fc87fcc52124cfe8adefaa0c92f5 ALSA: ASoC: move dma_data from snd_soc_dai to snd_soc_pcm_stream

:::::: TO: Daniel Mack <daniel@caiaq.de>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
