Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9064A43C076
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312809; cv=none; b=sUMGDMmKvTEeMbbmCqjFqv85puhag6j4L2s9XHAsLYfs7r9QSr/w61GvdNuITIMI9vJ9N1GAHbprgomm5hfQgZ1j6Hi6ZnbsWv+FzTR2ySnXiBELLBxYw9k/j5quSxdJQQtFLYfnQyasNHrnovgLUHnFD0/KDWvErjhdqA1UoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312809; c=relaxed/simple;
	bh=zKG9sEfFDMQS7hDQ8fRnlm3X9IjDfwdExZwGGpJA9g4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ND0OGTADgoEU8PNdSjxvMSI0NqaKu1cigcD0A1WuIIZNVjzlyxg4gMkq3GoHHCshK5spZAxNWa59eeJITttHrZs1tJXPLGen/Sk4dWBpcyKPLphiVdF9GbFveJMmcoL2FTjpg17dBGD9Fj6TtyKDgW3tgbw8clqjeHeAU5yGIvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlFDbdrw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlFDbdrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785312804; x=1816848804;
  h=date:from:to:cc:subject:message-id;
  bh=zKG9sEfFDMQS7hDQ8fRnlm3X9IjDfwdExZwGGpJA9g4=;
  b=MlFDbdrwZqYH325+oJ19z0GSVXOplNUSBm899V+XZPzGOUT2C2eER0zI
   QzAbhRC0i0a44cP3kGlPnfoBIb7PcTXGEVH9Z4L5S+1D8OQxkMwqTycHM
   H0Nru3cQbebDjAoReeQ/g2TzSGb1resLeEOdePTfe7LJyTq5PO7LmyBuL
   XqEYXOA+zlktZa7Er0EniSFZC2KChbnfg2wEgsl3Mm3wA5HYkkDphv/l1
   o/tcQx4mqvz+hXEvPHHEWHnQEh7oeABvw+EHmLcKMfsAvSsxL86EcZ2YM
   oKflvOGO0vEebUpqLCZCxMG13ZS+5SxIi+nrGBbJkoQOmXdNaxrGp2rsh
   w==;
X-CSE-ConnectionGUID: 0v5KfxXiSASV7pI49+r5VQ==
X-CSE-MsgGUID: 0rMItGSXQjGSPq9zTWQT+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85785237"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85785237"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 01:13:21 -0700
X-CSE-ConnectionGUID: mMisr4pbQPyCQuaR7uPIvQ==
X-CSE-MsgGUID: 76q9wdn4RL2jPwd7nL5fsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="283281645"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jul 2026 01:13:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wozPh-00000000fB5-2O95;
	Wed, 29 Jul 2026 08:13:17 +0000
Date: Wed, 29 Jul 2026 16:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8490/9778]
 sound/soc/sdca/sdca_interrupts.c:460:28: error: use of undeclared identifier
 'sdca_fdl_free_state'; did you mean 'sdca_jack_free_state'?
Message-ID: <202607291500.6UvUn4dk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3652b49adac266a3d27cb41cdfdb7d8790fc3633
commit: 0880082c27b6251cc3fea307dffa6899ad163e8b [8490/9778] ASoC: SDCA: Remove devm from primary IRQ cleanup
config: i386-randconfig-053-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291500.6UvUn4dk-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291500.6UvUn4dk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291500.6UvUn4dk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sdca/sdca_interrupts.c:460:28: error: use of undeclared identifier 'sdca_fdl_free_state'; did you mean 'sdca_jack_free_state'?
     460 |                                 interrupt->free_priv = sdca_fdl_free_state;
         |                                                        ^~~~~~~~~~~~~~~~~~~
         |                                                        sdca_jack_free_state
   include/sound/sdca_jack.h:31:6: note: 'sdca_jack_free_state' declared here
      31 | void sdca_jack_free_state(struct sdca_interrupt *interrupt);
         |      ^
   sound/soc/sdca/sdca_interrupts.c:543:28: error: use of undeclared identifier 'sdca_fdl_free_state'; did you mean 'sdca_jack_free_state'?
     543 |                                 interrupt->free_priv = sdca_fdl_free_state;
         |                                                        ^~~~~~~~~~~~~~~~~~~
         |                                                        sdca_jack_free_state
   include/sound/sdca_jack.h:31:6: note: 'sdca_jack_free_state' declared here
      31 | void sdca_jack_free_state(struct sdca_interrupt *interrupt);
         |      ^
   2 errors generated.


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
