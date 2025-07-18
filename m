Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9382DD5F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752849803; cv=none; b=Rag3u51FUsLx4A9pFcUl8rH0czStMRpXZzO+kz3t8XchPC2QPT6aBLhce+KDps3qNGh6nWeELwV0FHHum2h/FE/xsnVrPd2M3e0xVmttDDWDGfvcBoVg2BQ9TifZmvqMPqSlGO53f8ArTZC4+gyAk5lue4px6pZgEEX5Qodc9KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752849803; c=relaxed/simple;
	bh=rbJmN0lyEpXSQBasCHHVm+BdY6A5zoD2H3Sz7kkyH2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j67mfr58rDcnp2cCRldHA5NHSXgdeWljCVwTif2DvWaGvzpXG0b9EZ3xk1bxGcJCWX/aeNc0JLOAyS3EG6uVntVnx2IcuXcY35XUs/NiNbxKeaAULpsZgOC8xIxcv9lbLq+TPodXF5HovDv9n5KUETxVigbfVYuCiKS0ovlp93w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gintlErH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gintlErH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752849802; x=1784385802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rbJmN0lyEpXSQBasCHHVm+BdY6A5zoD2H3Sz7kkyH2s=;
  b=gintlErHYEysq0eAM2uPeZeoY/zV/M73MSJpYkif2fdoymoz4gmGGOTv
   KPnTQqDp2Pt323b8yqbkZqAUqfNhVWD4EnGK4xzMmrAmUabDRuJHT5Q5F
   TvrS+DAR7jcVXc1tdlnmE5TU/A3EKcm8S+7tucBcti8fvtgBTcrsiNhVX
   nGW46Iwp7sT466nJdAWIHoN54Rr55PFggQHuqFGWYz6D2LynFZ13oAcMD
   D6fnlqdJ3Lo4+5VRU3a6Ln0HgrcDN4qpkmugHQJQBpA6YGyiEmfff/J3A
   3RZzTvIsVW+E8K7Ti7WKhkaEJds3iYvG+2MsnXArNBZMhauWaPeP3gpy2
   Q==;
X-CSE-ConnectionGUID: XD2Cpcu5SEOZ2/iIfYppLA==
X-CSE-MsgGUID: 21XDfgsaQqC//61N//aRYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55109777"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="55109777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 07:43:22 -0700
X-CSE-ConnectionGUID: HnLFjawqQgKSyobSE4M3BA==
X-CSE-MsgGUID: 3WQPas5+QpiqtLOArEYu0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="181774821"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2025 07:43:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucmIv-000ElJ-0z;
	Fri, 18 Jul 2025 14:43:17 +0000
Date: Fri, 18 Jul 2025 22:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 8699/10823]
 sound/soc/sdca/sdca_interrupts.c:220:1: warning: the frame size of 1264
 bytes is larger than 1024 bytes
Message-ID: <202507182222.OLgOy9fX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charles,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 6894e49b7b62cdb0edbcaaa23ea0218edb3b02dd [8699/10823] ASoC: SDCA: Kconfig/Makefile fixups
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250718/202507182222.OLgOy9fX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507182222.OLgOy9fX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507182222.OLgOy9fX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/sdca/sdca_interrupts.c: In function 'detected_mode_handler':
>> sound/soc/sdca/sdca_interrupts.c:220:1: warning: the frame size of 1264 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     220 | }
         | ^


vim +220 sound/soc/sdca/sdca_interrupts.c

