Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBFDDDB7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 07:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMKyWN0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702538040; x=1734074040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mredddinhjXo35Mr6gRlHKUylrg2J4R50ip+2e/oqsk=;
  b=UMKyWN0r8/TvRlvDe1Uj1I5zzPCF8jD+IZimk33s78E+56eVmK+275mI
   jDRqo7f3m3gB/kOe3fvoAJ73kZubX81Xy9rHKSmOoCscXXraL05p5RFzM
   5tlb0TygF+OYXjEU4Cm+O8GLmmLiU8cc+/73rfA9BqGIRXLmDw9OUWflN
   Phb3X4lCIGO2CztI7nPKzTmrup/CH6s7MKToOWFXDceHabemcnxRJsp0G
   dq0EES15FfIQdUq35NcP5TGUTHD/IOzygmKWdzg0/QODTmqyNBR8u8NaX
   eH4uZU842SkOMhrHkHqoupl5OkaRwB2opiQvf7kTlGJm4dh0vUiaWxWBv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8476137"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="8476137"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 23:13:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1105589887"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="1105589887"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2023 23:13:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDfuu-000Liz-0C;
	Thu, 14 Dec 2023 07:13:56 +0000
Date: Thu, 14 Dec 2023 15:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-12132023-yi 8/10] htmldocs:
 ./include/uapi/linux/iommufd.h:676: warning: Function parameter or member
 'code' not described in 'iommu_hwpt_vtd_s1_invalidate'
Message-ID: <202312141537.gCYDU3dy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-12132023-yi
head:   2356965a99722d36c016a67291635b729229a752
commit: 66f5fcd475e470614eaa7b4bfe5589d05f775c59 [8/10] iommufd: Add data structure for Intel VT-d stage-1 cache invalidation
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141537.gCYDU3dy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141537.gCYDU3dy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/linux/iommufd.h:676: warning: Function parameter or member 'code' not described in 'iommu_hwpt_vtd_s1_invalidate'

vim +676 ./include/uapi/linux/iommufd.h

   642	
   643	/**
   644	 * struct iommu_hwpt_vtd_s1_invalidate - Intel VT-d cache invalidation
   645	 *                                       (IOMMU_HWPT_DATA_VTD_S1)
   646	 * @addr: The start address of the addresses to be invalidated. It needs
   647	 *        to be 4KB aligned.
   648	 * @npages: Number of contiguous 4K pages to be invalidated.
   649	 * @flags: Combination of enum iommu_hwpt_vtd_s1_invalidate_flags
   650	 * @__reserved: Must be 0.
   651	 * @error_code: One of enum iommu_hwpt_vtd_s1_invalidate_error_code
   652	 * @dev_id: The device in the invalidation completion message, it's meaninfful
   653	 *          when @error_code is set to IOMMU_HWPT_VTD_S1_INVALIDATE_DEVTLB_ICE
   654	 *          or IOMMU_HWPT_VTD_S1_INVALIDATE_DEVTLB_ITE.
   655	 *
   656	 * The Intel VT-d specific invalidation data for user-managed stage-1 cache
   657	 * invalidation in nested translation. Userspace uses this structure to
   658	 * tell the impacted cache scope after modifying the stage-1 page table.
   659	 *
   660	 * Invalidating all the caches related to the page table by setting @addr
   661	 * to be 0 and @npages to be U64_MAX.
   662	 *
   663	 * @error_code is meaningful only if the request is handled by kernel. This
   664	 * can be known by checking struct iommu_hwpt_invalidate::req_num output.
   665	 * @error_code only covers the errors detected by hardware after submitting
   666	 * the invalidation. The software detected errors would go through the normal
   667	 * ioctl errno.
   668	 */
   669	struct iommu_hwpt_vtd_s1_invalidate {
   670		__aligned_u64 addr;
   671		__aligned_u64 npages;
   672		__u32 flags;
   673		__u32 __reserved;
   674		__u32 code;
   675		__u32 dev_id;
 > 676	};
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
