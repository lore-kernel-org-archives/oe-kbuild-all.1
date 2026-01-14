Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D837F8C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379979; cv=none; b=INJAcAoHuN1GeFiNCuAnNAtztM2JzhQFhgWtTLWTmvU1wbFwodzvaAK/7znp/+dr/awY6NoWboFmahf8NVC2KlPzgns7oDxiQJs5QziCkGRB1tnd1V1NRigKadUmIVnJOBsuEdtrbSSJRIV40b9K/F2fkpj4/yI+NqreQIX9VWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379979; c=relaxed/simple;
	bh=2NpwZSdjC7U62+gPd7riSJ40/5NKLp8NtuFYSfWwVVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GUP/ys4a/cLwthmgrQQ+2VSrwK6M1jTu3b/untI7HY+vy3/x2GY4AADZLNYx+eRCt1ekpW8mpwS5JNziwoJcxL/nqkAcvVzHeUGXk43MAaG5P+oPU3R171xnnwAQil1peurB6UKHaZyO7meTYcPfkL+n8vHOq59mSW1z5BAw+88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mwku133F; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mwku133F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768379972; x=1799915972;
  h=date:from:to:cc:subject:message-id;
  bh=2NpwZSdjC7U62+gPd7riSJ40/5NKLp8NtuFYSfWwVVM=;
  b=Mwku133F9/Ix8Zmi5rCZQ2XpBQ3MHX6+nhv/PMqswppCBCGyM3gwMe9v
   3o5n2Y+/zUk8qx+6YTDPRqUj5WbPYeZ5qhwGpPZswAxHLPdPPsPWUyMKv
   GAwINzJAcGDqIdW3IiZroXCs44kreQ//56XfOhESNqieTCS6wvGGKjJm0
   f2xqzuC0sQh9jj2cP1iGp4dQXLS96Lnui6T8hiMbYrDh95auD+PPbpL1n
   6+XoV5vL0J8L8XCYFGHeUVTJPKmAwsH3BnIwQ8kXM5nU1+ZVDiGh+5lfy
   tkKQ+eddR6sz9gXsu0Arkp+u0wTOzI930G+K6vV05BjDv0VY4AiFy3weJ
   g==;
X-CSE-ConnectionGUID: PhTIUQ6XR1GQj17H5eYaWQ==
X-CSE-MsgGUID: ZVRRke5mTFqEufOjOEj1CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69759590"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69759590"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:39:28 -0800
X-CSE-ConnectionGUID: Pog82ux2Sli2ZlqE/V1tsQ==
X-CSE-MsgGUID: f1Ja/xn8S6KA1UsbFOpYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="227763113"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jan 2026 00:39:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfwPU-00000000G5K-1yYZ;
	Wed, 14 Jan 2026 08:39:24 +0000
Date: Wed, 14 Jan 2026 16:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-baolu 7/7]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1228:9: warning: argument to
 variable-length array is too large
Message-ID: <202601141623.FccejALW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux for-baolu
head:   cda5c27a4020d162948259df9d3c8dd61196290a
commit: cda5c27a4020d162948259df9d3c8dd61196290a [7/7] iommu/arm-smmu-v3: Move to entry_set
config: arm64-randconfig-r071-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141623.FccejALW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141623.FccejALW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141623.FccejALW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_write_cd_entry':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1228:9: warning: argument to variable-length array is too large [-Wvla-larger-than=]
    1228 |  __le64 memory[ENTRY_SYNC_MEMORY_LEN(&cd_writer.writer)];
         |         ^~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1228:9: note: limit is 1 bytes, but argument is 192
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_install_ste_for_dev':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1429:9: warning: argument to variable-length array is too large [-Wvla-larger-than=]
    1429 |  __le64 memory[ENTRY_SYNC_MEMORY_LEN(&ste_writer.writer)];
         |         ^~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1429:9: note: limit is 1 bytes, but argument is 192


vim +1228 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  1212	
  1213	void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
  1214				     struct arm_smmu_cd *cdptr,
  1215				     const struct arm_smmu_cd *target)
  1216	{
  1217		bool target_valid = target->data[0] & cpu_to_le64(CTXDESC_CD_0_V);
  1218		bool cur_valid = cdptr->data[0] & cpu_to_le64(CTXDESC_CD_0_V);
  1219		struct arm_smmu_cd_writer cd_writer = {
  1220			.writer = {
  1221				.ops = &arm_smmu_cd_writer_ops,
  1222				.num_quantas = CTXDESC_CD_DWORDS,
  1223				.vbit_quanta = 0,
  1224			},
  1225			.master = master,
  1226			.ssid = ssid,
  1227		};
> 1228		__le64 memory[ENTRY_SYNC_MEMORY_LEN(&cd_writer.writer)];
  1229	
  1230		if (ssid != IOMMU_NO_PASID && cur_valid != target_valid) {
  1231			if (cur_valid)
  1232				master->cd_table.used_ssids--;
  1233			else
  1234				master->cd_table.used_ssids++;
  1235		}
  1236	
  1237		entry_sync_write64(&cd_writer.writer, cdptr->data, target->data, memory,
  1238				   sizeof(memory));
  1239	}
  1240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