b9ab3b61824190b Charles Keepax 2025-06-24  138  
b9ab3b61824190b Charles Keepax 2025-06-24  139  static irqreturn_t detected_mode_handler(int irq, void *data)
b9ab3b61824190b Charles Keepax 2025-06-24  140  {
b9ab3b61824190b Charles Keepax 2025-06-24  141  	struct sdca_interrupt *interrupt = data;
b9ab3b61824190b Charles Keepax 2025-06-24  142  	struct snd_soc_component *component = interrupt->component;
b9ab3b61824190b Charles Keepax 2025-06-24  143  	struct device *dev = component->dev;
b9ab3b61824190b Charles Keepax 2025-06-24  144  	struct snd_soc_card *card = component->card;
b9ab3b61824190b Charles Keepax 2025-06-24  145  	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
b9ab3b61824190b Charles Keepax 2025-06-24  146  	struct snd_kcontrol *kctl = interrupt->priv;
b9ab3b61824190b Charles Keepax 2025-06-24  147  	struct snd_ctl_elem_value ucontrol;
b9ab3b61824190b Charles Keepax 2025-06-24  148  	struct soc_enum *soc_enum;
b9ab3b61824190b Charles Keepax 2025-06-24  149  	unsigned int reg, val;
b9ab3b61824190b Charles Keepax 2025-06-24  150  	int ret;
b9ab3b61824190b Charles Keepax 2025-06-24  151  
b9ab3b61824190b Charles Keepax 2025-06-24  152  	if (!kctl) {
b9ab3b61824190b Charles Keepax 2025-06-24  153  		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
b9ab3b61824190b Charles Keepax 2025-06-24  154  							   interrupt->entity->label,
b9ab3b61824190b Charles Keepax 2025-06-24  155  							   SDCA_CTL_SELECTED_MODE_NAME);
b9ab3b61824190b Charles Keepax 2025-06-24  156  
b9ab3b61824190b Charles Keepax 2025-06-24  157  		if (!name)
b9ab3b61824190b Charles Keepax 2025-06-24  158  			return -ENOMEM;
b9ab3b61824190b Charles Keepax 2025-06-24  159  
b9ab3b61824190b Charles Keepax 2025-06-24  160  		kctl = snd_soc_component_get_kcontrol(component, name);
b9ab3b61824190b Charles Keepax 2025-06-24  161  		if (!kctl) {
b9ab3b61824190b Charles Keepax 2025-06-24  162  			dev_dbg(dev, "control not found: %s\n", name);
b9ab3b61824190b Charles Keepax 2025-06-24  163  			return IRQ_NONE;
b9ab3b61824190b Charles Keepax 2025-06-24  164  		}
b9ab3b61824190b Charles Keepax 2025-06-24  165  
b9ab3b61824190b Charles Keepax 2025-06-24  166  		interrupt->priv = kctl;
b9ab3b61824190b Charles Keepax 2025-06-24  167  	}
b9ab3b61824190b Charles Keepax 2025-06-24  168  
b9ab3b61824190b Charles Keepax 2025-06-24  169  	soc_enum = (struct soc_enum *)kctl->private_value;
b9ab3b61824190b Charles Keepax 2025-06-24  170  
b9ab3b61824190b Charles Keepax 2025-06-24  171  	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
b9ab3b61824190b Charles Keepax 2025-06-24  172  			   interrupt->control->sel, 0);
b9ab3b61824190b Charles Keepax 2025-06-24  173  
b9ab3b61824190b Charles Keepax 2025-06-24  174  	ret = regmap_read(component->regmap, reg, &val);
b9ab3b61824190b Charles Keepax 2025-06-24  175  	if (ret < 0) {
b9ab3b61824190b Charles Keepax 2025-06-24  176  		dev_err(dev, "failed to read detected mode: %d\n", ret);
b9ab3b61824190b Charles Keepax 2025-06-24  177  		return IRQ_NONE;
b9ab3b61824190b Charles Keepax 2025-06-24  178  	}
b9ab3b61824190b Charles Keepax 2025-06-24  179  
b9ab3b61824190b Charles Keepax 2025-06-24  180  	switch (val) {
b9ab3b61824190b Charles Keepax 2025-06-24  181  	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
b9ab3b61824190b Charles Keepax 2025-06-24  182  	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
b9ab3b61824190b Charles Keepax 2025-06-24  183  		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
b9ab3b61824190b Charles Keepax 2025-06-24  184  				   interrupt->entity->id,
b9ab3b61824190b Charles Keepax 2025-06-24  185  				   SDCA_CTL_GE_SELECTED_MODE, 0);
b9ab3b61824190b Charles Keepax 2025-06-24  186  
b9ab3b61824190b Charles Keepax 2025-06-24  187  		/*
b9ab3b61824190b Charles Keepax 2025-06-24  188  		 * Selected mode is not normally marked as volatile register
b9ab3b61824190b Charles Keepax 2025-06-24  189  		 * (RW), but here force a read from the hardware. If the
b9ab3b61824190b Charles Keepax 2025-06-24  190  		 * detected mode is unknown we need to see what the device
b9ab3b61824190b Charles Keepax 2025-06-24  191  		 * selected as a "safe" option.
b9ab3b61824190b Charles Keepax 2025-06-24  192  		 */
b9ab3b61824190b Charles Keepax 2025-06-24  193  		regcache_drop_region(component->regmap, reg, reg);
b9ab3b61824190b Charles Keepax 2025-06-24  194  
b9ab3b61824190b Charles Keepax 2025-06-24  195  		ret = regmap_read(component->regmap, reg, &val);
b9ab3b61824190b Charles Keepax 2025-06-24  196  		if (ret) {
b9ab3b61824190b Charles Keepax 2025-06-24  197  			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
b9ab3b61824190b Charles Keepax 2025-06-24  198  			return IRQ_NONE;
b9ab3b61824190b Charles Keepax 2025-06-24  199  		}
b9ab3b61824190b Charles Keepax 2025-06-24  200  		break;
b9ab3b61824190b Charles Keepax 2025-06-24  201  	default:
b9ab3b61824190b Charles Keepax 2025-06-24  202  		break;
b9ab3b61824190b Charles Keepax 2025-06-24  203  	}
b9ab3b61824190b Charles Keepax 2025-06-24  204  
b9ab3b61824190b Charles Keepax 2025-06-24  205  	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
b9ab3b61824190b Charles Keepax 2025-06-24  206  
b9ab3b61824190b Charles Keepax 2025-06-24  207  	ucontrol.value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
b9ab3b61824190b Charles Keepax 2025-06-24  208  
b9ab3b61824190b Charles Keepax 2025-06-24  209  	down_write(rwsem);
b9ab3b61824190b Charles Keepax 2025-06-24  210  	ret = kctl->put(kctl, &ucontrol);
b9ab3b61824190b Charles Keepax 2025-06-24  211  	up_write(rwsem);
b9ab3b61824190b Charles Keepax 2025-06-24  212  	if (ret < 0) {
b9ab3b61824190b Charles Keepax 2025-06-24  213  		dev_err(dev, "failed to update selected mode: %d\n", ret);
b9ab3b61824190b Charles Keepax 2025-06-24  214  		return IRQ_NONE;
b9ab3b61824190b Charles Keepax 2025-06-24  215  	}
b9ab3b61824190b Charles Keepax 2025-06-24  216  
b9ab3b61824190b Charles Keepax 2025-06-24  217  	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
b9ab3b61824190b Charles Keepax 2025-06-24  218  
b9ab3b61824190b Charles Keepax 2025-06-24  219  	return IRQ_HANDLED;
b9ab3b61824190b Charles Keepax 2025-06-24 @220  }
b9ab3b61824190b Charles Keepax 2025-06-24  221  

:::::: The code at line 220 was first introduced by commit
:::::: b9ab3b61824190b1c6b2c59e7ba4de591f24eb92 ASoC: SDCA: Add some initial IRQ handlers

:::::: TO: Charles Keepax <ckeepax@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
