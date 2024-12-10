Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED922CBD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733818808; cv=none; b=SI1zYrUa+//z8wPoiXU9bTo1Ci7QDw/9aLK/xiL8G/YnHBkQFc3WFOHFy0koyDYtjNgizn2FJMxw7u8YeP1MeG2vpNHRZM+iIxNs4Mkd7p4atob5khAVDdolbSSLNgQxh4nk0MFBdU/x2ViD/VxxZSAmpBhVzMZyfSErZsTx3vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733818808; c=relaxed/simple;
	bh=6BMQvqJDtx8sRUSLwgSZ/yBQJ4UKTuw/ozBm4/Xtx+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J4PfTi9X0Y2Vv+NZOdfN82iIvcacrs/fQ2eEr77S7RDcYtMdwm6MwjDyhGp+2dXN8TtyDoK9b31zz4X9u46eJ4VoaxOIFdjIJ0eSWRYUlLdWGW118/MbwCdu5OnUDEuVOCR3/XJnm13uWBR8kbo7Dw2VsIamHrR69EBcnOXVcIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PE+uDDDV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PE+uDDDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733818806; x=1765354806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6BMQvqJDtx8sRUSLwgSZ/yBQJ4UKTuw/ozBm4/Xtx+M=;
  b=PE+uDDDVsz/O+qkMwcLKOjgfFSnGzkWp03b6rYALQF49ZjHRTWTsgWmF
   qVxbLMdDrM/biQAP4ty/fyCKKSuZJLPfTe8/vOqozyufrqCLVROj7+kaI
   M2Q2RiFEAxFlz0z6K5xLGbx3Z7BzswM2/QN2zutCwlXaX4GlbAcmXOepb
   tGmiarpQEC7+ZlahRfcvq4TgeLGK+kTINY9TmIUHyty7yXlbXjcQBcpAs
   K2F10/dOYxPq1hRhHZGVUB7BSxpf7klMg+rsx7pvymR4k0qi5zaHKH42x
   rSmk36qFjNIbvlgutYdnTfwnH8109qAW5RC2b8dSg2A31Pb6jS4oiolQ8
   g==;
X-CSE-ConnectionGUID: zA123Oc1SyqrA6vvdwNcrw==
X-CSE-MsgGUID: thm8dtFLTYS55rx23u4r+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34397725"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="34397725"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 00:20:06 -0800
X-CSE-ConnectionGUID: SLvfkdDBS9+gcsTUcFpdZw==
X-CSE-MsgGUID: qA3CA3HtQSmCRd1/z0Pxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="99397305"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2024 00:20:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKvTM-0005HB-23;
	Tue, 10 Dec 2024 08:20:00 +0000
Date: Tue, 10 Dec 2024 16:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 kernel/dma/pool.c:77:44: error: 'zone_dma_bits' undeclared
Message-ID: <202412101652.rQZpU0ee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: e82bab3a18d74d251a66047ba23778c818311870 [1/1] dma-pool: Only allocate from CMA when in same memory zone
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241210/202412101652.rQZpU0ee-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101652.rQZpU0ee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101652.rQZpU0ee-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/dma-direct.h:9,
                    from kernel/dma/pool.c:9:
   kernel/dma/pool.c: In function 'cma_in_zone':
>> kernel/dma/pool.c:77:44: error: 'zone_dma_bits' undeclared (first use in this function)
      77 |                 return end <= DMA_BIT_MASK(zone_dma_bits);
         |                                            ^~~~~~~~~~~~~
   include/linux/dma-mapping.h:148:28: note: in definition of macro 'DMA_BIT_MASK'
     148 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                            ^
   kernel/dma/pool.c:77:44: note: each undeclared identifier is reported only once for each function it appears in
      77 |                 return end <= DMA_BIT_MASK(zone_dma_bits);
         |                                            ^~~~~~~~~~~~~
   include/linux/dma-mapping.h:148:28: note: in definition of macro 'DMA_BIT_MASK'
     148 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                            ^


vim +/zone_dma_bits +77 kernel/dma/pool.c

   > 9	#include <linux/dma-direct.h>
    10	#include <linux/dma-noncoherent.h>
    11	#include <linux/init.h>
    12	#include <linux/genalloc.h>
    13	#include <linux/set_memory.h>
    14	#include <linux/slab.h>
    15	#include <linux/workqueue.h>
    16	
    17	static struct gen_pool *atomic_pool_dma __ro_after_init;
    18	static unsigned long pool_size_dma;
    19	static struct gen_pool *atomic_pool_dma32 __ro_after_init;
    20	static unsigned long pool_size_dma32;
    21	static struct gen_pool *atomic_pool_kernel __ro_after_init;
    22	static unsigned long pool_size_kernel;
    23	
    24	/* Size can be defined by the coherent_pool command line */
    25	static size_t atomic_pool_size;
    26	
    27	/* Dynamic background expansion when the atomic pool is near capacity */
    28	static struct work_struct atomic_pool_work;
    29	
    30	static int __init early_coherent_pool(char *p)
    31	{
    32		atomic_pool_size = memparse(p, &p);
    33		return 0;
    34	}
    35	early_param("coherent_pool", early_coherent_pool);
    36	
    37	static void __init dma_atomic_pool_debugfs_init(void)
    38	{
    39		struct dentry *root;
    40	
    41		root = debugfs_create_dir("dma_pools", NULL);
    42		if (IS_ERR_OR_NULL(root))
    43			return;
    44	
    45		debugfs_create_ulong("pool_size_dma", 0400, root, &pool_size_dma);
    46		debugfs_create_ulong("pool_size_dma32", 0400, root, &pool_size_dma32);
    47		debugfs_create_ulong("pool_size_kernel", 0400, root, &pool_size_kernel);
    48	}
    49	
    50	static void dma_atomic_pool_size_add(gfp_t gfp, size_t size)
    51	{
    52		if (gfp & __GFP_DMA)
    53			pool_size_dma += size;
    54		else if (gfp & __GFP_DMA32)
    55			pool_size_dma32 += size;
    56		else
    57			pool_size_kernel += size;
    58	}
    59	
    60	static bool cma_in_zone(gfp_t gfp)
    61	{
    62		unsigned long size;
    63		phys_addr_t end;
    64		struct cma *cma;
    65	
    66		cma = dev_get_cma_area(NULL);
    67		if (!cma)
    68			return false;
    69	
    70		size = cma_get_size(cma);
    71		if (!size)
    72			return false;
    73	
    74		/* CMA can't cross zone boundaries, see cma_activate_area() */
    75		end = cma_get_base(cma) + size - 1;
    76		if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
  > 77			return end <= DMA_BIT_MASK(zone_dma_bits);
    78		if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
    79			return end <= DMA_BIT_MASK(32);
    80		return true;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
