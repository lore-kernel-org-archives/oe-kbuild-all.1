Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5951DFDE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567700; cv=none; b=IxNLl749uY3M3FYAsH1KlmqW8HIWGTwekUIthZ7EVyg0f9JX4TTdEEEPc5oekFIcZwN0u2fjw14PAFYop76zeT5QRx7zKTuAxrDN7Opfsqiax5lPdg9t6DD53+9+BaxwOKQkOU5hPG3RxKB/yLqDGieMzzwX7l27feZ/uTzWxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567700; c=relaxed/simple;
	bh=V+1R3XBwvbMNnZ3LUucRL6rGDbvm0BiSK/Gr2kmf6Rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=neq/kKtYLtm1HX3w5BMXfTwdqpIcPTtvp7Ihf1CVOl43PbIq8ePVtrvtuVJwNYzmpIj2ty0qD0c/DO/hI6wXqrQSfNqWG+I2RqI2aDDXEc4/wWcBqrUSgUjVgfbygrH9l50yeGAyi41xeCxDGz9A4Od8DbrCToLLhIR73sx1Ono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vy90zZLl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vy90zZLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775567699; x=1807103699;
  h=date:from:to:cc:subject:message-id;
  bh=V+1R3XBwvbMNnZ3LUucRL6rGDbvm0BiSK/Gr2kmf6Rg=;
  b=Vy90zZLlJWat6UoE/03aod925HXjIWNKM2Z05ZwsvvWAFOOlgHjas2g1
   3nP6axB4e+EOkfcZ5t9MyN8ZJ0MUcCizNH/sfoX9PcwDGa+bVbLCKNc7C
   qKrQDSayVon8JgETttCX5TddeWjQ20E8b6x0g7rJX7ti4rdj5S2C6wFJV
   PRqI+1CRYQ46ySnuMdBBawIOTZxtVshZs6u3K2TAFFd1JPFt7jdvHNgVe
   8W4RvVIiI4zU+HNl4/KpF1h0X6HBIC9NRcgyEqlprZPH/sybMZvPMMipp
   6jtc8YR7/xK++CnBjPBh+dnxn3WEQMNDIGStXXWD5vHWaRqnws91b8OjX
   g==;
X-CSE-ConnectionGUID: ZNojSnTuR6aGLXLfoF1meA==
X-CSE-MsgGUID: N/Y/LkIhQKqEjhRlbDWd/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="64074206"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="64074206"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:14:58 -0700
X-CSE-ConnectionGUID: Q0JMbRTfQDm9Z34/GlKxcg==
X-CSE-MsgGUID: LO+UjW6ES26XWf1lBQDVKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223864969"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2026 06:14:57 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA6Gc-000000000bV-2UrC;
	Tue, 07 Apr 2026 13:14:54 +0000
Date: Tue, 07 Apr 2026 21:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-06 119/119]
 sound/soc/codecs/si476x.c:222:10: sparse: sparse: Initializer entry defined
 twice
Message-ID: <202604072139.9CeDasUz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-06
head:   557e71769b656376e9a03618f6e770bb6a3defd5
commit: 29d2324ae7f721e5087e6b950a20d953b0c71cf2 [119/119] hoge
config: x86_64-randconfig-121-20260407 (https://download.01.org/0day-ci/archive/20260407/202604072139.9CeDasUz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604072139.9CeDasUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072139.9CeDasUz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/si476x.c:222:10: sparse: sparse: Initializer entry defined twice
   sound/soc/codecs/si476x.c:224:10: sparse:   also defined here

vim +222 sound/soc/codecs/si476x.c

   218	
   219	static const struct snd_soc_dai_ops si476x_dai_ops = {
   220		.hw_params	= si476x_codec_hw_params,
   221		.set_fmt	= si476x_codec_set_dai_fmt,
 > 222		.num_auto_selectable_formats	= 1,
   223		.auto_selectable_formats	= ssm3515_selectable_formats,
   224		.num_auto_selectable_formats	= ARRAY_SIZE(ssm3515_selectable_formats),
   225	};
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
