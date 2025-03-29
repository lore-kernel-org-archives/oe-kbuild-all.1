Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9CE1E4B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743253647; cv=none; b=lw47ijckIqYavG6VuhiRcDKGGvqERMUpKvkVNF+Vuli1IkkGd66Hoksoa9eTnT/c582ArD6tunl9i4uvym/4q17ux+7g+YRb7R40FhzBOQu6ensA5OkzYqJJocXyldDd7YIOczsuqzXRgsiBwLP48PPpitzMzRh1Y8ZYPrVX0Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743253647; c=relaxed/simple;
	bh=w5k6fATrPd8Se61tYoSLfW2m8XNsJOyk9lnsXSoAmuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaGIHZVqRXwdS0v4nKpUOltoe7wNrkWQ5YaYmeWXkMzw7hFFJNxImZKjz0Zl9Zzaa613+niuPKHNVgrL9GTYbwYUMF3WGsygtEhw/kuTiQDVk9Oy+Kw/fp+MYF7HDomTCb9S3ZMCtdDlEM0H0D4GyWynG9mXQLtaoZjIMCX40Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtXDZLnm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtXDZLnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743253646; x=1774789646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w5k6fATrPd8Se61tYoSLfW2m8XNsJOyk9lnsXSoAmuM=;
  b=JtXDZLnmx+UJb+q4OY6Vo5FNRzAPFJCiRyAjBBVkTuT3AX2MJ6YxKf1p
   6mUMYBn8UuCctRtLPSL11sI8FKTJrKKCPkx/+tNbqiCsIGNSvyNrGxI5S
   Z9xnsh/evkj4vDUE/QqkA3BO1iINO0DBxz0JuQ5MiyZVlQGjeIApZ3saY
   G5vtOQedMCuOI8MDWeOchNmsCSjW1mjLHovsIP2XscF/9/3pSFZhxfx5n
   0cgz3DImtpEkuWdKDYxXbDyMrULb1HP/kcSh+YVxXiOLCGM+qRKKIOLUU
   SZwc8MMS9lSaRyD1AIenNz84sgeFJMYTaE9gB1fjxeVDBgr6HDfg9xoXi
   w==;
X-CSE-ConnectionGUID: MdxYbZsNRIWOEy1PzdVXRQ==
X-CSE-MsgGUID: KELveCiXRqe1MvPGL7eolg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="32208585"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="32208585"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 06:07:25 -0700
X-CSE-ConnectionGUID: RB3H8I1zS6q8YNTuS5zF0w==
X-CSE-MsgGUID: kIjWbLg2Sb+c3y9DQVCbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="126211304"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Mar 2025 06:07:24 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyVuD-000870-08;
	Sat, 29 Mar 2025 13:07:21 +0000
Date: Sat, 29 Mar 2025 21:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] zsmalloc: let callers select NUMA node to store
 the compressed objects
Message-ID: <202503292056.yiccDCgT-lkp@intel.com>
References: <20250329110230.2459730-2-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329110230.2459730-2-nphamcs@gmail.com>

