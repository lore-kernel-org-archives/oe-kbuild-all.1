Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0279E158528
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 02:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724208548; cv=none; b=mruG7WlrUhr4tyKtCIouUpfybQdkh/E1ED103aBhCNAmBvSG++pFVvLI9QNYzgSiN4mXJzDoYTHVk7I19/iXeirC+4TmxpMSL8jYRpl7wm572LEzpU5qHHHFzvPf7exhvJ3jdOyhDCLfpJHZO5W9bl8KG4X6nxjfz/kqpllpeZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724208548; c=relaxed/simple;
	bh=WRNnNtQ4/f0Xi0N6De7B8vlh6o7/Q9d2ELTPpMRIeOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIpngh5Fbr7PYwKbxs4GlM/v5lV6RQqo9tcq6DtoldBPMme96iKIRsPpVp9/3REYqksNfS4YHVC20R0+Sn6YEMDnDIhQXFhfNZ8gLczVnqm0rVdtoTB4RbjrNAtPjrf7kbs9v2yqNnabY3k7XxCLQxMYOTWJo9ddWD8ZCUzd+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F09co08o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F09co08o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724208546; x=1755744546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WRNnNtQ4/f0Xi0N6De7B8vlh6o7/Q9d2ELTPpMRIeOk=;
  b=F09co08oki0XNuaPF5e8qkNtEqX/+M/CCojsvjj9MhFa3hF+CjxW3B6Q
   FVkkpsvSVdLfpDjN7cGKFI5cDmRYEYwdvxXthaCdr7GBqfzu/wXlU5wuG
   cgDGhKs7VP85N3wHoNkF23Fqi0tqZN1GptDV09sk0rKIVTqTlaJLbqY7a
   ZyMnikrSh6TUo0uZH4ld4D7FUbhpIjh/qitVzIpkEJlzMMoSE00ZBH4jz
   qtjgh+pcHk8QnLjslZLdLBnhdec6oFmnIT3olYQJkm6Xcpo9gSUAcz2Bv
   tytPuxjCjc3oHg34CHuwoCOX0i/chbhDjaXxsUpxKr+CJo0E1H5Fz23qm
   g==;
X-CSE-ConnectionGUID: UjXmtwtbSjmMNj4KaJGr5g==
X-CSE-MsgGUID: x/0tbNdgSwWe9ARhmopesQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="45072732"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="45072732"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 19:49:03 -0700
X-CSE-ConnectionGUID: AFbCnKe2SnWWyl3PjZ7cvA==
X-CSE-MsgGUID: SUeLhlGiTYem9ayniD4DGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="60905046"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2024 19:49:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgbPA-000Aoo-0b;
	Wed, 21 Aug 2024 02:49:00 +0000
Date: Wed, 21 Aug 2024 10:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1980/7904]
 drivers/md/dm-user.c:525:6: warning: no previous prototype for function
 'message_kill'
Message-ID: <202408211029.3z0UqK43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   965c5bcac1fe560c973001599bd2364659dc788c
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1980/7904] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: i386-buildonly-randconfig-003-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211029.3z0UqK43-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211029.3z0UqK43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211029.3z0UqK43-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-user.c:525:6: warning: no previous prototype for function 'message_kill' [-Wmissing-prototypes]
     525 | void message_kill(struct message *m, mempool_t *pool)
         |      ^
   drivers/md/dm-user.c:525:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     525 | void message_kill(struct message *m, mempool_t *pool)
         | ^
         | static 
   drivers/md/dm-user.c:539:5: warning: no previous prototype for function 'target_poll' [-Wmissing-prototypes]
     539 | int target_poll(struct target *t)
         |     ^
   drivers/md/dm-user.c:539:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     539 | int target_poll(struct target *t)
         | ^
         | static 
   drivers/md/dm-user.c:544:6: warning: no previous prototype for function 'target_release' [-Wmissing-prototypes]
     544 | void target_release(struct kref *ref)
         |      ^
   drivers/md/dm-user.c:544:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     544 | void target_release(struct kref *ref)
         | ^
         | static 
   drivers/md/dm-user.c:565:6: warning: no previous prototype for function 'target_put' [-Wmissing-prototypes]
     565 | void target_put(struct target *t)
         |      ^
   drivers/md/dm-user.c:565:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     565 | void target_put(struct target *t)
         | ^
         | static 
>> drivers/md/dm-user.c:578:17: warning: no previous prototype for function 'channel_alloc' [-Wmissing-prototypes]
     578 | struct channel *channel_alloc(struct target *t)
         |                 ^
   drivers/md/dm-user.c:578:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     578 | struct channel *channel_alloc(struct target *t)
         | ^
         | static 
   drivers/md/dm-user.c:596:6: warning: no previous prototype for function 'channel_free' [-Wmissing-prototypes]
     596 | void channel_free(struct channel *c)
         |      ^
   drivers/md/dm-user.c:596:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     596 | void channel_free(struct channel *c)
         | ^
         | static 
   drivers/md/dm-user.c:181:30: warning: unused function 'target_from_miscdev' [-Wunused-function]
     181 | static inline struct target *target_from_miscdev(struct miscdevice *miscdev)
         |                              ^~~~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +/message_kill +525 drivers/md/dm-user.c

   524	
 > 525	void message_kill(struct message *m, mempool_t *pool)
   526	{
   527		m->bio->bi_status = BLK_STS_IOERR;
   528		bio_endio(m->bio);
   529		bio_put(m->bio);
   530		mempool_free(m, pool);
   531	}
   532	
   533	/*
   534	 * Returns 0 when there is no work left to do.  This must be callable without
   535	 * holding the target lock, as it is part of the waitqueue's check expression.
   536	 * When called without the lock it may spuriously indicate there is remaining
   537	 * work, but when called with the lock it must be accurate.
   538	 */
   539	int target_poll(struct target *t)
   540	{
   541		return !list_empty(&t->to_user) || t->dm_destroyed;
   542	}
   543	
   544	void target_release(struct kref *ref)
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
 > 578	struct channel *channel_alloc(struct target *t)
   579	{
   580		struct channel *c;
   581	
   582		lockdep_assert_held(&t->lock);
   583	
   584		c = kzalloc(sizeof(*c), GFP_KERNEL);
   585		if (c == NULL)
   586			return NULL;
   587	
   588		kref_get(&t->references);
   589		c->target = t;
   590		c->cur_from_user = &c->scratch_message_from_user;
   591		mutex_init(&c->lock);
   592		INIT_LIST_HEAD(&c->from_user);
   593		return c;
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
