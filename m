Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79AA1D5CEB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736167014; cv=none; b=eVm/EX5zW7hZ5S8MIKz9FI3Puw5C0aqRd9uu2GtqQtEsYqkfak3kLaTuHR6n/Gg7AukjN5KwHMWGxw2MEszTPse4VT2n9Nz5VF1Qlo6iZUDVk8ps60R3JfVrQ9d8srTILyNtUQqf5jyv9hti34Oyj/sVctn7tB8VwEtWE/gn16w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736167014; c=relaxed/simple;
	bh=K/H6a09fC5kEoWyW3dtFrU38PjvePx0dG8zb0tvhrYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlxhZMhZZ1k/euSFnFbpWjV3vYACESlbPqCj3tYFozLzyd4zucjxUQOPwnrBRyh1YS5mZCIeV8ix35c7zMOwmQ0CipzKtpbRCLWDLomyjqe+qFRkI0lsDnwrd5jzmiqvymyL9Ngf+AVMKy/GgGaRQOODlx8QdOyx8B1rN5sjeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kxinhwxs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kxinhwxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736167013; x=1767703013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/H6a09fC5kEoWyW3dtFrU38PjvePx0dG8zb0tvhrYg=;
  b=Kxinhwxsy642mFsgpqltge4UsAT/oOLp/lG/wiW/eXTUtMGO4iKGLC9i
   LCgy06CKk26VfwoG5C5BuLfKtLMO0XnzKKQ/m+3EcG4LndrtzEx+Hg6HI
   SkqFH3rjQfHikxXc82zTtUpjKwdfjCnkQeXYB551LjJEzTcJQ0hqDkGqR
   jBQRDSAU1v0MAqf4VcVLDtj4NQD+1/3pvKosj+asv4mWd77LKDTwxORIm
   smpUVTqNEvUmFuQk+3i62V9vfSu6P4soqDbT98L6NiJTLVJec7olOXfFv
   WuPp84pLmwCK5yraXOEMMfNAAGPG1/NUAazHlz3+IDrDMSLouiypb0yEB
   A==;
X-CSE-ConnectionGUID: TVJ7xUj2SWeDvPRYQQnLIA==
X-CSE-MsgGUID: hi7esgzkQ02YBAOiZBsiag==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46984136"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="46984136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 04:36:52 -0800
X-CSE-ConnectionGUID: 5QgnO+zrTP2UBHevSuybLg==
X-CSE-MsgGUID: qoN6h8pRSmCNuqt3T8x5mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102288186"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2025 04:36:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUmLg-000Cbn-2K;
	Mon, 06 Jan 2025 12:36:48 +0000
Date: Mon, 6 Jan 2025 20:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 235/1347] drivers/iommu/amd/iommu.c:1175:13:
 warning: 'iommu_flush_irt_and_complete' defined but not used
Message-ID: <202501062043.vkpvtDRU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 79bb3b1b3e1bba3028c622bd296298eb302006bd [235/1347] iommu/amd: Do not Invalidate IRT when IRTE caching is disabled
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250106/202501062043.vkpvtDRU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062043.vkpvtDRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062043.vkpvtDRU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/amd/iommu.c:1175:13: warning: 'iommu_flush_irt_and_complete' defined but not used [-Wunused-function]
    1175 | static void iommu_flush_irt_and_complete(struct amd_iommu *iommu, u16 devid)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommu_flush_irt_and_complete +1175 drivers/iommu/amd/iommu.c

  1174	
> 1175	static void iommu_flush_irt_and_complete(struct amd_iommu *iommu, u16 devid)
  1176	{
  1177		if (iommu->irtcachedis_enabled)
  1178			return;
  1179	
  1180		iommu_flush_irt(iommu, devid);
  1181		iommu_completion_wait(iommu);
  1182	}
  1183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
