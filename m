Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BFA2D94B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766591592; cv=none; b=Q63mabp7hMYBu2irIQ0M0IR+K1ZL3RCZY62upjbFXVb1L3a9Q+NZPO11i9O3eqxPeCUOClyqUc/g4RC9HZigGml856TUMrhSLyNyvXEnI2PxHvhXcOrLYWp/hkKyEsN379GlHwfAV38lln7GcLCxXr7TsTkRzaz56zDaiN8gIhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766591592; c=relaxed/simple;
	bh=BoH3wuxqc5mwuktt3XDZUbA6FH11akUNiCgj5J5+WKU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ex5V6+3+OqGQnqulqTfc3g1V2ztu/XdbEaS2dkRa2tWWTj+nF5nSF2srgB4DuZBHPFbmkjAoosKEU/jKPIczNdLZLghqeIqy4jHRl+Au67yeTMV2Vyv4Zut1eYpG3qLGDszxx/hu8wszBWutJEq2Gl7l5fEJFFmBxXG6Veebcnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkPF0N10; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkPF0N10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766591590; x=1798127590;
  h=date:from:to:cc:subject:message-id;
  bh=BoH3wuxqc5mwuktt3XDZUbA6FH11akUNiCgj5J5+WKU=;
  b=LkPF0N10oL7p4RoxwBW5VelfMGMdWQrLfZpeKIc9HuzRE0awy2szH/WA
   9GTcoSUsSYNGfb79k2hQ4YA09VJ/7NlkUa6FFck35FFwIQuFeMB7nY7Mi
   D163Or0maZleXfovwarQEGRBeWFwOAUNLLv9zDxPWMdJs7XXKW5CFAnyd
   kxZGz8PyzueXAr0rEEwjepdNqVIIBZd26SQhsGCqmOYe6a/+zRVBe2CnD
   G/wBG3aFQd8B7LjECx96Em9tTm8Xjrx+v6SeXkSLXT2Sdy88ox9Swdr0+
   oyyGJSx539IF2rzC+x3SVc7xGKDgZvpJgliR8orIDfV4Yke/wI6H0DMqX
   g==;
X-CSE-ConnectionGUID: C2jdZs/PTxSPq28jmYReXA==
X-CSE-MsgGUID: +3YoQVaMTxetZHadTQK8Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68322851"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="68322851"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 07:53:10 -0800
X-CSE-ConnectionGUID: SPGwmCeJTHyy1JdiPOau7g==
X-CSE-MsgGUID: cj2gFyxwS0GX6BonkoC8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="200072369"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Dec 2025 07:53:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYRAX-000000003DN-0aGb;
	Wed, 24 Dec 2025 15:53:00 +0000
Date: Wed, 24 Dec 2025 23:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1]
 drivers/md/dm-user.c:539:5: sparse: sparse: symbol 'target_poll' was not
 declared. Should it be static?
Message-ID: <202512242344.mfXXVwX3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [0/1] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: i386-randconfig-062-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242344.mfXXVwX3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242344.mfXXVwX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242344.mfXXVwX3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/dm-user.c:525:6: sparse: sparse: symbol 'message_kill' was not declared. Should it be static?
>> drivers/md/dm-user.c:539:5: sparse: sparse: symbol 'target_poll' was not declared. Should it be static?
>> drivers/md/dm-user.c:544:6: sparse: sparse: symbol 'target_release' was not declared. Should it be static?
>> drivers/md/dm-user.c:565:6: sparse: sparse: symbol 'target_put' was not declared. Should it be static?

vim +/target_poll +539 drivers/md/dm-user.c

   532	
   533	/*
   534	 * Returns 0 when there is no work left to do.  This must be callable without
   535	 * holding the target lock, as it is part of the waitqueue's check expression.
   536	 * When called without the lock it may spuriously indicate there is remaining
   537	 * work, but when called with the lock it must be accurate.
   538	 */
 > 539	int target_poll(struct target *t)
   540	{
   541		return !list_empty(&t->to_user) || t->dm_destroyed;
   542	}
   543	
 > 544	void target_release(struct kref *ref)
   545	{
   546		struct target *t = container_of(ref, struct target, references);
   547		struct list_head *cur;
   548	
   549		/*
   550		 * There may be outstanding BIOs that have not yet been given to
   551		 * userspace.  At this point there's nothing we can do about them, as
   552		 * there are and will never be any channels.
   553		 */
   554		list_for_each (cur, &t->to_user) {
   555			message_kill(list_entry(cur, struct message, to_user),
   556				     &t->message_pool);
   557		}
   558	
   559		mempool_exit(&t->message_pool);
   560		mutex_unlock(&t->lock);
   561		mutex_destroy(&t->lock);
   562		kfree(t);
   563	}
   564	
 > 565	void target_put(struct target *t)
   566	{
   567		/*
   568		 * This both releases a reference to the target and the lock.  We leave
   569		 * it up to the caller to hold the lock, as they probably needed it for
   570		 * something else.
   571		 */
   572		lockdep_assert_held(&t->lock);
   573	
   574		if (!kref_put(&t->references, target_release))
   575			mutex_unlock(&t->lock);
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
