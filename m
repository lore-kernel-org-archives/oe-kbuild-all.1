Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE51A8F84
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743884639; cv=none; b=G8Dr9jFQa3WrH0SvtdZJHB1oHWW+F4WYGfKx+WqLI8eq46JwLBwmK8f2+n0gHgq4J4qWswT+DyCAxVujLyoGq+eTf6OONkU4WiG6Uk1Ekwg83LP6/JG5QXrSioFTICw9x+IfrrsYK2HWlNGd1a2wkOgzCAk3bPSgB3fh0BJPwxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743884639; c=relaxed/simple;
	bh=fh4fhO7DysILE4HFhiyQJnBUyimnb1egD9ssIF0CkWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paPNVVmzWPhzaRUeS1HHjbYYdzCQD2W9d+iYqdsSXcSb+Dxuz+80F7lfNkdQCzd/zsMnaruSTFEYXblU9qb6b/zo4Rq5jP5sqsSC27pgJlF0CUQ58JqsEYgXyMzdS1TKXhhkMoBUkVI+0Vtdt4P6oxZf6MtwCjR5KF1ug7VGm/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=je58f/Ej; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="je58f/Ej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743884637; x=1775420637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fh4fhO7DysILE4HFhiyQJnBUyimnb1egD9ssIF0CkWI=;
  b=je58f/EjC8m0sO54V+G7bRXYe5W89zca1/mtvswS9v4tsERRKL0+dqec
   9qtdolFqtJzasnoMWY0oz4EJBDez/feTKkdXR3Qo+Tl/w3172miTBvmWs
   qbvu6e6dM8VMneI9pZOqV8L4hec7eJ2fa9OXxrg65j1nEWiMORRTvZHyT
   EF39WrJlKk6r7DHb1OIOrgnWga0NAcufX5UPs2b1RbiIBt9DiQ6hrIZ6n
   pyGCffA6B+1HJ9NSuTB0AyLrOU6nDFdXDEtXBtMiEdYGog9FoQy/XsqUK
   ghc35Chb9yVLWBBTVjVRt6fZXw1KSd+Rs/202UtR08piikO5eSP8MMcJ8
   g==;
X-CSE-ConnectionGUID: w9Ve3Y+lRDyPhshwgPMRpA==
X-CSE-MsgGUID: pj1pPKWsRhycRQnkHDbdzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="56669987"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="56669987"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 13:23:57 -0700
X-CSE-ConnectionGUID: 7P33FXzyTu+eI8hwTJJimQ==
X-CSE-MsgGUID: MIAg6A41SISX6Sr1BR6H4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="128502188"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Apr 2025 13:23:56 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1A3V-0002Fb-0r;
	Sat, 05 Apr 2025 20:23:53 +0000
Date: Sun, 6 Apr 2025 04:23:43 +0800
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 06/10] ASoC: tas2764: Crop SDOUT zero-out mask based
 on BCLK ratio
Message-ID: <202504060453.uisGt8Me-lkp@intel.com>
References: <20250405-apple-codec-changes-v4-6-d007e46ce4a2@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405-apple-codec-changes-v4-6-d007e46ce4a2@gmail.com>

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Calligeros/ASoC-tas2770-Power-cycle-amp-on-ISENSE-VSENSE-change/20250405-081800
base:   3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
patch link:    https://lore.kernel.org/r/20250405-apple-codec-changes-v4-6-d007e46ce4a2%40gmail.com
patch subject: [PATCH v4 06/10] ASoC: tas2764: Crop SDOUT zero-out mask based on BCLK ratio
config: arc-randconfig-001-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060453.uisGt8Me-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060453.uisGt8Me-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060453.uisGt8Me-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/tas2764.c: In function 'tas2764_write_sdout_zero_mask':
>> sound/soc/codecs/tas2764.c:377:21: error: 'struct tas2764_priv' has no member named 'sdout_zero_mask'
     377 |         if (!tas2764->sdout_zero_mask)
         |                     ^~
   sound/soc/codecs/tas2764.c:380:31: error: 'struct tas2764_priv' has no member named 'sdout_zero_mask'
     380 |         cropped_mask = tas2764->sdout_zero_mask & GENMASK(nsense_slots - 1, 0);
         |                               ^~
>> sound/soc/codecs/tas2764.c:383:58: error: 'TAS2764_SDOUT_HIZ_1' undeclared (first use in this function)
     383 |                 ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
         |                                                          ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2764.c:383:58: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/codecs/tas2764.c:390:56: error: 'TAS2764_SDOUT_HIZ_9' undeclared (first use in this function)
     390 |         ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
         |                                                        ^~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2764.c:391:45: error: 'TAS2764_SDOUT_HIZ_9_FORCE_0_EN' undeclared (first use in this function)
     391 |                                             TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +377 sound/soc/codecs/tas2764.c

   369	
   370	static int tas2764_write_sdout_zero_mask(struct tas2764_priv *tas2764, int bclk_ratio)
   371	{
   372		struct snd_soc_component *component = tas2764->component;
   373		int nsense_slots = bclk_ratio / 8;
   374		u32 cropped_mask;
   375		int i, ret;
   376	
 > 377		if (!tas2764->sdout_zero_mask)
   378			return 0;
   379	
   380		cropped_mask = tas2764->sdout_zero_mask & GENMASK(nsense_slots - 1, 0);
   381	
   382		for (i = 0; i < 4; i++) {
 > 383			ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
   384						      (cropped_mask >> (i * 8)) & 0xff);
   385	
   386			if (ret < 0)
   387				return ret;
   388		}
   389	
 > 390		ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
 > 391						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
   392						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
   393	
   394		if (ret < 0)
   395			return ret;
   396	
   397		return 0;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
