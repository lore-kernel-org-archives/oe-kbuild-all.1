Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5644C8CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 23:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771025513; cv=none; b=KvGevY+4GFmHeMuAEW5ckiAPEepL7WTMIm5icDbaJY3h9Tzgsf8gUQ1/gmCUVrbR1GTduO+oU9O+/ZsD3RcyoBfHRQR01qtKlKsXDuMuyeTULVk02qUgGCFo+CbPMOdZl+OjaSxWLKfte/YkDihed8UR5jgNB0dLOpps+HjFHtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771025513; c=relaxed/simple;
	bh=AwgOTnW5qvUWLE16U/CoNo/pWcl4ZEKlsB+t3vuGTqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aXmNSSMvB3JiCRf+aJ89wIadTGOI7CCWSqpvZJv+HfPViBBBd0ZHsjPg016fDY+2rghxAnapBlPBUz5GK3pLB1s5xkDU6Iig+ES9QmoLrFVh8T6A5Z0WDD+p3ByYkKqKdKMhNhBDa9n+jnwPUwKTjisb5mJR3cWsZXF3LK8AYCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwG6rR0T; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwG6rR0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771025512; x=1802561512;
  h=date:from:to:cc:subject:message-id;
  bh=AwgOTnW5qvUWLE16U/CoNo/pWcl4ZEKlsB+t3vuGTqE=;
  b=HwG6rR0TAqxDrzQ54gpAT1GOc9nU+X9KED8auq2l1ywpR04ZMaXZtO0A
   yqYGw5/WR2UVX2WVIVB5I7rnTkEEZCknzjDSnboH3gg2edPvVWuqzAPF5
   L3xrs6leCkiS3sbM2TcG/RnZJuviTKA16mRmC4Bu/xGqwRITCN+uj0iZ2
   xwWGvaGcWjkLeLmnJHmXacyrGJF6s6Ejz/1oqNG7WGYCXa8fYGt8RlE8h
   PsOiG3Cj6xxiL5dgpTT+zGklhj1SWu8TaAo2dsCu8mvv/MRb9vAPJXEUL
   A0M8k8zTDOPlbloEHM/P8fjxxlzJSMxrVeXJSoePpi+9A2d0fhUCQeYVB
   A==;
X-CSE-ConnectionGUID: z+9py+CBTZyRefjlAAZz0g==
X-CSE-MsgGUID: 0lFuLqN8SRWxYo+v00sapw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82940722"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="82940722"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:31:52 -0800
X-CSE-ConnectionGUID: 6A0Qg0mbTdCxnQT9PZatdA==
X-CSE-MsgGUID: R597KUHSRVm/7oIYP81WLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="218023503"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2026 15:31:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr2dY-00000000vuA-1nmR;
	Fri, 13 Feb 2026 23:31:48 +0000
Date: Sat, 14 Feb 2026 07:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 16/19]
 drivers/hwspinlock/hwspinlock_core.c:531:7: warning: assignment to 'struct
 hwspinlock_device *' from 'int' makes pointer from integer without a cast
Message-ID: <202602140708.jbb9K1TT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   661496e362d06c7579ec2f4001cebf7d520ef601
commit: ac5e31c8eab290f8d5b4f5200025c5a538b3c65b [16/19] core: core allocates bank
config: m68k-randconfig-r073-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140708.jbb9K1TT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140708.jbb9K1TT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140708.jbb9K1TT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwspinlock/hwspinlock_core.c: In function 'hwspin_lock_register':
   drivers/hwspinlock/hwspinlock_core.c:531:9: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
     bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
            ^~~~~~~
            xa_alloc
>> drivers/hwspinlock/hwspinlock_core.c:531:7: warning: assignment to 'struct hwspinlock_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
          ^
   drivers/hwspinlock/hwspinlock_core.c:564:2: error: implicit declaration of function 'kfree'; did you mean 'ida_free'? [-Werror=implicit-function-declaration]
     kfree(bank);
     ^~~~~
     ida_free
   cc1: some warnings being treated as errors


vim +531 drivers/hwspinlock/hwspinlock_core.c

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
   564		kfree(bank);
   565		return ERR_PTR(ret);
   566	}
   567	EXPORT_SYMBOL_GPL(hwspin_lock_register);
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
