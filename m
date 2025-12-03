Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8240F2F291D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760479; cv=none; b=Fj/wUyiUeWDRFGwnqRYEuy173reVlS22hVItmXrg3vnJD/ObTkODkR4u2vPrchTAfcjaOLkAixLTj+gmNCwPRwz/94plG3zDA2EqHq15JcaEtxK0X3Dy63FrMmAXle2sga3+ouvce1vERTB8r2KdhhYbwTuAdxBSUFH4kIcghCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760479; c=relaxed/simple;
	bh=4AAkHjsVov/FDYh9IL0VkY7qCzji3k3OxPgjb4NLaQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Afj1Xl5OdXuwg1TL4dscUte379Z9dNT8vPKl+DkU2a4Vx0cSVWWMdf3hJEVVLq5ZgGf3Wqd/oyooGJUIxwNpNHhD0/FYJBpTqwr7XLGh0XagnoTFVdzTHiLuoGGTTgCZBS7TtP8YAvXNOoga06hidYtZCSHLh4RHN87YyWYqIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSuWb+by; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSuWb+by"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764760478; x=1796296478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4AAkHjsVov/FDYh9IL0VkY7qCzji3k3OxPgjb4NLaQc=;
  b=CSuWb+byBRKK3OzEsMvdBWMDMB7896Z9EoJTKIrBOuiqrC6cH9EARrtD
   FQ63HPXOzflB4Y1N8hAjdYfQCPuPd3w+WthTq/5WpgsOtZK++6UF/YfC9
   IDdfQ5sJNwZvYy7XC/oL0iOirjBvJ/fZzI0p3+mWN2s7zntIQkgY+95sY
   b4mm/vv4VE0TnyYTGV/Mmas7FsyzkaG4tn886vH3YMSKXTYh6LRcgNPju
   zyf6A8ntQU7J8wanwNN5TAwMLZ9aF5zf9EcDgPaqI9LlaiZQ4g+8zdDv7
   xUdhAA1EMprou+F3sYy03shRpcBQcjsv0sFiluAsoqpO+r6vvgrolYm2K
   A==;
X-CSE-ConnectionGUID: cBqgXJxWRXa/4hpg3czeBw==
X-CSE-MsgGUID: 36Yun+NCSymK8gQq2uFrmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69344482"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="69344482"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 03:14:34 -0800
X-CSE-ConnectionGUID: 6CibGYjSRaWq2OUCWSYANg==
X-CSE-MsgGUID: bYXaGV0MQZC2p5JXWVcxfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199779177"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2025 03:14:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQkoX-00000000AuJ-4AmZ;
	Wed, 03 Dec 2025 11:14:29 +0000
Date: Wed, 3 Dec 2025 19:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-01 11/13]
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2383:10: error: 'const struct
 snd_soc_component_driver' has no member named 'pcm_construct'
Message-ID: <202512031931.XKhXGHEV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-01
head:   a5568a9bacc493dbb1465f3b850acf8595553013
commit: bd2deca8dd7083e29460b70bedf2172a397d966b [11/13] ASoC: soc-component: remove pcm_construct()/pcm_destruct()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251203/202512031931.XKhXGHEV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031931.XKhXGHEV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031931.XKhXGHEV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2383:10: error: 'const struct snd_soc_component_driver' has no member named 'pcm_construct'
    2383 |         .pcm_construct = mtk_afe_pcm_new,
         |          ^~~~~~~~~~~~~
>> sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2383:26: error: initialization of 'void (*)(struct snd_soc_component *)' from incompatible pointer type 'int (*)(struct snd_soc_component *, struct snd_soc_pcm_runtime *)' [-Wincompatible-pointer-types]
    2383 |         .pcm_construct = mtk_afe_pcm_new,
         |                          ^~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2383:26: note: (near initialization for 'mt8189_afe_component.remove')
   In file included from sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:27:
   sound/soc/mediatek/mt8189/../common/mtk-afe-platform-driver.h:22:5: note: 'mtk_afe_pcm_new' declared here
      22 | int mtk_afe_pcm_new(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2384:10: error: 'const struct snd_soc_component_driver' has no member named 'pcm_destruct'
    2384 |         .pcm_destruct = mt8189_afe_pcm_free,
         |          ^~~~~~~~~~~~
>> sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2384:25: error: initialization of 'int (*)(struct snd_soc_component *)' from incompatible pointer type 'void (*)(struct snd_soc_component *, struct snd_pcm *)' [-Wincompatible-pointer-types]
    2384 |         .pcm_destruct = mt8189_afe_pcm_free,
         |                         ^~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2384:25: note: (near initialization for 'mt8189_afe_component.suspend')
   sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2374:13: note: 'mt8189_afe_pcm_free' declared here
    2374 | static void mt8189_afe_pcm_free(struct snd_soc_component *component,
         |             ^~~~~~~~~~~~~~~~~~~


vim +2383 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c

7eb1535855983f Cyril Chao 2025-10-31  2379  
7eb1535855983f Cyril Chao 2025-10-31  2380  static const struct snd_soc_component_driver mt8189_afe_component = {
7eb1535855983f Cyril Chao 2025-10-31  2381  	.name = AFE_PCM_NAME,
7eb1535855983f Cyril Chao 2025-10-31  2382  	.probe = mt8189_afe_component_probe,
7eb1535855983f Cyril Chao 2025-10-31 @2383  	.pcm_construct = mtk_afe_pcm_new,
7eb1535855983f Cyril Chao 2025-10-31 @2384  	.pcm_destruct = mt8189_afe_pcm_free,
7eb1535855983f Cyril Chao 2025-10-31  2385  	.open = mt8189_afe_pcm_open,
7eb1535855983f Cyril Chao 2025-10-31  2386  	.pointer = mtk_afe_pcm_pointer,
7eb1535855983f Cyril Chao 2025-10-31  2387  };
7eb1535855983f Cyril Chao 2025-10-31  2388  

:::::: The code at line 2383 was first introduced by commit
:::::: 7eb1535855983f67b95c2ba777d686cc17188285 ASoC: mediatek: mt8189: add platform driver

:::::: TO: Cyril Chao <Cyril.Chao@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
