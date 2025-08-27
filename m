Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42B2E63C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756270891; cv=none; b=SDzxVXASkvXc1lCMU16xxhTNV3VqjxvAaW5G9T2dCtPe5Q648PEZit8Y/WvEkQ9RbOXZX3ea+Jiz6AQYGl1PZFLUpBz5LC8fL7ONFECzf5cF3xyZT8207K/dOwEMvwHX0syb2H0aETdMR1ovjCWaYdtcGCbBEBW19j7TPdUkMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756270891; c=relaxed/simple;
	bh=Qobk5sLlcHYIhlqCKPg/u3ELm1e/RpFvbTfDyUCQlZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tICb/ZdhIBAU9GKfDmh4mjua9f1Vs4BFySlHIm4fZH4NX3s/EMxrymPenCA8Lws9FdW0goz7Sqj5dzwiXr/ptKGW9LotosKmdIkAgaRMOO8kCyoEc5GKJntL5GbRRE+0fPI+fXrAJzw0f6x3zDPwFdVLBrAUVxB1t+Rl/kxjCck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ngk0gugv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ngk0gugv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756270888; x=1787806888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qobk5sLlcHYIhlqCKPg/u3ELm1e/RpFvbTfDyUCQlZE=;
  b=Ngk0gugv3+O/hTTWpW07scutCn7//5YJ4+C59rzEmgsEYKjtt/BVgKaP
   P2FYrGgZbJz+YtR1N7fYm3bR/ikA+ua1XcykxE1ulbyA5ZeGRwjf4YwPN
   N9qjtImGHParzWzKluuSFbdIr6WGxeOlCiuMQ6QC+/by3sXqKG0sxqGKs
   plEQ/4eXeD2s8D7XURjybwpeU33eLbJS15gGJ0BmHfjAaJs3NmSttu4WR
   ZRaQ3zNXuz2LorSgP7MGHger22Qqx3M2amAEadprIcXN8BdkzIoKsQNIV
   YpLTQm3wOVPlDCWqoKmrw4rWoYPdFFZuXvXgHba5fib0WeQp88Mh2YTIr
   g==;
X-CSE-ConnectionGUID: adPWXiw5Sc2fg0SstBweyw==
X-CSE-MsgGUID: RD+dc3KUTY61BED08X0ELw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58669327"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58669327"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 22:01:27 -0700
X-CSE-ConnectionGUID: cwkvsrm3SzmsQFWsdUVlew==
X-CSE-MsgGUID: 0JRv8MVER3OdkCIj/2ZG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169041642"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 26 Aug 2025 22:01:22 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur8Hd-0002ad-31;
	Wed, 27 Aug 2025 05:01:17 +0000
Date: Wed, 27 Aug 2025 07:00:34 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2] drivers/md/dm-user.c:539:5:
 warning: no previous prototype for function 'target_poll'
Message-ID: <202508270714.FU7A4hF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   456275f3e7f8f3b2be487c9f5b18c811bee029fc
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [2/2] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250827/202508270714.FU7A4hF8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508270714.FU7A4hF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508270714.FU7A4hF8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-user.c:525:6: warning: no previous prototype for function 'message_kill' [-Wmissing-prototypes]
     525 | void message_kill(struct message *m, mempool_t *pool)
         |      ^
   drivers/md/dm-user.c:525:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     525 | void message_kill(struct message *m, mempool_t *pool)
         | ^
         | static 
>> drivers/md/dm-user.c:539:5: warning: no previous prototype for function 'target_poll' [-Wmissing-prototypes]
     539 | int target_poll(struct target *t)
         |     ^
   drivers/md/dm-user.c:539:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     539 | int target_poll(struct target *t)
         | ^
         | static 
>> drivers/md/dm-user.c:544:6: warning: no previous prototype for function 'target_release' [-Wmissing-prototypes]
     544 | void target_release(struct kref *ref)
         |      ^
   drivers/md/dm-user.c:544:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     544 | void target_release(struct kref *ref)
         | ^
         | static 
>> drivers/md/dm-user.c:565:6: warning: no previous prototype for function 'target_put' [-Wmissing-prototypes]
     565 | void target_put(struct target *t)
         |      ^
   drivers/md/dm-user.c:565:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     565 | void target_put(struct target *t)
         | ^
         | static 
   drivers/md/dm-user.c:578:17: warning: no previous prototype for function 'channel_alloc' [-Wmissing-prototypes]
     578 | struct channel *channel_alloc(struct target *t)
         |                 ^
   drivers/md/dm-user.c:578:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     578 | struct channel *channel_alloc(struct target *t)
         | ^
         | static 
>> drivers/md/dm-user.c:596:6: warning: no previous prototype for function 'channel_free' [-Wmissing-prototypes]
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
   578	struct channel *channel_alloc(struct target *t)
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
 > 596	void channel_free(struct channel *c)
   597	{
   598		struct list_head *cur;
   599	
   600		lockdep_assert_held(&c->lock);
   601	
   602		/*
   603		 * There may be outstanding BIOs that have been given to userspace but
   604		 * have not yet been completed.  The channel has been shut down so
   605		 * there's no way to process the rest of those messages, so we just go
   606		 * ahead and error out the BIOs.  Hopefully whatever's on the other end
   607		 * can handle the errors.  One could imagine splitting the BIOs and
   608		 * completing as much as we got, but that seems like overkill here.
   609		 *
   610		 * Our only other options would be to let the BIO hang around (which
   611		 * seems way worse) or to resubmit it to userspace in the hope there's
   612		 * another channel.  I don't really like the idea of submitting a
   613		 * message twice.
   614		 */
   615		if (c->cur_to_user != NULL)
   616			message_kill(c->cur_to_user, &c->target->message_pool);
   617		if (c->cur_from_user != &c->scratch_message_from_user)
   618			message_kill(c->cur_from_user, &c->target->message_pool);
   619		list_for_each (cur, &c->from_user)
   620			message_kill(list_entry(cur, struct message, to_user),
   621				     &c->target->message_pool);
   622	
   623		mutex_lock(&c->target->lock);
   624		target_put(c->target);
   625		mutex_unlock(&c->lock);
   626		mutex_destroy(&c->lock);
   627		kfree(c);
   628	}
   629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
