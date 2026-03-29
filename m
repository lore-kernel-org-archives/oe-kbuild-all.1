Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D31256C84
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774824025; cv=none; b=hyy3s+gIrfDinEc9VNTtxHT3+cljSxdEXuCQMdvZmNsCPXpfMQSOzd7Vqc9Nwln8Le41pqaT+Y18DpnvgIMiPdxtHZXDv+5uBxQTb6OKOoGeFJJjGioJrnQ2T+CadhZ56sMObE+VbuABwabeYBeCRVbATozY9ympMRsJYVaL8vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774824025; c=relaxed/simple;
	bh=/s+X1yD5mjXWU5I1EzpCI3vFVo4LhkXD0z5KH/es/vw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ThbSXgxR/GfT5/rcdHgYQoHR/72905KflPiOHj+9aZaQ9Q287Xv8JOMYwXdj7PHm1ZGtf+ECjjtlgjFCZlKsn8fXqgSGSTX+OP2Kg8xKUCGlnBqyM9oDEuJbtrW7G5FezaGqq6tVc8FFL0sOi/plRBvAEl0a0UHTWKxFVK9R5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFavpqeq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFavpqeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774824023; x=1806360023;
  h=date:from:to:cc:subject:message-id;
  bh=/s+X1yD5mjXWU5I1EzpCI3vFVo4LhkXD0z5KH/es/vw=;
  b=VFavpqeq6m5PRT8OmWiDn78I+z7vxy74VpLQjI0ewAWSUk2sJT9lnC47
   ann+T9jpiKJPYYvZsKO/WNrn/A2WjPJd/Fi4bf65iRD/pF5WLuFpcpvpt
   D3FoZMMsmkg6ebGi2aL7y25/Emtgr/sE2GS9vbcvYO4v1QCEeT2aV3Dig
   KqFEt1ezC4CfUWI90TFj2qyuZoVzcWaKD2NEPgIkZwKxm1ynTjD43qzqy
   1DVKDPmLMfyJRs17O/E71fzXnH0NNf3G/yzDqxBwuBQqT443c7AbAl721
   UB4eit3yl5tz0WeL3Tzz+kO0RmnH9uHNUwCoYLfa3etPCC5ITM/R4iiQG
   g==;
X-CSE-ConnectionGUID: /d+9vkp2RQCL+u5IoAyGug==
X-CSE-MsgGUID: 2mJuUWwIQ6q//nK2vZ5pgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75703499"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75703499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 15:40:23 -0700
X-CSE-ConnectionGUID: u0TUuzCbR/il+ysVty0oeQ==
X-CSE-MsgGUID: 3ey5yqTDQ3a4douPYiFrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="230683899"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Mar 2026 15:40:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ynq-000000007z7-3DWX;
	Sun, 29 Mar 2026 22:40:18 +0000
Date: Mon, 30 Mar 2026 00:40:12 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1] htmldocs:
 Documentation/virt/kvm/devices/vfio.rst:21: WARNING: Definition list ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202603300054.X5BzpfTJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d36fd08818dc78f214d13bede4b8ae4d43848a08
commit: 9256f713ae14e0aebd300c5152fc1f11cc71664b [0/1] ANDROID: KVM: arm64: Add documentation for pvIOMMU UAPI
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260330/202603300054.X5BzpfTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300054.X5BzpfTJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ``ARM_SMCCC_VENDOR_HYP_KVM_PVIOMMU_OP_FUNC_ID``
   -------------------------------------- [docutils]
   Documentation/virt/kvm/arm/mmio-guard.rst:94: ERROR: Unexpected indentation. [docutils]
>> Documentation/virt/kvm/devices/vfio.rst:21: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:77: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/virt/kvm/devices/vfio.rst:84: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:88: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:97: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:105: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:106: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/incfs.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +21 Documentation/virt/kvm/devices/vfio.rst

    17	
    18	Groups:
    19	  KVM_DEV_VFIO_FILE
    20		alias: KVM_DEV_VFIO_GROUP
  > 21	  KVM_DEV_VFIO_PVIOMMU
    22	
    23	KVM_DEV_VFIO_FILE attributes:
    24	  KVM_DEV_VFIO_FILE_ADD: Add a VFIO file (group/device) to VFIO-KVM device
    25		tracking
    26	
    27		kvm_device_attr.addr points to an int32_t file descriptor for the
    28		VFIO file.
    29	
    30	  KVM_DEV_VFIO_FILE_DEL: Remove a VFIO file (group/device) from VFIO-KVM
    31		device tracking
    32	
    33		kvm_device_attr.addr points to an int32_t file descriptor for the
    34		VFIO file.
    35	
    36	KVM_DEV_VFIO_GROUP (legacy kvm device group restricted to the handling of VFIO group fd):
    37	  KVM_DEV_VFIO_GROUP_ADD: same as KVM_DEV_VFIO_FILE_ADD for group fd only
    38	
    39	  KVM_DEV_VFIO_GROUP_DEL: same as KVM_DEV_VFIO_FILE_DEL for group fd only
    40	
    41	  KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE: attaches a guest visible TCE table
    42		allocated by sPAPR KVM.
    43		kvm_device_attr.addr points to a struct::
    44	
    45			struct kvm_vfio_spapr_tce {
    46				__s32	groupfd;
    47				__s32	tablefd;
    48			};
    49	
    50		where:
    51	
    52		- @groupfd is a file descriptor for a VFIO group;
    53		- @tablefd is a file descriptor for a TCE table allocated via
    54		  KVM_CREATE_SPAPR_TCE.
    55	
    56	The FILE/GROUP_ADD operation above should be invoked prior to accessing the
    57	device file descriptor via VFIO_GROUP_GET_DEVICE_FD in order to support
    58	drivers which require a kvm pointer to be set in their .open_device()
    59	callback.  It is the same for device file descriptor via character device
    60	open which gets device access via VFIO_DEVICE_BIND_IOMMUFD.  For such file
    61	descriptors, FILE_ADD should be invoked before VFIO_DEVICE_BIND_IOMMUFD
    62	to support the drivers mentioned in prior sentence as well.
    63	
    64	KVM_DEV_VFIO_PVIOMMU attributes:
    65	  KVM_DEV_VFIO_PVIOMMU_ATTACH: Create and attach a pvIOMMU instance to the
    66	    KVM VM associated with this device, returns a file descriptor "pviommufd"
    67	    for this IOMMU which supports some IOCTLs.
    68	
    69	  KVM_DEV_VFIO_PVIOMMU_GET_INFO: Retrieve information about IOMMUs for a VFIO
    70	    devicefd, using the following struct:
    71	
    72			struct kvm_vfio_iommu_info {
    73				__u32 size;
    74				__s32 device_fd;
    75				__u32 out_nr_sids;
    76				__u32 __reserved;
    77			};
    78	
    79		  Where kvm_vfio_iommu_info.device_fd the input VFIO device ID, and
    80		  kvm_vfio_iommu_info.out_nr_sids is the number stream IDs(endpoint) for
    81		  this device, this similar to VFIO_DEVICE_GET_IRQ_INFO which returns the
    82		  number of irqs for a VFIO device.
    83		  size is added to allow the struct to be extended, while __reserved
  > 84	      must be zero.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
