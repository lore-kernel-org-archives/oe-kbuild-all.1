Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75B51F3D35
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 18:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733509029; cv=none; b=NhzzGDl4Gs7hfePU2wQbIBdFL1wfHIzl25Ao0WjDWK9wjQM9iA+SJWcgaU+aEaUUcnfLnHRQERtQKh/rq3tq9HAFwekT9UrGnnPGD5WkPSuZDk7ev7V+3DDI68BrjpG+lfsd3wyHygYgTnNjDMQjMHssPNKZ1CXV5vhFEUFZIEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733509029; c=relaxed/simple;
	bh=PuS3bVtn0ZRczfucdBQOA8VUcsYE4/cmz79l1lBPOQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RtFIB+2Dq1dLnTdwXgsaAShDYBnrXTOvC+LTf5zONurYfgD32H+qdJ8cjVhn7BD5U7vhE+srEU0uH5BxZY8t4yWQ854p9UKVmEfPWW5lN+N23HxRoxqwVdaXHnpLkOrEYCtY4qWBsrVhSBcU/PEUvyWtZV2fxThANJn3NXPpG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFBKdpyO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFBKdpyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733509028; x=1765045028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PuS3bVtn0ZRczfucdBQOA8VUcsYE4/cmz79l1lBPOQE=;
  b=kFBKdpyOgXQwFRKlKhYiDKYkDnvXZxIfFLruePUF7eJ8dpc12dEwtfGL
   YsaC1SU/hRBy/a2X3qrkFSIUwU0UFw7C8CQWviyMC/vheEA69O7076/19
   fvud8EFG41b3+NAamy8SdvYiiKZAb/sv4OTql6HofbHdLP53rzGWTIqw+
   7/JpE1W+0ito/ibYkbMr7iZ1ZIzXHsqttj69gnd7aCRg5ddvrhbLDqB7I
   qegRBXuNPnhWY/KxyOHCGC1Uk9zAvBcqpYZ+LbCkFiLu2KdSjAGIU7dRW
   X7nfH/XJbLpQwAw9PH6Imfgl54WSsEt+XR0qFaaeGXnbbC+j2V7NHF0D5
   w==;
X-CSE-ConnectionGUID: NSAmzjQuTiO4KpUaEhGNyA==
X-CSE-MsgGUID: lcmIIokhTeOzHpkkr5YUFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33191756"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="33191756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 10:17:07 -0800
X-CSE-ConnectionGUID: n7dWQFVnR3ipH02qP1bIjA==
X-CSE-MsgGUID: KjfPEkxuT0SHctchjmHVcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="131882590"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2024 10:17:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJcsx-00029p-0I;
	Fri, 06 Dec 2024 18:17:03 +0000
Date: Sat, 7 Dec 2024 02:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt 47/48] kismet: WARNING: unmet direct
 dependencies detected for IOMMU_PT_AMDV1 when selected by AMD_IOMMU
Message-ID: <202412070203.nipZ3KVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   9ddc32675fb9d56c04f95d0b0b7498d2d160e13c
commit: b17f0e7b887fa38ca758c7b2ee98e7963f532138 [47/48] iommu/amd: Use the generic iommu page table
config: x86_64-kismet-CONFIG_IOMMU_PT_AMDV1-CONFIG_AMD_IOMMU-0-0 (https://download.01.org/0day-ci/archive/20241207/202412070203.nipZ3KVJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070203.nipZ3KVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070203.nipZ3KVJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_PT_AMDV1 when selected by AMD_IOMMU
   WARNING: unmet direct dependencies detected for IOMMU_PT_AMDV1
     Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
     Selected by [y]:
     - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]
   
   WARNING: unmet direct dependencies detected for IOMMU_PT_X86PAE
     Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
     Selected by [y]:
     - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
