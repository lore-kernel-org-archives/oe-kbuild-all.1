Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AA6995E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707473965; cv=none; b=QDRwbeZE0rzPiKiZEvQMnqki01l+Ok+WdjNBPrlBMDhTWinL0M7BNAYEdpdTwuCsJSAjBpcaK8bYM5J/W+JAW6wHOmT7ld3FGR89G6RfKLKFnN0a5syUE05p4wg4Intbyr+rtW6JddRfSBJ0smhYl+tQPjcIJlWenQ4sjb4X5C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707473965; c=relaxed/simple;
	bh=xEl0nTI08OIr/ubvNitfHcoGGjn5OD0XStyntZ0eoCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C3bcYbnx2myU7OrMt9pl1xjSNCBnVSTiO4CjFR1zhkqV/x/6IH3SnPJpExy73oLzMXQbtJsZFPrp8MNnTjRhdN6355zYKUED78nIBzarfKkSuzN4yvCPvLIafDW+R4Wh1GzRLk9NexDp8CTTdZtGs0JyAchJSNnedw5Rj1GsOpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rb7vO7sQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rb7vO7sQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707473963; x=1739009963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xEl0nTI08OIr/ubvNitfHcoGGjn5OD0XStyntZ0eoCE=;
  b=Rb7vO7sQ2yfGxnYivqTmaKCfouYIEVk1FkcDumk70BjXFhGivyc2I4iC
   2f4AC+ZbW83yyatx7g0C53tf5W79HUacLmvPOAiZVsRxP06dVQXqqZJ4A
   hKc/edwI1Xc1QO8/tCPwtWGgDoCCB4Bs+A51B673vgHctDFgxWXnKJcCx
   8B8rdiyZJ56R8PwTHW/FCH1TKhhlIwRGTPVGWCmCLUS5HRwTGOsGjkk7A
   yabTm3zMDy7CIqPnLANukFAZpNfCSnP4AB7GwgTz1tiMqj+gTY/RfFtzZ
   jlmw7tbehDK7Cx4LWU+iP1F1bfsMhGi1I6toxWv198sHc17/rr41dV7MO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1299122"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1299122"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 02:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934385250"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="934385250"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 02:19:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYNyY-0004cC-1x;
	Fri, 09 Feb 2024 10:19:18 +0000
Date: Fri, 9 Feb 2024 18:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4128/17898]
 drivers/crypto/caam/sm_store.c:424:6: warning: no previous prototype for
 function 'sm_key_job_done'
Message-ID: <202402091849.LEHNHNY3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: 9a605b9455ed929a437d6908d1a8d02d85c28141 [4128/17898] MLKU-25-3 crypto: caam - add Secure Memory support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240209/202402091849.LEHNHNY3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402091849.LEHNHNY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091849.LEHNHNY3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/sm_store.c:424:6: warning: no previous prototype for function 'sm_key_job_done' [-Wmissing-prototypes]
   void sm_key_job_done(struct device *dev, u32 *desc, u32 err, void *context)
        ^
   drivers/crypto/caam/sm_store.c:424:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sm_key_job_done(struct device *dev, u32 *desc, u32 err, void *context)
   ^
   static 
>> drivers/crypto/caam/sm_store.c:467:5: warning: no previous prototype for function 'slot_alloc' [-Wmissing-prototypes]
   int slot_alloc(struct device *dev, u32 unit, u32 size, u32 *slot)
       ^
   drivers/crypto/caam/sm_store.c:467:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int slot_alloc(struct device *dev, u32 unit, u32 size, u32 *slot)
   ^
   static 
   drivers/crypto/caam/sm_store.c:499:14: warning: variable 'slotdata' set but not used [-Wunused-but-set-variable]
           u8 __iomem *slotdata;
                       ^
>> drivers/crypto/caam/sm_store.c:495:5: warning: no previous prototype for function 'slot_dealloc' [-Wmissing-prototypes]
   int slot_dealloc(struct device *dev, u32 unit, u32 slot)
       ^
   drivers/crypto/caam/sm_store.c:495:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int slot_dealloc(struct device *dev, u32 unit, u32 slot)
   ^
   static 
