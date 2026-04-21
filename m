Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA4238D52
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776805246; cv=none; b=npEDug5QmO85/kAFvX20w69iCqjzuo8RNQE27bmYrtx6pnRnf/tTW/qC6RUaxmgA+U0xydxtPGoDC79F7M51GmvqhJ7FgM7sW4vwJfwh2535F1H9VTZFlGtIFbah8n4NIjfs/zuM7n2GhluIBclMKrefE2XomEuyOVcIYWjmYBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776805246; c=relaxed/simple;
	bh=uaisVzpC+c07veB176hqKg15qQaRVa1+lP53Fo3GDac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D3vc5NARm736EFYNkpbaEGFveqO64sEVeI9nuq8BHja8Ttn1spVHe8Sj1BZWTOz4o1kfjpN5MIedgDWeDYSHR5p4Lt5X1Jk3Ff7vAb0mzbXkyjBRcNMuZ8ZlF5tXQvZQ50bKzmFORScGyqyJsmH7lOXgDjQ0W8nGKZD2a0d8qpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrHi/LN+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrHi/LN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776805244; x=1808341244;
  h=date:from:to:cc:subject:message-id;
  bh=uaisVzpC+c07veB176hqKg15qQaRVa1+lP53Fo3GDac=;
  b=UrHi/LN+qcsVzGI/Z3cqggrybR0qccSiMt5hcxzv8XXGsPLEu3MqyAkB
   hrg1w2fjSh6qqS4Eip63vOEVvOOOn7WOigVJNp8jE/C2dampMWyYjeRG7
   CQm5dMWwRfmRHOwnkU5ZuUwSdNdHkRdGHSD8Vi04tEnHxuTj8Ex6ZbKQI
   dACH3dRm3QC0JHuLZRQ+3F9wYQyq/D58nRpnRMNlMacdUhz1/5a3BPcKW
   MovQfxZ3QGJNzZ11+Kjb0doVmiJPlhTq8ksV/sXisAJWo7pNZ5Q0wiW2B
   XnSF/rbl9k4fM4kUY2iFHR6cyEn8QZxK+X5wk0TVgZrNPZBld/Q/TlKR2
   A==;
X-CSE-ConnectionGUID: TPadhsrYQnyhIEfma0XOAA==
X-CSE-MsgGUID: M44BY6E0TPWpfgYywtaVVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81617286"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="81617286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 14:00:44 -0700
X-CSE-ConnectionGUID: /n0/R9LvSWCZsyb6zzkUpA==
X-CSE-MsgGUID: UvoUaiYySbKnD0Ud2IsquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="225633682"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Apr 2026 14:00:43 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFID2-000000003ya-2mTG;
	Tue, 21 Apr 2026 21:00:40 +0000
Date: Wed, 22 Apr 2026 04:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20-2 147/147]
 sound/soc/codecs/88pm860x-codec.c:1229:66: error: invalid use of undefined
 type 'struct snd_soc_component'
Message-ID: <202604220425.YwQuoPzA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20-2
head:   1604ab9b37c0f7145cc187f24e3aca5b4e318eb1
commit: 1604ab9b37c0f7145cc187f24e3aca5b4e318eb1 [147/147] move soc-component
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260422/202604220425.YwQuoPzA-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220425.YwQuoPzA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220425.YwQuoPzA-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/88pm860x-codec.c: In function 'pm860x_component_handler':
>> sound/soc/codecs/88pm860x-codec.c:1229:66: error: invalid use of undefined type 'struct snd_soc_component'
    1229 |                 trace_snd_soc_jack_irq(dev_name(pm860x->component->dev));
         |                                                                  ^~


vim +1229 sound/soc/codecs/88pm860x-codec.c

