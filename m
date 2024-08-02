Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AE2208D7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722572907; cv=none; b=rMdg0DvmtK/GtFUNehlRuJ/v6sgvO6TSaOBIUbJtpwtr4///X4rqr8LzYyIEz64hiEwfGHZUfz56tOm5Yj2R4vOtrOB6mlYnWdVdI8kpH9Dc1Vce5QrZwfwzLmyhzBaipalT8dZAX9hpQoSVnz+ZTp7HbQhnYDMdRkC1UZSjDJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722572907; c=relaxed/simple;
	bh=IQjSb5zeIG6n+Agmm1ULOoe5aUySv8ygTlrcdrZD5zY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xug5oxaiHmu/5Bi9Q9MV6tTOz17hqF5fBHMNioog/0+GoXkwg3dFUfYXILpQmrAYLw1ixueY5v5XP+WjCUsyZAX3+AXVRPdrdkl4kzap/haLCwloSdvPLPUEMUSlLcg9QOfEcrRCLfFrCVs78Mfr/+yCkRMnT7oMUouW3e13G9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWZes3vi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWZes3vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722572905; x=1754108905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQjSb5zeIG6n+Agmm1ULOoe5aUySv8ygTlrcdrZD5zY=;
  b=NWZes3vivqCweRKAxBtbPYy9ZotrHDGTeYDT+89zVvCoyDu0oYVlKvSS
   xGw1i1mhmSlgDAnmMGSY9W4IuTty196E85b7FRZXWoX7qYFx36OxjqyOT
   nDse9c0yMlHyxvi6ul+dPzxcuInhIFGmi8CbjZPSem/uKhKlZ3yDfx4P6
   luRMEK/0vo7umykXDR6WkydSnfVxI3PAtYbKuTlkdRfbdtTBrE/MdXs+a
   XBnWSZjctWgRJOFGHfpBZJM2lJ7s5joOV1EeWhuFFBhqA7CjbkuiGvWWJ
   idzy2iIe8tOVA4qZSD8aEbwYdGljGZDrRctyX2iq+hM4kFigCk6TejU0N
   Q==;
X-CSE-ConnectionGUID: AC0agaM/SA6m2bnwQu2CMw==
X-CSE-MsgGUID: d+sspu+yQnuQocCZCNc+LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31950954"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="31950954"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 21:28:25 -0700
X-CSE-ConnectionGUID: jyg9yhrjSnKnAF4UTMQtLw==
X-CSE-MsgGUID: 3iTY1VyjQGWw7r6Q4a0HAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="55873207"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Aug 2024 21:28:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZjts-000wP2-2M;
	Fri, 02 Aug 2024 04:28:20 +0000
Date: Fri, 2 Aug 2024 12:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileek6JoY 10/11] sound/soc/codecs/cs35l45.c:180:18:
 error: assignment to 'struct snd_kcontrol *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202408021221.6BR46U9T-lkp@intel.com>
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
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240802/202408021221.6BR46U9T-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408021221.6BR46U9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408021221.6BR46U9T-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs35l45.c: In function 'cs35l45_activate_ctl':
   sound/soc/codecs/cs35l45.c:180:20: error: implicit declaration of function 'snd_soc_component_get_kcontrol_locked'; did you mean 'snd_soc_component_get_kcontrol'? [-Wimplicit-function-declaration]
     180 |         kcontrol = snd_soc_component_get_kcontrol_locked(component->card, ctl_name);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    snd_soc_component_get_kcontrol
>> sound/soc/codecs/cs35l45.c:180:18: error: assignment to 'struct snd_kcontrol *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     180 |         kcontrol = snd_soc_component_get_kcontrol_locked(component->card, ctl_name);
         |                  ^


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
