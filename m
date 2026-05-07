Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D1B1B4257
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 03:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778123780; cv=none; b=s59MsFD9/Y3f1jw7NhZHRp102LbUrZJ6LbqtF7G136xIi2/78ySqyRxIK65Ou247ajaFiVcfAMi+78DK/crt/beTmy2rPYsJxzCo1GflqB9S4QRi+J/rkrYR3X3Q+SfLRglCP0sBWoGXZ8d99KzEMQUH8GANkxtwtu9ceW866E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778123780; c=relaxed/simple;
	bh=AaEJzgcg8XHIMjm6UqqrgVYgQOgcWZQuKyD+wY8b5MA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=byfp/lpf137X/CvjU/k+eRv4Kma9jYCkS9+ku6I8/ggz0kJM44MdzJHG9ymYz2eBWKZlQwQggURwxc2zOkzxwCqRDI0XJBpYaxxdUxOv/hve6W4O2Mh7meM116pTd+4YN8qNNqfKhoQUXFQzCEP8QpjBh4ScMhXszDB/8MpmfcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StFwaaLz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StFwaaLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778123777; x=1809659777;
  h=date:from:to:cc:subject:message-id;
  bh=AaEJzgcg8XHIMjm6UqqrgVYgQOgcWZQuKyD+wY8b5MA=;
  b=StFwaaLz9JS8ZKNQKRZOCj+abZpxPeZtbnadU1C59Z/9SLALMN80crFk
   7tx2BIgZjy8JOrIxbxU/7YyVX7i/GX55/aM8+avGgYyGTs01bWQYvaPtR
   QiRmI8uDJzojbdQ5eeij1RBvaQ+NHgHIv6TUBzxYh8rg8mxAihI+LpHPR
   PTt5ktw9+221JkTESeGKgRjP9xE41x7u6Ic4hsSi3oqeO8G9m56i6HKM6
   wQ0UBFKt8WJwY139yqc6WFfv6PmcZ+V3vi55QvdQu8fscXIKw+hX33+G1
   BugBrzyAGpTUrrSgQ9wm5UScnrJim89aEZBQ8bEhagpl6cf1aWpfBWx2Q
   g==;
X-CSE-ConnectionGUID: vjGFKDPxQ0iSX+XFc65LnA==
X-CSE-MsgGUID: 5eAhq4z3SwKHuoYqlIalbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82910474"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="82910474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 20:16:17 -0700
X-CSE-ConnectionGUID: FSYk9iWYSJakfbYyJ73XkQ==
X-CSE-MsgGUID: aVkh+gbfSjqbDS9q7/VDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="266712630"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2026 20:16:15 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKpDg-000000001W1-3FC5;
	Thu, 07 May 2026 03:16:12 +0000
Date: Thu, 07 May 2026 11:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sheetal <sheetal@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-7.2 8/8]
 sound/soc/tegra/tegra210_mixer.c:160: undefined reference to `__udivdi3'
Message-ID: <202605071156.iLnuY134-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2
head:   36645381b864b53ae976221854bbfc23da6abba3
commit: 36645381b864b53ae976221854bbfc23da6abba3 [8/8] ASoC: tegra: Add per-stream Mixer Fade controls
config: powerpc-randconfig-002 (https://download.01.org/0day-ci/archive/20260507/202605071156.iLnuY134-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071156.iLnuY134-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071156.iLnuY134-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: sound/soc/tegra/tegra210_mixer.o: in function `tegra210_mixer_configure_gain':
>> sound/soc/tegra/tegra210_mixer.c:160: undefined reference to `__udivdi3'


vim +160 sound/soc/tegra/tegra210_mixer.c

   125	
   126	static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
   127						 unsigned int id, bool instant_gain)
   128	{
   129		struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
   130		unsigned int reg = MIXER_GAIN_CFG_RAM_ADDR(id);
   131		int err, i;
   132	
   133		pm_runtime_get_sync(cmpnt->dev);
   134	
   135		/* Write default gain poly coefficients */
   136		for (i = 0; i < NUM_GAIN_POLY_COEFFS; i++) {
   137			err = tegra210_mixer_write_ram(mixer, reg + i,
   138						       gain_params.poly_coeff[i]);
   139	
   140			if (err < 0)
   141				goto rpm_put;
   142		}
   143	
   144		/* Write stored gain value */
   145		err = tegra210_mixer_write_ram(mixer, reg + NUM_GAIN_POLY_COEFFS,
   146					       mixer->gain_value[id]);
   147		if (err < 0)
   148			goto rpm_put;
   149	
   150		/* Write duration parameters */
   151		for (i = 0; i < NUM_DURATION_PARMS; i++) {
   152			int val;
   153	
   154			if (instant_gain) {
   155				val = 1;
   156			} else {
   157				if (i == DURATION_N3_ID)
   158					val = mixer->duration[id];
   159				else if (i == DURATION_INV_N3_ID)
 > 160					val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
   161						    mixer->duration[id]);
   162				else
   163					val = gain_params.duration[i];
   164			}
   165	
   166			err = tegra210_mixer_write_ram(mixer,
   167						       REG_DURATION_PARAM(reg, i),
   168						       val);
   169			if (err < 0)
   170				goto rpm_put;
   171		}
   172	
   173		/* Trigger to apply gain configurations */
   174		err = tegra210_mixer_write_ram(mixer, reg + REG_CFG_DONE_TRIGGER,
   175					       VAL_CFG_DONE_TRIGGER);
   176	
   177	rpm_put:
   178		pm_runtime_put(cmpnt->dev);
   179	
   180		return err;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
