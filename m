Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC0814286
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709662920; cv=none; b=YxJNyHwbZvqGtwA5n2Xp5PFo4g/5+N2AnmS4I8nELbuwLPV42NUmh6QEWY5RtF/w3QXs/+303A3us+7Ljf4XwSPLpbWoZ/15neBNLQzRzDtxr/FzxdkqEFb5OMgAoJzKQzP7PTa+LYAnf7n0Zo2av6X1F6wrdvdsksyvIGfogE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709662920; c=relaxed/simple;
	bh=5L+8u62UfVnmrmjy554GfNNvisSn35zZpl6zmSxFMpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=orgxejdYTvXjRJW85qDs/D1dYVM7po600p10IY8BLTaphDennoF6RuGzLKaDwtIpa4YOUzA4KPZPN8TaA+OjXxUCdTuJlThvSaRxEjNDjGXNsfvhWJoPUexjUJ4vgmo3EpaTWPkwkHS2/rer5eQj2jDLLztsb4Uj7RlyXQmarrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6nAWdps; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6nAWdps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709662918; x=1741198918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5L+8u62UfVnmrmjy554GfNNvisSn35zZpl6zmSxFMpA=;
  b=d6nAWdps7GCSitLspmm3rJL8lOR5wGxwSaqDzU6cOOvdw8yOikOEQuY+
   nnVsqtwjCZph4woigVq1NlV8+QiO1YUbZVlga/33s3/qj2HK+s4iuP3n1
   CQ4UBYN4RxO10pHfTlr3EmcwtU7Ie6oaXLrb7NNFSPaUeQcVnsbozi6lL
   LJO8adkkQgzzkk36cT12kB++9O5Lth7q+g/MVNQMvGYGgpHdcLx49m25c
   ftQrioUYrFFOZR8VOzPagVicgWWyKd4/vaaLqn2SPpL6u/P/SqfsT/f9C
   Z0gSvH4O6lN/p7o2xT60GVgUeb3BMMFTa0pr97/HnlRDFLih/1B/zI4Mn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4096648"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4096648"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 10:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9359278"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2024 10:21:54 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhZQG-0003Yq-1H;
	Tue, 05 Mar 2024 18:21:52 +0000
Date: Wed, 6 Mar 2024 02:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/ipmmu-vmsa.c:966:16: error: initialization of 'int
 (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,
  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long
 unsigned int,  long unsigned int,  int,...
Message-ID: <202403060247.tuvDeRVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 07fa45a37620bc952407c8f262ecdee7b541e069 iommu/amd: Convert AMD iommu driver to the dma-iommu api
date:   9 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240306/202403060247.tuvDeRVh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060247.tuvDeRVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060247.tuvDeRVh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/debug_locks.h:7,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from include/linux/mutex.h:16,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:16,
                    from include/linux/dma-mapping.h:7,
                    from include/linux/dma-iommu.h:12,
                    from drivers/iommu/ipmmu-vmsa.c:11:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from arch/x86/include/asm/bitops.h:16,
                    from include/linux/bitops.h:26,
                    from include/linux/bitmap.h:8,
                    from drivers/iommu/ipmmu-vmsa.c:9:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/iommu/ipmmu-vmsa.c: In function 'to_ipmmu':
>> drivers/iommu/ipmmu-vmsa.c:91:31: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
      91 |         return fwspec ? fwspec->iommu_priv : NULL;
         |                               ^~
   drivers/iommu/ipmmu-vmsa.c: In function 'ipmmu_init_platform_device':
   drivers/iommu/ipmmu-vmsa.c:779:15: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     779 |         fwspec->iommu_priv = platform_get_drvdata(ipmmu_pdev);
         |               ^~
   drivers/iommu/ipmmu-vmsa.c: In function 'ipmmu_slave_whitelist':
   drivers/iommu/ipmmu-vmsa.c:824:23: warning: comparison is always false due to limited range of data type [-Wtype-limits]
     824 |         for (i = 0; i < ARRAY_SIZE(rcar_gen3_slave_whitelist); i++) {
         |                       ^
   drivers/iommu/ipmmu-vmsa.c: At top level:
>> drivers/iommu/ipmmu-vmsa.c:966:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     966 |         .map = ipmmu_map,
         |                ^~~~~~~~~
   drivers/iommu/ipmmu-vmsa.c:966:16: note: (near initialization for 'ipmmu_ops.map')
   drivers/iommu/ipmmu-vmsa.c: In function 'to_ipmmu':
>> drivers/iommu/ipmmu-vmsa.c:92:1: warning: control reaches end of non-void function [-Wreturn-type]
      92 | }
         | ^
   cc1: some warnings being treated as errors


vim +966 drivers/iommu/ipmmu-vmsa.c

^590eaf1fec755 Kaixu Xia 2021-03-16  960  
^590eaf1fec755 Kaixu Xia 2021-03-16  961  static const struct iommu_ops ipmmu_ops = {
^590eaf1fec755 Kaixu Xia 2021-03-16  962  	.domain_alloc = ipmmu_domain_alloc,
^590eaf1fec755 Kaixu Xia 2021-03-16  963  	.domain_free = ipmmu_domain_free,
^590eaf1fec755 Kaixu Xia 2021-03-16  964  	.attach_dev = ipmmu_attach_device,
^590eaf1fec755 Kaixu Xia 2021-03-16  965  	.detach_dev = ipmmu_detach_device,
^590eaf1fec755 Kaixu Xia 2021-03-16 @966  	.map = ipmmu_map,
^590eaf1fec755 Kaixu Xia 2021-03-16  967  	.unmap = ipmmu_unmap,
^590eaf1fec755 Kaixu Xia 2021-03-16  968  	.flush_iotlb_all = ipmmu_flush_iotlb_all,
^590eaf1fec755 Kaixu Xia 2021-03-16  969  	.iotlb_sync = ipmmu_iotlb_sync,
^590eaf1fec755 Kaixu Xia 2021-03-16  970  	.iova_to_phys = ipmmu_iova_to_phys,
^590eaf1fec755 Kaixu Xia 2021-03-16  971  	.add_device = ipmmu_add_device,
^590eaf1fec755 Kaixu Xia 2021-03-16  972  	.remove_device = ipmmu_remove_device,
^590eaf1fec755 Kaixu Xia 2021-03-16  973  	.device_group = ipmmu_find_group,
^590eaf1fec755 Kaixu Xia 2021-03-16  974  	.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
^590eaf1fec755 Kaixu Xia 2021-03-16  975  	.of_xlate = ipmmu_of_xlate,
^590eaf1fec755 Kaixu Xia 2021-03-16  976  };
^590eaf1fec755 Kaixu Xia 2021-03-16  977  

:::::: The code at line 966 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
