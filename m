Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C206F9E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721144467; cv=none; b=IjQQQgp0FSzZshwQ8WfPf4O2jUtLMCUvIbYQMtHq9zDV3oaWP9efO2Pe+n7m5A7ymQlYjJ9UfvyyzYC7xs8ZonxcWi8LzcitYdsTL6stjO4YqrzpjyOwkdB5CmfECDCJ4BbYLM+oemwdSDhpeIiHK7c4Fxrz5UhhknjxtYcSTRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721144467; c=relaxed/simple;
	bh=CgmvyWvJq33IdiRtMpvbCqVZ3pwOI2NHq+nWis7kgOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qV2sFWuY60n9ZkVfn9SOM3VyPZR/DuxTNN6bBsuMuHBE+36mu9x5ctB3QKfp7avdOrxlKyLMpeLqi56MV5Knx9gQfW5yfPSN7Qw4vNB6mZYVnaO8Ad8Qaz3a3NEf3qubmkW1oWDaszgL/LS4zeVS/xo8E1mrsDlum1OpIKv2p8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlJTeiZP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlJTeiZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721144465; x=1752680465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CgmvyWvJq33IdiRtMpvbCqVZ3pwOI2NHq+nWis7kgOA=;
  b=XlJTeiZPQkxuSLMBYv35n7na4bIX7C7LlqEmAXLhOlWxRd/AMKzolXex
   klah3Q5J+apBlp3gDt1sPn0efek5CX7y6bL8iHHM3pwnRDisS481twrwa
   zZYfhASj1l+d4wqJqCWzavYzv3NylMYRQgzASRVpOB8d/ZmWc+30Qqsxj
   u/4bCHcFAdQv3YjLNYRhRTSQzxn7SSYjIz0in3zlnFH10N6jfZ8Xp6JXX
   uHiA1YNJ72fhXGvr3NFenACR0N9oEFD7ZN3bhuPAjHLOqilrl/vNNgzBD
   x3ksH87w00LrO4fuZsDB7lox1KZmFkEiAtjQ2nV/+wL+8b1ltDDj7D8jT
   A==;
X-CSE-ConnectionGUID: 95C7Q/+qSK+clCfYM3AtQA==
X-CSE-MsgGUID: NnFgnvXuSg2ovxRZbMPIig==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18789622"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18789622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 08:41:05 -0700
X-CSE-ConnectionGUID: NMJfXkuPRbeYB0EffSwb6w==
X-CSE-MsgGUID: t6plSWXVSdyyM6s1yyIXQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="54292209"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jul 2024 08:41:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTkIX-000fOm-1t;
	Tue, 16 Jul 2024 15:41:01 +0000
Date: Tue, 16 Jul 2024 23:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10697/10703] WARNING: modpost: vmlinux: section
 mismatch in reference: arm_smmu_device_probe+0x174 (section: .text) ->
 arm_smmu_v3_plat_info (section: .init.data)
Message-ID: <202407162323.jh9MzUxd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   de51c3bc2687c57e76a35b4b7afdce90367a12b1
commit: 85e566f79665ac8782551afa1134dec7f80f4c97 [10697/10703] iommu/arm-smmu-v3: Change the style to identify the the hisi_platform
config: arm64-randconfig-003-20240716 (https://download.01.org/0day-ci/archive/20240716/202407162323.jh9MzUxd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407162323.jh9MzUxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407162323.jh9MzUxd-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: arm_smmu_device_probe+0x174 (section: .text) -> arm_smmu_v3_plat_info (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: arm_smmu_device_probe+0x178 (section: .text) -> arm_smmu_v3_plat_info (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
