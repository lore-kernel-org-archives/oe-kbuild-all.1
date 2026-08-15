Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082839479B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 23:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786837096; cv=none; b=JX2mx8tVkx5JzOO+FU4ZBatfszVsfde/rpY8olYrtjZL/78GswYr31eHHnOy8sKdKkVF5ZJC7UtyxU2tulY+aSJm/g9Ayjx++5N2CKQ/piH3q6Jmab9pKXPhTejWLDBik8y5DmbAxeJ/ijz0AE44rrG9Y3ZkPpqaY4t9JaiAgKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786837096; c=relaxed/simple;
	bh=chvM42BNNf2BM8vcQ7C/u4EAKMJgmbaVdqRapYBQcTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pz3cAj1qFilfe73ko22ceNQScGqcxFsm8VYUiQmu7Yf0W2JL7oU9yjhT411pcyUWHXefY38j4vbwAJhmhGhu+lz9UfZCK3dh5Zo93UlbQPfdyqH92v2hhPcujyMtIxGpvdlQrDMUS4OcV2XF7cxOkL7Z2q4srxvpwzo3QcvIcOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHcKucDy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHcKucDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786837094; x=1818373094;
  h=date:from:to:cc:subject:message-id;
  bh=chvM42BNNf2BM8vcQ7C/u4EAKMJgmbaVdqRapYBQcTE=;
  b=ZHcKucDyyLboNRs7ZHcj+QSMwOiJd/qWEU2CRXBMi8MWfNVWTj3IORZ/
   +reI6zirFDQUVaxUqURI6yULxMYeSX9hhLTKFpMk2OE3Fx9Ik9Y8JllHj
   7HscRqD4dK7kC9BtMWIf7X88jv02Eh+r8W2cmmvgnOdwS4p8TFRpYkocb
   tsZ96RXiBhlEHz8Y0X8pX5lmcuvrHx1ZYK8gsDT9BQ4UHttb5ySNHicq8
   cTcB+8Z0AWJqoipKHsv9PRywXYWmt6rtfDG5ryNUdKh1YU07kRjH/aymE
   Lk0bLsRE40TDJSbo9jzKpPK1Qck1hhrUOXfKjxSZiCez+u2xy/o6hH/tU
   Q==;
X-CSE-ConnectionGUID: zJttiNd+SVSx2D0boK83jw==
X-CSE-MsgGUID: hafnTJRNQxyNezmBmQe/2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="86484433"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="86484433"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 16:38:12 -0700
X-CSE-ConnectionGUID: 1jowM+qDSL6NoZg/9oSPuA==
X-CSE-MsgGUID: Ne9k6I4LTdGJOQGnSDpKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="266550027"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2026 16:38:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvNx1-00000000cWm-4C1y;
	Sat, 15 Aug 2026 23:38:08 +0000
Date: Sun, 16 Aug 2026 07:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [tip:locking/urgent 1/1] kernel/futex/core.c:1870:21:
 sparse: sparse: cast removes address space '__percpu' of expression
