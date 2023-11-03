Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D352033A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WktoeF31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699047997; x=1730583997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WxllRlh0gRSBOf8RS+FxtYyYzirdJKxt7wkYfCpif2Q=;
  b=WktoeF31F//Cnu0CjG9dWSx2YVGIKP7ucT7hXB6agAKGr3Hp/FSk5+KA
   zOlGO4UqFOQYvWdSnqYPNBbgbsRYsHiwomMGTlahMpm0RUUXP6ryF9wWc
   ICETHM9oUtiDLCDQAV1KxJH7+dEi0DnjXyuirv07bvt4RRwkzIr5rBE7D
   OB5q+yPbOwxRSEvmR33PhBoPEq3IvERDhsxTRDtauIJ/4IHqj54iopLWg
   GVe4B5OSmcZAGPCNckNpQX0Z9vA5O9Tc/ksKbHCXjkZUKOq8L8g/xK4x0
   /qVowc7o0DOABGhJGqKkMAqFR/iWPGGAudmrjB1Z4Y0ySUp8mNsblmHjG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="374061397"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="374061397"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 14:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832149932"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="832149932"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 14:46:34 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz1zs-0002y8-3D;
	Fri, 03 Nov 2023 21:46:32 +0000
Date: Sat, 4 Nov 2023 05:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommufd-io-pgfault-delivery-v2 15/20] htmldocs:
 ./include/uapi/linux/iommufd.h:488: warning: Function parameter or member
 'out_fault_fd' not described in 'iommu_hwpt_alloc'
Message-ID: <202311040530.rqlafwD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git iommufd-io-pgfault-delivery-v2
head:   357b5abcba0477f7f1391dd0fa3a919a6f06bdf0
commit: dfbe776b36031f87cec7227874c7f8c897649ef0 [15/20] iommufd: Add iommu page fault uapi data
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040530.rqlafwD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040530.rqlafwD9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/linux/iommufd.h:488: warning: Function parameter or member 'out_fault_fd' not described in 'iommu_hwpt_alloc'
>> ./include/uapi/linux/iommufd.h:745: warning: expecting prototype for struct iommu_hwpt_response. Prototype was for struct iommu_hwpt_page_response instead
>> Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:700: WARNING: Unexpected indentation.
>> Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:695: WARNING: Unknown target name: "iommu_pgfault_flags".

vim +488 ./include/uapi/linux/iommufd.h

15b096a0e29a27 Yi Liu          2023-09-01  445  
7074d7bd67d495 Jason Gunthorpe 2023-07-17  446  /**
7074d7bd67d495 Jason Gunthorpe 2023-07-17  447   * struct iommu_hwpt_alloc - ioctl(IOMMU_HWPT_ALLOC)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  448   * @size: sizeof(struct iommu_hwpt_alloc)
19386259999cfd Yi Liu          2023-09-01  449   * @flags: Combination of enum iommufd_hwpt_alloc_flags
7074d7bd67d495 Jason Gunthorpe 2023-07-17  450   * @dev_id: The device to allocate this HWPT for
0db73b27b5cdc6 Yi Liu          2023-03-03  451   * @pt_id: The IOAS or HWPT to connect this HWPT to
7074d7bd67d495 Jason Gunthorpe 2023-07-17  452   * @out_hwpt_id: The ID of the new HWPT
7074d7bd67d495 Jason Gunthorpe 2023-07-17  453   * @__reserved: Must be 0
0db73b27b5cdc6 Yi Liu          2023-03-03  454   * @hwpt_type: One of enum iommu_hwpt_type
0db73b27b5cdc6 Yi Liu          2023-03-03  455   * @data_len: Length of the type specific data
0db73b27b5cdc6 Yi Liu          2023-03-03  456   * @data_uptr: User pointer to the type specific data
7074d7bd67d495 Jason Gunthorpe 2023-07-17  457   *
7074d7bd67d495 Jason Gunthorpe 2023-07-17  458   * Explicitly allocate a hardware page table object. This is the same object
7074d7bd67d495 Jason Gunthorpe 2023-07-17  459   * type that is returned by iommufd_device_attach() and represents the
7074d7bd67d495 Jason Gunthorpe 2023-07-17  460   * underlying iommu driver's iommu_domain kernel object.
7074d7bd67d495 Jason Gunthorpe 2023-07-17  461   *
0db73b27b5cdc6 Yi Liu          2023-03-03  462   * A kernel-managed HWPT will be created with the mappings from the given
0db73b27b5cdc6 Yi Liu          2023-03-03  463   * IOAS via the @pt_id. The @hwpt_type for this allocation can be set to
0db73b27b5cdc6 Yi Liu          2023-03-03  464   * either IOMMU_HWPT_TYPE_DEFAULT or a pre-defined type corresponding to
0db73b27b5cdc6 Yi Liu          2023-03-03  465   * an I/O page table type supported by the underlying IOMMU hardware.
0db73b27b5cdc6 Yi Liu          2023-03-03  466   *
0db73b27b5cdc6 Yi Liu          2023-03-03  467   * A user-managed HWPT will be created from a given parent HWPT via the
0db73b27b5cdc6 Yi Liu          2023-03-03  468   * @pt_id, in which the parent HWPT must be allocated previously via the
0db73b27b5cdc6 Yi Liu          2023-03-03  469   * same ioctl from a given IOAS (@pt_id). In this case, the @hwpt_type
0db73b27b5cdc6 Yi Liu          2023-03-03  470   * must be set to a pre-defined type corresponding to an I/O page table
0db73b27b5cdc6 Yi Liu          2023-03-03  471   * type supported by the underlying IOMMU hardware.
0db73b27b5cdc6 Yi Liu          2023-03-03  472   *
0db73b27b5cdc6 Yi Liu          2023-03-03  473   * If the @hwpt_type is set to IOMMU_HWPT_TYPE_DEFAULT, @data_len and
0db73b27b5cdc6 Yi Liu          2023-03-03  474   * @data_uptr should be zero. Otherwise, both @data_len and @data_uptr
0db73b27b5cdc6 Yi Liu          2023-03-03  475   * must be given.
7074d7bd67d495 Jason Gunthorpe 2023-07-17  476   */
7074d7bd67d495 Jason Gunthorpe 2023-07-17  477  struct iommu_hwpt_alloc {
7074d7bd67d495 Jason Gunthorpe 2023-07-17  478  	__u32 size;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  479  	__u32 flags;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  480  	__u32 dev_id;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  481  	__u32 pt_id;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  482  	__u32 out_hwpt_id;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  483  	__u32 __reserved;
0db73b27b5cdc6 Yi Liu          2023-03-03  484  	__u32 hwpt_type;
0db73b27b5cdc6 Yi Liu          2023-03-03  485  	__u32 data_len;
0db73b27b5cdc6 Yi Liu          2023-03-03  486  	__aligned_u64 data_uptr;
dfbe776b36031f Lu Baolu        2023-10-07  487  	__u32 out_fault_fd;
7074d7bd67d495 Jason Gunthorpe 2023-07-17 @488  };
7074d7bd67d495 Jason Gunthorpe 2023-07-17  489  #define IOMMU_HWPT_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_HWPT_ALLOC)
60fedb262bbc63 Lu Baolu        2023-08-18  490  

:::::: The code at line 488 was first introduced by commit
:::::: 7074d7bd67d495cb3f6fe7c7c96b357a3b9d4ec2 iommufd: Add IOMMU_HWPT_ALLOC

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
