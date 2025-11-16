Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BDA7494
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 05:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763271194; cv=none; b=myrEy212Lo4a4MsnjGhFIgY84NhzMQCpys1ornvSIRtSj52N1Rm1GgGNf16yDkW2DtUl9wUUaTmVljMcixFT/K0Ia/IwSosQ9G7ba5yAOaDHeADF3tIxgh1c/knT9ibAGTX5n+tfdvq2T/+UX1H5sPR8oS5BBOAuyH4snlLiUjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763271194; c=relaxed/simple;
	bh=X+EZiUdfLBQi9a7U2PAgXIjQkee8FD+6/7uQiEkD3xE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JtVCzLqYR6QwFP/H/yalKTC18k2p3Zs+R+E9faGNE/DvWFu84a/6JrMMVBFSlxX08iWaUS7uL8BMrkqewBRzxUIbayvityKX6+ol4H/+snGpxjeP7qfjLPKFUWxQQmeOR0FVeHBQ93CUzwmiE4Kf2OWhDxFw6fEYiAESlnmn+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mdtjbs2u; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mdtjbs2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763271192; x=1794807192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X+EZiUdfLBQi9a7U2PAgXIjQkee8FD+6/7uQiEkD3xE=;
  b=Mdtjbs2umTtAKGBDlfkCuoKg9C0CHC7GHdMWlhhloY1BtyRzCrpIHiZC
   DAJreqOh1ysMu5mX8PzgYZwnQLDeuYzcgWepq68qhjKxwN9Ijb9mwyuzL
   i/YaIF0fgGMJwDL0Qvuc4PGCx4qqpqWUktYtXVps5sk4LXwoVnDOveLta
   54lmKbL6Pd1XBE/1VcqlIRVGlr1yddiLzCX6I2mmILObBvM59nq1+TnJt
   RiKGhG0dRhhrj2YIs/KU0CwKGBErphE11w5qzyzh4VqPZWoNUwd4YW/qt
   0oaMQcrClRyOX/MikyuDBpZrWTFUDD9EEO4w+2+SHfnQxXIqLHi5Ur0g1
   g==;
X-CSE-ConnectionGUID: e3JsSrsRTaWCyXt/rt8b9w==
X-CSE-MsgGUID: i5kdNA0SSrycE+KMyExvzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="64310522"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="64310522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 21:33:10 -0800
X-CSE-ConnectionGUID: ShPJddJYRvmB4U4yqfQFTw==
X-CSE-MsgGUID: Waeh8mh7QHSPRY51aqrTbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="221035274"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Nov 2025 21:33:09 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKVNr-0008Wd-07;
	Sun, 16 Nov 2025 05:33:07 +0000
Date: Sun, 16 Nov 2025 13:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: [iommu:core 11/40] arch/powerpc/include/asm/mem_encrypt.h:13:49:
 warning: declaration of 'struct device' will not be visible outside of this
 function
Message-ID: <202511161358.rS5pSb3U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   7e06063a43d317c1ca9278b6662555f687f43f03
commit: 879ced2bab1ba95e98fac56c9503791183bc7cbb [11/40] iommupt: Add the AMD IOMMU v1 page table format
config: powerpc64-randconfig-r051-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161358.rS5pSb3U-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161358.rS5pSb3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161358.rS5pSb3U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36:
   In file included from drivers/iommu/generic_pt/fmt/amdv1.h:23:
   In file included from include/linux/mem_encrypt.h:17:
>> arch/powerpc/include/asm/mem_encrypt.h:13:49: warning: declaration of 'struct device' will not be visible outside of this function [-Wvisibility]
      13 | static inline bool force_dma_unencrypted(struct device *dev)
         |                                                 ^
   1 warning generated.


vim +13 arch/powerpc/include/asm/mem_encrypt.h

2efbc58f157a39 Anshuman Khandual 2019-08-19  12  
2efbc58f157a39 Anshuman Khandual 2019-08-19 @13  static inline bool force_dma_unencrypted(struct device *dev)
2efbc58f157a39 Anshuman Khandual 2019-08-19  14  {
2efbc58f157a39 Anshuman Khandual 2019-08-19  15  	return is_secure_guest();
2efbc58f157a39 Anshuman Khandual 2019-08-19  16  }
2efbc58f157a39 Anshuman Khandual 2019-08-19  17  

:::::: The code at line 13 was first introduced by commit
:::::: 2efbc58f157a39ad9e9199b92d9c47736023a2fe powerpc/pseries/svm: Force SWIOTLB for secure guests

:::::: TO: Anshuman Khandual <khandual@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