>> drivers/crypto/caam/sm_store.c:524:7: warning: no previous prototype for function 'slot_get_address' [-Wmissing-prototypes]
   void *slot_get_address(struct device *dev, u32 unit, u32 slot)
         ^
   drivers/crypto/caam/sm_store.c:524:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *slot_get_address(struct device *dev, u32 unit, u32 slot)
   ^
   static 
>> drivers/crypto/caam/sm_store.c:540:7: warning: no previous prototype for function 'slot_get_physical' [-Wmissing-prototypes]
   void *slot_get_physical(struct device *dev, u32 unit, u32 slot)
         ^
   drivers/crypto/caam/sm_store.c:540:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *slot_get_physical(struct device *dev, u32 unit, u32 slot)
   ^
   static 
>> drivers/crypto/caam/sm_store.c:556:5: warning: no previous prototype for function 'slot_get_base' [-Wmissing-prototypes]
   u32 slot_get_base(struct device *dev, u32 unit, u32 slot)
       ^
   drivers/crypto/caam/sm_store.c:556:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 slot_get_base(struct device *dev, u32 unit, u32 slot)
   ^
   static 
>> drivers/crypto/caam/sm_store.c:576:5: warning: no previous prototype for function 'slot_get_offset' [-Wmissing-prototypes]
   u32 slot_get_offset(struct device *dev, u32 unit, u32 slot)
       ^
   drivers/crypto/caam/sm_store.c:576:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 slot_get_offset(struct device *dev, u32 unit, u32 slot)
   ^
   static 
>> drivers/crypto/caam/sm_store.c:592:5: warning: no previous prototype for function 'slot_get_slot_size' [-Wmissing-prototypes]
   u32 slot_get_slot_size(struct device *dev, u32 unit, u32 slot)
       ^
   drivers/crypto/caam/sm_store.c:592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 slot_get_slot_size(struct device *dev, u32 unit, u32 slot)
   ^
   static 
>> drivers/crypto/caam/sm_store.c:607:5: warning: no previous prototype for function 'kso_init_data' [-Wmissing-prototypes]
   int kso_init_data(struct device *dev, u32 unit)
       ^
   drivers/crypto/caam/sm_store.c:607:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kso_init_data(struct device *dev, u32 unit)
   ^
   static 
   drivers/crypto/caam/sm_store.c:657:24: warning: variable 'keystore_data' set but not used [-Wunused-but-set-variable]
           struct keystore_data *keystore_data = NULL;
                                 ^
>> drivers/crypto/caam/sm_store.c:654:6: warning: no previous prototype for function 'kso_cleanup_data' [-Wmissing-prototypes]
   void kso_cleanup_data(struct device *dev, u32 unit)
        ^
   drivers/crypto/caam/sm_store.c:654:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kso_cleanup_data(struct device *dev, u32 unit)
   ^
   static 
   drivers/crypto/caam/sm_store.c:841:14: warning: variable 'slotaddr' set but not used [-Wunused-but-set-variable]
           u8 __iomem *slotaddr;
                       ^
   drivers/crypto/caam/sm_store.c:868:14: warning: variable 'slotaddr' set but not used [-Wunused-but-set-variable]
           u8 __iomem *slotaddr, *lkeymod;
                       ^
   drivers/crypto/caam/sm_store.c:957:14: warning: variable 'slotaddr' set but not used [-Wunused-but-set-variable]
           u8 __iomem *slotaddr, *lkeymod;
                       ^
   15 warnings generated.


