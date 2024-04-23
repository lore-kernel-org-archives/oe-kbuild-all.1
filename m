Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CC13F452
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713892132; cv=none; b=qcwKwQ33YIfjaU6zI97Idho7SELBquQiuH8T1bPYa+qmpq7hCM55gg39WhklEiwEtRgW6JVNMyCDfkTA85sdFyWVgxoqx9Zpi2EzuUl1aTHs4nzZOq8GXmyxuUFEd2jDPCCZnXvyaW0S1i/eoxWujNL/m42NKS5dvgmJE7HHUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713892132; c=relaxed/simple;
	bh=PpJt96ECHrDvKUAwHaQd6O0Qb7jt7tSiU9MuqB565TA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VFFzPHxa5kR+Acj6J4UDwxUs367sMNiNR6haAx9rggvUYB5VM83xlbSyar2py0xYscYinuRruJCPkaYtVrZ+8bYF+bDJFgZVpA2dTFOvPsnBgvihmQtWFg6BpPZ810JtMHtR7zhPaAfe+UQIBdvuJOR6+vynO5NyxlKmDQWY0VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSFoXLml; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSFoXLml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713892131; x=1745428131;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PpJt96ECHrDvKUAwHaQd6O0Qb7jt7tSiU9MuqB565TA=;
  b=gSFoXLmlsdtNG66kiNytrnzqnl8Fm4CB6jbfp01KcFLIYucy/PW3CeYs
   HfY/+aEuVOqz49N5AiIpBkRgFegMfDdOYsBvZcoB9ozxt9TdsIn1Cr7Um
   FMbAD/vAm6vmvd1JVS8R4/sSdgQGVjwCGXzDEJ7dHwFUtagWbpc4Sh7o9
   RXdYoPUXwJKbg4tmKzt7+x4fADTmEAgDjfFHaEwJr5HebfRgOYz/9o9Uj
   7BhImcbzOSoqWus/Rm+vm1zdCQTdxDEqFFXU8JsIIc7s20B2KLDi7hS/0
   06rUcGbPQwAWE7eJ68v8au4SSIj8qq0oBNRx1uYZRv2JCKgYAGtHOKinA
   Q==;
X-CSE-ConnectionGUID: f7XXqZ5EQLqrHNZ6OlcJwQ==
X-CSE-MsgGUID: ZD/+gKIZQROUeCXuZTt1UA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9709371"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9709371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:08:39 -0700
X-CSE-ConnectionGUID: Bos0SO/HQc2x0HjUzkw3cQ==
X-CSE-MsgGUID: vTBUakX2Suu1Tn4Vf5cpQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24430745"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2024 10:08:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzJdE-0000NY-1W;
	Tue, 23 Apr 2024 17:08:36 +0000
Date: Wed, 24 Apr 2024 01:07:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:morimoto/dpcm-cleanup 20/23]
 sound/soc/samsung/odroid.c:187:18: sparse: sparse: Initializer entry defined
 twice
Message-ID: <202404240127.wi5ZHtGk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound morimoto/dpcm-cleanup
head:   9be6af3a99f40fb05a32d03d6f60961d4706f3d3
commit: c463b891d025cda70a56df4365832f0584503b7a [20/23] ASoC: samsung: Replace playback/capture_only to playback/capture_assertion
config: arm-randconfig-r132-20240423 (https://download.01.org/0day-ci/archive/20240424/202404240127.wi5ZHtGk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404240127.wi5ZHtGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240127.wi5ZHtGk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/samsung/odroid.c:187:18: sparse: sparse: Initializer entry defined twice
   sound/soc/samsung/odroid.c:192:18: sparse:   also defined here

vim +187 sound/soc/samsung/odroid.c

   152	
   153	SND_SOC_DAILINK_DEFS(primary,
   154		DAILINK_COMP_ARRAY(COMP_EMPTY()),
   155		DAILINK_COMP_ARRAY(COMP_DUMMY()),
   156		DAILINK_COMP_ARRAY(COMP_PLATFORM("3830000.i2s")));
   157	
   158	SND_SOC_DAILINK_DEFS(mixer,
   159		DAILINK_COMP_ARRAY(COMP_DUMMY()),
   160		DAILINK_COMP_ARRAY(COMP_EMPTY()));
   161	
   162	SND_SOC_DAILINK_DEFS(secondary,
   163		DAILINK_COMP_ARRAY(COMP_EMPTY()),
   164		DAILINK_COMP_ARRAY(COMP_DUMMY()),
   165		DAILINK_COMP_ARRAY(COMP_PLATFORM("3830000.i2s-sec")));
   166	
   167	static struct snd_soc_dai_link odroid_card_dais[] = {
   168		{
   169			/* Primary FE <-> BE link */
   170			.ops = &odroid_card_fe_ops,
   171			.name = "Primary",
   172			.stream_name = "Primary",
   173			.dynamic = 1,
   174			.playback_assertion = 1,
   175			SND_SOC_DAILINK_REG(primary),
   176		}, {
   177			/* BE <-> CODECs link */
   178			.name = "I2S Mixer",
   179			.ops = &odroid_card_be_ops,
   180			.no_pcm = 1,
   181			.playback_assertion = 1,
   182			.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
   183					SND_SOC_DAIFMT_CBS_CFS,
   184			SND_SOC_DAILINK_REG(mixer),
   185		}, {
   186			/* Secondary FE <-> BE link */
 > 187			.playback_assertion = 1,
   188			.ops = &odroid_card_fe_ops,
   189			.name = "Secondary",
   190			.stream_name = "Secondary",
   191			.dynamic = 1,
   192			.playback_assertion = 1,
   193			SND_SOC_DAILINK_REG(secondary),
   194		}
   195	};
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
