Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80006BA47
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 03:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722570369; cv=none; b=cvDP1WPD0ytygh5fzOsDh1PtZZKrFmWwc/6p85o9PZJn9c5shZuJBBjp0+n3oiOaMPO/cS5TvnoRcWdtLrfJIuz3imfCss1HXI3iamWY5QxKL7qnyG6XWR32XFmYFMLzGKAoiEOHr+JqNhHkZQSQ/9a6yqi/za1xTsLuLqINVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722570369; c=relaxed/simple;
	bh=yHxHg8V4uvNrifvHCRfpIi8QoS/2hncSMbEwN/1M/D8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fkvFNDp60SEmEJ5SqG3/WrKE0+/4ayt/EeJuwU+GrLfqRP179UsIc8D+yufoxEFcO0cBtpUOMTi6WJ+Km9trd5N2/3usLDm7CsH02WY3LSUROFaRAAvWMLRT5UuT9WHCOsBpJsV7tBi+GDd1A+9ahAJFIDMM2M8tBotbr8alzwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=df94G4DH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df94G4DH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722570364; x=1754106364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yHxHg8V4uvNrifvHCRfpIi8QoS/2hncSMbEwN/1M/D8=;
  b=df94G4DHYOXu2rncQVxG+lYqUfxjZQgtbGxWgasKDDfUEZmKEtB0zrDy
   KdT+/99ijnuEiitFHuhRtZDMsokVscYxGULZ1d+6UJVleUrBVzwXvC2xr
   +/6XRbUkG+jeRQh5/I74SPms+KyljWcxktq4FIawb9VfT7IAdS6BgYTCF
   LFguszuQCJt5YsTH6NAY3mz96+J4xHTxExyVDWTtxGvmJZO4agZxYMxNh
   glZm0N/thxN5SV63UB8wFXmw0s1kUrHjdJg+sL3DHShRHIV8CG1ThQtrh
   Kt98FmlVvXAPwvVBABd4i5y89vg93OG6yg56t5qeZG3Onj+XK8NSV1S2t
   A==;
X-CSE-ConnectionGUID: zZ+X+bsNRb676YKGgi9ftQ==
X-CSE-MsgGUID: 9xF6hiqcQV6YMrOzgBUvLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20153372"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="20153372"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 20:46:04 -0700
X-CSE-ConnectionGUID: /t0NwGp7TZOc/xCUMtOfAA==
X-CSE-MsgGUID: Teu/lLqDS8CwtjPprnmoSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="54930563"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Aug 2024 20:46:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZjEu-000wJA-1p;
	Fri, 02 Aug 2024 03:46:00 +0000
Date: Fri, 2 Aug 2024 11:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileek6JoY 10/11] sound/soc/codecs/cs35l45.c:180:20:
 error: implicit declaration of function
 'snd_soc_component_get_kcontrol_locked'; did you mean
 'snd_soc_component_get_kcontrol'?
Message-ID: <202408021131.1aBGm0AI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileek6JoY
head:   9eb2bbfc62e372988a4c5cd1cb551231a65ec818
commit: e174e5ea5df61289c1f6f94dfc00b8c9f95630d6 [10/11] ASoC: cs35l45: Use new snd_soc_component_get_kcontrol() helper
config: x86_64-randconfig-002-20240802 (https://download.01.org/0day-ci/archive/20240802/202408021131.1aBGm0AI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408021131.1aBGm0AI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408021131.1aBGm0AI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/codecs/cs35l45.c: In function 'cs35l45_activate_ctl':
>> sound/soc/codecs/cs35l45.c:180:20: error: implicit declaration of function 'snd_soc_component_get_kcontrol_locked'; did you mean 'snd_soc_component_get_kcontrol'? [-Werror=implicit-function-declaration]
     180 |         kcontrol = snd_soc_component_get_kcontrol_locked(component->card, ctl_name);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    snd_soc_component_get_kcontrol
>> sound/soc/codecs/cs35l45.c:180:18: warning: assignment to 'struct snd_kcontrol *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     180 |         kcontrol = snd_soc_component_get_kcontrol_locked(component->card, ctl_name);
         |                  ^
   cc1: some warnings being treated as errors


vim +180 sound/soc/codecs/cs35l45.c

   171	
   172	static int cs35l45_activate_ctl(struct snd_soc_component *component,
   173					const char *ctl_name, bool active)
   174	{
   175		struct snd_card *card = component->card->snd_card;
   176		struct snd_kcontrol *kcontrol;
   177		struct snd_kcontrol_volatile *vd;
   178		unsigned int index_offset;
   179	
 > 180		kcontrol = snd_soc_component_get_kcontrol_locked(component->card, ctl_name);
   181		if (!kcontrol) {
   182			dev_err(component->dev, "Can't find kcontrol %s\n", ctl_name);
   183			return -EINVAL;
   184		}
   185	
   186		index_offset = snd_ctl_get_ioff(kcontrol, &kcontrol->id);
   187		vd = &kcontrol->vd[index_offset];
   188		if (active)
   189			vd->access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
   190		else
   191			vd->access &= ~SNDRV_CTL_ELEM_ACCESS_WRITE;
   192	
   193		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO, &kcontrol->id);
   194	
   195		return 0;
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
