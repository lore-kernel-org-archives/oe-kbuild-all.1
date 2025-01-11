Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE881FC8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736617167; cv=none; b=k8LROrxNiyV56Y7nEv2EPEQMxTsRHTqVa6wdGx21YDR8Svpo5KE2aTd9OC6D8Spe7fxuYKeG8Ojkq71h1VO0mvqMCdZI4sGROmCDR++oIw31c2ZW5k53IJoDTPpIPA+PRarElNo7FW5p51UqKWVUHI/VFOQ485WoKDb/SgWPbwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736617167; c=relaxed/simple;
	bh=ddXVY1Qzfil++zZUT4slP8g0HrqQ5+9/TfB7PegmsCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LnCWN14Tqy7diJcKHjDNYEuxj2XZfB/c8PfxqGb2blNd1LcMQ2tXw/DF1i3BYea81F6kT//pF0RVcQOWm4eDEJfAx+6KW0uALV4W6qu4892fMwtZMbgK0v/yAGC9nqOk7JUOuStUl4tzZU01PK5LsqqHDMHXYZRLQ7iDlhNGetA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ll/Itjgd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ll/Itjgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736617167; x=1768153167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddXVY1Qzfil++zZUT4slP8g0HrqQ5+9/TfB7PegmsCc=;
  b=ll/ItjgdCJtB6GQvNIZKZQDX6d1WBV0qWWWHzLWikJsSJatePM8fzk8r
   UVsfED54mip7zTLNdZifwjPbE3/cNHtOVt3WJJunsNjuDgNSde/wU6Uz3
   uffBmGAE/WY7Jj//PymlIe82ewFA4y09vql7kN/KXCRCKlbfAYf0dIg0/
   F0mGWnS/k8K/b9k820wdPPNF+fXoB0ee4QDQ480bItaZqd13zcG+l8DeY
   +M6BQnJ7LISwRK2y+MbRMaI4tVXpHhLLXYtAeii8XgqBpNj0+ea8dkjOn
   k0VGobt5J+XSpK9hrj7idlkpPANJCrNDcMXVbyFmx1py1M/c0nx/Ei/BZ
   A==;
X-CSE-ConnectionGUID: P5QYwEV+SeqvD7reAmiP3A==
X-CSE-MsgGUID: rcShX3pOQduUcMPAQstjnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="48264285"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="48264285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 09:39:26 -0800
X-CSE-ConnectionGUID: pbg14EExQFyaa6GnsGoB1Q==
X-CSE-MsgGUID: hjVofH1OQhCa0mXGpIcCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104534316"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2025 09:39:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWfSD-000L45-2N;
	Sat, 11 Jan 2025 17:39:21 +0000
Date: Sun, 12 Jan 2025 01:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 333/504] drivers/usb/dwc3/core.c:682:undefined
 reference to `ulpi_write'
Message-ID: <202501120126.Hfe71w5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 852fef317cff07d1feee37e7d6ae013b9da7394e [333/504] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: riscv-randconfig-r062-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120126.Hfe71w5G-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120126.Hfe71w5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120126.Hfe71w5G-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_free_scratch_buffers':
>> drivers/usb/dwc3/core.c:682:(.text+0x35ac): undefined reference to `ulpi_write'
   riscv32-linux-ld: drivers/usb/dwc3/core.o: in function `__preempt_count_sub':
>> include/asm-generic/preempt.h:60:(.text+0x417c): undefined reference to `ulpi_write'


vim +682 drivers/usb/dwc3/core.c

   676	
   677	static void dwc3_free_scratch_buffers(struct dwc3 *dwc)
   678	{
   679		if (dwc->dr_mode == USB_DR_MODE_HOST)
   680			return;
   681	
 > 682		if (!dwc->has_hibernation)
   683			return;
   684	
   685		if (!dwc->nr_scratch)
   686			return;
   687	
   688		 /* should never fall here */
   689		if (WARN_ON(!dwc->scratchbuf))
   690			return;
   691	
   692		dma_unmap_single(dwc->sysdev, dwc->scratch_addr,
   693				 (size_t)(dwc->nr_scratch *
   694				 (size_t)DWC3_SCRATCHBUF_SIZE),
   695				 DMA_BIDIRECTIONAL);
   696		kfree(dwc->scratchbuf);
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
