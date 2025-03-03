Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9F13A3F7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 03:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740971954; cv=none; b=kMc6HD4KgyMA0v4u9SZB/xkqehuPhBrbYfWkv/tbnhn4Meuq+vbwPQ9nQ0VHyD7gmI4nXlYhqdPJFKbJZsh4haTbwyzGk2pe/yXY7Z/6H3F2AwlNKQO7Tf/97VCKs/Y1N5n9CHyNlicJdkxG48+TFUV+LMH7ifUcZ/2tY9QweIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740971954; c=relaxed/simple;
	bh=bGekzdwqgPEk5zrUQRIWHjCZAMNx+sOVBFYRtSMmbmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MaeUrZIyVcomreC1p89ynNhhpoPp7NEqJwb3J+55+aJBV3prKDB97McVoMqZ8Ip46VlSI9DM9lQAUx1wU3YOsp+i9BmDvJdLdM347Pl2cGUSiqRPnpO+hU1x62rvW8s5gw4gFJykXB0JxhlabRUrW21TnnqCQFKgeFzoUec3sq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXFLbUDr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXFLbUDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740971953; x=1772507953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGekzdwqgPEk5zrUQRIWHjCZAMNx+sOVBFYRtSMmbmA=;
  b=KXFLbUDrrcAGT/54TpAAALGyPudwfe69gJbE/d4sFkqpsv8i5VVkS0Tk
   BP7y4FKrBrCoVcZKpLkgyFChGTKe9+S1Q+vC5W7qqGXwz/Pps3pWUkPbn
   qRkX0NzAyEZjRTeSksYOoFUFlc9+afLm/LNf7/w+FZ9+RVeWjLz3ysdK5
   Bn63DHgNReHLqVa8iuS4A7sO8gCXWdpebnTbMobNorC6JQ983ggDgL00S
   pn1IFtR/K2MMQ3KkIpxIkoltjyBHM2X9E0PRHtNFZaRq7+Oq0ExwmBUe5
   SCbWU6xS1reG044zWuOKZP0guGLWJxv2MIxkYyejR7gIl2Xsw3lOy9pE/
   g==;
X-CSE-ConnectionGUID: YO0E1EStTqmfIMHb9HNd1w==
X-CSE-MsgGUID: oaU+x07vQViK+hVvKizykw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="45761591"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="45761591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 19:19:12 -0800
X-CSE-ConnectionGUID: b6Sno7zqRTaeJNYQ4MaOkw==
X-CSE-MsgGUID: s04uI0F7RrKWt2yEQJs0WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122012074"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2025 19:19:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1towKi-000HsH-2c;
	Mon, 03 Mar 2025 03:19:08 +0000
Date: Mon, 3 Mar 2025 11:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 17/18] kernel/futex/core.c:1446:50:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202503031149.k8qLAZoI-lkp@intel.com>
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
commit: 44bcbe5284e76b0a4b74d43190d136d0ec0cb471 [17/18] futex: Untangle and naming
config: arc-randconfig-r111-20250303 (https://download.01.org/0day-ci/archive/20250303/202503031149.k8qLAZoI-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250303/202503031149.k8qLAZoI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031149.k8qLAZoI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/core.c:193:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct futex_private_hash *fph @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:193:13: sparse:     expected struct futex_private_hash *fph
   kernel/futex/core.c:193:13: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
   kernel/futex/core.c:1402:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:1402:18: sparse:     expected void const *addr
   kernel/futex/core.c:1402:18: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
>> kernel/futex/core.c:1446:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct futex_private_hash *fph @@     got struct futex_private_hash [noderef] __rcu *futex_phash @@
   kernel/futex/core.c:1446:50: sparse:     expected struct futex_private_hash *fph
   kernel/futex/core.c:1446:50: sparse:     got struct futex_private_hash [noderef] __rcu *futex_phash
   kernel/futex/core.c:1563:58: sparse: sparse: Using plain integer as NULL pointer
   kernel/futex/core.c:838:9: sparse: sparse: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit

vim +1446 kernel/futex/core.c

  1404	
  1405	static int futex_hash_allocate(unsigned int hash_slots)
  1406	{
  1407		struct futex_private_hash *fph, *hb_tofree = NULL;
  1408		struct mm_struct *mm = current->mm;
  1409		size_t alloc_size;
  1410		int i;
  1411	
  1412		if (hash_slots == 0)
  1413			hash_slots = 16;
  1414		hash_slots = clamp(hash_slots, 2, futex_hashmask + 1);
  1415		if (!is_power_of_2(hash_slots))
  1416			hash_slots = rounddown_pow_of_two(hash_slots);
  1417	
  1418		if (unlikely(check_mul_overflow(hash_slots, sizeof(struct futex_hash_bucket),
  1419						&alloc_size)))
  1420			return -ENOMEM;
  1421	
  1422		if (unlikely(check_add_overflow(alloc_size, sizeof(struct futex_private_hash),
  1423						&alloc_size)))
  1424			return -ENOMEM;
  1425	
  1426		fph = kvmalloc(alloc_size, GFP_KERNEL_ACCOUNT);
  1427		if (!fph)
  1428			return -ENOMEM;
  1429	
  1430		rcuref_init(&fph->users, 1);
  1431		fph->hash_mask = hash_slots - 1;
  1432	
  1433		for (i = 0; i < hash_slots; i++)
  1434			futex_hash_bucket_init(&fph->queues[i], fph);
  1435	
  1436		scoped_guard(mutex, &mm->futex_hash_lock) {
  1437			if (mm->futex_phash && !mm->futex_phash_new) {
  1438				/*
  1439				 * If we have an existing hash, but do not yet have
  1440				 * allocated a replacement hash, drop the initial
  1441				 * reference on the existing hash.
  1442				 *
  1443				 * Ignore the return value; removal is serialized by
  1444				 * mm->futex_hash_lock which we currently hold.
  1445				 */
> 1446				futex_private_hash_put(mm->futex_phash);
  1447			}
  1448	
  1449			if (mm->futex_phash_new) {
  1450				/*
  1451				 * If we already have a replacement hash pending;
  1452				 * keep the larger hash.
  1453				 */
  1454				if (mm->futex_phash_new->hash_mask <= fph->hash_mask) {
  1455					hb_tofree = mm->futex_phash_new;
  1456				} else {
  1457					hb_tofree = fph;
  1458					fph = mm->futex_phash_new;
  1459				}
  1460				mm->futex_phash_new = NULL;
  1461			}
  1462	
  1463			/*
  1464			 * Will set mm->futex_phash_new on failure;
  1465			 * futex_get_private_hash() will try again.
  1466			 */
  1467			__futex_pivot_hash(mm, fph);
  1468		}
  1469		kvfree(hb_tofree);
  1470		return 0;
  1471	}
  1472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