vim +/sm_key_job_done +424 drivers/crypto/caam/sm_store.c

   423	
 > 424	void sm_key_job_done(struct device *dev, u32 *desc, u32 err, void *context)
   425	{
   426		struct sm_key_job_result *res = context;
   427	
   428		if (err)
   429			caam_jr_strstatus(dev, err);
   430	
   431		res->error = err;	/* save off the error for postprocessing */
   432	
   433		complete(&res->completion);	/* mark us complete */
   434	}
   435	
   436	static int sm_key_job(struct device *ksdev, u32 *jobdesc)
   437	{
   438		struct sm_key_job_result testres = {0};
   439		struct caam_drv_private_sm *kspriv;
   440		int rtn = 0;
   441	
   442		kspriv = dev_get_drvdata(ksdev);
   443	
   444		init_completion(&testres.completion);
   445	
   446		rtn = caam_jr_enqueue(kspriv->smringdev, jobdesc, sm_key_job_done,
   447				      &testres);
   448		if (rtn != -EINPROGRESS)
   449			goto exit;
   450	
   451		wait_for_completion(&testres.completion);
   452		rtn = testres.error;
   453	
   454	exit:
   455		return rtn;
   456	}
   457	
   458	/*
   459	 * Following section establishes the default methods for keystore access
   460	 * They are NOT intended for use external to this module
   461	 *
   462	 * In the present version, these are the only means for the higher-level
   463	 * interface to deal with the mechanics of accessing the phyiscal keystore
   464	 */
   465	
   466	
 > 467	int slot_alloc(struct device *dev, u32 unit, u32 size, u32 *slot)
   468	{
   469		struct caam_drv_private_sm *smpriv = dev_get_drvdata(dev);
   470		struct keystore_data *ksdata = smpriv->pagedesc[unit].ksdata;
   471		u32 i;
   472	#ifdef SM_DEBUG
   473		dev_info(dev, "slot_alloc(): requesting slot for %d bytes\n", size);
   474	#endif
   475	
   476		if (size > smpriv->slot_size)
   477			return -EKEYREJECTED;
   478	
   479		for (i = 0; i < ksdata->slot_count; i++) {
   480			if (ksdata->slot[i].allocated == 0) {
   481				ksdata->slot[i].allocated = 1;
   482				(*slot) = i;
   483	#ifdef SM_DEBUG
   484				dev_info(dev, "slot_alloc(): new slot %d allocated\n",
   485					 *slot);
   486	#endif
   487				return 0;
   488			}
   489		}
   490	
   491		return -ENOSPC;
   492	}
   493	EXPORT_SYMBOL(slot_alloc);
   494	
 > 495	int slot_dealloc(struct device *dev, u32 unit, u32 slot)
   496	{
   497		struct caam_drv_private_sm *smpriv = dev_get_drvdata(dev);
   498		struct keystore_data *ksdata = smpriv->pagedesc[unit].ksdata;
   499		u8 __iomem *slotdata;
   500	
   501	#ifdef SM_DEBUG
   502		dev_info(dev, "slot_dealloc(): releasing slot %d\n", slot);
   503	#endif
   504		if (slot >= ksdata->slot_count)
   505			return -EINVAL;
   506		slotdata = ksdata->base_address + slot * smpriv->slot_size;
   507	
   508		if (ksdata->slot[slot].allocated == 1) {
   509			/* Forcibly overwrite the data from the keystore */
   510			memset_io(ksdata->base_address + slot * smpriv->slot_size, 0,
   511			       smpriv->slot_size);
   512	
   513			ksdata->slot[slot].allocated = 0;
   514	#ifdef SM_DEBUG
   515			dev_info(dev, "slot_dealloc(): slot %d released\n", slot);
   516	#endif
   517			return 0;
   518		}
   519	
   520		return -EINVAL;
   521	}
   522	EXPORT_SYMBOL(slot_dealloc);
   523	
 > 524	void *slot_get_address(struct device *dev, u32 unit, u32 slot)
   525	{
   526		struct caam_drv_private_sm *smpriv = dev_get_drvdata(dev);
   527		struct keystore_data *ksdata = smpriv->pagedesc[unit].ksdata;
   528	
   529		if (slot >= ksdata->slot_count)
   530			return NULL;
   531	
   532	#ifdef SM_DEBUG
   533		dev_info(dev, "slot_get_address(): slot %d is 0x%08x\n", slot,
   534			 (u32)ksdata->base_address + slot * smpriv->slot_size);
   535	#endif
   536	
   537		return ksdata->base_address + slot * smpriv->slot_size;
   538	}
   539	
 > 540	void *slot_get_physical(struct device *dev, u32 unit, u32 slot)
   541	{
   542		struct caam_drv_private_sm *smpriv = dev_get_drvdata(dev);
   543		struct keystore_data *ksdata = smpriv->pagedesc[unit].ksdata;
   544	
   545		if (slot >= ksdata->slot_count)
   546			return NULL;
   547	
   548	#ifdef SM_DEBUG
   549		dev_info(dev, "%s: slot %d is 0x%08x\n", __func__, slot,
   550			 (u32)ksdata->phys_address + slot * smpriv->slot_size);
   551	#endif
   552	
   553		return ksdata->phys_address + slot * smpriv->slot_size;
   554	}
   555	
 > 556	u32 slot_get_base(struct device *dev, u32 unit, u32 slot)
   557	{
   558		struct caam_drv_private_sm *smpriv = dev_get_drvdata(dev);
   559		struct keystore_data *ksdata = smpriv->pagedesc[unit].ksdata;
   560	
   561		/*
   562		 * There could potentially be more than one secure partition object
   563		 * associated with this keystore.  For now, there is just one.
   564		 */
   565	
   566		(void)slot;
   567	
   568	#ifdef SM_DEBUG
   569		dev_info(dev, "slot_get_base(): slot %d = 0x%08x\n",
   570			slot, (u32)ksdata->base_address);
   571	#endif
   572	
   573		return (uintptr_t)(ksdata->base_address);
   574	}
   575	
 > 576	u32 slot_get_offset(struct device *dev, u32 unit, u32 slot)
   577	{
   578		struct caam_drv_private_sm *smpriv = dev_get_drvdata(dev);
   579		struct keystore_data *ksdata = smpriv->pagedesc[unit].ksdata;
   580	
   581		if (slot >= ksdata->slot_count)
   582			return -EINVAL;
   583	
   584	#ifdef SM_DEBUG
   585		dev_info(dev, "slot_get_offset(): slot %d = %d\n", slot,
   586			slot * smpriv->slot_size);
   587	#endif
   588	
   589		return slot * smpriv->slot_size;
   590	}
   591	
 > 592	u32 slot_get_slot_size(struct device *dev, u32 unit, u32 slot)
   593	{
   594		struct caam_drv_private_sm *smpriv = dev_get_drvdata(dev);
   595	
   596	
   597	#ifdef SM_DEBUG
   598		dev_info(dev, "slot_get_slot_size(): slot %d = %d\n", slot,
   599			 smpriv->slot_size);
   600	#endif
   601		/* All slots are the same size in the default implementation */
   602		return smpriv->slot_size;
   603	}
   604	
   605	
   606	
 > 607	int kso_init_data(struct device *dev, u32 unit)
   608	{
   609		struct caam_drv_private_sm *smpriv = dev_get_drvdata(dev);
   610		struct keystore_data *keystore_data = NULL;
   611		u32 slot_count;
   612		u32 keystore_data_size;
   613	
   614		/*
   615		 * Calculate the required size of the keystore data structure, based
   616		 * on the number of keys that can fit in the partition.
   617		 */
   618		slot_count = smpriv->page_size / smpriv->slot_size;
   619	#ifdef SM_DEBUG
   620		dev_info(dev, "kso_init_data: %d slots initializing\n", slot_count);
   621	#endif
   622	
   623		keystore_data_size = sizeof(struct keystore_data) +
   624					slot_count *
   625					sizeof(struct keystore_data_slot_info);
   626	
   627		keystore_data = kzalloc(keystore_data_size, GFP_KERNEL);
   628	
   629		if (!keystore_data)
   630			return -ENOMEM;
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
