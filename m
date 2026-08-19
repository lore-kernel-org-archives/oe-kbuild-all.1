Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061E392811
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 05:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787115753; cv=none; b=SACAuB/+jnNZmd3CPFTCHiRF5YHnkkg9cjtmSneoCgeSTUBSeQGeQxFWkQZ13oDytw/ZnPzD3GkdtxR8ehsLt1qJioeH7RQjUgS67aKVMZEKMcU/7oVhual42oX1UTq+IHygv9iZICUXpa9b3ykH6NfPpG/ECrSBbDwjd18eiT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787115753; c=relaxed/simple;
	bh=9/H14TARoRCZtJdr7d0CAcBep0/2tkjnPRRhym1Hl3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SkwGQxbvhvIHiYtV3GF7EoyiTx0VHQhxivGdYPbJnXocB/mv9sfDPsLFuWByf/tGgHQpcF7l/ZblYt2oQWDUkFUqdeGOztpMcewXBWkPf4Nh5XNqvAZi6TfKI/4Xa3CYw191Mq/Ydxmr3azI5MQP3BC94YI8G+Gs4dr0yHIDizA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ke8hHBcr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ke8hHBcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787115752; x=1818651752;
  h=date:from:to:cc:subject:message-id;
  bh=9/H14TARoRCZtJdr7d0CAcBep0/2tkjnPRRhym1Hl3Y=;
  b=ke8hHBcrVftycsbXsdAthDT8hzBYM2oTEoCE/FSXUlt2OgUsUQzADuuQ
   s+lP9eip6UQ6fEZ7whjZqQ9jb/s4dnWbH0sa4SIstjS1A8TlSVgIr03hc
   d8ahE1Bx04TVO2SolKq0fy2TEnW9VJ3sK00uwDj1EDfwZhXr65vFnohUZ
   siZXr+PPmU3R8ZKT3bqKsQmpjj0f9vHbWz5aTDlZ76ovVxwRC/eCPfFvM
   atUuIv9NVDg76mp5IwYZ7EMwGcSmJimK9EyPxu3rzZhmzX7f8S4ovsXme
   iaZ6w8rqz5AXv2ubtXdyjKTLPMaQMOGhbgAIVUO7YNW3L4ZESIvlscITL
   Q==;
X-CSE-ConnectionGUID: +Q4ncJTBSj243LjvTCVT4Q==
X-CSE-MsgGUID: o3+LYtxpSGaKvWfuQVG9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87533863"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87533863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:02:31 -0700
X-CSE-ConnectionGUID: fnTSA1FKSPeQYDvXAVmT8g==
X-CSE-MsgGUID: 9ZpZjVy4RdSAq9XFi/EqSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="303644808"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Aug 2026 22:02:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwYRX-00000000etY-18jj;
	Wed, 19 Aug 2026 05:02:27 +0000
Date: Wed, 19 Aug 2026 13:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/cache 2/13] fs/f2fs/cache.c:182:30: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202608191224.eWjE9na5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/cache
head:   cc6a23d8c232f588f3a5415d1b10a19e1e4ce860
commit: 79680d7892699e4a580d6dc3831820056989cd75 [2/13] f2fs: cache: implement metadata cache
config: sparc64-randconfig-r112-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191224.eWjE9na5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191224.eWjE9na5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191224.eWjE9na5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/cache.c:182:30: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   fs/f2fs/cache.c:182:30: sparse:     expected unsigned int flags
   fs/f2fs/cache.c:182:30: sparse:     got restricted gfp_t
>> fs/f2fs/cache.c:185:23: sparse: sparse: invalid assignment: |=
   fs/f2fs/cache.c:185:23: sparse:    left side has type unsigned int
   fs/f2fs/cache.c:185:23: sparse:    right side has type restricted gfp_t
>> fs/f2fs/cache.c:187:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int flags @@
   fs/f2fs/cache.c:187:17: sparse:     expected restricted gfp_t [usertype] flags
   fs/f2fs/cache.c:187:17: sparse:     got unsigned int flags
>> fs/f2fs/cache.c:187:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int flags @@
   fs/f2fs/cache.c:187:17: sparse:     expected restricted gfp_t [usertype] flags
   fs/f2fs/cache.c:187:17: sparse:     got unsigned int flags
>> fs/f2fs/cache.c:187:17: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int flags @@
   fs/f2fs/cache.c:187:17: sparse:     expected restricted gfp_t [usertype] flags
   fs/f2fs/cache.c:187:17: sparse:     got unsigned int flags
>> fs/f2fs/cache.c:191:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flags @@
   fs/f2fs/cache.c:191:17: sparse:     expected restricted gfp_t [usertype] gfp
   fs/f2fs/cache.c:191:17: sparse:     got unsigned int flags
>> fs/f2fs/cache.c:191:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flags @@
   fs/f2fs/cache.c:191:17: sparse:     expected restricted gfp_t [usertype] gfp
   fs/f2fs/cache.c:191:17: sparse:     got unsigned int flags
>> fs/f2fs/cache.c:191:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flags @@
   fs/f2fs/cache.c:191:17: sparse:     expected restricted gfp_t [usertype] gfp
   fs/f2fs/cache.c:191:17: sparse:     got unsigned int flags

vim +182 fs/f2fs/cache.c

   175	
   176	static struct f2fs_cached_block *f2fs_create_cache(
   177			struct f2fs_cached_block_list *cache,
   178			unsigned long index, bool nofail)
   179	{
   180		struct f2fs_cached_block *entry;
   181		struct folio *folio;
 > 182		unsigned int flags = GFP_NOFS;
   183	
   184		if (nofail)
 > 185			flags |= __GFP_NOFAIL;
   186	
 > 187		entry = kzalloc(sizeof(*entry), flags);
   188		if (!entry)
   189			return ERR_PTR(-ENOMEM);
   190	
 > 191		folio = folio_alloc(flags, 0);
   192		if (!folio) {
   193			kfree(entry);
   194			return ERR_PTR(-ENOMEM);
   195		}
   196	
   197		entry->data = folio_address(folio);
   198		entry->index = index;
   199	
   200		atomic_set(&entry->refcount, 0);
   201		entry->next_entry = NULL;
   202		INIT_LIST_HEAD(&entry->list);
   203	
   204		entry->cache = cache;
   205	
   206		return entry;
   207	}
   208	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