f213f4b51777408 Haojian Zhuang    2010-08-19  1213  
5783994b9afa8d3 Kuninori Morimoto 2018-01-29  1214  static irqreturn_t pm860x_component_handler(int irq, void *data)
f213f4b51777408 Haojian Zhuang    2010-08-19  1215  {
f213f4b51777408 Haojian Zhuang    2010-08-19  1216  	struct pm860x_priv *pm860x = data;
abc495582a3f01d Kuninori Morimoto 2026-04-09  1217  	struct device *dev = snd_soc_component_to_dev(pm860x->component);
f213f4b51777408 Haojian Zhuang    2010-08-19  1218  	int status, shrt, report = 0, mic_report = 0;
f213f4b51777408 Haojian Zhuang    2010-08-19  1219  	int mask;
f213f4b51777408 Haojian Zhuang    2010-08-19  1220  
f213f4b51777408 Haojian Zhuang    2010-08-19  1221  	status = pm860x_reg_read(pm860x->i2c, REG_STATUS_1);
f213f4b51777408 Haojian Zhuang    2010-08-19  1222  	shrt = pm860x_reg_read(pm860x->i2c, REG_SHORTS);
f213f4b51777408 Haojian Zhuang    2010-08-19  1223  	mask = pm860x->det.hs_shrt | pm860x->det.hook_det | pm860x->det.lo_shrt
f213f4b51777408 Haojian Zhuang    2010-08-19  1224  		| pm860x->det.hp_det;
f213f4b51777408 Haojian Zhuang    2010-08-19  1225  
7116f452c8e3e38 Mark Brown        2010-12-29  1226  #ifndef CONFIG_SND_SOC_88PM860X_MODULE
1c9e9795b5e2348 Mark Brown        2010-12-05  1227  	if (status & (HEADSET_STATUS | MIC_STATUS | SHORT_HS1 | SHORT_HS2 |
1c9e9795b5e2348 Mark Brown        2010-12-05  1228  		      SHORT_LO1 | SHORT_LO2))
5783994b9afa8d3 Kuninori Morimoto 2018-01-29 @1229  		trace_snd_soc_jack_irq(dev_name(pm860x->component->dev));
1435b9402fe0fb2 Mark Brown        2010-12-23  1230  #endif
1c9e9795b5e2348 Mark Brown        2010-12-05  1231  
f213f4b51777408 Haojian Zhuang    2010-08-19  1232  	if ((pm860x->det.hp_det & SND_JACK_HEADPHONE)
f213f4b51777408 Haojian Zhuang    2010-08-19  1233  		&& (status & HEADSET_STATUS))
f213f4b51777408 Haojian Zhuang    2010-08-19  1234  		report |= SND_JACK_HEADPHONE;
f213f4b51777408 Haojian Zhuang    2010-08-19  1235  
f213f4b51777408 Haojian Zhuang    2010-08-19  1236  	if ((pm860x->det.mic_det & SND_JACK_MICROPHONE)
f213f4b51777408 Haojian Zhuang    2010-08-19  1237  		&& (status & MIC_STATUS))
f213f4b51777408 Haojian Zhuang    2010-08-19  1238  		mic_report |= SND_JACK_MICROPHONE;
f213f4b51777408 Haojian Zhuang    2010-08-19  1239  
f213f4b51777408 Haojian Zhuang    2010-08-19  1240  	if (pm860x->det.hs_shrt && (shrt & (SHORT_HS1 | SHORT_HS2)))
f213f4b51777408 Haojian Zhuang    2010-08-19  1241  		report |= pm860x->det.hs_shrt;
f213f4b51777408 Haojian Zhuang    2010-08-19  1242  
f213f4b51777408 Haojian Zhuang    2010-08-19  1243  	if (pm860x->det.hook_det && (status & HOOK_STATUS))
f213f4b51777408 Haojian Zhuang    2010-08-19  1244  		report |= pm860x->det.hook_det;
f213f4b51777408 Haojian Zhuang    2010-08-19  1245  
f213f4b51777408 Haojian Zhuang    2010-08-19  1246  	if (pm860x->det.lo_shrt && (shrt & (SHORT_LO1 | SHORT_LO2)))
f213f4b51777408 Haojian Zhuang    2010-08-19  1247  		report |= pm860x->det.lo_shrt;
f213f4b51777408 Haojian Zhuang    2010-08-19  1248  
f213f4b51777408 Haojian Zhuang    2010-08-19  1249  	if (report)
f213f4b51777408 Haojian Zhuang    2010-08-19  1250  		snd_soc_jack_report(pm860x->det.hp_jack, report, mask);
f213f4b51777408 Haojian Zhuang    2010-08-19  1251  	if (mic_report)
f213f4b51777408 Haojian Zhuang    2010-08-19  1252  		snd_soc_jack_report(pm860x->det.mic_jack, SND_JACK_MICROPHONE,
f213f4b51777408 Haojian Zhuang    2010-08-19  1253  				    SND_JACK_MICROPHONE);
f213f4b51777408 Haojian Zhuang    2010-08-19  1254  
abc495582a3f01d Kuninori Morimoto 2026-04-09  1255  	dev_dbg(dev, "headphone report:0x%x, mask:%x\n", report, mask);
abc495582a3f01d Kuninori Morimoto 2026-04-09  1256  	dev_dbg(dev, "microphone report:0x%x\n", mic_report);
f213f4b51777408 Haojian Zhuang    2010-08-19  1257  	return IRQ_HANDLED;
f213f4b51777408 Haojian Zhuang    2010-08-19  1258  }
f213f4b51777408 Haojian Zhuang    2010-08-19  1259  

:::::: The code at line 1229 was first introduced by commit
:::::: 5783994b9afa8d37e9766b3cfbb594c1ae26087c ASoC: 88pm860x: replace codec to component

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
