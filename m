Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750063D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723120577; cv=none; b=U2txgGS5Bo8yyWyze7cq7IM3ORfgFvp9khxQtqSOgxFqUKwPPrgG56yFBn/TjYaTk6Hv7XVT5J6a7uKmGzsL8lQ92qfSIh8rcWZPOclPKnoLLU4t425RmrCyVLaGDMpg29cnd9ksdjG2KplL9PSy2m1tvv/YV0zPJidZGIBHLN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723120577; c=relaxed/simple;
	bh=hLrWHsNbwLHHfnRjdGE4TQmDcglmsKPu8foGeIQ/aSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=phFqdsDyiYYWUDIOzfTEdrjm33BPU1MHhvcLlnzDGpYOt1NemAujSsnNl3OjaAM5V+GBSlBoJj8zedw33I/hVSW3et7z5eelLetvKx3t6VzREZFnNMetc6WH8PQpScrYpzYJLDQtm5QV62am5KN0wlJ8hPp5BwZLcXWA6DqWghI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acFIzhM5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acFIzhM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723120575; x=1754656575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLrWHsNbwLHHfnRjdGE4TQmDcglmsKPu8foGeIQ/aSk=;
  b=acFIzhM5eEp4OBHR6Z8+PczeB+T3TiFOds9KKj8QkJYqauEFY7oX8sCA
   d26pAPN48wfN8MWgz/enAs508G0AvFPibr6HZNJ3S8CTaljbjC74SGg60
   7Owe3SGy+fwbp5wirobWASUS+0/yduSEajHp/+i64Ecb8M2+Stz9klfxQ
   d5nqQ92rm8B8NEprm2LjgPRflgHav85Gb++4hxPlIchWIInwaj0ykLCMh
   lzQHq2QjJ5Ish7EheOj4aJZpCpXSxVLyKWVF+IxkCk+3wqncAQp1aMQxm
   7mRzdEDdR4Pg9Y8dZgsDhX4j/30IWwbNxG2+1QH1CCXsgGh9X4Hl0KAB9
   w==;
X-CSE-ConnectionGUID: 2F1OhTE/SGWrhS/p4r4BLw==
X-CSE-MsgGUID: eUtKrY4dSXefIkARu04Zqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21213126"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21213126"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:36:15 -0700
X-CSE-ConnectionGUID: zAJH4uQ2QMmBkTdFwaqRgw==
X-CSE-MsgGUID: 8qfG/etmS0aC0LEbZwKgsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57126269"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Aug 2024 05:36:13 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc2Mj-0006Ao-1N;
	Thu, 08 Aug 2024 12:35:42 +0000
Date: Thu, 8 Aug 2024 20:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 18/225] lib/stackdepot.c:44:9: error: implicit
 declaration of function 'MIN'
Message-ID: <202408082024.K413hXT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   275d686abcb590d862b74e2670533d93fd10e58c
commit: 2900cb53f7d7d47f73c4c368c0db15a2c6df3e72 [18/225] lib/stackdepot: double DEPOT_POOLS_CAP if KASAN is enabled
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240808/202408082024.K413hXT3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082024.K413hXT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408082024.K413hXT3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/stackdepot.c:44:9: error: implicit declaration of function 'MIN' [-Wimplicit-function-declaration]
      44 |         MIN((1LL << (DEPOT_POOL_INDEX_BITS)) - 1, DEPOT_POOLS_CAP)
         |         ^~~
   lib/stackdepot.c:66:26: note: in expansion of macro 'DEPOT_MAX_POOLS'
      66 | static void *stack_pools[DEPOT_MAX_POOLS];
         |                          ^~~~~~~~~~~~~~~
>> lib/stackdepot.c:66:14: error: variably modified 'stack_pools' at file scope
      66 | static void *stack_pools[DEPOT_MAX_POOLS];
         |              ^~~~~~~~~~~


vim +/MIN +44 lib/stackdepot.c

    41	
    42	/* The pool_index is offset by 1 so the first record does not have a 0 handle. */
    43	#define DEPOT_MAX_POOLS \
  > 44		MIN((1LL << (DEPOT_POOL_INDEX_BITS)) - 1, DEPOT_POOLS_CAP)
    45	
    46	static bool stack_depot_disabled;
    47	static bool __stack_depot_early_init_requested __initdata = IS_ENABLED(CONFIG_STACKDEPOT_ALWAYS_INIT);
    48	static bool __stack_depot_early_init_passed __initdata;
    49	
    50	/* Use one hash table bucket per 16 KB of memory. */
    51	#define STACK_HASH_TABLE_SCALE 14
    52	/* Limit the number of buckets between 4K and 1M. */
    53	#define STACK_BUCKET_NUMBER_ORDER_MIN 12
    54	#define STACK_BUCKET_NUMBER_ORDER_MAX 20
    55	/* Initial seed for jhash2. */
    56	#define STACK_HASH_SEED 0x9747b28c
    57	
    58	/* Hash table of stored stack records. */
    59	static struct list_head *stack_table;
    60	/* Fixed order of the number of table buckets. Used when KASAN is enabled. */
    61	static unsigned int stack_bucket_number_order;
    62	/* Hash mask for indexing the table. */
    63	static unsigned int stack_hash_mask;
    64	
    65	/* Array of memory regions that store stack records. */
  > 66	static void *stack_pools[DEPOT_MAX_POOLS];
    67	/* Newly allocated pool that is not yet added to stack_pools. */
    68	static void *new_pool;
    69	/* Number of pools in stack_pools. */
    70	static int pools_num;
    71	/* Offset to the unused space in the currently used pool. */
    72	static size_t pool_offset = DEPOT_POOL_SIZE;
    73	/* Freelist of stack records within stack_pools. */
    74	static LIST_HEAD(free_stacks);
    75	/* The lock must be held when performing pool or freelist modifications. */
    76	static DEFINE_RAW_SPINLOCK(pool_lock);
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
