Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0EB3A71B6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427783; cv=none; b=TMASRNln1U8Vda1WBNNbWkyCjzQaDKmY4JDKqGHE3edAdsABBUYy9EPbuDBwkmQIldgXxuvY8YMwLMG9zk2UQ+TGMzTCudxJK/VjzQ4eDsI7SbQgarTg6zFXWRfMMq+cS3A0/3HRVHnXTUQqDnd095+jIw1qZ3Yf/nr8GIijQOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427783; c=relaxed/simple;
	bh=UkNOsmdgPEu9xoZVv7cIrQgO3tr2WbFk4pTcF5iPjKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AA7/aVpM5XcQ3Ewax/DiLQs3nVNyMQzvAom9FdvTnfO8Jk/CDxAC1MyUC7uOu4fMRAB3NyFJPedlNB8VmjccchtdS9CHnEw1bn8e3FRXm3jax0LKDs19ZIkKgy60ekn6GikIl5/RaOYrRQMFmUp4T8+fcUHe+hrsFtYlS7o2VtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqmHQr5f; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqmHQr5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780427781; x=1811963781;
  h=date:from:to:cc:subject:message-id;
  bh=UkNOsmdgPEu9xoZVv7cIrQgO3tr2WbFk4pTcF5iPjKk=;
  b=EqmHQr5fbxIIn08TJ8Epy4OatnSISWJNCGXhTvTzl2/2/IVoI1NyrLHc
   sZ6he0kJidq1fRsBDNgu5zKKDUt6Zob4sVQiOTpR471ZtiaTHbJOvmHZD
   WSxtPGozJTht8jZjMw0M4nYRuzA2ISU8N25degAv0kUBhcLRNSvkWqMDK
   OWyvPR4JHf99T9QECG/qPUxRUi0gKUk/kbOPfvT7X6vocH0BltoTwFjLW
   pccnxnPGgSVxctyzX71VWMv8r+/KFP8x0SgbYlYkF48XKFRhbnkfCRUxQ
   di4qY+IPzMQl4HZS0uy5tLJlEVWQWLGLwvw+7O/J53RrvLTUIY8vfwiBx
   A==;
X-CSE-ConnectionGUID: 2QyvY5AwQzSs8CrAPLVu5g==
X-CSE-MsgGUID: WeLI/z1qSlyqn90khiWiIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="84851274"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="84851274"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 12:16:21 -0700
X-CSE-ConnectionGUID: IfzJDyKNTw+fIVtpA8T5LA==
X-CSE-MsgGUID: gi0Kj4v3QRy1lsMy6i3OOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239829164"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 12:16:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUUb3-00000000CRC-1WDs;
	Tue, 02 Jun 2026 19:16:17 +0000
Date: Wed, 03 Jun 2026 03:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/soc-dapm.c:4945:21: error: dereferencing pointer to incomplete type
 'struct snd_soc_component'
