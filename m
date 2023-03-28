Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D9AD30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680027387; x=1711563387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zBQitEvYxCLjLt1+EQCRPPqqsZ2f4VP3z/thZj5ux5U=;
  b=ixyUTCL05Ta+Mw5I4Olv3aGbsJmKDFDmISYbabsx2Y0hyNx/uDmFARQq
   Xa7cA+iYk1261otSP7bhTdLXBahkksag/38OJuXIW/ryuANkkRs7YToNh
   wTtXOEbvxvqjLIyYZnxvrIs9lOwhcmX4kGtixmCcTrc4GPdVHr0muWnpa
   FiszArPVyX38+ZNk2+vUJG2SCHWemRNGO0ha0sWHMsuW/XyV9oe0b+hKb
   DOVQlpkGafnGrWDVJRXLhTURRwfW0LrfMss21PyK6JuHXypWv5L1d0pdf
   nDvno5QqBaX2xzhantytQOD1RYyLxBmwyJd5KNIopOx76gxvtT9ELyHnZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405592320"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="405592320"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 11:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="1013668203"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="1013668203"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2023 11:16:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phDrk-000Inv-05;
	Tue, 28 Mar 2023 18:16:16 +0000
Date: Wed, 29 Mar 2023 02:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd-v5.19-rc5 89/104] htmldocs:
 ./include/uapi/linux/iommufd.h:506: warning: expecting prototype for struct
 iommu_hwpt_invalidate_s1_cache. Prototype was for struct
 iommu_cache_invalidate_info instead
Message-ID: <202303290221.lmtYN3Kh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: f06d7e4ee0b250be209bf105edc7a5b1caeb79d3 [89/104] uapi/iommufd: Add user structures for nesting
reproduce:
        # https://github.com/yiliu1765/iommufd/commit/f06d7e4ee0b250be209bf105edc7a5b1caeb79d3
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd iommufd-v5.19-rc5
        git checkout f06d7e4ee0b250be209bf105edc7a5b1caeb79d3
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290221.lmtYN3Kh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/linux/iommufd.h:506: warning: expecting prototype for struct iommu_hwpt_invalidate_s1_cache. Prototype was for struct iommu_cache_invalidate_info instead
>> Documentation/userspace-api/iommufd:178: ./include/uapi/linux/iommufd.h:411: WARNING: Unexpected indentation.
>> Documentation/userspace-api/iommufd:178: ./include/uapi/linux/iommufd.h:413: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +506 ./include/uapi/linux/iommufd.h

   459	
   460	/**
   461	 * struct iommu_hwpt_invalidate_s1_cache - ioctl(IOMMU_HWPT_INVAL_S1_CACHE)
   462	 * @size: sizeof(struct iommu_hwpt_invalidate_s1_cache)
   463	 * @flags: Must be 0
   464	 * @hwpt_id: hwpt ID of target hardware page table for the invalidation
   465	 * @cache: bitfield that allows to select which caches to invalidate
   466	 * @granularity: defines the lowest granularity used for the invalidation:
   467	 *     domain > PASID > addr
   468	 * @padding: reserved for future use (should be zero)
   469	 * @pasid_info: invalidation data when @granularity is %IOMMU_INV_GRANU_PASID
   470	 * @addr_info: invalidation data when @granularity is %IOMMU_INV_GRANU_ADDR
   471	 *
   472	 * Not all the combinations of cache/granularity are valid:
   473	 *
   474	 * +--------------+---------------+---------------+---------------+
   475	 * | type /       |   DEV_IOTLB   |     IOTLB     |      PASID    |
   476	 * | granularity  |               |               |      cache    |
   477	 * +==============+===============+===============+===============+
   478	 * | DOMAIN       |       N/A     |       Y       |       Y       |
   479	 * +--------------+---------------+---------------+---------------+
   480	 * | PASID        |       Y       |       Y       |       Y       |
   481	 * +--------------+---------------+---------------+---------------+
   482	 * | ADDR         |       Y       |       Y       |       N/A     |
   483	 * +--------------+---------------+---------------+---------------+
   484	 *
   485	 * Invalidations by %IOMMU_INV_GRANU_DOMAIN don't take any argument other than
   486	 * @version and @cache.
   487	 *
   488	 * If multiple cache types are invalidated simultaneously, they all
   489	 * must support the used granularity.
   490	 */
   491	struct iommu_cache_invalidate_info {
   492	#define IOMMU_CACHE_INVALIDATE_INFO_VERSION_1 1
   493		__u32	version;
   494	/* IOMMU paging structure cache */
   495	#define IOMMU_CACHE_INV_TYPE_IOTLB	(1 << 0) /* IOMMU IOTLB */
   496	#define IOMMU_CACHE_INV_TYPE_DEV_IOTLB	(1 << 1) /* Device IOTLB */
   497	#define IOMMU_CACHE_INV_TYPE_PASID	(1 << 2) /* PASID cache */
   498	#define IOMMU_CACHE_INV_TYPE_NR		(3)
   499		__u8	cache;
   500		__u8	granularity;
   501		__u8	padding[6];
   502		union {
   503			struct iommu_inv_pasid_info pasid_info;
   504			struct iommu_inv_addr_info addr_info;
   505		} granu;
 > 506	};
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
