Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6211AA7A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769832349; cv=none; b=W6Yh+Zv/1z173ClA93oytEqqudBGnOEueZD0Ln9/QdRbcTlvDQF4HVlfHiZztxblHa1pYSAGDhdkgBrGlvUHv0f/WUVJs/hloJisof+m6oLBGHKthKDAVDVuBAszw/nrQLria2zABdJqjbM2MF7+VthoGejyo3zXT4cDGHdAj2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769832349; c=relaxed/simple;
	bh=r1rD8dG9zR3b2z2DgElBm6jAG0yJdR+qCg4PFs4SeZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oZ1TlBKBfKix82LanPLv901PJdvF/xL0IkDK4hJ81A0c0d1MgQ8rHwfbhicDkQmDTZ7HdNwcuFvyjG42B2UPoFGdxC00THS0dYQ0OZ+d4oR/fGdfoBjx1oFbR7oFKsFwW9Mw8ywVEDS/NNJvVih8g6pcQFc8uhd7hHybyQ5SE0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLylxILD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLylxILD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769832346; x=1801368346;
  h=date:from:to:cc:subject:message-id;
  bh=r1rD8dG9zR3b2z2DgElBm6jAG0yJdR+qCg4PFs4SeZU=;
  b=LLylxILDZSZoXLkgrmOoAPWJMZWPdL/p3Bj5WmYALJuLISHvCEH1sETl
   a3pH9ZoWwoO4aXfyWiXCrT9CITuVRrLBk2Ka+cO+SGWzE7cpp3shEEMhK
   D0sbdMSpIJXG2bG27Ix+FP06Cv6A0jN03MOsYpPTXNVSKg9JdgpL3sF7c
   ADPYY0BEMsvkejeMNtoE/tJ8035t0doCjeIlrgTQhz+xajss3Gxb0m/SE
   SuUw1ukUd85jVpo/e0mhGhgj7r3CcMhAfHOKbkJrpRJ+4fc6W16fXAuRK
   K5hBF2Baj1sHO4qq/jL3jz3RA0G97cXZtFcChaoA92U3AhA/NmozEfw1d
   g==;
X-CSE-ConnectionGUID: fxXoN/f9SWWqhKqSy2ZZ9g==
X-CSE-MsgGUID: Sf3LU7MUQ+yNTiAjhcrKnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74934086"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="74934086"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 20:05:46 -0800
X-CSE-ConnectionGUID: TUYCvZemS/O+t7IZD+UK8g==
X-CSE-MsgGUID: orJzv/oCTH6A6U8py7x+WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="240278742"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2026 20:05:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm2Ew-00000000ddI-1nl2;
	Sat, 31 Jan 2026 04:05:42 +0000
Date: Sat, 31 Jan 2026 12:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_noiommu 4/6] arc-linux-ld:
 drivers/vfio/vfio.h:124:undefined reference to `vfio_noiommu_enabled'
Message-ID: <202601311154.wlUY4dSX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommufd_noiommu
head:   7786a2757eb91ada48627ce3c749705507a3cdd3
commit: 8e19339e317779e8448d80d70c8e10fde713306d [4/6] vfio: Support noiommu devices through the cdev interface
config: arc-randconfig-002-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311154.wlUY4dSX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311154.wlUY4dSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311154.wlUY4dSX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/vfio/vfio_main.o: in function `vfio_device_set_no_iommu':
   drivers/vfio/vfio.h:124:(.text+0xd68): undefined reference to `vfio_noiommu_enabled'
>> arc-linux-ld: drivers/vfio/vfio.h:124:(.text+0xd68): undefined reference to `vfio_noiommu_enabled'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