Hi Nhat,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4135040c342ba080328891f1b7e523c8f2f04c58]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/zsmalloc-let-callers-select-NUMA-node-to-store-the-compressed-objects/20250329-190441
base:   4135040c342ba080328891f1b7e523c8f2f04c58
patch link:    https://lore.kernel.org/r/20250329110230.2459730-2-nphamcs%40gmail.com
patch subject: [RFC PATCH 1/2] zsmalloc: let callers select NUMA node to store the compressed objects
config: riscv-randconfig-001-20250329 (https://download.01.org/0day-ci/archive/20250329/202503292056.yiccDCgT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503292056.yiccDCgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503292056.yiccDCgT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/zsmalloc.c: In function 'zs_malloc':
>> mm/zsmalloc.c:1354:16: error: implicit declaration of function 'zs_malloc_node'; did you mean 'kvmalloc_node'? [-Wimplicit-function-declaration]
    1354 |         return zs_malloc_node(pool, size, gfp, NULL);
         |                ^~~~~~~~~~~~~~
         |                kvmalloc_node
   mm/zsmalloc.c: At top level:
>> mm/zsmalloc.c:1357:22: error: conflicting types for 'zs_malloc_node'; have 'long unsigned int(struct zs_pool *, size_t,  gfp_t,  int *)' {aka 'long unsigned int(struct zs_pool *, long unsigned int,  unsigned int,  int *)'}
    1357 | static unsigned long zs_malloc_node(struct zs_pool *pool, size_t size,
         |                      ^~~~~~~~~~~~~~
   mm/zsmalloc.c:1354:16: note: previous implicit declaration of 'zs_malloc_node' with type 'int()'
    1354 |         return zs_malloc_node(pool, size, gfp, NULL);
         |                ^~~~~~~~~~~~~~
>> mm/zsmalloc.c:1357:22: warning: 'zs_malloc_node' defined but not used [-Wunused-function]
    1357 | static unsigned long zs_malloc_node(struct zs_pool *pool, size_t size,
         |                      ^~~~~~~~~~~~~~


vim +1354 mm/zsmalloc.c

  1340	
  1341	
  1342	/**
  1343	 * zs_malloc - Allocate block of given size from pool.
  1344	 * @pool: pool to allocate from
  1345	 * @size: size of block to allocate
  1346	 * @gfp: gfp flags when allocating object
  1347	 *
  1348	 * On success, handle to the allocated object is returned,
  1349	 * otherwise an ERR_PTR().
  1350	 * Allocation requests with size > ZS_MAX_ALLOC_SIZE will fail.
  1351	 */
  1352	unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
  1353	{
> 1354		return zs_malloc_node(pool, size, gfp, NULL);
  1355	}
  1356	
> 1357	static unsigned long zs_malloc_node(struct zs_pool *pool, size_t size,
  1358					gfp_t gfp, int *nid)
  1359	{
  1360		unsigned long handle;
  1361		struct size_class *class;
  1362		int newfg;
  1363		struct zspage *zspage;
  1364	
  1365		if (unlikely(!size))
  1366			return (unsigned long)ERR_PTR(-EINVAL);
  1367	
  1368		if (unlikely(size > ZS_MAX_ALLOC_SIZE))
  1369			return (unsigned long)ERR_PTR(-ENOSPC);
  1370	
  1371		handle = cache_alloc_handle(pool, gfp);
  1372		if (!handle)
  1373			return (unsigned long)ERR_PTR(-ENOMEM);
  1374	
  1375		/* extra space in chunk to keep the handle */
  1376		size += ZS_HANDLE_SIZE;
  1377		class = pool->size_class[get_size_class_index(size)];
  1378	
  1379		/* class->lock effectively protects the zpage migration */
  1380		spin_lock(&class->lock);
  1381		zspage = find_get_zspage(class);
  1382		if (likely(zspage)) {
  1383			obj_malloc(pool, zspage, handle);
  1384			/* Now move the zspage to another fullness group, if required */
  1385			fix_fullness_group(class, zspage);
  1386			class_stat_add(class, ZS_OBJS_INUSE, 1);
  1387	
  1388			goto out;
  1389		}
  1390	
  1391		spin_unlock(&class->lock);
  1392	
  1393		zspage = alloc_zspage(pool, class, gfp, nid);
  1394		if (!zspage) {
  1395			cache_free_handle(pool, handle);
  1396			return (unsigned long)ERR_PTR(-ENOMEM);
  1397		}
  1398	
  1399		spin_lock(&class->lock);
  1400		obj_malloc(pool, zspage, handle);
  1401		newfg = get_fullness_group(class, zspage);
  1402		insert_zspage(class, zspage, newfg);
  1403		atomic_long_add(class->pages_per_zspage, &pool->pages_allocated);
  1404		class_stat_add(class, ZS_OBJS_ALLOCATED, class->objs_per_zspage);
  1405		class_stat_add(class, ZS_OBJS_INUSE, 1);
  1406	
  1407		/* We completely set up zspage so mark them as movable */
  1408		SetZsPageMovable(pool, zspage);
  1409	out:
  1410		spin_unlock(&class->lock);
  1411	
  1412		return handle;
  1413	}
  1414	EXPORT_SYMBOL_GPL(zs_malloc);
  1415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
