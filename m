Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6D42DA54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301916; cv=none; b=noPwH5j8FNIU3tY5ZrQSwLq/aKCS+rowC/UnWz40vEWs/gpurejWad5rtz7Nk4UGndGXWU1y+TEQdMYwE83iiJQCH+ImDODJHd0wH69vvLY00ZhaFHCDCvYO5et4Dy3B9MK1LDrQsmc8fZq6FoHFDeEzQv9x1Xlr3t0xuRRI/q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301916; c=relaxed/simple;
	bh=rEQ9NdrGSQVTLUtGlc4rL6LHVU+wGi0CV1Gf0+wMGqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XjYpDwP9qaKPFdtui9Wq8CqDz+W84hGT/RLqa4+460tGB3aZCgUJfPGpsQxWRw61cXhc0WX7VZ1JcbX6fbHxUZxXzkrXKflvsaHl/L+OyFi72R9Ifq33S0uX/Nl9zGvdUwZMe3z5Wt4RPtvf0qU9LCh5Mqj3SLyfTGWp1HZXROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpQ+Q8lg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpQ+Q8lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784301913; x=1815837913;
  h=date:from:to:cc:subject:message-id;
  bh=rEQ9NdrGSQVTLUtGlc4rL6LHVU+wGi0CV1Gf0+wMGqA=;
  b=XpQ+Q8lgHIMaVcT1y2BGvFD7KZE+6tCsAWC7yX1kolT7PHot7OSXgA/D
   YFIrpYxMlnPI666Fpy3FbjSm3pYiLnzOB2MHBhJ+omKzVyVpQW3xQH4Ma
   /c0TQdANqGiksryCsQJ0OIBlOMe0a6A40A1zFWI9TqMp+jxUU3OE82EIZ
   /dWMUsMAb+7R3aiNWz/W3g7d6fnWUfnwDg7w0K0FHWLk7214PXRyYFE2+
   ik0V3gpTiLPt92r9pjWBJELD+ftbO55rBbd0UGmSlAzZKPAAeWBpD6MOW
   znR9VENi7yE4HPAOShSHZVSGn9RpJA/u0revZcMxFjoPm/jSsikp5LKSq
   A==;
X-CSE-ConnectionGUID: Q952n3i9S2iz4ZyZ9qdnEg==
X-CSE-MsgGUID: RGSxN371SOauBXw1JM4Qkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85175178"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85175178"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 08:25:09 -0700
X-CSE-ConnectionGUID: ro6r7pneReykGDtXAtJtzg==
X-CSE-MsgGUID: Xh/ZIG5aSIKfoncGTXHbCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="256894345"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2026 08:25:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkkQz-00000000SsI-0Yk6;
	Fri, 17 Jul 2026 15:25:05 +0000
Date: Fri, 17 Jul 2026 23:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 sound/soc/codecs/cs35l56-test.c:557:9: error: implicit declaration of
 function 'snd_soc_component_set_drvdata'; did you mean
 'snd_soc_component_set_jack'?
Message-ID: <202607172351.G3rfCkD9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: db31ab2b35b1a9b8892ec5883f4eb5798260075e [311/311] ASoC: soc-component: remove snd_soc_component_{set/get}_drvdata()
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607172351.G3rfCkD9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172351.G3rfCkD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172351.G3rfCkD9-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_case_init_common':
>> sound/soc/codecs/cs35l56-test.c:557:9: error: implicit declaration of function 'snd_soc_component_set_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     557 |         snd_soc_component_set_drvdata(cs35l56->component, cs35l56);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_component_set_jack


vim +557 sound/soc/codecs/cs35l56-test.c

