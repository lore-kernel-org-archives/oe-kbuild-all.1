Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DD513C9B3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737795878; cv=none; b=tsRE840bJz5wmgMQhDCrlcLp+hqHDXs1idWo0uYWN5NbBe5DFFsC7zrufdddp9ECQ7korUnUR2nzzPUkQetdh/ZGXI13pQEsygTTlaVOvfzhkVVr5S6xUlZbHAD6Fnuz6NeoUvgKETPZCrXOhpZLvDYpX+iPZBWH8xfNfy/G3T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737795878; c=relaxed/simple;
	bh=eAmQq8X2FPRGxOpwebHeW6f5FFnA0l/6tUjviF25r/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffOgJV8MxyEA1H4iBEgDiweKJrklDP82R24X/okRzqiGvd6p/6MPdeSSJYoSxq0KDSSQAzoxkGiVcO9zHg6RMrdF1gcssSQ/RA/l3aCBGTDOlmSwLpn1iTrspvvGQYV0lAq8ewvy4/gWiff4J0B4qi9lgKEbNld9rC5ZNrWGrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVBTQt1D; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVBTQt1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737795877; x=1769331877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eAmQq8X2FPRGxOpwebHeW6f5FFnA0l/6tUjviF25r/M=;
  b=EVBTQt1DWSZHE0zfLZ4QCZvdGIUC3d2Ctm6Dq6680E+OGq7Ptsl4OSvW
   MAQrw39x/s8JGGKk4Mpup0+zf+ItHYI7e+Qty+iMjZ9S6jUH6JxDkU7oT
   EM2xuWerh33/4F7g9CJZo3hKfUTQV0R14sP72yCOTMqU0URCkviX17FGr
   i8MbHCWvv30B9z8ma0UnIzC6mgQACuZRQvgRUuX05uevRmtMwVydcFWw3
   KhVGswa7tdojk4nfp9qlTDbnV91vZPssjFhL86Ss4PXq6a98DKz9BOAJs
   6ebMqCuKJkf2k1XaB4sLumgeA+ddwGq4JoyaKUNQlKNkld6jXecU/Spzw
   w==;
X-CSE-ConnectionGUID: 4cVRBfcFRqu9pD+Ax7HjXA==
X-CSE-MsgGUID: 4bWKa71uSnCG/IbOFL2b9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38582030"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="38582030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 01:04:36 -0800
X-CSE-ConnectionGUID: 06Jr8XExQDavPuU8f7NXeg==
X-CSE-MsgGUID: v2EeHrmrT7iwksrpuw1phQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131279370"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2025 01:04:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbc5h-000deJ-1V;
	Sat, 25 Jan 2025 09:04:33 +0000
Date: Sat, 25 Jan 2025 17:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 1/31]
 drivers/gpu/drm/imagination/pvr_fw_mips.h:25:22: error: variably modified
 'pt_pages' at file scope
Message-ID: <202501251711.vmBZn9fl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   bacb8e8c931b7a93050028a12879222bbb17e282
commit: d6bad3bbc1fb47995eac2c4beddb8642185c3418 [1/31] crypto: Harden against integer overflows in DIV_ROUND_UP()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250125/202501251711.vmBZn9fl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251711.vmBZn9fl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251711.vmBZn9fl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/imagination/pvr_fw_mips.c:6:
>> drivers/gpu/drm/imagination/pvr_fw_mips.h:25:22: error: variably modified 'pt_pages' at file scope
      25 |         struct page *pt_pages[PVR_MIPS_PT_PAGE_COUNT];
         |                      ^~~~~~~~
>> drivers/gpu/drm/imagination/pvr_fw_mips.h:31:20: error: variably modified 'pt_dma_addr' at file scope
      31 |         dma_addr_t pt_dma_addr[PVR_MIPS_PT_PAGE_COUNT];
         |                    ^~~~~~~~~~~


vim +/pt_pages +25 drivers/gpu/drm/imagination/pvr_fw_mips.h

e4236b14fe32a8 Matt Coster  2024-03-05  17  
927f3e0253c112 Sarah Walker 2023-11-22  18  /**
927f3e0253c112 Sarah Walker 2023-11-22  19   * struct pvr_fw_mips_data - MIPS-specific data
927f3e0253c112 Sarah Walker 2023-11-22  20   */
927f3e0253c112 Sarah Walker 2023-11-22  21  struct pvr_fw_mips_data {
927f3e0253c112 Sarah Walker 2023-11-22  22  	/**
927f3e0253c112 Sarah Walker 2023-11-22  23  	 * @pt_pages: Pages containing MIPS pagetable.
927f3e0253c112 Sarah Walker 2023-11-22  24  	 */
927f3e0253c112 Sarah Walker 2023-11-22 @25  	struct page *pt_pages[PVR_MIPS_PT_PAGE_COUNT];
927f3e0253c112 Sarah Walker 2023-11-22  26  
927f3e0253c112 Sarah Walker 2023-11-22  27  	/** @pt: Pointer to CPU mapping of MIPS pagetable. */
927f3e0253c112 Sarah Walker 2023-11-22  28  	u32 *pt;
927f3e0253c112 Sarah Walker 2023-11-22  29  
927f3e0253c112 Sarah Walker 2023-11-22  30  	/** @pt_dma_addr: DMA mappings of MIPS pagetable. */
927f3e0253c112 Sarah Walker 2023-11-22 @31  	dma_addr_t pt_dma_addr[PVR_MIPS_PT_PAGE_COUNT];
927f3e0253c112 Sarah Walker 2023-11-22  32  
927f3e0253c112 Sarah Walker 2023-11-22  33  	/** @boot_code_dma_addr: DMA address of MIPS boot code. */
927f3e0253c112 Sarah Walker 2023-11-22  34  	dma_addr_t boot_code_dma_addr;
927f3e0253c112 Sarah Walker 2023-11-22  35  
927f3e0253c112 Sarah Walker 2023-11-22  36  	/** @boot_data_dma_addr: DMA address of MIPS boot data. */
927f3e0253c112 Sarah Walker 2023-11-22  37  	dma_addr_t boot_data_dma_addr;
927f3e0253c112 Sarah Walker 2023-11-22  38  
927f3e0253c112 Sarah Walker 2023-11-22  39  	/** @exception_code_dma_addr: DMA address of MIPS exception code. */
927f3e0253c112 Sarah Walker 2023-11-22  40  	dma_addr_t exception_code_dma_addr;
927f3e0253c112 Sarah Walker 2023-11-22  41  
927f3e0253c112 Sarah Walker 2023-11-22  42  	/** @cache_policy: Cache policy for this processor. */
927f3e0253c112 Sarah Walker 2023-11-22  43  	u32 cache_policy;
927f3e0253c112 Sarah Walker 2023-11-22  44  
927f3e0253c112 Sarah Walker 2023-11-22  45  	/** @pfn_mask: PFN mask for MIPS pagetable. */
927f3e0253c112 Sarah Walker 2023-11-22  46  	u32 pfn_mask;
927f3e0253c112 Sarah Walker 2023-11-22  47  };
927f3e0253c112 Sarah Walker 2023-11-22  48  

:::::: The code at line 25 was first introduced by commit
:::::: 927f3e0253c11276f0237ca1a14e77c48957c069 drm/imagination: Implement MIPS firmware processor and MMU support

:::::: TO: Sarah Walker <sarah.walker@imgtec.com>
:::::: CC: Maxime Ripard <mripard@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
