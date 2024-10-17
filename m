Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5B1C3034
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 22:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729204020; cv=none; b=CIW3F4ic3GNNbiJrkDYcV5m3Ql0ODUoQZUCGKP7plTPVoKv1BI27oqmfOklMjct/wWU0mxRWl3XYwEo2L61KG67V7iPCnNCbLIdj1sz+5uCXsOtLbguCQ86QbZQF1fBMJYNhLS6yYQ/9EVG2/yF89zQdzePV5sQxX+mrelAiiR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729204020; c=relaxed/simple;
	bh=VdLJFdmeiiRW4sY4sPyXCFpAx91+x+PgU/3bPmGprf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gc2e6xV04FZFqN4yqv/bHpyPbFI6iowyS4MrL42AqucvulxQfyB4FFlZdVhCKkmyTAfYreBOuExAWhfs+XSEL4+cMhpzwlsUTCXVauWY2PjjBcp/7DKFwkcaETj9LdOqiWdxlGbquXEeWyCvwnprk2Fd5w3IQvvLmtve73XgxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfPkQH08; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfPkQH08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729204015; x=1760740015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VdLJFdmeiiRW4sY4sPyXCFpAx91+x+PgU/3bPmGprf4=;
  b=TfPkQH08RD2uPda0mAHPbwLCDV9wpFUTN9iHSDsR2A/u0nl/Npqo4ovR
   tfkYl6Wo7GQK3PZGY427/Xdhf3hWT2FuhLMmjxaWnJOzHXMZlEOjW983x
   CweaKHNesURLlqxaI8g/eHbkM838VOfuPhY5oyuepoe+RSk1KrCiwX9ZJ
   72DxPTraEZ/2rw35Shp1Y5UexdF/paWhc09NAo2R/x85WTelBmcipi9X6
   lxN/BU1mxFwjcUISz9EDX5x/ywbOMBITS8fcZtGopCFn+IjahvL6v29vE
   9d5E1N0U8YaZRONktiVl6NH5aVGDY80uq12VogZ/c1vh+XE39JE1CNNkF
   Q==;
X-CSE-ConnectionGUID: zXWaJDWWTMe6JBBdMxhvkw==
X-CSE-MsgGUID: nNIqev9fR3yuWNRDfbxzbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32646148"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="32646148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 15:26:53 -0700
X-CSE-ConnectionGUID: B25X/3GJSVKnUdX2nc+/kg==
X-CSE-MsgGUID: Zib9oc1AQIaKDcSIeI1nvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78651927"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2024 15:26:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1YxG-000N0F-12;
	Thu, 17 Oct 2024 22:26:50 +0000
Date: Fri, 18 Oct 2024 06:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nvme-dma 4/10] riscv64-linux-ld: mapping.c:undefined
 reference to `iommu_dma_start_range'
Message-ID: <202410180629.59BHAxq9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nvme-dma
head:   080c3a9ad1b0163ed2b4f9f9fba9a9fd8fe8919f
commit: d86a03930160ddad48801a97253b62b277c13f4d [4/10] dma-mapping: add a dma_unlink_and_free_iova API
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20241018/202410180629.59BHAxq9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180629.59BHAxq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180629.59BHAxq9-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/dma/mapping.o: in function `dma_alloc_noncontiguous':
   mapping.c:(.text+0x4c6): undefined reference to `iommu_dma_link_range'
   riscv64-linux-ld: kernel/dma/mapping.o: in function `dma_set_mask':
   mapping.c:(.text+0x50e): undefined reference to `iommu_dma_end_range'
>> riscv64-linux-ld: mapping.c:(.text+0x522): undefined reference to `iommu_dma_start_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
