Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C90140363
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561820; cv=none; b=pD35dlz8AE1LbWZrsM3zCD5tr48Ij3mwOKtwsoTnVPS0SA7eL0KSCArSjSn2Nc0eiDgWWCSZRsCifO2eQRxq3pJ7wDhz5qBJJStRMAlwXKjfjPrN9dmhazXOqC3huByVzY2u371/Ir4KIDoutmSWsQG7RhS5D9Dqq1qLyksFKoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561820; c=relaxed/simple;
	bh=oMLYOyBhQSYdN06gsza6YIxixLrJCFBllEQfR3+I3cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/xGVCjEWvjzavtbaSlaVwpSAYTehseS1jA5IIREkoSUnEDyKCaRugpYdrn2qF7ax7C7/kJ886NWZ2kEWm4bZD0Loc17/DQ8ppbGD+TIx3T2sriqTJhHmgILoWB8aCvPrXKkfcJFZ+yosY5xqf4KW0RH57ThpGVS5M5eed6DWdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ch3Y3Kt/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ch3Y3Kt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719561819; x=1751097819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oMLYOyBhQSYdN06gsza6YIxixLrJCFBllEQfR3+I3cQ=;
  b=ch3Y3Kt/30GrMjK0rBugqhydHWSSAhdn+BBg5vcIjRNNUIb4/uz61qkK
   Lm/QjGMn/FzEX5WhQ6+r8h1uxb4z0715lbM14GJgJC14AFtXbM2W98HXp
   QL6wRUB/A6UeguHc154hPTK+DtJrkwK6ItZTvmJDNLJYmH4qUc0WA1Epr
   OIEdcRnmOCko2+0tyz/78Zpl593VHOTeMs/KpVMs7uswIfZJIHaDYTZ70
   j+i255vb700HVjdCpwf6l5MFVQ0C6VVtv5/BYhlkpc2sIdg0B0+5H1OKe
   Rfy0reyhC+7K60xevZ9eolZZbYyYf+8ZglgIpbjrMfkJLlWs30FeFKeOh
   A==;
X-CSE-ConnectionGUID: PkDqgYTTRgqasoocBwM0EA==
X-CSE-MsgGUID: UDF1ptbqRomDuQOXoCNvBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27323377"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="27323377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 01:03:38 -0700
X-CSE-ConnectionGUID: 374phvE4T0qftEcMT/6G7w==
X-CSE-MsgGUID: st7fM4J+SzqNiSZyFMVDZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="45313280"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jun 2024 01:03:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN6Zz-000GuI-0I;
	Fri, 28 Jun 2024 08:03:35 +0000
Date: Fri, 28 Jun 2024 16:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:rosebush 2/5] lib/rosebush.c:56:46: error:
 'spinlock_t' {aka 'struct spinlock'} has no member named 'dep_map'
Message-ID: <202406281549.oF7mq1M2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache rosebush
head:   7a7ecd4f2b493425b64377e6293c81b06e7cc8ea
commit: 7126d5cc921de485e55c313a280c88622f3a337b [2/5] rosebush: Add new data structure
config: x86_64-buildonly-randconfig-001-20240628 (https://download.01.org/0day-ci/archive/20240628/202406281549.oF7mq1M2-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281549.oF7mq1M2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281549.oF7mq1M2-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/rosebush.c: In function 'rbh_first':
>> lib/rosebush.c:56:46: error: 'spinlock_t' {aka 'struct spinlock'} has no member named 'dep_map'
      56 |                 "rbh", (rbh)->rbh_resize_lock.dep_map.key, LD_WAIT_SPIN)
         |                                              ^
   lib/rosebush.c:139:9: note: in expansion of macro 'bucket_lock_init'
     139 |         bucket_lock_init(rbh, &table->buckets[0]);
         |         ^~~~~~~~~~~~~~~~
>> lib/rosebush.c:56:46: error: 'spinlock_t' {aka 'struct spinlock'} has no member named 'dep_map'
      56 |                 "rbh", (rbh)->rbh_resize_lock.dep_map.key, LD_WAIT_SPIN)
         |                                              ^
   lib/rosebush.c:142:9: note: in expansion of macro 'bucket_lock_init'
     142 |         bucket_lock_init(rbh, &table->buckets[1]);
         |         ^~~~~~~~~~~~~~~~
   lib/rosebush.c: In function 'copy_initial_buckets':
>> lib/rosebush.c:56:46: error: 'spinlock_t' {aka 'const struct spinlock'} has no member named 'dep_map'
      56 |                 "rbh", (rbh)->rbh_resize_lock.dep_map.key, LD_WAIT_SPIN)
         |                                              ^
   lib/rosebush.c:167:9: note: in expansion of macro 'bucket_lock_init'
     167 |         bucket_lock_init(rbh, bucket);
         |         ^~~~~~~~~~~~~~~~
>> lib/rosebush.c:56:46: error: 'spinlock_t' {aka 'const struct spinlock'} has no member named 'dep_map'
      56 |                 "rbh", (rbh)->rbh_resize_lock.dep_map.key, LD_WAIT_SPIN)
         |                                              ^
   lib/rosebush.c:172:9: note: in expansion of macro 'bucket_lock_init'
     172 |         bucket_lock_init(rbh, bucket);
         |         ^~~~~~~~~~~~~~~~
   lib/rosebush.c: In function 'bucket_copy':
>> lib/rosebush.c:56:46: error: 'spinlock_t' {aka 'const struct spinlock'} has no member named 'dep_map'
      56 |                 "rbh", (rbh)->rbh_resize_lock.dep_map.key, LD_WAIT_SPIN)
         |                                              ^
   lib/rosebush.c:262:9: note: in expansion of macro 'bucket_lock_init'
     262 |         bucket_lock_init(rbh, buckets[0]);
         |         ^~~~~~~~~~~~~~~~
>> lib/rosebush.c:56:46: error: 'spinlock_t' {aka 'const struct spinlock'} has no member named 'dep_map'
      56 |                 "rbh", (rbh)->rbh_resize_lock.dep_map.key, LD_WAIT_SPIN)
         |                                              ^
   lib/rosebush.c:265:9: note: in expansion of macro 'bucket_lock_init'
     265 |         bucket_lock_init(rbh, buckets[1]);
         |         ^~~~~~~~~~~~~~~~


vim +56 lib/rosebush.c

    45	
    46	/*
    47	 * As far as lockdep is concerned, all buckets in the same rosebush use
    48	 * the same lock.  We use the classes to distinguish the rbh resize lock
    49	 * from the bucket locks.  The only time we take two bucket locks is
    50	 * when we already hold the resize lock, so there is no need to define
    51	 * an order between bucket locks.
    52	 */
    53	#ifdef CONFIG_DEBUG_SPINLOCK
    54	#define bucket_lock_init(rbh, bucket)					\
    55		__raw_spin_lock_init(spinlock_check(&(bucket)->rbh_lock),	\
  > 56			"rbh", (rbh)->rbh_resize_lock.dep_map.key, LD_WAIT_SPIN)
    57	#else
    58	#define bucket_lock_init(rbh, bucket)					\
    59		spin_lock_init(&(bucket)->rbh_lock)
    60	#endif
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
