Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A77EEBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771038607; cv=none; b=NXfhP2V2pPu9J8dGa93S+EG0yRcbQfnelAHaXyxqgm9r7wfnp0jYlU+LplbMGtVmBVdXg6kOTMKwxlISNRszdSFeT7WooOLq8M2Q62C1ZntTa4QD9rCO5m+kZew/5/84+iK/cDLZLagdxi8oI22RMoeiXOW2KouAQCqxSO5VdiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771038607; c=relaxed/simple;
	bh=QhekNKuc1toUutNEUwprDfCivySsfZ7u0I5TpJyL1Gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fbJwW8rkxikFgh456Tk7dwJYzZh/HvaOM8uAQYLs5lQ2Btt8TyPPS6M/mLyn+89zReMXBW4tRRCLbgS78NgfLEirMqAtqSZlp2y7j1+rEMVSBpZrngpSHu3Ztr49Jg0qik7SEcJXJ3U18OXYrA3qwLrO2q5ODu3rne5UO0JPyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsyz7W+W; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsyz7W+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771038605; x=1802574605;
  h=date:from:to:cc:subject:message-id;
  bh=QhekNKuc1toUutNEUwprDfCivySsfZ7u0I5TpJyL1Gs=;
  b=gsyz7W+WIoRx7svi64/DONOIy44l9Ck9FeVeB94ll8w3B6z4eQpDONSz
   0RaSYpg6seoMWqVhrpru758ZwivxPshoZJ+O6KfwHgZz9k+oLgdcjlIJ7
   HMOhJ+KsQ3hTmE3rjAOgOokAbse+EsC/R6K6KT8uBj6/5l1dkmlSQfMhJ
   ZmviHbhzKLee8MbcTWtAIbLTeLfM/DnHzRKR2L2naLrMAQ9ohZVa1bxYK
   8aZi3Ag04+Gi2hpe6+TACwXfascYkQn300sB/EE7KFydWygrli6EbmPJM
   sPz7f8CEVFVUrUE15WlLIlfrLnhTJjY0D/3NV7Ec9+x/1tEste2aN8DD2
   A==;
X-CSE-ConnectionGUID: 4Gd0O/szT72Of7Y33FOWVA==
X-CSE-MsgGUID: DdSqt+lQSzOXmSoGj6PUGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72292490"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72292490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 19:10:04 -0800
X-CSE-ConnectionGUID: pQ3um3tySnGh0iZyElML7w==
X-CSE-MsgGUID: H2XhVz13RoWrt0Zv6MbG/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212926847"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 19:10:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr62i-00000000w6Y-2KkB;
	Sat, 14 Feb 2026 03:10:00 +0000
Date: Sat, 14 Feb 2026 11:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 16/19]
 drivers/hwspinlock/hwspinlock_core.c:531:9: error: call to undeclared
 function 'kzalloc'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602141043.6zAFbnEm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   661496e362d06c7579ec2f4001cebf7d520ef601
commit: ac5e31c8eab290f8d5b4f5200025c5a538b3c65b [16/19] core: core allocates bank
config: arm-randconfig-003-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141043.6zAFbnEm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141043.6zAFbnEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141043.6zAFbnEm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwspinlock/hwspinlock_core.c:531:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     531 |         bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
         |                ^
>> drivers/hwspinlock/hwspinlock_core.c:531:7: error: incompatible integer to pointer conversion assigning to 'struct hwspinlock_device *' from 'int' [-Wint-conversion]
     531 |         bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwspinlock/hwspinlock_core.c:564:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     564 |         kfree(bank);
         |         ^
   drivers/hwspinlock/hwspinlock_core.c:596:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     596 |         kfree(bank);
         |         ^
   4 errors generated.


vim +/kzalloc +531 drivers/hwspinlock/hwspinlock_core.c

   502	
   503	/**
   504	 * hwspin_lock_register() - register a new hw spinlock device
   505	 * @dev: the backing device
   506	 * @ops: hwspinlock handlers for this device
   507	 * @base_id: id of the first hardware spinlock in this bank
   508	 * @num_locks: number of hwspinlocks provided by this device
   509	 * @init_data: additional data passed on to the init_priv callback
   510	 *
   511	 * This function should be called from the underlying platform-specific
   512	 * implementation, to register a new hwspinlock device instance.
   513	 *
   514	 * Should be called from a process context (might sleep)
   515	 *
   516	 * Returns: a pointer to the device (needed for unregistering), or an
   517	 * appropriate error pointer on failure
   518	 */
   519	struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
   520						       int base_id, int num_locks, void *init_data)
   521	{
   522		struct hwspinlock_device *bank;
   523		struct hwspinlock *hwlock;
   524		int ret, i;
   525	
   526		if (!ops || !dev || !num_locks || !ops->trylock || !ops->unlock) {
   527			pr_err("invalid parameters\n");
   528			return ERR_PTR(-EINVAL);
   529		}
   530	
 > 531		bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
   532		if (!bank)
   533			return ERR_PTR(-ENOMEM);
   534	
   535		bank->dev = dev;
   536		bank->ops = ops;
   537		bank->base_id = base_id;
   538		bank->num_locks = num_locks;
   539	
   540		for (i = 0; i < num_locks; i++) {
   541			hwlock = &bank->lock[i];
   542	
   543			spin_lock_init(&hwlock->lock);
   544			hwlock->bank = bank;
   545	
   546			if (ops->init_priv) {
   547				hwlock->priv = ops->init_priv(i, init_data);
   548				if (IS_ERR(hwlock->priv)) {
   549					ret = PTR_ERR(hwlock->priv);
   550					goto reg_failed;
   551				}
   552			}
   553	
   554			ret = hwspin_lock_register_single(hwlock, base_id + i);
   555			if (ret)
   556				goto reg_failed;
   557		}
   558	
   559		return bank;
   560	
   561	reg_failed:
   562		while (--i >= 0)
   563			hwspin_lock_unregister_single(base_id + i);
 > 564		kfree(bank);
   565		return ERR_PTR(ret);
   566	}
   567	EXPORT_SYMBOL_GPL(hwspin_lock_register);
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