Message-ID: <202608160702.gsnEjcvu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/urgent
head:   4f664e37fe72ab21426d2d74fcbcf7399e8fc52c
commit: 4f664e37fe72ab21426d2d74fcbcf7399e8fc52c [1/1] futex: Fix race on the initial mm->futex.phash.ref allocation
config: riscv-randconfig-r134-20260816 (https://download.01.org/0day-ci/archive/20260816/202608160702.gsnEjcvu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160702.gsnEjcvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160702.gsnEjcvu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   kernel/futex/core.c:536:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:536:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:536:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:536:51: sparse:     got void *
   kernel/futex/core.c:552:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:552:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:552:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:552:51: sparse:     got void *
>> kernel/futex/core.c:1870:21: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +1870 kernel/futex/core.c

  1836	
  1837	static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
  1838	{
  1839		struct mm_struct *mm = current->mm;
  1840		struct futex_private_hash *fph;
  1841		bool custom = flags & FH_CUSTOM;
  1842		int i;
  1843	
  1844		if (hash_slots && (hash_slots == 1 || !is_power_of_2(hash_slots)))
  1845			return -EINVAL;
  1846	
  1847		/*
  1848		 * Once we've disabled the global hash there is no way back.
  1849		 */
  1850		scoped_guard(rcu) {
  1851			fph = rcu_dereference(mm->futex.phash.hash);
  1852			if (fph && !fph->hash_mask) {
  1853				if (custom)
  1854					return -EBUSY;
  1855				return 0;
  1856			}
  1857		}
  1858	
  1859		if (!mm->futex.phash.ref) {
  1860			unsigned int __percpu *ref = alloc_percpu(unsigned int);
  1861	
  1862			if (!ref)
  1863				return -ENOMEM;
  1864	
  1865			/*
  1866			 * Tasks sharing the mm can run this concurrently, so take the
  1867			 * initial reference before publishing the counter.
  1868			 */
  1869			this_cpu_inc(*ref); /* 0 -> 1 */
> 1870			if (cmpxchg(&mm->futex.phash.ref, NULL, ref))
  1871				free_percpu(ref);
  1872		}
  1873	
  1874		fph = kvzalloc(struct_size(fph, queues, hash_slots),
  1875			       GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
  1876		if (!fph)
  1877			return -ENOMEM;
  1878	
  1879		fph->hash_mask = hash_slots ? hash_slots - 1 : 0;
  1880		fph->custom = custom;
  1881		fph->mm = mm;
  1882	
  1883		for (i = 0; i < hash_slots; i++)
  1884			futex_hash_bucket_init(&fph->queues[i]);
  1885	
  1886		if (custom) {
  1887			/*
  1888			 * Only let prctl() wait / retry; don't unduly delay clone().
  1889			 */
  1890	again:
  1891			wait_var_event(mm, futex_pivot_pending(mm));
  1892		}
  1893	
  1894		scoped_guard(mutex, &mm->futex.phash.lock) {
  1895			struct futex_private_hash *free __free(kvfree) = NULL;
  1896			struct futex_private_hash *cur, *new;
  1897	
  1898			cur = rcu_dereference_protected(mm->futex.phash.hash,
  1899							lockdep_is_held(&mm->futex.phash.lock));
  1900			new = mm->futex.phash.hash_new;
  1901			mm->futex.phash.hash_new = NULL;
  1902	
  1903			if (fph) {
  1904				if (cur && !cur->hash_mask) {
  1905					/*
  1906					 * If two threads simultaneously request the global
  1907					 * hash then the first one performs the switch,
  1908					 * the second one returns here.
  1909					 */
  1910					free = fph;
  1911					mm->futex.phash.hash_new = new;
  1912					return -EBUSY;
  1913				}
  1914				if (cur && !new) {
  1915					/*
  1916					 * If we have an existing hash, but do not yet have
  1917					 * allocated a replacement hash, drop the initial
  1918					 * reference on the existing hash.
  1919					 */
  1920					futex_ref_drop(cur);
  1921				}
  1922	
  1923				if (new) {
  1924					/*
  1925					 * Two updates raced; throw out the lesser one.
  1926					 */
  1927					if (futex_hash_less(new, fph)) {
  1928						free = new;
  1929						new = fph;
  1930					} else {
  1931						free = fph;
  1932					}
  1933				} else {
  1934					new = fph;
  1935				}
  1936				fph = NULL;
  1937			}
  1938	
  1939			if (new) {
  1940				/*
  1941				 * Will set mm->futex.phash.new_hash on failure;
  1942				 * futex_private_hash_get() will try again.
  1943				 */
  1944				if (!__futex_pivot_hash(mm, new) && custom)
  1945					goto again;
  1946			}
  1947		}
  1948		return 0;
  1949	}
  1950	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
