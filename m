Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB46466B57
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627105; cv=none; b=hDxmF9hZZgW1HeL7ub2GstgO6z2jY+gXZGPT4JyR5BdLKjWg4p+LrgQug9rvHjxL0U0wJle6ii2GnXNvn8aMBp8LeduSL8L51lvxCtl+YBrDOAibs8vYnlB5T9MF7IQud6C3MJUjTPbwj5qp38QwZV5WW0+TPHqJ+YOL0b9Wpyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627105; c=relaxed/simple;
	bh=P5JCBizWE6Yu6MpBecuUqi1EuH5dElxwDOVCZWs/P8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U5QIQS6/SBy/dsxtO15sqlwkrQAvjrNvpOFGKPwXJ0l5gj4CnQXSHrBKsMv1U2tjmNlBzacvgVgVg6Q6mDBaL4gD3shrD+jTS8QssjK0MIKiZyLwkP7NDmjpagO6aBFRZBby63Kw4Y9cMlWmsTg13ZM883JN8kRfJcWK5gyYvIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZX6JPaA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZX6JPaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781627103; x=1813163103;
  h=date:from:to:cc:subject:message-id;
  bh=P5JCBizWE6Yu6MpBecuUqi1EuH5dElxwDOVCZWs/P8Q=;
  b=SZX6JPaAe3Qad5038gbxH63Z8rr4q4pSFm2541LBPpnTvKMqMOnhBUlh
   cfJHCxyMjn1TF7QWu0XXq0FSxFQdIfJdCEmg55M4/XkyFVVJiCfkQOW4z
   OUv8FPMJ1rgnq/G74y2BXBjF6FUeqMnRvExEqhp9sVNc3UPpQfb4fpHwK
   kVMz2lIJ0r8Z4b+4+SOZsYBleJIlpyuHLPVo4iQUUgBvGQQC/XzhQA0jP
   OqyxP1qhPWZDHxRXhHhKN8Q+APOVQeq0rK2CgObXRRx9S6ZWs0ZzQuKFy
   jobV0e4l7NlX9GFAwulLmyx+mmUKjLvDMMKTql1rl12QpTr20vnP+4KgP
   g==;
X-CSE-ConnectionGUID: va5Q/BEzSpeJTARLhn2lqw==
X-CSE-MsgGUID: +1IFrtXvT3K4DnfHYOD70g==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93889463"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93889463"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 09:25:02 -0700
X-CSE-ConnectionGUID: M6z6RuIEQsCLNrbX2cdPsw==
X-CSE-MsgGUID: G9i76qrjTQSX7TvCqEc9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247886230"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Jun 2026 09:25:01 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZWaw-0000000059l-41DX;
	Tue, 16 Jun 2026 16:24:58 +0000
Date: Tue, 16 Jun 2026 18:24:06 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 313/326]
 sound/soc/codecs/cs35l56-test.c:558:28: error: assignment to 'struct
 snd_soc_component *' from 'int' makes pointer from integer without a cast
Message-ID: <202606161829.afoxYXcG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 4bbdf4f7c937878b634b01d362515e2a79053b52 [313/326] dai
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260616/202606161829.afoxYXcG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161829.afoxYXcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161829.afoxYXcG-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_case_init_common':
>> sound/soc/codecs/cs35l56-test.c:558:30: error: implicit declaration of function 'snd_soc_component_alloc'; did you mean 'snd_soc_component_close'? [-Wimplicit-function-declaration]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
         |                              snd_soc_component_close
>> sound/soc/codecs/cs35l56-test.c:558:28: error: assignment to 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                            ^
--
   sound/soc/codecs/wm_adsp_fw_find_test.c: In function 'wm_adsp_fw_find_test_case_init':
>> sound/soc/codecs/wm_adsp_fw_find_test.c:287:31: error: implicit declaration of function 'snd_soc_component_alloc'; did you mean 'snd_soc_component_close'? [-Wimplicit-function-declaration]
     287 |         priv->dsp.component = snd_soc_component_alloc(test_dev, &component_driver,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                               snd_soc_component_close
>> sound/soc/codecs/wm_adsp_fw_find_test.c:287:29: error: assignment to 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     287 |         priv->dsp.component = snd_soc_component_alloc(test_dev, &component_driver,
         |                             ^


vim +558 sound/soc/codecs/cs35l56-test.c

   528	
   529	static int cs35l56_test_case_init_common(struct kunit *test)
   530	{
   531		struct cs35l56_test_priv *priv;
   532		const struct cs35l56_test_param *param = test->param_value;
   533		struct cs35l56_private *cs35l56;
   534		struct snd_soc_card *card;
   535	
   536		KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
   537	
   538		priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
   539		if (!priv)
   540			return -ENOMEM;
   541	
   542		test->priv = priv;
   543	
   544		/* Create dummy amp driver dev */
   545		priv->amp_dev = faux_device_create("cs35l56_test_drv", NULL, NULL);
   546		KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
   547		KUNIT_ASSERT_EQ(test, 0,
   548				kunit_add_action_or_reset(test,
   549							  faux_device_destroy_wrapper,
   550							  priv->amp_dev));
   551	
   552		/* Construct minimal set of driver structs */
   553		priv->cs35l56_priv = kunit_kzalloc(test, sizeof(*priv->cs35l56_priv), GFP_KERNEL);
   554		KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_priv);
   555		cs35l56 = priv->cs35l56_priv;
   556		cs35l56->base.dev = &priv->amp_dev->dev;
   557	
 > 558		cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
   559							     NULL, NULL, NULL, NULL);
   560		dev_set_drvdata(cs35l56->base.dev, cs35l56);
   561	
   562		cs35l56->card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
   563		KUNIT_ASSERT_NOT_NULL(test, cs35l56->card);
   564	
   565		if (param) {
   566			cs35l56->base.type = param->type;
   567			cs35l56->base.rev = param->rev;
   568		}
   569	
   570		return 0;
   571	}
   572	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
