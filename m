Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E39D306
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 18:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQEubgw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698604977; x=1730140977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dYnJq3KdvvNiR0cPErKSeNcE33bxX8RtXBfQkjBDFNY=;
  b=DQEubgw89OQblw5cjuLkN2v5ddelVj52SfOxEtQd1O030aQDhz4ea8AJ
   72o84MExqSQIyogr+1j/WjS5pI5RbjMoy7aQi8TtY+Bj8E0AOjNDcJJ/Y
   TbJd+JAAkra5a0C4D4cHvfOocyFJAfkwQ5aTm9LrhIdbPGjitdWJhl4pl
   sd0RpY9Hq044BJYbhhhFDYj6Gp7vNrmH4HoZzxD8JiIhs3+FANFpPPWe6
   UZTkpfaAXn01ydFUI+5RVMJeY+mOBot4uPSqoLkj1G/l0y7LdbjCxND02
   4ip8xgWIL8Thmwp11draFcA7uppk4oVFm6YL15PELqBma8O528xLfCK1/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="9514064"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="9514064"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 11:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="789269724"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="789269724"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Oct 2023 11:42:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxAkN-000Ckp-2P;
	Sun, 29 Oct 2023 18:42:51 +0000
Date: Mon, 30 Oct 2023 02:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 93/97] sound/soc/codecs/tas2770.c:173:13:
 warning: variable 'ret' set but not used
Message-ID: <202310300252.JU4ITw4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   916959fca89df80ef4bbf35d2066e2e9e0ca58d3
commit: 896a4bdf824745d377d21d26c215864ed56d2c31 [93/97] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231030/202310300252.JU4ITw4T-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310300252.JU4ITw4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300252.JU4ITw4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/tas2770.c: In function 'sense_event':
>> sound/soc/codecs/tas2770.c:173:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     173 |         int ret = 0;
         |             ^~~


vim +/ret +173 sound/soc/codecs/tas2770.c

   162	
   163	static const struct snd_kcontrol_new isense_switch =
   164		SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 3, 1, 1);
   165	static const struct snd_kcontrol_new vsense_switch =
   166		SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 2, 1, 1);
   167	
   168	static int sense_event(struct snd_soc_dapm_widget *w,
   169	                          struct snd_kcontrol *kcontrol, int event)
   170	{
   171		struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
   172		struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
 > 173		int ret = 0;
   174	
   175		/*
   176		 * Powering up ISENSE/VSENSE requires a trip through the shutdown state.
   177		 * Do that here to ensure that our changes are applied properly, otherwise
   178		 * we might end up with non-functional IVSENSE if playback started earlier,
   179		 * which would break software speaker protection.
   180		 */
   181	
   182		switch (event) {
   183		case SND_SOC_DAPM_PRE_REG:
   184			ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
   185							    TAS2770_PWR_CTRL_MASK,
   186							    TAS2770_PWR_CTRL_SHUTDOWN);
   187			break;
   188		case SND_SOC_DAPM_POST_REG:
   189			ret = tas2770_update_pwr_ctrl(tas2770);
   190			break;
   191		}
   192	
   193		return 0;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
