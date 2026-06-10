Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4FC2D7DC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 02:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781057280; cv=none; b=MPyeePPEsYttbpmYUFDhr6pX2l2aiBIPLozOa8hjIxXXzBp3IhLUSGCl1MkSQu+c8NNICSkLEzgAip1nZa35ciQoZw8/jJ2hoV717Am2exBeJQg/1sUJToeHTYf00MqyhPid8BJaN5iAkwjc4rWuJGqgMhDoarXqhom7sQXTBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781057280; c=relaxed/simple;
	bh=1hRSa9EXArgIAAaG/RMgz7NiOAax7ERMR8guTDSsTZo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U7yObYnlxpCsTasn4zbprI4eA9C3ClIrh++qIPX94XDszGE9xNicE2y3eAd2d2Y2IyDIq9/1T6ASHc/b0biSo6LUV4UmaKgPy50BziCy6lMBlfzDuvLuCA5rHx6w7XJwfoO1P5bk+GuH06PUBfppxOaV3GLMW3pLeWsm8ANGFmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxJTZi8c; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxJTZi8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781057279; x=1812593279;
  h=date:from:to:cc:subject:message-id;
  bh=1hRSa9EXArgIAAaG/RMgz7NiOAax7ERMR8guTDSsTZo=;
  b=JxJTZi8cuqjUyStsWOCQXLF7tJPigGRRNBS5J26oz5UYz5cY97CHY83n
   kXxBJWof5MbxnMpk2v2iaJF5+RhwT8rpE1bwdbcHCOJ4Jca4OstGMlDAY
   suJEzxxxchDgKLLOLbhG4lyW+oBKbFmpMVJgM9ORgB8VaBynWrhad54qu
   5C7COxyDC9Aobmh98q84jWGOF/gtsuDN6k3ngvQjWVgDYhTfAkouTdHO6
   hQBMfT5RDpL2z+Lw255lorjljNLfigujPT84riuhB0U8h2qhKrVRD+45T
   XKNrfbJ2nproXrSxftGmIGMf//CtlSBEie6U/4rVFPVs5jLZF8m/ZR+n3
   Q==;
X-CSE-ConnectionGUID: 2IrzynCITOew8uvdNCezHA==
X-CSE-MsgGUID: yBUXGuVVRK6DhQ1QsT9bhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99416289"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="99416289"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:07:56 -0700
X-CSE-ConnectionGUID: yuH6/8qqS8Whhb45h2ZWIw==
X-CSE-MsgGUID: 2D5O+e2MSN2vJWYUI2ChjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241896537"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 19:07:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX8MC-00000000KnM-3SUV;
	Wed, 10 Jun 2026 02:07:52 +0000
Date: Wed, 10 Jun 2026 10:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/wsa2-fix 5/5]
 sound/soc/qcom/sc8280xp.c:237:71: error: 'cpu_dai' undeclared; did you mean
 'cpu_dying'?
Message-ID: <202606100903.UJnbPKd9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/wsa2-fix
head:   074a0ec5e0e7c16933371ee131890bacbfee4fdd
commit: 074a0ec5e0e7c16933371ee131890bacbfee4fdd [5/5] WiP
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260610/202606100903.UJnbPKd9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100903.UJnbPKd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100903.UJnbPKd9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/qcom/sc8280xp.c: In function 'sc8280xp_snd_prepare':
>> sound/soc/qcom/sc8280xp.c:237:71: error: 'cpu_dai' undeclared (first use in this function); did you mean 'cpu_dying'?
     237 |         return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
         |                                                                       ^~~~~~~
         |                                                                       cpu_dying
   sound/soc/qcom/sc8280xp.c:237:71: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/qcom/sc8280xp.c:238:1: warning: control reaches end of non-void function [-Wreturn-type]
     238 | }
         | ^


vim +237 sound/soc/qcom/sc8280xp.c

074a0ec5e0e7c1 Neil Armstrong      2026-05-28  223  
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  224  static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  225  {
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  226  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  227  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  228  
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  229  	if (data->snd_soc_common_priv->snd_prepare) {
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  230  		int ret;
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  231  
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  232  		ret = data->snd_soc_common_priv->snd_prepare(substream);
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  233  		if (ret)
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  234  			return ret;
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  235  	}
074a0ec5e0e7c1 Neil Armstrong      2026-05-28  236  
d02460317ed9c9 Srinivas Kandagatla 2025-10-22 @237  	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
295aeea6646ad6 Srinivas Kandagatla 2022-09-16 @238  }
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  239  

:::::: The code at line 237 was first introduced by commit
:::::: d02460317ed9c95aa2c5f6ff1c70e22e1857d95d ASoC: qcom: sdw: remove redundant code

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
