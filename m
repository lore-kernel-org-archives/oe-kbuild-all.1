Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E906FCE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688493544; x=1720029544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aa7FCgXRD9reRD2WqNCg9gIDPp09VfpjAxtBXt92zn4=;
  b=Ey4yttUoAfti6YlFlmwUth3q8R+3vEcYO5EZaYw2pC8OWAp/OSEUscAm
   e1f90gPZB2UQDN8cE2M5l84u5A3M3Vt6cE2WwM5NXF05OpXSevfdHGQN8
   cL+mU30IfBeIY5ILCVekZAX71c8MVae8G+WU8CQ7wTDAp7Pkrmi50Hjzw
   /ck05TMoCnTuKFREw3pprheBMsQZoyuoyZg+o5/MItTf0dYKT/V0f2VmC
   nGCbr/2RAIGLRSGMw/RNhtX01dHEzFZRuqlh0dyAZ/SS/xZP1QKpKLcz4
   8wzs5v9NdEs27su2Z6qxnV3BIccZ/YzAFqwxGzFnx+d50X0XjPBFFeRqJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="393917042"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="393917042"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 10:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965564049"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="965564049"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 10:59:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGkIn-000IQ7-1d;
	Tue, 04 Jul 2023 17:59:01 +0000
Date: Wed, 5 Jul 2023 01:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 33/38]
 sound/soc/codecs/sigmadsp.c:676:50: error: 'struct sigmadsp_control' has no
 member named 'kctl'
Message-ID: <202307050119.aWILsASi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   6dd4ae925ae5b90ccfbcb11dce06fd505cc18bc8
commit: f6df559bc59a922fc6bd100cd018207323c3f9d1 [33/38] ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
config: nios2-randconfig-r026-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050119.aWILsASi-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050119.aWILsASi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050119.aWILsASi-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/sigmadsp.c: In function 'sigmadsp_activate_ctrl':
>> sound/soc/codecs/sigmadsp.c:676:50: error: 'struct sigmadsp_control' has no member named 'kctl'
     676 |         changed = snd_ctl_activate_id(card, &ctrl->kctl->id, active);
         |                                                  ^~


vim +676 sound/soc/codecs/sigmadsp.c

   667	
   668	static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
   669		struct sigmadsp_control *ctrl, unsigned int samplerate_mask)
   670	{
   671		struct snd_card *card = sigmadsp->component->card->snd_card;
   672		bool active;
   673		int changed;
   674	
   675		active = sigmadsp_samplerate_valid(ctrl->samplerates, samplerate_mask);
 > 676		changed = snd_ctl_activate_id(card, &ctrl->kctl->id, active);
   677		if (active && changed > 0) {
   678			mutex_lock(&sigmadsp->lock);
   679			if (ctrl->cached)
   680				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
   681			mutex_unlock(&sigmadsp->lock);
   682		}
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
