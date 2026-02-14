Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59C53EBF3A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 00:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771027976; cv=none; b=LQ/ncVky64zL/iOcMVaNHo3lgxbVNu1H+dVHVJs2c8EGqfVrdyndtkZxxLw0oXsxnc8W3tiVrudTX/GwNaAbusRElVxwNKDhuMiutmo68aMjik50ZX9JOky/cFbgxcIjeqIzbFujz+qzLNB8a/SC5X76UpsS30l9vcEwtH0hFBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771027976; c=relaxed/simple;
	bh=HWQ1w2bzxj+fGlgxGMuE9iwvPVKMSIHV/8pawRsUr+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S4tcpnxpzbFR3dLTDgaNAbjzelqrv5/9wZVS9OAu5ZWLVWVQfB1uzmSnW5ELyshWPv3lLf8cubyk5fi2QQhzBQhegqRofCETVLFtsEkEtfO0uWSZpcPsrsLjuIkZPhbK4+8yZpkdN/RV6Bk9u/BrsruPlK8e7FYkT4kuaT22644=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xb5T5qFQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xb5T5qFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771027975; x=1802563975;
  h=date:from:to:cc:subject:message-id;
  bh=HWQ1w2bzxj+fGlgxGMuE9iwvPVKMSIHV/8pawRsUr+M=;
  b=Xb5T5qFQdFmkgodXMN/6W0E0yWJENYec34lvqxBQzrV93N8EoiCg654X
   XFzA2lIaExpKAG/dCO5VuOO/R42mZUTRj6dmFm7G5/9J6yIQuKY8pR6zx
   uMvhujudxvKIEjpW8nTSRADZ/VV0xZTg+hXJqZmmopXd2TcT4cjE/CNHG
   S2tRL0qqtqf4+JSf0uErBG5LjUZ1cmHkMGBnf0NRzy950KH6ey7DRVx1L
   qlyPbWl/2Ov14gr0t4CfLq/OEHTPrcthYiK6mJsX7NMb6XvJAWplC5jCw
   41rpjmZiSAmU2mSxI7AnD9rEevuI3fA/rDhg6CnXIDXl8U6G89fkBsVOr
   g==;
X-CSE-ConnectionGUID: 67Fdd+uzRgG+nNmot70Ibg==
X-CSE-MsgGUID: DQVCueI0TOuwtcY2x9tP7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71927653"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="71927653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 16:12:54 -0800
X-CSE-ConnectionGUID: tokNkuQjTOGBtKfgW/FlJg==
X-CSE-MsgGUID: xCCEKpN8QX+UeNkbRoBENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="217563281"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2026 16:12:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr3HG-00000000vwa-3OFh;
	Sat, 14 Feb 2026 00:12:50 +0000
Date: Sat, 14 Feb 2026 08:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 16/19]
 drivers/hwspinlock/hwspinlock_core.c:531:16: error: implicit declaration of
 function 'kzalloc'
Message-ID: <202602140823.7MZA6CDy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   661496e362d06c7579ec2f4001cebf7d520ef601
commit: ac5e31c8eab290f8d5b4f5200025c5a538b3c65b [16/19] core: core allocates bank
config: i386-randconfig-141-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140823.7MZA6CDy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140823.7MZA6CDy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140823.7MZA6CDy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwspinlock/hwspinlock_core.c: In function 'hwspin_lock_register':
>> drivers/hwspinlock/hwspinlock_core.c:531:16: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     531 |         bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
         |                ^~~~~~~
>> drivers/hwspinlock/hwspinlock_core.c:531:14: error: assignment to 'struct hwspinlock_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     531 |         bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
         |              ^
>> drivers/hwspinlock/hwspinlock_core.c:564:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     564 |         kfree(bank);
         |         ^~~~~


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
