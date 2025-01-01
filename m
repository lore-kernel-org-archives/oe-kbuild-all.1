Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB846B5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735719025; cv=none; b=OBZ01DRdz7dade7yd3bJCMxiUmqJYjj0JJP0febyXtLs5YdrEM95dgNIPmqZlMjbb4EYUqlgXyZ3eJMRplMKYnaJ/8LMP30HAoD9+4QhwTkg1yf3GnYorVp3bgdjvUi9QqsYn344iu0vZq+nTRyZtzrHxbBqmYxalXfpGCkJhhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735719025; c=relaxed/simple;
	bh=HEorAkrSvHEW4D4VkvZXW10VPFyms0d8xtCApwUeD+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qeNy9UgTC/9wt4nnVHJIKQx/smC1scIoO2vNojrOAl9nNpbpG0xKRTcEMFI1nPdquda2FvInQnWn0epbqgR5k1B0W7FZYBftexjY9yb/Y5ycoWh2r7p2WZGU1xveVwqcMuJbbeaDvPlgJO4nGZAy9ukmC7ZG1XxtbSzjQlvMVlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXIxVTGh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXIxVTGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735719023; x=1767255023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HEorAkrSvHEW4D4VkvZXW10VPFyms0d8xtCApwUeD+I=;
  b=aXIxVTGh2AQm0t4SY7dCW4APx9UmjChaiHJSJSQp7SCT4syB6oRpqAHK
   nOQA/z4pFMmlrkoRMwf/p7k3IqA5FZ2uNelTknLu/DZm4BdPsYf7orv8I
   d7aJudUzS4SZ10a0rmQhl5yEo6WmF85UitPw25WfRlH6+yicZebEqHkHE
   kwMujpHy9/yeDR5ukabcnyCBm+GHK1xM17Env9cDCYnlFhD1sSxdynnet
   jkbnO7H/zYwmT7Dv6YyPkPCZfJ7O1H/MDrl1ZLNAa7TT8ph3mJ32U/3Ge
   SznADq6WSXnKnsi/rNwTUlW0H2pHaCHCsAs5qE6z5Dztv3i6qUJDEI9vR
   A==;
X-CSE-ConnectionGUID: Nb8LISuISy+WmvhRGWhkvQ==
X-CSE-MsgGUID: xSPGe0JLSHyezXDsk6GJKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="38809169"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="38809169"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 00:10:22 -0800
X-CSE-ConnectionGUID: CgdAURqlQ+659bfvDkNPag==
X-CSE-MsgGUID: KRBLGTtNRlqNJabTMzyXKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="101326254"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jan 2025 00:10:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSto0-0007iR-1b;
	Wed, 01 Jan 2025 08:10:16 +0000
Date: Wed, 1 Jan 2025 16:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/iommu/ipmmu-vmsa.c:92:1: warning: control reaches end of non-void
 function
Message-ID: <202501011609.jmplkElH-lkp@intel.com>
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
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: a9fffbc714b2163772232f4ea9e95ce490088830 [2441/2441] iommu/amd: Convert AMD iommu driver to the dma-iommu api
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250101/202501011609.jmplkElH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011609.jmplkElH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011609.jmplkElH-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/iommu/ipmmu-vmsa.c:91:31: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
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
   drivers/iommu/ipmmu-vmsa.c:966:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     966 |         .map = ipmmu_map,
         |                ^~~~~~~~~
   drivers/iommu/ipmmu-vmsa.c:966:16: note: (near initialization for 'ipmmu_ops.map')
   drivers/iommu/ipmmu-vmsa.c: In function 'to_ipmmu':
>> drivers/iommu/ipmmu-vmsa.c:92:1: warning: control reaches end of non-void function [-Wreturn-type]
      92 | }
         | ^
   cc1: some warnings being treated as errors


vim +92 drivers/iommu/ipmmu-vmsa.c

5914c5fdde9266 Joerg Roedel 2015-03-26  86  
e4efe4a9a2ace6 Robin Murphy 2017-10-13  87  static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
0fbc8b04c34fef Magnus Damm  2017-05-17  88  {
df90365580623b Joerg Roedel 2018-11-29  89  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
df90365580623b Joerg Roedel 2018-11-29  90  
df90365580623b Joerg Roedel 2018-11-29  91  	return fwspec ? fwspec->iommu_priv : NULL;
0fbc8b04c34fef Magnus Damm  2017-05-17 @92  }
0fbc8b04c34fef Magnus Damm  2017-05-17  93  

:::::: The code at line 92 was first introduced by commit
:::::: 0fbc8b04c34fef1d730712135c504978c939a5a3 iommu/ipmmu-vmsa: Use fwspec iommu_priv on ARM64

:::::: TO: Magnus Damm <damm+renesas@opensource.se>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
