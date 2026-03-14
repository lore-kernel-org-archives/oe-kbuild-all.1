Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773A3806C6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518898; cv=none; b=cIUfTYwPmYiN4nCdy/IPCzG5ezWao65kJZzPEiErkKY8/n6WA5VwHlghXNAa/WCsjPN305l63t3tOZA/TiUa4aPV9FcAzOoXvUw7STaSdSPTQ2ZqDQ82Y9+nLCgNBm0MvuT3fT95pEPqKl9OFVkp7tXfzMhc2t9ZYPUuk6E2HSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518898; c=relaxed/simple;
	bh=mBZM53Sd42xlZZTNdKMXYCXd4DocLDS4V19UR4HWBfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UnbBCBskyEX0ssSCPXus+KgT6BwQWhprYTlC9K4b7cUhf3Dtu1ePhBncq7/4XNDjglTodkmSlA+MHh2nojzYRBlw+/LhJ0QwHVrOYF436ezZwTf/azrQTkEfYOylYyoK77ojt5KE3kHrvhD2fGl6hZloLgbeSOiK0jJShQLQWZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDK0TCxR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDK0TCxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773518896; x=1805054896;
  h=date:from:to:cc:subject:message-id;
  bh=mBZM53Sd42xlZZTNdKMXYCXd4DocLDS4V19UR4HWBfQ=;
  b=CDK0TCxRSTqpJ8CAXXu7DLwwycHpun+u3Hn7ppTe0fcAVxmryjVkyU/r
   L/k8VkOUAG/gNuqTFHw6GgLDdNhNxKjFYHQtDVkrJ5X7NjnuaiXDg8rr6
   V/Cmn4riuPUfe+iGlT/nAmNlnEKwKD4TY8RUMyAPNSGZZPyGL+e6oTl1I
   brEjUuUfdIBhDm28tOUV+3dT5xXSho/Pi+/0yfgZSpeotdvdG+xYYhkPU
   24kjM2FoQJmx5XPddm2dTBFt9u60TB0MjRtsBPQFZU3lOSN/92qDj5y4i
   2c1i3iAHsYPm4ZC9pogTir/uGmPG8P4dosB6yr9wxFPOwHRoCZVIN9UF+
   w==;
X-CSE-ConnectionGUID: 2JaLYdc9RMiXU8mQgEal9A==
X-CSE-MsgGUID: 5kB06jCRTc6cJxkpnrHhDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="84907289"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="84907289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 13:08:16 -0700
X-CSE-ConnectionGUID: sC+GyvW9QB+4SRBZ+2+6iw==
X-CSE-MsgGUID: tbVGIdKnQTGuGslvFOxPQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="220735046"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Mar 2026 13:08:14 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1VHO-000000005gp-41XI;
	Sat, 14 Mar 2026 20:08:10 +0000
Date: Sun, 15 Mar 2026 04:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Xiubo Li <xiubli@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>, Jeff Layton <jlayton@kernel.org>
Subject: include/linux/list.h:74:19: warning: storing the address of
 local variable 'realm_queue' in '*&realm_24(D)->rebuild_item.prev'
Message-ID: <202603150451.HnobCkPK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80234b5ab240f52fa45d201e899e207b9265ef91
commit: 74a31df4f1f16807a93e414a322baf6eceddb60d ceph: eliminate the recursion when rebuilding the snap context
date:   4 years ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260315/202603150451.HnobCkPK-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603150451.HnobCkPK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603150451.HnobCkPK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from fs/ceph/snap.c:5:
   In function '__list_add',
       inlined from 'list_add_tail' at include/linux/list.h:102:2,
       inlined from 'rebuild_snap_realms' at fs/ceph/snap.c:429:2:
>> include/linux/list.h:74:19: warning: storing the address of local variable 'realm_queue' in '*&realm_24(D)->rebuild_item.prev' [-Wdangling-pointer=]
      74 |         new->prev = prev;
         |         ~~~~~~~~~~^~~~~~
   fs/ceph/snap.c: In function 'rebuild_snap_realms':
   fs/ceph/snap.c:425:19: note: 'realm_queue' declared here
     425 |         LIST_HEAD(realm_queue);
         |                   ^~~~~~~~~~~
   include/linux/list.h:26:26: note: in definition of macro 'LIST_HEAD'
      26 |         struct list_head name = LIST_HEAD_INIT(name)
         |                          ^~~~
   fs/ceph/snap.c:422:57: note: 'realm' declared here
     422 | static void rebuild_snap_realms(struct ceph_snap_realm *realm,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~


vim +74 include/linux/list.h

d7c816733d501b Kees Cook        2016-08-17  58  
^1da177e4c3f41 Linus Torvalds   2005-04-16  59  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  60   * Insert a new entry between two known consecutive entries.
^1da177e4c3f41 Linus Torvalds   2005-04-16  61   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  62   * This is only for internal list manipulation where we know
^1da177e4c3f41 Linus Torvalds   2005-04-16  63   * the prev/next entries already!
^1da177e4c3f41 Linus Torvalds   2005-04-16  64   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  65  static inline void __list_add(struct list_head *new,
^1da177e4c3f41 Linus Torvalds   2005-04-16  66  			      struct list_head *prev,
^1da177e4c3f41 Linus Torvalds   2005-04-16  67  			      struct list_head *next)
^1da177e4c3f41 Linus Torvalds   2005-04-16  68  {
d7c816733d501b Kees Cook        2016-08-17  69  	if (!__list_add_valid(new, prev, next))
d7c816733d501b Kees Cook        2016-08-17  70  		return;
d7c816733d501b Kees Cook        2016-08-17  71  
^1da177e4c3f41 Linus Torvalds   2005-04-16  72  	next->prev = new;
^1da177e4c3f41 Linus Torvalds   2005-04-16  73  	new->next = next;
^1da177e4c3f41 Linus Torvalds   2005-04-16 @74  	new->prev = prev;
1c97be677f72b3 Paul E. McKenney 2015-09-20  75  	WRITE_ONCE(prev->next, new);
^1da177e4c3f41 Linus Torvalds   2005-04-16  76  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  77  

:::::: The code at line 74 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
