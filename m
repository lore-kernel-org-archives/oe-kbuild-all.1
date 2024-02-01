Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8AE15E9C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706756962; cv=none; b=JAHokJ1AzASgsPY8V5cD4tcCWxyncvDoeP1SoNk+p1yM1fxMMURdOLXrfv+Ppe/P+5qyu8ZwvFzyOlYAb47m5TGcVxjJRsbn5fnDsff0ZXU5E/VioIhu39sKK29FPWN0jd0hHxuvYmONJCcyTIkHQLOd/mLZQj3uMQwVdLTsv7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706756962; c=relaxed/simple;
	bh=QzGtZbskeMKfmN4c0IHC8E6A05jJzHiedxjhSX6h9Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXntuHf04WYgF9ydBhmIrGnPnEwkol8LbylVMEJrS+bULoQMThJA3FxstbI9fN6Vz+PBbgms/sHDh9ncPAi/XbcopYttN/M85sj/holKcTfvbJZTm2U7lPPO+O5rrrJ4V3o70vDawrTBgKuEFC8Wa/hu+aNC7He+0xIzuMOklQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cm9qlU47; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cm9qlU47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706756960; x=1738292960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzGtZbskeMKfmN4c0IHC8E6A05jJzHiedxjhSX6h9Uk=;
  b=Cm9qlU47X4AOImS8e6TCj2CcBXaqLOvTaNG+Tnm36FOlx2csMlYPJjOj
   eRMMyC9BdRnKeyYbTGoin3F2jyrLIVkmuYSsLhXHxe4S5fpDFqhjhucdu
   cWCBE8WgqFOGMYW1KDxaKLBMe2L0raEjY2z2M0UUUx16wM206fHB7qcZh
   OD8bKH0aikxcN+7BO76Bx0acq8GcKkg69f98lNMvug5BdB0eoVSFtVe8L
   1pDDtVm166cvjTTAeqsUUfUEtJfzScYritXkcGdupSgSY8/HF3/Vdx2Qm
   cP93s1ko2L1fp/eZzFykZl4TlDyizlYp/Ow4kbzgzhcMrFHUoaWrwTO3Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468029224"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="468029224"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 19:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738301369"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="738301369"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2024 19:09:18 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVNRz-0002JW-34;
	Thu, 01 Feb 2024 03:09:15 +0000
Date: Thu, 1 Feb 2024 11:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommu_cache_flush_refactor 5/8]
 drivers/iommu/intel/pasid.c:257:41: warning: implicit conversion from 'u64'
 (aka 'unsigned long long') to 'unsigned long' changes value from
 18446744073709551615 to 4294967295
Message-ID: <202402011042.Jk5YtdZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/yiliu1765/iommufd.git wip/iommu_cache_flush_refactor
head:   f2fec66c24236299f6cd347135ac7b39ee5cc555
commit: 409be2dd13f01025d30d24b78287beaf85a02eed [5/8] iommu/vt-d: Use U64_MAX instead of -1
config: i386-randconfig-016-20240201 (https://download.01.org/0day-ci/archive/20240201/202402011042.Jk5YtdZ7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011042.Jk5YtdZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011042.Jk5YtdZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/pasid.c:257:41: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     257 |                 qi_flush_piotlb(iommu, did, pasid, 0, U64_MAX, 0);
         |                 ~~~~~~~~~~~~~~~                       ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
   drivers/iommu/intel/pasid.c:279:41: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     279 |                 qi_flush_piotlb(iommu, did, pasid, 0, U64_MAX, 0);
         |                 ~~~~~~~~~~~~~~~                       ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
   drivers/iommu/intel/pasid.c:569:40: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     569 |         qi_flush_piotlb(iommu, did, pasid, 0, U64_MAX, 0);
         |         ~~~~~~~~~~~~~~~                       ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
   3 warnings generated.
--
>> drivers/iommu/intel/iommu.c:1450:52: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1450 |                         domain_flush_pasid_iotlb(iommu, dmar_domain, 0, U64_MAX, 0);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~                        ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
   1 warning generated.
--
>> drivers/iommu/intel/dmar.c:1567:13: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
    1567 |         if (npages == U64_MAX) {
         |             ~~~~~~ ^  ~~~~~~~
   1 warning generated.


vim +257 drivers/iommu/intel/pasid.c

   232	
   233	void intel_pasid_tear_down_entry(struct intel_iommu *iommu, struct device *dev,
   234					 u32 pasid, bool fault_ignore)
   235	{
   236		struct pasid_entry *pte;
   237		u16 did, pgtt;
   238	
   239		spin_lock(&iommu->lock);
   240		pte = intel_pasid_get_entry(dev, pasid);
   241		if (WARN_ON(!pte) || !pasid_pte_is_present(pte)) {
   242			spin_unlock(&iommu->lock);
   243			return;
   244		}
   245	
   246		did = pasid_get_domain_id(pte);
   247		pgtt = pasid_pte_get_pgtt(pte);
   248		intel_pasid_clear_entry(dev, pasid, fault_ignore);
   249		spin_unlock(&iommu->lock);
   250	
   251		if (!ecap_coherent(iommu->ecap))
   252			clflush_cache_range(pte, sizeof(*pte));
   253	
   254		pasid_cache_invalidation_with_pasid(iommu, did, pasid);
   255	
   256		if (pgtt == PASID_ENTRY_PGTT_PT || pgtt == PASID_ENTRY_PGTT_FL_ONLY)
 > 257			qi_flush_piotlb(iommu, did, pasid, 0, U64_MAX, 0);
   258		else
   259			iommu->flush.flush_iotlb(iommu, did, 0, 0, DMA_TLB_DSI_FLUSH);
   260	
   261		/* Device IOTLB doesn't need to be flushed in caching mode. */
   262		if (!cap_caching_mode(iommu->cap))
   263			devtlb_invalidation_with_pasid(iommu, dev, pasid);
   264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
