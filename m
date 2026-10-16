Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A753659FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160595; cv=none; b=l/eMWZMG88A9pl4+SeQkgAVMPKxWrfTPE5+Rw1ct3/6EhaUTkxQEtJ9cPPyKg+ulo5WaTcK7wzXal2KYbmi8UookJcg3sqCfwOWJyGY1IS3I2JS/13gZuDs1bRiaDOt4E79YBUVlAloqXxE02rbnX0cqGdvXL3EVuaNLfc+oIq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160595; c=relaxed/simple;
	bh=IjeYdSCWg8Ak+gkk3PWicwfOSP75u+JNM1Ym0i7ZteU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K77V/wdJnNUSrGMkfWcCf/2KYaRUrjcZ5/zJU0cOrdeVHHhqM9e5kWXCKyqTbO0FfLun8sqY3WGclu7f0tygXlzB54c0fI2/rmR1UjeeKWd7XGpNojTzUE5sNeeQH7PgpjFJWYg95cOwzDE6iz0AWjAwcM2hgs9T2BHg0bafOJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQIsUmJt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQIsUmJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792160593; x=1823696593;
  h=date:from:to:cc:subject:message-id;
  bh=IjeYdSCWg8Ak+gkk3PWicwfOSP75u+JNM1Ym0i7ZteU=;
  b=IQIsUmJt9XWaJhz069eEI/JldwT6ZORb5H0/AopmNXVbkuyaEnPOyUB0
   xWmbfbWBYwfv82Fi15h6+JZXB14Rw5QMYiZaoNy5wcAWmtADtas8CBF/h
   oURqwrkJK1JgmVqWiLTmCTHM677q6Y/PJG9JB7RcjQjIrdXGj9lhoBHwv
   lR4rHbpaYsrF8byfmLsPN/uoIvQJ6mIU53nkaG4wXuHzV8zy95rK0uQcw
   21UAEREd0hqvMFMDAruWeX0NQvjBg1Ex6ud8ybtqFg0+LwlGMTcsVTBgT
   gaK7Bdg0uGupWUiYZhzco930Z3+ir4ISpirq6JQTOHm7PvFZD/K2escJK
   g==;
X-CSE-ConnectionGUID: kZzi60MhS7KrlceAOlYUnw==
X-CSE-MsgGUID: bZGU5WbpTAC/9bVnJfo8Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="949690"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="949690"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:23:13 -0700
X-CSE-ConnectionGUID: lplfZXijRHWTsCvKxempew==
X-CSE-MsgGUID: nRIDDPSMS8maBFiVB3HOQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1874217"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Oct 2026 07:23:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHipx-00000000CGF-1cbE;
	Fri, 16 Oct 2026 14:23:09 +0000
Date: Fri, 16 Oct 2026 16:22:47 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-16-2 231/331]
 drivers/staging/greybus/audio_codec.c:1095:9: error: implicit declaration of
 function 'devm_snd_soc_component_register'; did you mean
 'snd_soc_component_register'?
Message-ID: <202610161605.SEPfEPI9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-16-2
head:   74808ab9efae9b3cfb9234516fbf8d3bc7f6b8b7
commit: 47cdfff731aaf82d9b36ad4dd43651e744e88d85 [231/331] dai
config: microblaze-randconfig-r2108-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161605.SEPfEPI9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161605.SEPfEPI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161605.SEPfEPI9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/greybus/audio_codec.c: In function 'gbaudio_codec_probe':
>> drivers/staging/greybus/audio_codec.c:1095:9: error: implicit declaration of function 'devm_snd_soc_component_register'; did you mean 'snd_soc_component_register'? [-Werror=implicit-function-declaration]
    1095 |  return devm_snd_soc_component_register(&pdev->dev,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_component_register
   cc1: some warnings being treated as errors


vim +1095 drivers/staging/greybus/audio_codec.c

  1092	
  1093	static int gbaudio_codec_probe(struct platform_device *pdev)
  1094	{
> 1095		return devm_snd_soc_component_register(&pdev->dev,
  1096				&soc_codec_dev_gbaudio,
  1097				gbaudio_dai, ARRAY_SIZE(gbaudio_dai));
  1098	}
  1099	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
