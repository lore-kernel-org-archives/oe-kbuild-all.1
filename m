Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5623CCFB7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853300; cv=none; b=TEzBSShnguNf50vMULLKoxzcDWBkbivuuFnYG1ZuTO8PpzxYCBLr6FyKRDscJ1SIhkB5y5AxCokgV75KdYAHgDcN+uqXFFZw0+JmzWS67MiW6FAbkhXgnYeQi8HqP57WjcxrT5Xz21oZiJa35uAplokl0sd4PLn0pNK3ME1su70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853300; c=relaxed/simple;
	bh=xTZsjZoT0JRH6QB6wJkKaAnj33A/vA58a3Ri90dgbFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AFCHxUEcf5vneiu6L1o0QBHQGH+jyk19Mr1W9DopBrQjuONKfCDqqhNVb4+Lbtq1GQdJxCBuClNJ48g3V4kUWG/mljmLL+NS0f+TAiMJbt4cctB3xhcx3wWPExNifmAsuXoJzx5aARQWZyytXThObU63hIuNllcJ/dYtHt40hiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyUVsZdk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyUVsZdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776853298; x=1808389298;
  h=date:from:to:cc:subject:message-id;
  bh=xTZsjZoT0JRH6QB6wJkKaAnj33A/vA58a3Ri90dgbFA=;
  b=jyUVsZdkpiG51dRZ4TfDbsGR2xKKwl1atsDByQv2gItj1/kb8j8t6GlC
   xJL24HPUQcLxOl72Z+WcT+5tmbwDQfPVfQYFgLZak2rL2pNG6hD625vhG
   3BlUnHbfmghnt0iGzw/HEFnSR5GXSYzdbMN8bFyYIPdtEBew2/r7zYd3w
   5xHe/OgsPZwjxuAa7QP2wj3zXVrwykdNC5hwYiGu90dXxBYxgPDJcqnZ+
   L8ERudUVebweYAnmSMgkq0pZp3hxNejaSfeIlFv6rYtTx4I0MVjAg54y7
   ii8weXhWC1RUoXQvkOE10sJkrvDJw8wm29W/aC8cITkbhdMFDGq8rGyBp
   g==;
X-CSE-ConnectionGUID: EisnSUp2TnSv4inddiH9lQ==
X-CSE-MsgGUID: Ji5krzyuSYCQ1GCJHyrfhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89189625"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="89189625"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:21:37 -0700
X-CSE-ConnectionGUID: IXWT+Vy2RXOWbvhqfN4qtg==
X-CSE-MsgGUID: gTot8p0kQZGzWv6GqVUGEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="234105556"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Apr 2026 03:21:36 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFUi6-000000000aT-0SyG;
	Wed, 22 Apr 2026 10:21:34 +0000
Date: Wed, 22 Apr 2026 18:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20-2 147/147]
 sound/soc/ti/n810.c:272:35: warning: 'snd_soc_driver' defined but not used
Message-ID: <202604221837.1FC4N3nK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20-2
head:   1604ab9b37c0f7145cc187f24e3aca5b4e318eb1
commit: 2307ef10ca1bc4e93bd613bc369b2322d421dede [147/147] ASoC: soc-core: use snd_soc_card_register()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260422/202604221837.1FC4N3nK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604221837.1FC4N3nK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604221837.1FC4N3nK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/ti/n810.c:287:20: error: 'snd_soc_card_driver' undeclared here (not in a function)
     287 |         .driver = &snd_soc_card_driver,
         |                    ^~~~~~~~~~~~~~~~~~~
>> sound/soc/ti/n810.c:272:35: warning: 'snd_soc_driver' defined but not used [-Wunused-variable]
     272 | static struct snd_soc_card_driver snd_soc_driver = {
         |                                   ^~~~~~~~~~~~~~
--
   sound/soc/ti/omap3pandora.c:223:19: error: initialization of 'const char *' from incompatible pointer type 'struct snd_soc_card_driver *' [-Wincompatible-pointer-types]
     223 |         .driver = &snd_soc_card_driver,
         |                   ^
   sound/soc/ti/omap3pandora.c:223:19: note: (near initialization for 'snd_soc_card_omap3pandora.driver.name')
>> sound/soc/ti/omap3pandora.c:220:65: warning: missing braces around initializer [-Wmissing-braces]
     220 | static struct snd_soc_card_platform snd_soc_card_omap3pandora = {
         |                                                                 ^
   ......
     223 |         .driver = &snd_soc_card_driver,
         |                   {
     224 | };
         | }


vim +/snd_soc_driver +272 sound/soc/ti/n810.c

   270	
   271	/* Audio machine driver */
 > 272	static struct snd_soc_card_driver snd_soc_driver = {
   273		.dai_link = &n810_dai,
   274		.num_links = 1,
   275		.controls = aic33_n810_controls,
   276		.num_controls = ARRAY_SIZE(aic33_n810_controls),
   277		.dapm_widgets = aic33_dapm_widgets,
   278		.num_dapm_widgets = ARRAY_SIZE(aic33_dapm_widgets),
   279		.dapm_routes = audio_map,
   280		.num_dapm_routes = ARRAY_SIZE(audio_map),
   281		.fully_routed = true,
   282	};
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
