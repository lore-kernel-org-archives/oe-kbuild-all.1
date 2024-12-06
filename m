Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28562135B6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 20:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733515281; cv=none; b=udT8+nfIzLb9Aj1Srff/49EpQlpfQxhectOzy+TTjNr7kO2JCBsOHn9txnqIWoTDAH5Kv87F206o4cmREyBZimQlFGL3KqOkof0j8jeY1z7HelgQ1LEO+o3Gh6m75QduOeJJLpRqsel0qBbzH7/pMgsbVnZSvnmOXWamBpiF4y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733515281; c=relaxed/simple;
	bh=OK4HMwloqkNcgmjeI+ZKt9lWg1K+EifSwwwfZhVBtyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZBtRuzVFARK8tKltfU6t20yXZHGK+zv9Co1wVED2lYSkyrnhnesA8FQX3o4u0OAn8pyRvggZRQEogB9WiL/yrIteIFs5C+YwKCRIeH+BOtrMP6wg1Iv6u00bVLFakTcLWP0+tAAoOUgdg71ebCvCdqG57PBzq6QAHWWKVXJBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giw50kmb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giw50kmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733515280; x=1765051280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OK4HMwloqkNcgmjeI+ZKt9lWg1K+EifSwwwfZhVBtyg=;
  b=giw50kmb1jQa822bDbwF4zf5fQVJmC4pld6oMEEv+vfMAjEwX+XKtypn
   OQ762Kt0sdbNhA7EH8xbmGDqo7ECGZGqzZcSnUMsCLX6Gu7XlrTdcx8gM
   xJDC1sl8jpuepbRtbPUxVrC2Lgx+MrP9rtPlzDI4ndzELQAfTfVLonULD
   1oJMMNWZvLvs9YY2bH0234OtqJ5vAViBKLuMuWV+qvHNot2SbIIFnTk9j
   7W4ED3OVegT83qaiww2SVwKTxT0BOztIE9DrgyWQ/EICykLcOwmBHCjLe
   w+e0l6Xz08k7ZRzzlwhTN3CGcBHPRlsYFqvdoSo1VFyKUm+SyQp/W5ucU
   w==;
X-CSE-ConnectionGUID: 77rE4GvsQ+CvdeIt72zXhQ==
X-CSE-MsgGUID: kdmJNTWZRr+WOl7C2cRX3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="59280283"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="59280283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 12:01:16 -0800
X-CSE-ConnectionGUID: Go4gUgaXRfizqoHetA5ANA==
X-CSE-MsgGUID: vETWd34cSc6UN1dCzZlIDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="117748922"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Dec 2024 12:01:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJeVk-0002Dh-1O;
	Fri, 06 Dec 2024 20:01:12 +0000
Date: Sat, 7 Dec 2024 04:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt 47/48] kismet: WARNING: unmet direct
 dependencies detected for IOMMU_PT_X86PAE when selected by AMD_IOMMU
Message-ID: <202412070332.Lr6zbVdz-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_IOMMU_PT_X86PAE-CONFIG_AMD_IOMMU-0-0 (https://download.01.org/0day-ci/archive/20241207/202412070332.Lr6zbVdz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070332.Lr6zbVdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070332.Lr6zbVdz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_PT_X86PAE when selected by AMD_IOMMU
   WARNING: unmet direct dependencies detected for IOMMU_PT_AMDV1
     Depends on [n]: GENERIC_PT [=y] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
     Selected by [y]:
     - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]
   
   WARNING: unmet direct dependencies detected for IOMMU_PT_X86PAE
     Depends on [n]: GENERIC_PT [=y] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
     Selected by [y]:
     - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
