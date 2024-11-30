Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A12572
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 01:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732930699; cv=none; b=Al5u6NM+3JKcrOqANh60VhrrQMlMHy22zkuhzvn4843ZNUDe45qhccOHbdzCjx4tqHgE8OQ7aR5PmLfcGozoPGEGxSkPmV2TV3hHTI6oIHKcEq51xUi5NLx8vX1oUhzuUEOA6g6kK5PVOSigzmfuCIX+sTFcg+NgZVq89IkiMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732930699; c=relaxed/simple;
	bh=+BrnliY4+coWU6DDcghfGzlCc35nOizR6SbzoxUIecY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9gMx2tc5IOL3HKHP7HfZZydgKZwlswvsWmrWmDxs8bOYH/X2tJWpysQGncy4y3dfubGzS2p1MfNNLfj9dAfaxGWkQOfbjex2RRD+L4EIC0rX4aEwXGWN3MYKt+eLQhfRf9bMrdHSBVeQyyOMtd5/DctJf2g0ba4trR8tI9xwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYk44VUM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYk44VUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732930697; x=1764466697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+BrnliY4+coWU6DDcghfGzlCc35nOizR6SbzoxUIecY=;
  b=ZYk44VUMtumFKi5fj+mGCPw/RwRmiY+7WmV8l4iIY5tS6/vfkYQfVr1I
   blAlc7QcaGwIe6G6kb2MJ/vBuLIePon4rJG8adu61XaVfM8HqFjVqcv0B
   b4pohxIsQ3DDbBjJ0mvK/W0lnhPL+hkvyRRY4CmqQA/7J9BPg9W+o8v/Q
   0hoo+ZaAIBfZk/bnJsyip7wDSV3BaCx6J92gEfeTnixDNg7Bh9K95hr4G
   KZamEN86Rgu65KXw5LOAP8nYR5ThPUAXqJLV4hwwg5Vj17d7Kje1FbNYh
   SppqqCn+w6Gm7094oWtD8i94+EwrQU/aBCesxRhHeH5sEbmrYJsUILKF0
   g==;
X-CSE-ConnectionGUID: B34/hreqSFexbmyO9zJTKQ==
X-CSE-MsgGUID: tp77nhj6S76rhahjlkVwWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="50564877"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="50564877"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 17:38:17 -0800
X-CSE-ConnectionGUID: 29OdXeaZT2O2Yfrke7N53A==
X-CSE-MsgGUID: PB7e8Z9uR76KTZ/xr8x5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="93434311"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Nov 2024 17:38:17 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHCR3-0000qD-37;
	Sat, 30 Nov 2024 01:38:13 +0000
Date: Sat, 30 Nov 2024 09:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.12.0-scu4-dt-overlay 25/30] drivers/of/resolver.c:391:5:
 error: redefinition of 'of_add_resolver_symbol'
Message-ID: <202411300937.t5wzkEyZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.12.0-scu4-dt-overlay
head:   6a87eb702125c86f68c9c466c941b914713c8252
commit: 6432b35945fe3f299f755399ffb8b0101e508866 [25/30] of: resolver: Add helper to add to __symbols__
config: arm-randconfig-001-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300937.t5wzkEyZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300937.t5wzkEyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300937.t5wzkEyZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/of/resolver.c:391:5: error: redefinition of 'of_add_resolver_symbol'
     391 | int of_add_resolver_symbol(const char *prefix, const struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/of/resolver.c:15:
   include/linux/of.h:1775:19: note: previous definition of 'of_add_resolver_symbol' with type 'int(const char *, const struct device *, const char *)'
    1775 | static inline int of_add_resolver_symbol(const char *name,
         |                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/of_add_resolver_symbol +391 drivers/of/resolver.c

   375	
   376	/**
   377	 * of_add_resolver_symbol - Add to /__symbols__
   378	 *
   379	 * @prefix: 	First part of symbol
   380	 * @dev:	Device to take the name from
   381	 * @path: 	Path of the symbol in the device tree
   382	 *
   383	 * In order that the overlay resolver can resolve phandles in the
   384	 * overlay to nodes in the base tree, the phandle needs an entry in
   385	 * __symbols__.  When a dynamic node is added, use this helper to add
   386	 * such an entry. The symbol is constructed from the prefix and the
   387	 * device name, which is then mangled to make it DT confirming.
   388	 *
   389	 * Return: %0 on success or a negative error value on error.
   390	 */
 > 391	int of_add_resolver_symbol(const char *prefix, const struct device *dev,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
