Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844039A062
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 05:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785302096; cv=none; b=bj+HFn0483R/1DoE7xSa+voyYmPQxmcnOvBwQtUJw58GXmcO9Ug1xl8sj0FUWBLiiig3x/Dc8cfYxREWIXUeQGux5V6h80gyUtWnK0YpedHFvjdHJ9/tGJqK87lf0GvPYIDL/YbPQ/r2oycEKigzIva2WWkmmxYKZHkEUhTaQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785302096; c=relaxed/simple;
	bh=pET1fcUJN6lXpRTIueiDf3U01VlzkZ3BuYz2OZK1k5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=atIezZl3SSzL3yiCnJ3hvD9fT/vuKipqtanNos0/aSeBJOg6lo5xxExh4pZECI2gpWodgMcudyksHX2wsxV0JUaRrBFsGcYdpghOSxYQN/Fger4WsxwBVxFom8ljLEirrrAdomXGkcu8ibZSCu60x5EsCGVJlx7ow/APplZbMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wu8upLKQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wu8upLKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785302094; x=1816838094;
  h=date:from:to:cc:subject:message-id;
  bh=pET1fcUJN6lXpRTIueiDf3U01VlzkZ3BuYz2OZK1k5A=;
  b=Wu8upLKQOiR9B8UVKFivQmyhu56xpd7OX1oBElw1GAQeovti5vOqgAd8
   ljNFUAlvVV2PzcenZFWIMY2zbSm+OIhvCCCQuD2nvxa2cKTMF7ae6o9j7
   ANHt5cxTn39vqU8zUzvUqifRBk2CtRonhcsaieOeBdL5omsYPYiB4zTOe
   yFFyLk26AizeTqlHV/qyc62kzEifbdpeUEtTY4ZJ6WUa91hE1HhjpadW4
   mrjEb6/+4uH7brNPLKgBe3qdrLxp8Ff/CvbyNx87VmPo3NPibBg7YqTC3
   cFkJPH3st4M2MCWK6teTC1fmO4fy2aNRAEZS3LDH2hoy5lY0LNkCqJlR7
   w==;
X-CSE-ConnectionGUID: iDxsWp4HRU+ebZA+VmUkVg==
X-CSE-MsgGUID: w/Q5CJCdRhWjfv3NVXn5pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85914145"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85914145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 22:14:51 -0700
X-CSE-ConnectionGUID: E+DE1lrBThK6fm6JzZXHnQ==
X-CSE-MsgGUID: DEiYuSddQd6RY45YULF9+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="283241012"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2026 22:14:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wowcx-00000000f3X-3DUk;
	Wed, 29 Jul 2026 05:14:47 +0000
Date: Wed, 29 Jul 2026 13:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8490/9778]
 sound/soc/sdca/sdca_interrupts.c:460:56: error: 'sdca_fdl_free_state'
 undeclared; did you mean 'sdca_jack_free_state'?
Message-ID: <202607291304.FE3mOcJF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3652b49adac266a3d27cb41cdfdb7d8790fc3633
commit: 0880082c27b6251cc3fea307dffa6899ad163e8b [8490/9778] ASoC: SDCA: Remove devm from primary IRQ cleanup
config: i386-randconfig-016-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291304.FE3mOcJF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291304.FE3mOcJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291304.FE3mOcJF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sdca/sdca_interrupts.c: In function 'sdca_irq_populate_early':
>> sound/soc/sdca/sdca_interrupts.c:460:56: error: 'sdca_fdl_free_state' undeclared (first use in this function); did you mean 'sdca_jack_free_state'?
     460 |                                 interrupt->free_priv = sdca_fdl_free_state;
         |                                                        ^~~~~~~~~~~~~~~~~~~
         |                                                        sdca_jack_free_state
   sound/soc/sdca/sdca_interrupts.c:460:56: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/sdca/sdca_interrupts.c: In function 'sdca_irq_populate':
   sound/soc/sdca/sdca_interrupts.c:543:56: error: 'sdca_fdl_free_state' undeclared (first use in this function); did you mean 'sdca_jack_free_state'?
     543 |                                 interrupt->free_priv = sdca_fdl_free_state;
         |                                                        ^~~~~~~~~~~~~~~~~~~
         |                                                        sdca_jack_free_state


vim +460 sound/soc/sdca/sdca_interrupts.c

   414	
   415	/**
   416	 * sdca_irq_populate_early - process pre-audio card IRQ registrations
   417	 * @dev: Device pointer for SDCA Function.
   418	 * @regmap: Regmap pointer for the SDCA Function.
   419	 * @function: Pointer to the SDCA Function.
   420	 * @info: Pointer to the SDCA interrupt info for this device.
   421	 *
   422	 * This is intended to be used as part of the Function boot process. It
   423	 * can be called before the soundcard is registered (ie. doesn't depend
   424	 * on component) and will register the FDL interrupts.
   425	 *
   426	 * Return: Zero on success, and a negative error code on failure.
   427	 */
   428	int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
   429				    struct sdca_function_data *function,
   430				    struct sdca_interrupt_info *info)
   431	{
   432		int i, j;
   433	
   434		guard(mutex)(&info->irq_lock);
   435	
   436		for (i = 0; i < function->num_entities; i++) {
   437			struct sdca_entity *entity = &function->entities[i];
   438	
   439			for (j = 0; j < entity->num_controls; j++) {
   440				struct sdca_control *control = &entity->controls[j];
   441				int irq = control->interrupt_position;
   442				struct sdca_interrupt *interrupt;
   443				int ret;
   444	
   445				interrupt = get_interrupt_data(dev, irq, info);
   446				if (IS_ERR(interrupt))
   447					return PTR_ERR(interrupt);
   448				else if (!interrupt)
   449					continue;
   450	
   451				switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
   452				case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
   453					ret = sdca_irq_data_populate(dev, regmap, NULL,
   454								     function, entity,
   455								     control, interrupt);
   456					if (ret)
   457						return ret;
   458	
   459					interrupt->early_request = true;
 > 460					interrupt->free_priv = sdca_fdl_free_state;
   461	
   462					ret = sdca_fdl_alloc_state(interrupt);
   463					if (ret)
   464						return ret;
   465	
   466					ret = sdca_irq_request_locked(dev, info, irq,
   467								      interrupt->name,
   468								      fdl_owner_handler,
   469								      interrupt);
   470					if (ret) {
   471						dev_err(dev, "failed to request irq %s: %d\n",
   472							interrupt->name, ret);
   473						return ret;
   474					}
   475					break;
   476				default:
   477					break;
   478				}
   479			}
   480		}
   481	
   482		return 0;
   483	}
   484	EXPORT_SYMBOL_NS_GPL(sdca_irq_populate_early, "SND_SOC_SDCA");
   485	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
