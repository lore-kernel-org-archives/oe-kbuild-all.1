Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940135;
	b=Yue4zq33zdsJ8ie2H53P95xEp5RQuxhZb5oI6o9EDHlBdW40OviycYLW9JKYbkFKvXr8
	 Se6gOnDjeBY6Dj9dMJthQ3KcyepGPIOb2PE+0BSZfa19Bcb4zJFuYhnO7O7eEPI4FUs44
	 RAxcir++1sSsiDC2g6yOe9wuh46wEkOIvXU5X9kIA5OzJGOugPgspKfzoHrLYQ/56sC43
	 AQLuKtsSTas2CLWxA5YX4ObCgbQz6iSzkU6Yi27NkjLvYMHfs+A+7mCp6D4so5PfxYLGr
	 L37I1lnqxP4u0B+Tf6WMnysskqx23eoD9VRj4Ag+Xr6dbo2m8UIGNIZA40mPAx4jkiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=cH0k23uQ0R5ThMdjtKSKUDnfHUc+a7kfcJ8zCx6tF0M=;
	b=NBKoXo6Lkd4cUpNRK9xOnnW1PhhPcAIIDjaIrCUlt5YpqidL/Q679sgh5B5Adkz3JAS1
	 kthTVrabLUYOyqBSy1B6pz1x+X9uRkOFvh/I7I0j7RptYBlrd3Jt7j5yNJVZauONtmImU
	 YKxOOsORN8vyDXRiJavPpSO4fRiuxF6jIYwG0VJFa5ncpAwnnab5SG/EToZyGwBU5j2Vo
	 qrsXVUSEGfd5k8qUoieennNqLQagMo9h9A4Yfr4dBAcwnCVVYdMlvjJbGsB98fDETN4AB
	 zizgyJoi+JydMAzbk2SMOy4h5fHzE+Ff+8UQ23c0buxR+0kg8DzXfxuXKGMfgOlzD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cropivmE;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC1B606A330
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 04:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC1B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cropivmE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793940133; x=1825476133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P89PlaK+/hvait3mFpoUo17/ifRpIJ9Cd+NQmTZRaj4=;
  b=cropivmE9EqoihXDPEO4F//9cdFZoCqRe7IMYmIUEz1Vn3bAgWVewwVo
   b9xI19qWYAvX5zLheu4dWI5uZSyEj3JjRgylz55optB9sLdxCUouxBQKv
   oi6IK6ym0Yqa1aby872I0Sze1WmDWNkjvRkVEGQ6CtsLjwPcJASs3nKD4
   If5TeswqNS0LlMHDm39CHKvdQmC9KN2sxuns9OquF9vY8EkEIfFi6txdv
   wGw2cp17063Q03d+avmfztWuHKnAQ1DslsuE5ybhfV/Ld4v7b4Q94LWz6
   FP3ugbaClKonyZIZx9i4HGSaRfLx7bp/xQFsNXWSM2HbaydpPaZhFgudM
   g==;
X-CSE-ConnectionGUID: C0ig1YRbSmalBKXEzxKcqQ==
X-CSE-MsgGUID: 2fBeHfPMSzyVd73PubJEuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2787850"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2787850"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 20:42:10 -0800
X-CSE-ConnectionGUID: CLdB014lRY+wouytS07x1g==
X-CSE-MsgGUID: IOKiHfd5Qm6pFMR3YJ0Tew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7335016"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2026 20:42:08 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPBmA-00000000A1h-2kCl;
	Fri, 06 Nov 2026 04:42:06 +0000
Date: Fri, 06 Nov 2026 05:41:38 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: drivers/gpu/drm/xe/xe_svm.c:1615:48-51: ERROR: Missing
 resource_size with res
Message-ID: <202611060555.alPmrU8P-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66469d9905b39d2c260a15d7d6db450f4db67c1
commit: 8a52f4d9b1efc90eb338b0d59912e640400b9c63 drm/xe: Use the drm_pagemap cache and shrinker
date:   11 months ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261106/202611060555.alPmrU8P-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8a52f4d9b1ef ("drm/xe: Use the drm_pagemap cache and shrinker")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060555.alPmrU8P-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_svm.c:1615:48-51: ERROR: Missing resource_size with res

vim +1615 drivers/gpu/drm/xe/xe_svm.c

  1563	
  1564	/**
  1565	 * xe_pagemap_create() - Create a struct xe_pagemap object
  1566	 * @xe: The xe device.
  1567	 * @vr: Back-pointer to the struct xe_vram_region.
  1568	 *
  1569	 * Allocate and initialize a struct xe_pagemap. On successful
  1570	 * return, drm_pagemap_put() on the embedded struct drm_pagemap
  1571	 * should be used to unreference.
  1572	 *
  1573	 * Return: Pointer to a struct xe_pagemap if successful. Error pointer
  1574	 * on failure.
  1575	 */
  1576	static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram_region *vr)
  1577	{
  1578		struct device *dev = xe->drm.dev;
  1579		struct xe_pagemap *xpagemap;
  1580		struct dev_pagemap *pagemap;
  1581		struct drm_pagemap *dpagemap;
  1582		struct resource *res;
  1583		void *addr;
  1584		int err;
  1585	
  1586		xpagemap = kzalloc(sizeof(*xpagemap), GFP_KERNEL);
  1587		if (!xpagemap)
  1588			return ERR_PTR(-ENOMEM);
  1589	
  1590		pagemap = &xpagemap->pagemap;
  1591		dpagemap = &xpagemap->dpagemap;
  1592		INIT_WORK(&xpagemap->destroy_work, xe_pagemap_destroy_work);
  1593		xpagemap->vr = vr;
  1594	
  1595		err = drm_pagemap_init(dpagemap, pagemap, &xe->drm, &xe_drm_pagemap_ops);
  1596		if (err)
  1597			goto out_no_dpagemap;
  1598	
  1599		res = devm_request_free_mem_region(dev, &iomem_resource,
  1600						   vr->usable_size);
  1601		if (IS_ERR(res)) {
  1602			err = PTR_ERR(res);
  1603			goto out_err;
  1604		}
  1605	
  1606		pagemap->type = MEMORY_DEVICE_PRIVATE;
  1607		pagemap->range.start = res->start;
  1608		pagemap->range.end = res->end;
  1609		pagemap->nr_range = 1;
  1610		pagemap->owner = xe_svm_devm_owner(xe);
  1611		pagemap->ops = drm_pagemap_pagemap_ops_get();
  1612		addr = devm_memremap_pages(dev, pagemap);
  1613		if (IS_ERR(addr)) {
  1614			err = PTR_ERR(addr);
> 1615			devm_release_mem_region(dev, res->start, res->end - res->start + 1);
  1616			goto out_err;
  1617		}
  1618		xpagemap->hpa_base = res->start;
  1619		return xpagemap;
  1620	
  1621	out_err:
  1622		drm_pagemap_put(dpagemap);
  1623		return ERR_PTR(err);
  1624	
  1625	out_no_dpagemap:
  1626		kfree(xpagemap);
  1627		return ERR_PTR(err);
  1628	}
  1629	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
