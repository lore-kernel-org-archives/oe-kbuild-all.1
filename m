Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2657335BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726650855; cv=none; b=OmeLcth+fUiulTCsC2R+yVZQnGIHsEOtZ75zTPHE7mZCcv/IkT3Ha/09Y8xcFXYZbOEXeQ7tFc9B3dOrb7mquSTjofI3efT5SDV3dZ+wRBVTvBkhOsazz4ZOzacZVDozQEOwjXPsN3fdigrrklPPfgACAMVynh/11mTmMvKnoMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726650855; c=relaxed/simple;
	bh=4LHmhI5iJTI+3h0IFjqDKJW3uKtSK1cyhY+PMjqiST4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugl60qACnVIModPaBiAB4FwDTwdq9wMmx+mZLj0VT1eM3Z+8bCCN68Lc0UR4Pzv13QOl1bUrDRRvM00pb06AaHDhvbcgkmm2xQosnclWXWDkOYnA+Vm6mDXHs6Q47ngL7b0FiKu0kXpPX/awmf+5tTcxslXiIUjbCPylYZ7/0RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwWxujXT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwWxujXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726650854; x=1758186854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4LHmhI5iJTI+3h0IFjqDKJW3uKtSK1cyhY+PMjqiST4=;
  b=OwWxujXTHxmX54XSN0jRnB+eRSMFTF8IEDq/IBrjJN0MQEw4UoisSQz8
   sKQ+mIcpBrkJwpVO6xPpJQMfaBGsDY/P4VDmt+qRmO0pTflF5Cq1gi1ES
   6W0ItoTeIY4gNcvvPlchj4hKYVQhjAdtV4WBFqMTQLenVymeL9RkUNfY/
   rvIqp9gmp+16JfA+6CWEbFRzY/n+9iftyZmNBfOQC+aQNoz7S7t/Q59F+
   /AqmCAqG3vVqgf66h6DsVONtT+ISiSRg6y6G93XXgxvbtYmlSN3zd4seJ
   FqjA1i0NyM0NwfpLppdAk7c7GVhRv1GYGLNuYiFdCa17fU9KztceKnssm
   w==;
X-CSE-ConnectionGUID: NzBh5hHqS3uPLgk/EPQ9fw==
X-CSE-MsgGUID: A5WlgHe2R5qmJUnYMDX5rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36928384"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="36928384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 02:14:13 -0700
X-CSE-ConnectionGUID: Qn4uCO61TeGJTwnJAL645w==
X-CSE-MsgGUID: a5jQ2674TDSn6deslhhiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="100165367"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Sep 2024 02:14:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqqlE-000C70-3A;
	Wed, 18 Sep 2024 09:14:08 +0000
Date: Wed, 18 Sep 2024 17:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Eric Auger <eric.auger@redhat.com>
Subject: [jgunthorpe:smmuv3_nesting 19/21]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3267:23: sparse: sparse: cast to
 restricted __le64
Message-ID: <202409181759.h5S6XN32-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   f877814753bee37493de05928d0c4f78bbf1a9dc
commit: 25bad32e9208dde096dc2620a659b8700e6e6aec [19/21] iommu/arm-smmu-v3: Add arm_smmu_cache_invalidate_user
config: arm64-randconfig-r132-20240918 (https://download.01.org/0day-ci/archive/20240918/202409181759.h5S6XN32-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409181759.h5S6XN32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181759.h5S6XN32-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1699:46: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1696:27: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1696:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1696:25: sparse:     expected restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1696:25: sparse:     got unsigned long long
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3267:23: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3268:23: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3352:23: sparse: sparse: restricted __le64 degrades to integer
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +3267 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3253	
  3254	/*
  3255	 * Convert, in place, the raw invalidation command into an internal format that
  3256	 * can be passed to arm_smmu_cmdq_issue_cmdlist(). Internally commands are
  3257	 * stored in CPU endian.
  3258	 *
  3259	 * Enforce the VMID on the command.
  3260	 */
  3261	static int
  3262	arm_smmu_convert_user_cmd(struct arm_smmu_nested_domain *nested_domain,
  3263				  struct iommu_hwpt_arm_smmuv3_invalidate *cmd)
  3264	{
  3265		u16 vmid = nested_domain->s2_parent->s2_cfg.vmid;
  3266	
> 3267		cmd->cmd[0] = le64_to_cpu(cmd->cmd[0]);
  3268		cmd->cmd[1] = le64_to_cpu(cmd->cmd[1]);
  3269	
  3270		switch (cmd->cmd[0] & CMDQ_0_OP) {
  3271		case CMDQ_OP_TLBI_NSNH_ALL:
  3272			/* Convert to NH_ALL */
  3273			cmd->cmd[0] = CMDQ_OP_TLBI_NH_ALL |
  3274				      FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
  3275			cmd->cmd[1] = 0;
  3276			break;
  3277		case CMDQ_OP_TLBI_NH_VA:
  3278		case CMDQ_OP_TLBI_NH_VAA:
  3279		case CMDQ_OP_TLBI_NH_ALL:
  3280		case CMDQ_OP_TLBI_NH_ASID:
  3281			cmd->cmd[0] &= ~CMDQ_TLBI_0_VMID;
  3282			cmd->cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
  3283			break;
  3284		default:
  3285			return -EIO;
  3286		}
  3287		return 0;
  3288	}
  3289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
