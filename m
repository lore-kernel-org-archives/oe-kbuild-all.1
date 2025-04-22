Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763214C5B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336867; cv=none; b=Xhe9A6v7AEIVWGF9X2xJ0GJLRd5t+xrxW9XF1Xvpw/pDO+aJrsKNy6NweTFAAWtLd1z4GZBhNRf/OsGZyGst5+oPaaTEjwhsE0QHshLiNNOaYvUhr0lPQe1tKtsLrgBcoGpmRapeiOVH/7NAQkcOTT7VPLeELlHRBDEDOUlNBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336867; c=relaxed/simple;
	bh=G6hexDWsgjqSii1MVl50yojHEpQ6cvegSEhFEyJdQ0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JrAolavYcPMFPPS6eqXePvDEZmDTts/JlPxJCSB4bcJVygpsSZ7UEZVIaGPA9rJh7wpV5HfjlqfM/VEpUriGS1xPiFGt6Ot7XuEjHkF/PXOIuNGut8J5db5JXusAlfOnz8FsJFWrtpj99XUp6//SfoZ+whzm0rGxPT7+Zo2BdEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuywCaP1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuywCaP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745336863; x=1776872863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6hexDWsgjqSii1MVl50yojHEpQ6cvegSEhFEyJdQ0o=;
  b=AuywCaP1AA7KCXZwHRM8EUuoolH4ynJb8JC4xj02Rw0hmYjzd+MRlVkn
   PReXZ3XQsK49+j7+eGeFS6FaNElKOrCuCQhWy6iTt12zDaFv0OPkIFV7Y
   F30RoABQUWuRurnDPY5ESkSwxprQG+/qzXSWe1jIEcT8a5xmhvRTlwqWv
   y3EDy8SVj+qY8n5iKOMz3icYCDm/dFVfL47MRh6KGjhayVwSzD2tcu6K2
   3BIbQXBaPQehJWBWN/cf6B6MLuiQkr9Y7kOYS54PrxAPr/TR1PAjvREbB
   kfAhnEyG54rRu3Sp42jWOnxYHdPxE4gNx0toK5vLRTHSxxPY8aTsUZQXS
   A==;
X-CSE-ConnectionGUID: SxQR6nMiRG2JEibEez5hsA==
X-CSE-MsgGUID: 3zjn309gTf6jFc35nvKqrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69393591"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="69393591"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:47:42 -0700
X-CSE-ConnectionGUID: tvdKISyYTN6bnJEUaxRGzg==
X-CSE-MsgGUID: v9u8xhE+RiqNY67bM200vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="131796910"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2025 08:47:41 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7FqU-00017j-3D;
	Tue, 22 Apr 2025 15:47:39 +0000
Date: Tue, 22 Apr 2025 23:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 21/21]
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:376:34: error:
 incompatible pointer to integer conversion passing 'struct regmap *' to
 parameter of type 'int'
Message-ID: <202504222301.4zR9qSMZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f140971cf554cfa7c517cfb96260a3a674e9166f
commit: 767753385164d9ffc25c22e2825199a8b3471fea [21/21] CHROMIUM: jpeg: refactor jpeg smmu sid setting interface
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250422/202504222301.4zR9qSMZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504222301.4zR9qSMZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504222301.4zR9qSMZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:1628:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:376:34: error: incompatible pointer to integer conversion passing 'struct regmap *' to parameter of type 'int' [-Wint-conversion]
     376 |                 return dev_err_probe(dev->dev, dev->smmu_regmap,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:278:64: note: passing argument to parameter 'err' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                ^
   4 warnings and 1 error generated.
--
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:1628:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:637:34: error: incompatible pointer to integer conversion passing 'struct regmap *' to parameter of type 'int' [-Wint-conversion]
     637 |                 return dev_err_probe(dev->dev, dev->smmu_regmap,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:278:64: note: passing argument to parameter 'err' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                ^
   4 warnings and 1 error generated.


vim +376 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

   364	
   365	static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
   366	{
   367		struct mtk_jpeg_dev *master_dev = dev->master_dev;
   368	
   369		if (!master_dev->variant->support_smmu)
   370			return 0;
   371	
   372		dev->smmu_regmap =
   373	                syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
   374							"mediatek,smmu-config");
   375	        if (IS_ERR(dev->smmu_regmap)) {
 > 376			return dev_err_probe(dev->dev, dev->smmu_regmap,
   377					     "mmap smmu_base failed(%ld)\n",
   378					     PTR_ERR(dev->smmu_regmap));
   379		}
   380	
   381		return 0;
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