6f220440399afba Richard Fitzgerald 2026-02-05  522  
d0ab89951197f0f Richard Fitzgerald 2026-01-21  523  static int cs35l56_test_case_init_common(struct kunit *test)
d0ab89951197f0f Richard Fitzgerald 2026-01-21  524  {
d0ab89951197f0f Richard Fitzgerald 2026-01-21  525  	struct cs35l56_test_priv *priv;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  526  	const struct cs35l56_test_param *param = test->param_value;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  527  	struct cs35l56_private *cs35l56;
f91d2ea52853c9b Kuninori Morimoto  2026-06-19  528  	struct snd_soc_card *card;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  529  
d0ab89951197f0f Richard Fitzgerald 2026-01-21  530  	KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
d0ab89951197f0f Richard Fitzgerald 2026-01-21  531  
d0ab89951197f0f Richard Fitzgerald 2026-01-21  532  	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
d0ab89951197f0f Richard Fitzgerald 2026-01-21  533  	if (!priv)
d0ab89951197f0f Richard Fitzgerald 2026-01-21  534  		return -ENOMEM;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  535  
d0ab89951197f0f Richard Fitzgerald 2026-01-21  536  	test->priv = priv;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  537  
d0ab89951197f0f Richard Fitzgerald 2026-01-21  538  	/* Create dummy amp driver dev */
d0ab89951197f0f Richard Fitzgerald 2026-01-21  539  	priv->amp_dev = faux_device_create("cs35l56_test_drv", NULL, NULL);
d0ab89951197f0f Richard Fitzgerald 2026-01-21  540  	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
d0ab89951197f0f Richard Fitzgerald 2026-01-21  541  	KUNIT_ASSERT_EQ(test, 0,
d0ab89951197f0f Richard Fitzgerald 2026-01-21  542  			kunit_add_action_or_reset(test,
d0ab89951197f0f Richard Fitzgerald 2026-01-21  543  						  faux_device_destroy_wrapper,
d0ab89951197f0f Richard Fitzgerald 2026-01-21  544  						  priv->amp_dev));
d0ab89951197f0f Richard Fitzgerald 2026-01-21  545  
d0ab89951197f0f Richard Fitzgerald 2026-01-21  546  	/* Construct minimal set of driver structs */
d0ab89951197f0f Richard Fitzgerald 2026-01-21  547  	priv->cs35l56_priv = kunit_kzalloc(test, sizeof(*priv->cs35l56_priv), GFP_KERNEL);
d0ab89951197f0f Richard Fitzgerald 2026-01-21  548  	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_priv);
d0ab89951197f0f Richard Fitzgerald 2026-01-21  549  	cs35l56 = priv->cs35l56_priv;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  550  	cs35l56->base.dev = &priv->amp_dev->dev;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  551  
f91d2ea52853c9b Kuninori Morimoto  2026-06-19  552  	card = snd_soc_card_alloc(&priv->amp_dev->dev);
f91d2ea52853c9b Kuninori Morimoto  2026-06-19  553  	KUNIT_ASSERT_NOT_NULL(test, card);
f91d2ea52853c9b Kuninori Morimoto  2026-06-19  554  
f91d2ea52853c9b Kuninori Morimoto  2026-06-19  555  	cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev);
d0ab89951197f0f Richard Fitzgerald 2026-01-21  556  	KUNIT_ASSERT_NOT_NULL(test, cs35l56->component);
6f220440399afba Richard Fitzgerald 2026-02-05 @557  	snd_soc_component_set_drvdata(cs35l56->component, cs35l56);
f91d2ea52853c9b Kuninori Morimoto  2026-06-19  558  	test_hack_component_setup(cs35l56->component, card, NULL);
d0ab89951197f0f Richard Fitzgerald 2026-01-21  559  
d0ab89951197f0f Richard Fitzgerald 2026-01-21  560  	if (param) {
d0ab89951197f0f Richard Fitzgerald 2026-01-21  561  		cs35l56->base.type = param->type;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  562  		cs35l56->base.rev = param->rev;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  563  	}
d0ab89951197f0f Richard Fitzgerald 2026-01-21  564  
d0ab89951197f0f Richard Fitzgerald 2026-01-21  565  	return 0;
d0ab89951197f0f Richard Fitzgerald 2026-01-21  566  }
d0ab89951197f0f Richard Fitzgerald 2026-01-21  567  

:::::: The code at line 557 was first introduced by commit
:::::: 6f220440399afba29165e0597fa2c3aa836191d7 ASoC: cs35l56: KUnit tests for parsing and using onchip GPIOs

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
