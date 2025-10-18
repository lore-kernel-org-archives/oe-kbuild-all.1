Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD31B423B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760799169; cv=none; b=Ps+uR7x7vzyjZol1/UKAppYxaxXfWQScVBO0lM7UwMGbDK0vseXy4SL1R7JXigq2C2EEGOSPOMq+4OmsYpQy6HTxopW/HlkPOgAuJce6Zln2Nt3IuWC3kiNRYb34Q2xYb9WrXAagSFH10p4wBKFKMpg7lqi7Y078dP/qculZisc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760799169; c=relaxed/simple;
	bh=GH6yt844+jXIfXMA5SG8a+s6Xwg5qdClbehUeU5rSus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIicYugI4xU/6oWS+cDRF9gW7YSkHC5KpLkOA0yBiCZisOXg2no1cTSGEhpU5SVaNxPUDJAKy4UUcp9/D6e4cE3TnAutowz1QKI1W0kl54ke2sndsFK8TnVeNgRzukOkQfK5iu9pBnoEnVGNaeu3pkpc3EihaeVpdOndl5iQKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhKoG3/6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhKoG3/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760799167; x=1792335167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GH6yt844+jXIfXMA5SG8a+s6Xwg5qdClbehUeU5rSus=;
  b=lhKoG3/6dlqQcsfXAK5QY6v7lNzpvXwtJrlT+ftesMMnHlTupfvFEzFB
   2rhYyql5uydrvxs/AftAsDbbb5MNe/xmRxoeR45QaJ/jdNslLoMVOSVze
   w134mDMn4Z5flZA2aEJI9PsDem9Y1NpszX0WxxpXRFLxBkM57m5pUzd+T
   ahQBNQzAUtOaegCN2hxF1ZbIYQlq9g0fZCd9tgXs++NXY6Z1MWTv6+g6n
   t4lVbLB/7t7ng9FlWt370K5IiViSw5TELKPWTBbH5aJoedRMONp4BvKus
   c3ik+1/z3IXE4pRsDBGPh/vNT+k/RlJ9GIdCUycMGUsYf80c55eS5JtiD
   g==;
X-CSE-ConnectionGUID: dXPFiR6jQa2zBd6Sjo7ncQ==
X-CSE-MsgGUID: dFfFerOFSUq6eDBpEXh5IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88461275"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="88461275"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 07:52:46 -0700
X-CSE-ConnectionGUID: KaEh6rMdSo+wXLsS3EtNfQ==
X-CSE-MsgGUID: ZXa+7TXyTQCgHr6FfSeKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183380908"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Oct 2025 07:52:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA8IN-0008L7-0u;
	Sat, 18 Oct 2025 14:52:36 +0000
Date: Sat, 18 Oct 2025 22:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Oder Chiou <oder_chiou@realtek.com>, broonie@kernel.org,
	lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	flove@realtek.com, shumingf@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH v5 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
Message-ID: <202510182222.lSFRBRdo-lkp@intel.com>
References: <20251015103404.3075684-1-oder_chiou@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015103404.3075684-1-oder_chiou@realtek.com>

Hi Oder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oder-Chiou/ASoC-dt-bindings-realtek-rt5575-add-bindings-for-ALC5575/20251017-203710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20251015103404.3075684-1-oder_chiou%40realtek.com
patch subject: [PATCH v5 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
config: riscv-randconfig-r131-20251018 (https://download.01.org/0day-ci/archive/20251018/202510182222.lSFRBRdo-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510182222.lSFRBRdo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510182222.lSFRBRdo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/rt5575.c:298:39: sparse: sparse: symbol 'rt5575_soc_component_dev' was not declared. Should it be static?

vim +/rt5575_soc_component_dev +298 sound/soc/codecs/rt5575.c

   297	
 > 298	const struct snd_soc_component_driver rt5575_soc_component_dev = {
   299		.probe = rt5575_probe,
   300		.controls = rt5575_snd_controls,
   301		.num_controls = ARRAY_SIZE(rt5575_snd_controls),
   302		.dapm_widgets = rt5575_dapm_widgets,
   303		.num_dapm_widgets = ARRAY_SIZE(rt5575_dapm_widgets),
   304		.dapm_routes = rt5575_dapm_routes,
   305		.num_dapm_routes = ARRAY_SIZE(rt5575_dapm_routes),
   306		.use_pmdown_time = 1,
   307		.endianness = 1,
   308	};
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
