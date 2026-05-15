Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD65E35E1BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 19:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778874626; cv=none; b=LWcyeK8HKJ1vFxdaBthp9Trp41cVD/aYIsHWpPa/bBTyN7tR7iYbRpg83L4Om7lXPgSb0qz1oN+agipwj4hOERGU/zlioShwdLVTaWgEaLn+yeqBqhR1NElQNtC8JXuLW4fyP4aNwTABurCxgGNdGquCYZc87+nvcDuT90jYegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778874626; c=relaxed/simple;
	bh=k15qqqgCP9nWa36ZDnfAEeB9gW0FiZxgQpiUzUfjm8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIoREFdHV+F6VnICwkiTUYatmEnSLOKKiMcf+tv9bACVhk7Pf4uRbIPk/iVxHKzBn5mRDRUnH+aximH6dMx/zfeoa5sWxzp8p7oLQ8vDxZxGlq6slfVVIBDBFM0ISPOXE/S9HmwrHfOwt9ziiDNfY+kbAJjOA1/NnMrttB6rAlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ih3a2ACk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ih3a2ACk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778874623; x=1810410623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k15qqqgCP9nWa36ZDnfAEeB9gW0FiZxgQpiUzUfjm8w=;
  b=Ih3a2ACkEbzkR75o+yxGB/22q2hfmgKNYt6ChvTrJTSQr0uamRO53Jg8
   X6I9TtkwFoSbNcflrX1LuAl12rO3fGQfP3bLm9YjEePF1a1Utt60stj8r
   Q1DgLUzLIttOecMhjD8V6N8t/l42A8tIIGdHp907CzHVHjgXgKdWKmuBJ
   rk7uXGXpMRVXHoL7yLaWRoB74mcJuREOtPfae+DKvE8OpmT+Kr6xPFxK1
   NB7fl6qE1MTfLdb9RzstMgZLZ9OtGBQypNqXxQDNZV4CYpGqmmB3AnXjM
   VuiY4LWM/TVJN2Ne61cNRrWrzUBDAY09ZQqCDjUoYMBbHZORvQWE4i80z
   w==;
X-CSE-ConnectionGUID: eq3UO1CBRSqN58K/6Pj0rA==
X-CSE-MsgGUID: fatCumVHQwCHiNkLHwa16Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79800906"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79800906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 12:50:22 -0700
X-CSE-ConnectionGUID: CfccELJcRdeEPUtj/tnFVQ==
X-CSE-MsgGUID: qNQWcAw2QoiEi+M2ptL57g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2026 12:50:20 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNyXs-000000002dR-15c8;
	Fri, 15 May 2026 19:50:08 +0000
Date: Sat, 16 May 2026 03:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
	shumingf@realtek.com, derek.fang@realtek.com,
	Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: Add a control to support CAE firmware
 update
Message-ID: <202605160321.U3aaymLP-lkp@intel.com>
References: <20260515091643.3038701-1-jack.yu@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515091643.3038701-1-jack.yu@realtek.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jack-yu-realtek-com/ASoC-rt722-sdca-Add-a-control-to-support-CAE-firmware-update/20260515-191729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260515091643.3038701-1-jack.yu%40realtek.com
patch subject: [PATCH] ASoC: rt722-sdca: Add a control to support CAE firmware update
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605160321.U3aaymLP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160321.U3aaymLP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160321.U3aaymLP-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/rt722-sdca.c: In function 'rt722_cae_update_put':
>> sound/soc/codecs/rt722-sdca.c:571:21: error: implicit declaration of function 'snd_soc_component_get_bias_level'; did you mean 'snd_soc_component_set_bias_level'? [-Wimplicit-function-declaration]
     571 |                 if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     snd_soc_component_set_bias_level


vim +571 sound/soc/codecs/rt722-sdca.c

   555	
   556	static int rt722_cae_update_put(struct snd_kcontrol *kcontrol,
   557					 struct snd_ctl_elem_value *ucontrol)
   558	{
   559		struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
   560		struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
   561		int ret, changed = 0;
   562	
   563		if (!rt722->hw_init)
   564			return 0;
   565	
   566		ret = pm_runtime_resume_and_get(component->dev);
   567		if (ret < 0 && ret != -EACCES)
   568			return ret;
   569	
   570		if (ucontrol->value.integer.value[0]) {
 > 571			if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
   572				ret = rt722_cae_load(rt722);
   573				if (ret)
   574					dev_err(component->dev, "CAE load failed: %d\n", ret);
   575				else
   576					changed = 1;
   577			}
   578		} else {
   579			if (rt722->cae_update_done) {
   580				rt722->cae_update_done = 0;
   581				changed = 1;
   582			}
   583		}
   584	
   585		pm_runtime_mark_last_busy(component->dev);
   586		pm_runtime_put_autosuspend(component->dev);
   587	
   588		return changed;
   589	}
   590	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