Message-ID: <202606030337.y8mdSwpN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: a9f127425c2b0e25ca695cfacf153f06744e2f80 [290/290] ASoC: soc-component: capsuling Component
config: arm64-randconfig-002-20260601 (https://download.01.org/0day-ci/archive/20260603/202606030337.y8mdSwpN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030337.y8mdSwpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030337.y8mdSwpN-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_pin_has_prefix':
>> sound/soc/soc-dapm.c:4945:21: error: dereferencing pointer to incomplete type 'struct snd_soc_component'
      prefix = component->name_prefix;
                        ^~
--
   sound/soc/soc-dai.c: In function 'snd_soc_dai_name':
>> sound/soc/soc-dai.c:1153:20: error: dereferencing pointer to incomplete type 'struct snd_soc_component'
     if (dai->component->name)
                       ^~
--
   sound/soc/codecs/simple-amplifier.c: In function 'simple_amp_add_basic_dapm':
   sound/soc/codecs/simple-amplifier.c:461:17: error: redefinition of 'dev'
     struct device *dev = component->dev;
                    ^~~
   sound/soc/codecs/simple-amplifier.c:459:17: note: previous definition of 'dev' was here
     struct device *dev = snd_soc_component_to_dev(component);
                    ^~~
>> sound/soc/codecs/simple-amplifier.c:461:32: error: dereferencing pointer to incomplete type 'struct snd_soc_component'
     struct device *dev = component->dev;
                                   ^~
   sound/soc/codecs/simple-amplifier.c: In function 'simple_amp_add_power_supplies':
   sound/soc/codecs/simple-amplifier.c:511:17: error: redefinition of 'dev'
     struct device *dev = component->dev;
                    ^~~
   sound/soc/codecs/simple-amplifier.c:508:17: note: previous definition of 'dev' was here
     struct device *dev = snd_soc_component_to_dev(component);
                    ^~~


vim +4945 sound/soc/soc-dapm.c

1547aba993c990 Mark Brown  2010-05-07  4930  
8468c8aafe8b58 Chancel Liu 2026-05-07  4931  /**
8468c8aafe8b58 Chancel Liu 2026-05-07  4932   * snd_soc_dapm_pin_has_prefix - check if given pin has a known prefix
8468c8aafe8b58 Chancel Liu 2026-05-07  4933   * @card: card to be checked
8468c8aafe8b58 Chancel Liu 2026-05-07  4934   * @pin: pin name
8468c8aafe8b58 Chancel Liu 2026-05-07  4935   *
8468c8aafe8b58 Chancel Liu 2026-05-07  4936   * Returns true if given pin has a known prefix
8468c8aafe8b58 Chancel Liu 2026-05-07  4937   */
8468c8aafe8b58 Chancel Liu 2026-05-07  4938  bool snd_soc_dapm_pin_has_prefix(struct snd_soc_card *card, const char *pin)
8468c8aafe8b58 Chancel Liu 2026-05-07  4939  {
8468c8aafe8b58 Chancel Liu 2026-05-07  4940  	struct snd_soc_component *component;
8468c8aafe8b58 Chancel Liu 2026-05-07  4941  	const char *prefix;
8468c8aafe8b58 Chancel Liu 2026-05-07  4942  	size_t prefix_len;
8468c8aafe8b58 Chancel Liu 2026-05-07  4943  
8468c8aafe8b58 Chancel Liu 2026-05-07  4944  	for_each_card_components(card, component) {
8468c8aafe8b58 Chancel Liu 2026-05-07 @4945  		prefix = component->name_prefix;
8468c8aafe8b58 Chancel Liu 2026-05-07  4946  		if (!prefix)
8468c8aafe8b58 Chancel Liu 2026-05-07  4947  			continue;
8468c8aafe8b58 Chancel Liu 2026-05-07  4948  
8468c8aafe8b58 Chancel Liu 2026-05-07  4949  		prefix_len = strlen(prefix);
8468c8aafe8b58 Chancel Liu 2026-05-07  4950  		if (!strncmp(pin, prefix, prefix_len) && pin[prefix_len] == ' ')
8468c8aafe8b58 Chancel Liu 2026-05-07  4951  			return true;
8468c8aafe8b58 Chancel Liu 2026-05-07  4952  	}
8468c8aafe8b58 Chancel Liu 2026-05-07  4953  
8468c8aafe8b58 Chancel Liu 2026-05-07  4954  	return false;
8468c8aafe8b58 Chancel Liu 2026-05-07  4955  }
8468c8aafe8b58 Chancel Liu 2026-05-07  4956  EXPORT_SYMBOL_GPL(snd_soc_dapm_pin_has_prefix);
8468c8aafe8b58 Chancel Liu 2026-05-07  4957  

:::::: The code at line 4945 was first introduced by commit
:::::: 8468c8aafe8b5807e5acba2f8aa96d0b3ce0c248 ASoC: dapm: Fix widget lookup with prefixed names across DAPM contexts

:::::: TO: Chancel Liu <chancel.liu@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
