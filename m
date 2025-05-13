Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833121F151D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122909; cv=none; b=rGRWsKzziS2yyOrLjHIwv0rtoiDaRuQHoWfpynLI841kzJL5Kc4JtIuPmrNdOG9j71uSPQz7kpvE6LMbFrQjncgaRDyLZp369CTAD2921sS4hL0CmSKWYxk1i7jdmoh7N9kwUG3FVhXwnVPglZRu88nrHFAIz9DdZTBgBZLydgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122909; c=relaxed/simple;
	bh=IyOd5VEa25PH+Jl/zupeRZeX47rx0OnZlMJylsX5NUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X4JeBzBYYb9Dr5gAM06FJxKgfLCtX7jcGk8eT57za+RmkECFSO71VwGdMnoFjqkuCyvc2kqL/dTYLXTGWITJoL70DrVApqjlL3oHLCU6aJLOgHxARBzIWfzs0OSVHB67XJT7DrGvKpfse2i8dENaCzFEO48orpKZhfabK4kms3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNf3w3cf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNf3w3cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747122908; x=1778658908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyOd5VEa25PH+Jl/zupeRZeX47rx0OnZlMJylsX5NUg=;
  b=KNf3w3cfNjdj9+PSRD2AHDbfu+CQ1pNQSZXiVsE+JngdAZmo1nQKCTqJ
   SxDRZ5pG8Fn7KC4ECfQVzTNbZVFIVISlKC+2SZUyBIzh5SFlI856bpQcz
   uvfz1+8M348s+QYtw5SC1lE8wnt0W/sBIcVKQj7pEyVAxy1QuvTW2Jdz9
   Lb7G6UKvCQMLdpgv9bDQDB8aEJ5ojFtl8tecx8zI1SYNWxzVd+2bBkPYX
   Fv3sLiQmfi/CyoGtedFF8rur5swD3ra4imPtFidKekFQAM2pa3TXWJXjW
   Y75GpUtd4YZKAgNLN7uDFG1mlmZxA4j67ePr+2VgT9A2cpmU2Mp2S9KVW
   g==;
X-CSE-ConnectionGUID: 3ve0AjfSTNiT1rr3z3oGqQ==
X-CSE-MsgGUID: ZpRTGky0Q4mORkC5wf97JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48208673"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48208673"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 00:55:06 -0700
X-CSE-ConnectionGUID: P1R4I5ArQh62eDZO6NEy6g==
X-CSE-MsgGUID: P9rT/ya3RkuUIYy+jHyG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="174757149"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2025 00:55:05 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEkTe-0000ug-2c;
	Tue, 13 May 2025 07:55:02 +0000
Date: Tue, 13 May 2025 15:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/syscon-phandle-args-iommu 4/4]
 drivers/iommu/mtk_iommu_v1.c:512:28: warning: variable 'data' set but not
 used
Message-ID: <202505131519.XF8MywZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/syscon-phandle-args-iommu
head:   2ffacca9e16ae5a4cf942a7bd5756c2d9903a45e
commit: 2ffacca9e16ae5a4cf942a7bd5756c2d9903a45e [4/4] iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable
config: alpha-randconfig-2006-20250504 (https://download.01.org/0day-ci/archive/20250513/202505131519.XF8MywZu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131519.XF8MywZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131519.XF8MywZu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: note: -Wvla-larger-than=0 is meaningless
   drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_v1_probe_finalize':
>> drivers/iommu/mtk_iommu_v1.c:512:28: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     struct mtk_iommu_v1_data *data;
                               ^~~~


vim +/data +512 drivers/iommu/mtk_iommu_v1.c

57dbf81f50c82a Joerg Roedel        2020-04-29  509  
ad9b10e533f6fb Yong Wu             2022-05-03  510  static void mtk_iommu_v1_probe_finalize(struct device *dev)
57dbf81f50c82a Joerg Roedel        2020-04-29  511  {
ad9b10e533f6fb Yong Wu             2022-05-03 @512  	struct mtk_iommu_v1_data *data;
57dbf81f50c82a Joerg Roedel        2020-04-29  513  	int err;
f3e827d73ed454 Yong Wu             2018-01-26  514  
3524b5592cad63 Joerg Roedel        2020-03-26  515  	data        = dev_iommu_priv_get(dev);
f3e827d73ed454 Yong Wu             2018-01-26  516  
2ffacca9e16ae5 Krzysztof Kozlowski 2025-05-01  517  	err = arm_iommu_attach_device(dev, data->mapping);
57dbf81f50c82a Joerg Roedel        2020-04-29  518  	if (err)
57dbf81f50c82a Joerg Roedel        2020-04-29  519  		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
b17336c55d8928 Honghui Zhang       2016-06-08  520  }
b17336c55d8928 Honghui Zhang       2016-06-08  521  

:::::: The code at line 512 was first introduced by commit
:::::: ad9b10e533f6fb3fa74afdc2341774b1305c176f iommu/mediatek-v1: Just rename mtk_iommu to mtk_iommu_v1

:::::: TO: Yong Wu <yong.wu@mediatek.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
