Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC81443AAB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 12:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251424; cv=none; b=sai7V9AhQUEfnLcDDRAgjzl5fj/IlwJZ0+O13HdwXqAnYaEP53U/llytoqtZkVyQrELDovVuY/if8+d78aZrkDuP05PL77zztudFxbvDBVd1dqi1S0pzhymqoaAqpZmptRulFo3iDGjggUbxmXSNSzdwG+UaORm0kkHz2X0dO5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251424; c=relaxed/simple;
	bh=loVroCGiliwjWvsIGLJJmqsARfvDTQiUVfHyYsNG3OU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LQhQRtIHcxjpJrNU1hwYxJ3xnLy92N8dInDVdWzhfoj00OBGZo+ft5Nf1595F+1zOb9/wk/CVKW04hyWBXFjlKBR0kcnxi1qkLfd4HP8UyLAp8KAm7BG09HnSRgbYL9hlZFcHuI9O1rTBNuxi/ax8fwCjquzZreUEOq0pf08wys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELBGm3Ql; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELBGm3Ql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790251422; x=1821787422;
  h=date:from:to:cc:subject:message-id;
  bh=loVroCGiliwjWvsIGLJJmqsARfvDTQiUVfHyYsNG3OU=;
  b=ELBGm3Ql5Hbac8H+Ram0KNVN52wJtVKpfh69LOi3TlB4mNGcsaenSxmY
   KzPNaLlZAPSNO9kYBUCkQJWa8fOTObNM4/GyLn0dzn9cjY7vumx5YSCT+
   ibglgwDAT2rJhJYYKDAwcU+3Jey2D3jXsQ0pSQnZdtB9dJZu+r4bbJNkG
   jsus+ccx+Ut+LEGYn06EZjrE6KWDDL3SRWsF+2e0v/h8XR9Bi9kKcZYwM
   E6KGSs/C6Xg3iq0gQu3SUv6CueRvD3a4DgnKu4TdeKnOxNattCY+PdZ0F
   nlh205UEFdXUWcYJtv1BREaWOlxSoboWj6okopdqGP8okOf0tUf/b1toP
   g==;
X-CSE-ConnectionGUID: jpfncfSNRhGpsCtxrYuyNw==
X-CSE-MsgGUID: UyEby32aQyOQ/so3sei+gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91123501"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91123501"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 05:03:39 -0700
X-CSE-ConnectionGUID: TvIy7/QaT6uja4+16gKAvA==
X-CSE-MsgGUID: SIQrdFxeQoebxjd3by8CmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="270492885"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Sep 2026 05:03:38 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9iAp-00000000InY-2Tes;
	Thu, 24 Sep 2026 12:03:35 +0000
Date: Thu, 24 Sep 2026 20:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6936/8910]
 sound/soc/mediatek/an7581/an7581-afe-pcm.c:144:30: sparse: sparse: symbol
 'an7581_afe_fe_ops' was not declared. Should it be static?
Message-ID: <202609242059.t4FlJzOz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 4974ffa0d6c28dfaba838a29503c3af02080a8a1 [6936/8910] ASoC: airoha: Add AFE driver for Airoha AN7581
config: parisc-randconfig-r1307-20260924 (https://download.01.org/0day-ci/archive/20260924/202609242059.t4FlJzOz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609242059.t4FlJzOz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609242059.t4FlJzOz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:144:30: sparse: sparse: symbol 'an7581_afe_fe_ops' was not declared. Should it be static?
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     expected void *base
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     got void [noderef] __iomem *
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *regs @@     got void *base @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse:     expected void [noderef] __iomem *regs
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse:     got void *base

vim +/an7581_afe_fe_ops +144 sound/soc/mediatek/an7581/an7581-afe-pcm.c

   143	
 > 144	const struct snd_soc_dai_ops an7581_afe_fe_ops = {
   145		.startup	= an7581_afe_fe_startup,
   146		.shutdown	= mtk_afe_fe_shutdown,
   147		.hw_params	= mtk_afe_fe_hw_params,
   148		.hw_free	= mtk_afe_fe_hw_free,
   149		.prepare	= mtk_afe_fe_prepare,
   150		.trigger	= mtk_afe_fe_trigger,
   151	};
   152	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
