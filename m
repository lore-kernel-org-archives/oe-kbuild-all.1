Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944510E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 May 2023 01:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684028121; x=1715564121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oFxf7pWfQW7M6ceJSnS4iWuxW06jpBc8ENSBaLcR8vI=;
  b=HWbOY7iE+ly25Lt6fF4QBaP4JGRWN1gKlceur/bhNOcQ//GYktgcLoad
   a1biBxAkabAMefkMHOkT+l1MsKxUMdBvCHN3D/hTq4DoSefN33Om4Xh33
   oUYWUg4Jlw32NtIpwRMK7Feh85ka8dqplme9A0qVh1qpN22oCdMwxGQXu
   VwvUmNvhApur3z8qDcV/tGdSqPnqV04S3MPWX2ShloG+Dc4WRIiU6XRl8
   MB6YhJDlPdHove31OGiwQdi3ZLodx8I5C/P38C8jWU/dVbYzfVSKl72tw
   NjXtT+ZFMxXwLiay3XIvn8ojtGjclBMPrTi3Tc/eApAYCvIfP/fIjN749
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="340335951"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="340335951"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 18:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="694629462"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="694629462"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 May 2023 18:35:19 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py0dq-0005m0-2W;
	Sun, 14 May 2023 01:35:18 +0000
Date: Sun, 14 May 2023 09:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>
Subject: [linux-next:master 1011/2056] mm/gup.c:2430:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202305140954.06aQsI9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e922ba281a8d84f640d8c8e18a385d032c19e185
commit: 1d313cb53d95b8d1527173bda7174e920f5a195a [1011/2056] mm/gup: disallow FOLL_LONGTERM GUP-fast writing to file-backed mappings
config: loongarch-randconfig-s042-20230514 (https://download.01.org/0day-ci/archive/20230514/202305140954.06aQsI9r-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1d313cb53d95b8d1527173bda7174e920f5a195a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1d313cb53d95b8d1527173bda7174e920f5a195a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140954.06aQsI9r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gup.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   mm/gup.c:2430:9: sparse:     expected void *ptr
   mm/gup.c:2430:9: sparse:     got unsigned int [noderef] __percpu *
>> mm/gup.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   mm/gup.c:2430:9: sparse:     expected void *ptr
   mm/gup.c:2430:9: sparse:     got unsigned int [noderef] __percpu *
>> mm/gup.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   mm/gup.c:2430:9: sparse:     expected void *ptr
   mm/gup.c:2430:9: sparse:     got unsigned int [noderef] __percpu *
>> mm/gup.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   mm/gup.c:2430:9: sparse:     expected void *ptr
   mm/gup.c:2430:9: sparse:     got unsigned int [noderef] __percpu *
>> mm/gup.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   mm/gup.c:2430:9: sparse:     expected void *ptr
   mm/gup.c:2430:9: sparse:     got int [noderef] __percpu *
>> mm/gup.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   mm/gup.c:2430:9: sparse:     expected void *ptr
   mm/gup.c:2430:9: sparse:     got int [noderef] __percpu *
>> mm/gup.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   mm/gup.c:2430:9: sparse:     expected void *ptr
   mm/gup.c:2430:9: sparse:     got int [noderef] __percpu *
>> mm/gup.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   mm/gup.c:2430:9: sparse:     expected void *ptr
   mm/gup.c:2430:9: sparse:     got int [noderef] __percpu *

vim +2430 mm/gup.c

  2382	
  2383	/*
  2384	 * Used in the GUP-fast path to determine whether a pin is permitted for a
  2385	 * specific folio.
  2386	 *
  2387	 * This call assumes the caller has pinned the folio, that the lowest page table
  2388	 * level still points to this folio, and that interrupts have been disabled.
  2389	 *
  2390	 * Writing to pinned file-backed dirty tracked folios is inherently problematic
  2391	 * (see comment describing the writable_file_mapping_allowed() function). We
  2392	 * therefore try to avoid the most egregious case of a long-term mapping doing
  2393	 * so.
  2394	 *
  2395	 * This function cannot be as thorough as that one as the VMA is not available
  2396	 * in the fast path, so instead we whitelist known good cases and if in doubt,
  2397	 * fall back to the slow path.
  2398	 */
  2399	static bool folio_fast_pin_allowed(struct folio *folio, unsigned int flags)
  2400	{
  2401		struct address_space *mapping;
  2402		unsigned long mapping_flags;
  2403	
  2404		/*
  2405		 * If we aren't pinning then no problematic write can occur. A long term
  2406		 * pin is the most egregious case so this is the one we disallow.
  2407		 */
  2408		if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) !=
  2409		    (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))
  2410			return true;
  2411	
  2412		/* The folio is pinned, so we can safely access folio fields. */
  2413	
  2414		if (WARN_ON_ONCE(folio_test_slab(folio)))
  2415			return false;
  2416	
  2417		/* hugetlb mappings do not require dirty-tracking. */
  2418		if (folio_test_hugetlb(folio))
  2419			return true;
  2420	
  2421		/*
  2422		 * GUP-fast disables IRQs. When IRQS are disabled, RCU grace periods
  2423		 * cannot proceed, which means no actions performed under RCU can
  2424		 * proceed either.
  2425		 *
  2426		 * inodes and thus their mappings are freed under RCU, which means the
  2427		 * mapping cannot be freed beneath us and thus we can safely dereference
  2428		 * it.
  2429		 */
> 2430		lockdep_assert_irqs_disabled();
  2431	
  2432		/*
  2433		 * However, there may be operations which _alter_ the mapping, so ensure
  2434		 * we read it once and only once.
  2435		 */
  2436		mapping = READ_ONCE(folio->mapping);
  2437	
  2438		/*
  2439		 * The mapping may have been truncated, in any case we cannot determine
  2440		 * if this mapping is safe - fall back to slow path to determine how to
  2441		 * proceed.
  2442		 */
  2443		if (!mapping)
  2444			return false;
  2445	
  2446		/* Anonymous folios pose no problem. */
  2447		mapping_flags = (unsigned long)mapping & PAGE_MAPPING_FLAGS;
  2448		if (mapping_flags)
  2449			return mapping_flags & PAGE_MAPPING_ANON;
  2450	
  2451		/*
  2452		 * At this point, we know the mapping is non-null and points to an
  2453		 * address_space object. The only remaining whitelisted file system is
  2454		 * shmem.
  2455		 */
  2456		return shmem_mapping(mapping);
  2457	}
  2458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
