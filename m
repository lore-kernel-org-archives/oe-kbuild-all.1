Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688481DDA3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 05:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740980413; cv=none; b=Iw2KDt+K42MD78o6HDAGbsn0ges4nOa6fWsqey7cpeuuGZMG3VzSLB3wluNt6hY5j6U3Q+eYdbAGfpmZEK8CeaEE0IPyfywVaekLOCX3iqMFZHgX14HtvAlyW8N5Bz67ge4W9W2PwKn1VlTzeqTSR2Ujr+LlMZwZesW/i97oPTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740980413; c=relaxed/simple;
	bh=rYFtMHdDDHL+kxEWQoMx6d5+TFdJmIa6taOb/Vd500E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvOqDbyYvec2aNFxhZRNPIiBPcVcpgVgZ3x5tiR+V9Qyi+q6e+LW38tLPdcEdLTyauwg/WwBFdSLYDnS646YrohFAtJoWNANEBBYzKjIZfBXis4eo5RZ7BVVdPoOBjHe3mPZuWvA+q3i7yyKsSWTQcc1pgFQJRlV41voufSm26s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcpZ2diE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcpZ2diE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740980412; x=1772516412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rYFtMHdDDHL+kxEWQoMx6d5+TFdJmIa6taOb/Vd500E=;
  b=BcpZ2diEQcipl6iKFhZdpbdfZrfIG/YSI4GC2OjnmqWB8vszzWAQ1dQu
   8gdBgGfh0Imyfx0nxh2kjcUd6QKG3i8z7nW9CcfHlzzkLRVY9H8QvWpNx
   cJsgZyL1uICqoghSAQcQS52dQO6v55CHdzf+yy08P25RfiOdSqkFCH8SB
   7IglmQUcWNT97zPJm4EoOVy677sHUj0/oefSxFc9XZShMuDO4ETtlCool
   2g2IOVjK0K/MzUcVhakm2jDGDavYyhjgQkerFlg6ItN45m6NJKo8uP1tf
   S+G8WX8GiCvmb3jc80dpK5KILcOHA6qj/f1Snckpc/Q20cU8kyfPUWtYK
   A==;
X-CSE-ConnectionGUID: P85jaaTRT/GYBCvxB+G0cQ==
X-CSE-MsgGUID: 0qNqm6ufQpiyfimvoFaKxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="52823200"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="52823200"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 21:40:11 -0800
X-CSE-ConnectionGUID: qEUPki0gQbWoM43etF31zQ==
X-CSE-MsgGUID: LZIDrA3cSQqI3de1WCM0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148816293"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2025 21:40:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toyWZ-000Hyn-1F;
	Mon, 03 Mar 2025 05:39:53 +0000
Date: Mon, 3 Mar 2025 13:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 18/18] kernel/futex/core.c:1478:21:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202503031355.JHQnrBwe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   b37932a2988afdd932334774c6e7536f5f5e1f70
commit: b37932a2988afdd932334774c6e7536f5f5e1f70 [18/18] futex: Rework SET_SLOTS
config: arc-randconfig-r111-20250303 (https://download.01.org/0day-ci/archive/20250303/202503031355.JHQnrBwe-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250303/202503031355.JHQnrBwe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031355.JHQnrBwe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/core.c:195:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct futex_private_hash *fph @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:195:13: sparse:     expected struct futex_private_hash *fph
   kernel/futex/core.c:195:13: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
   kernel/futex/core.c:1396:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:1396:18: sparse:     expected void const *addr
   kernel/futex/core.c:1396:18: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
   kernel/futex/core.c:1406:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct rcuref_t [usertype] *ref @@     got struct rcuref_t [noderef] __rcu * @@
   kernel/futex/core.c:1406:32: sparse:     expected struct rcuref_t [usertype] *ref
   kernel/futex/core.c:1406:32: sparse:     got struct rcuref_t [noderef] __rcu *
>> kernel/futex/core.c:1478:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct futex_private_hash *cur @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:1478:21: sparse:     expected struct futex_private_hash *cur
   kernel/futex/core.c:1478:21: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
   kernel/futex/core.c:1489:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct futex_private_hash *fph @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:1489:58: sparse:     expected struct futex_private_hash *fph
   kernel/futex/core.c:1489:58: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
   kernel/futex/core.c:1617:58: sparse: sparse: Using plain integer as NULL pointer
   kernel/futex/core.c:832:9: sparse: sparse: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit
>> kernel/futex/core.c:1447:31: sparse: sparse: dereference of noderef expression

vim +1478 kernel/futex/core.c

  1432	
  1433	static int futex_hash_allocate(unsigned int hash_slots, bool custom)
  1434	{
  1435		struct mm_struct *mm = current->mm;
  1436		struct futex_private_hash *fph;
  1437		int i;
  1438	
  1439		if (hash_slots && (hash_slots == 1 || !is_power_of_2(hash_slots)))
  1440			return -EINVAL;
  1441	
  1442		/*
  1443		 * Once we've disabled the global hash there is no way back.
  1444		 */
  1445		scoped_guard (rcu) {
  1446			fph = rcu_dereference(mm->futex_phash);
> 1447			if (fph && !mm->futex_phash->hash_mask) {
  1448				if (custom)
  1449					return -EBUSY;
  1450				return 0;
  1451			}
  1452		}
  1453	
  1454		fph = kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT);
  1455		if (!fph)
  1456			return -ENOMEM;
  1457	
  1458		rcuref_init(&fph->users, 1);
  1459		fph->hash_mask = hash_slots ? hash_slots - 1 : 0;
  1460		fph->custom = custom;
  1461		fph->mm = mm;
  1462	
  1463		for (i = 0; i < hash_slots; i++)
  1464			futex_hash_bucket_init(&fph->queues[i], fph);
  1465	
  1466		if (custom) {
  1467			/*
  1468			 * Only let prctl() wait / retry; don't unduly delay clone().
  1469			 */
  1470	again:
  1471			wait_var_event(mm, futex_pivot_pending(mm));
  1472		}
  1473	
  1474		scoped_guard(mutex, &mm->futex_hash_lock) {
  1475			struct futex_private_hash *free __free(kvfree) = NULL;
  1476			struct futex_private_hash *cur, *new;
  1477	
> 1478			cur = mm->futex_phash;
  1479			new = mm->futex_phash_new;
  1480			mm->futex_phash_new = NULL;
  1481	
  1482			if (fph) {
  1483				if (cur && !new) {
  1484					/*
  1485					 * If we have an existing hash, but do not yet have
  1486					 * allocated a replacement hash, drop the initial
  1487					 * reference on the existing hash.
  1488					 */
  1489					futex_private_hash_put(mm->futex_phash);
  1490				}
  1491	
  1492				if (new) {
  1493					/*
  1494					 * Two updates raced; throw out the lesser one.
  1495					 */
  1496					if (futex_hash_less(new, fph)) {
  1497						free = new;
  1498						new = fph;
  1499					} else {
  1500						free = fph;
  1501					}
  1502				} else {
  1503					new = fph;
  1504				}
  1505				fph = NULL;
  1506			}
  1507	
  1508			if (new) {
  1509				/*
  1510				 * Will set mm->futex_phash_new on failure;
  1511				 * futex_get_private_hash() will try again.
  1512				 */
  1513				if (!__futex_pivot_hash(mm, new) && custom)
  1514					goto again;
  1515			}
  1516		}
  1517		return 0;
  1518	}
  1519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
