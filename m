Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD20191F7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534970; cv=none; b=H3dUqqknQiNHjVe0HbTmJuga5FvGTcgjQ+QPxYvj/BZ8nH8jbSYXH3KUWNaKGEK9GWRg8pKCE8zM4A8ZVaBVzTdcOlHLeAdx1BERSJ0GfcBsEyS4w2NkaEsXLWBE0dPNktcuJQaXHr7KunF1zw1MpwBiFajv9dkcoBcsBv/UtNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534970; c=relaxed/simple;
	bh=TYHRySzW/0D00N6mA0pYJ7hP8b8aDylk5z1d9zA+k4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R78ZXOnR5Ra4yHH0ehUfH496rme5T+DRFHS3EFurFppl5YHCu45j4CvL9k8cMzDQ2PD5wruJXEAqS3j03rD4/TY/LO9CORN4YmQvKXOP4kBneeVjr4R3I3sOOn/qongHrQ+j/pPj4gLmnGRsc2NQU597Upa9KbBdYndrH1ZHWdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnPaHvgu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnPaHvgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732534969; x=1764070969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TYHRySzW/0D00N6mA0pYJ7hP8b8aDylk5z1d9zA+k4I=;
  b=BnPaHvgurxWU6I1Q6PVpGFSaWldRvw0AXk8BfmgxGyU73Zw6c5HOPoGc
   scYW6FUXVuxyMg6AfUCCFd716ZwGrs6JackPtZbfIOAXchIr6FtYsms8Z
   9CgGb2J1CN557QtlY5Xb3unAO/QpL/N4viPh8oeBtyCHeaXLspzl1xncv
   cygRU5Gxt4fzhhGbMVUPb4WG7aFraTU6RmMwczkTSqAVzkQH8P6NEchuU
   w4jPAgtAdbDcuudvmzKDuZrqc+eRm7YuHIZi+J48KYKs6x7MhsYw4mqDm
   BvbKlrk/Y4pp9rlngfbPA9u3QAbOwUlxpZ2d3EzcaQ6VOw3P3gfy3sgAS
   w==;
X-CSE-ConnectionGUID: qrrwmio0St+3gfmxCvAMAA==
X-CSE-MsgGUID: N11oQFWrSeeApYZwJbVbNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43699111"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43699111"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:42:48 -0800
X-CSE-ConnectionGUID: 4qiSjg44QsWu8XJL3hfdvQ==
X-CSE-MsgGUID: NRO0MayMTqCyy+kAU2HYtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="95654007"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2024 03:42:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFXUK-0006GJ-0l;
	Mon, 25 Nov 2024 11:42:44 +0000
Date: Mon, 25 Nov 2024 19:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.cred 1/27] fs/cachefiles/internal.h:396:63:
 sparse: sparse: incorrect type in argument 1 (different modifiers)
Message-ID: <202411251906.JGdyJN0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.cred
head:   a617a3cb721d5c4fdc88889c7d80936831efe7df
commit: 52ef01ce9c2dafcc67b4657dd2991d097ab2f0a7 [1/27] tree-wide: s/override_creds()/override_creds_light(get_new_cred())/g
config: x86_64-randconfig-121-20241125 (https://download.01.org/0day-ci/archive/20241125/202411251906.JGdyJN0g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251906.JGdyJN0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251906.JGdyJN0g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/cachefiles/cache.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/cache.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
   fs/cachefiles/cache.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/cache.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/cachefiles/interface.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/interface.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
   fs/cachefiles/interface.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/interface.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
   fs/cachefiles/interface.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/interface.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/cachefiles/daemon.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/daemon.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
   fs/cachefiles/daemon.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/daemon.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/cachefiles/io.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/io.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
   fs/cachefiles/io.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/io.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
   fs/cachefiles/io.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/io.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
   fs/cachefiles/io.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/io.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/cachefiles/namei.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/namei.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/cachefiles/security.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/security.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
   fs/cachefiles/security.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/security.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/cachefiles/volume.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/volume.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/cachefiles/xattr.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/xattr.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/cachefiles/ondemand.c: note: in included file:
>> fs/cachefiles/internal.h:396:63: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct cred *cred @@     got struct cred const *cache_cred @@
   fs/cachefiles/internal.h:396:63: sparse:     expected struct cred *cred
   fs/cachefiles/internal.h:396:63: sparse:     got struct cred const *cache_cred
   fs/cachefiles/ondemand.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred

vim +396 fs/cachefiles/internal.h

   384	
   385	/*
   386	 * security.c
   387	 */
   388	extern int cachefiles_get_security_ID(struct cachefiles_cache *cache);
   389	extern int cachefiles_determine_cache_security(struct cachefiles_cache *cache,
   390						       struct dentry *root,
   391						       const struct cred **_saved_cred);
   392	
   393	static inline void cachefiles_begin_secure(struct cachefiles_cache *cache,
   394						   const struct cred **_saved_cred)
   395	{
 > 396		*_saved_cred = override_creds_light(get_new_cred(cache->cache_cred));
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
