Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B71B288
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 06:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8xccTTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700549433; x=1732085433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E2Si3Ix7fakoFAsI/ENX9eDNdVSwNa9BjFCjbStediA=;
  b=N8xccTTDpGhNPSB1jd8NQQT5Wcfc+8K+/zDJ9iSN+XOdECsK6wR51j9D
   6K6LUwaV3eT8G6nGYmYNKo8GFtdHLPBF5j5ORxYWR0TNPTmS7DxOHkaRk
   yMA649k9RSMg2X/Y76dQi7eK74iEUgkKKYOftB7Umr6cEtSs50o7M2aQA
   vmavli/PPg1NHR3JsNVrnw8T2xCFvXJpoSFp7a3PNUu/QuQ1Q0MZeeiwI
   M6cBWb6IPim4Yh17txJ8lXxsJj7FjOFCAK2V64n4oNI4C07oT+e2Ngh0O
   0hiXpl5tVR4/AJeCQr8rMNo3mX0eNo5AMfdWlwxrENMEuWFC1Tadfs3Ei
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371949844"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371949844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 22:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="7801734"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2023 22:50:33 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5KaY-0007Sn-1k;
	Tue, 21 Nov 2023 06:50:28 +0000
Date: Tue, 21 Nov 2023 14:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11202023 73/95]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3064:18: sparse: sparse: cast to
 restricted __le64
Message-ID: <202311211439.MvW0X14b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-11202023
head:   c4ada481317d6b86b847e5d45f7656a498c5275c
commit: 684e1274dac4c85181ac92452fa969e75cb5bafd [73/95] iommu/arm-smmu-v3: Add arm_smmu_cache_invalidate_user
config: arm64-randconfig-r121-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211439.MvW0X14b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211439.MvW0X14b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211439.MvW0X14b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3064:18: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3065:18: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +3064 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3057	
  3058	static int arm_smmu_fix_user_cmd(struct arm_smmu_nested_domain *nested_domain,
  3059					 u64 *cmd, u32 *cerror_idx)
  3060	{
  3061		struct arm_smmu_device *smmu = nested_domain->s2_parent->smmu;
  3062		struct arm_smmu_stream *stream;
  3063	
> 3064		cmd[0] = le64_to_cpu(cmd[0]);
  3065		cmd[1] = le64_to_cpu(cmd[1]);
  3066	
  3067		switch (*cmd & CMDQ_0_OP) {
  3068		case CMDQ_OP_TLBI_NSNH_ALL:
  3069			*cmd &= ~CMDQ_0_OP;
  3070			*cmd |= CMDQ_OP_TLBI_NH_ALL;
  3071			fallthrough;
  3072		case CMDQ_OP_TLBI_NH_VA:
  3073		case CMDQ_OP_TLBI_NH_VAA:
  3074		case CMDQ_OP_TLBI_NH_ALL:
  3075		case CMDQ_OP_TLBI_NH_ASID:
  3076			*cmd &= ~CMDQ_TLBI_0_VMID;
  3077			*cmd |= FIELD_PREP(CMDQ_TLBI_0_VMID,
  3078					   nested_domain->s2_parent->vmid);
  3079			break;
  3080		case CMDQ_OP_ATC_INV:
  3081		case CMDQ_OP_CFGI_CD:
  3082		case CMDQ_OP_CFGI_CD_ALL:
  3083			xa_lock(&smmu->streams_user);
  3084			stream = xa_load(&smmu->streams_user,
  3085					 FIELD_GET(CMDQ_CFGI_0_SID, *cmd));
  3086			xa_unlock(&smmu->streams_user);
  3087			if (!stream) {
  3088				*cerror_idx = CMDQ_ERR_CERROR_ATC_INV_IDX;
  3089				return -ENODEV;
  3090			}
  3091			*cmd &= ~CMDQ_CFGI_0_SID;
  3092			*cmd |= FIELD_PREP(CMDQ_CFGI_0_SID, stream->id);
  3093			break;
  3094		default:
  3095			*cerror_idx = CMDQ_ERR_CERROR_ILL_IDX;
  3096			return -EINVAL;
  3097		}
  3098		pr_debug("Fixed user CMD: %016llx : %016llx\n", cmd[1], cmd[0]);
  3099	
  3100		return 0;
  3101	}
  3102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
