Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5703596B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 03:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741492429; cv=none; b=QmqB0wNZgQBWbfq4wCxFmzVwFCXbTfysZoo5j6LISM9aA8tmabA1+JjrnwoQ48V1UoVbxpKyXwH22ghYY3UMd7jrfX3R4b1w6SpkOwYW23J1WCRy8NXIVjYJs3eXZpACaBR2nOGrnbevBXzKUOe4IvBKjz7uJI2W2RfG9IjzE8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741492429; c=relaxed/simple;
	bh=dthA8HMmsVMgB5EvxN3JhWFp8FewKu+23/RaTHjSQpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rq3xZAigu+rtXuhwgB/a1jzFPPUW8G3tozAC8i/zFQGSipu/KwsznXKfUqmjf5ugZOWjcQQIwyzDLFHzb3vBCEaDEYiD4w7nS+dS0nHQZ9spGocjIvNhnEj1OJHFFgTCrtALYt9o20yctVfeKDV8za2SczRcJdBFpQOssPqJU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+013Lwy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+013Lwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741492427; x=1773028427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dthA8HMmsVMgB5EvxN3JhWFp8FewKu+23/RaTHjSQpY=;
  b=T+013LwyFTDoZfMtM14X5vgXj4fPo/THlO0cb4PzhvQyQGq2F63v3snx
   PsVrW+Y6/P6xVMa3GQixVqKIXdgjiZ9Yz6Svt9FsstIxZdFgpb/Xjv/4k
   UtWombYLdeUrmqhmbKcvjg7FrJp7caxywKu8gRNaWqsw054uXDYAYsDFm
   fwmlX4FWhc8VvhDhCOFlXlUTr2zEEW3IThrG8aQDE21pFAVv3+GwNEJ8k
   wfFXwuzmfo2LYxbRev75GwHseGcSvVvGCMLvlIK4rbetjQ8tbphg+4uWd
   7NPSVkkQCoIGDkcnHXqz+cqNXJhexucqDHuX3FTvtUUUUndUU8fyVA0q+
   g==;
X-CSE-ConnectionGUID: 9OdDA/+cT3KMpveEUYFUXw==
X-CSE-MsgGUID: GZ9YhEaRQvudZi0tQqM1cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46288382"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="46288382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 19:53:47 -0800
X-CSE-ConnectionGUID: UFQ53EYCRJykLoCCmK8HSg==
X-CSE-MsgGUID: AFfx8wAcRgGIfaBmC4siaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156883151"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Mar 2025 19:53:45 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr7jS-0002do-2D;
	Sun, 09 Mar 2025 03:53:42 +0000
Date: Sun, 9 Mar 2025 11:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [akpm-mm:mm-unstable 481/507] lib/xarray.c:1251:14: error:
 redefinition of 'xas_try_split_min_order'
Message-ID: <202503091121.RktXlKnp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   2f0c87542d97822659e81f55ae5e5cc1994f3339
commit: 835714732ae42a4b4f590316b06d06826bff2483 [481/507] mm/filemap: use xas_try_split() in __filemap_add_folio()
config: i386-buildonly-randconfig-003-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091121.RktXlKnp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091121.RktXlKnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091121.RktXlKnp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/xarray.c:1251:14: error: redefinition of 'xas_try_split_min_order'
    1251 | unsigned int xas_try_split_min_order(unsigned int order)
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/xarray.c:13:
   include/linux/xarray.h:1587:28: note: previous definition of 'xas_try_split_min_order' with type 'unsigned int(unsigned int)'
    1587 | static inline unsigned int xas_try_split_min_order(unsigned int order)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/xas_try_split_min_order +1251 lib/xarray.c

  1237	
  1238	/**
  1239	 * xas_try_split_min_order() - Minimal split order xas_try_split() can accept
  1240	 * @order: Current entry order.
  1241	 *
  1242	 * xas_try_split() can split a multi-index entry to smaller than @order - 1 if
  1243	 * no new xa_node is needed. This function provides the minimal order
  1244	 * xas_try_split() supports.
  1245	 *
  1246	 * Return: the minimal order xas_try_split() supports
  1247	 *
  1248	 * Context: Any context.
  1249	 *
  1250	 */
> 1251	unsigned int xas_try_split_min_order(unsigned int order)
  1252	{
  1253		if (order % XA_CHUNK_SHIFT == 0)
  1254			return order == 0 ? 0 : order - 1;
  1255	
  1256		return order - (order % XA_CHUNK_SHIFT);
  1257	}
  1258	EXPORT_SYMBOL_GPL(xas_try_split_min_order);
  1259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
