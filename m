Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71134E777
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668006; cv=none; b=CsLFLi8LEx2HcB/6XjpA31OvbB1nstb+0OdjYVtEt2VcIpou7v1InBGOC2qT/ZTw5gtxp0F7nZuW6hl1kLPa/z2wGctEtlQu53/E01ibRqbZzatql8YugG3c6JSozA+d9AJasp+JuYnm8OZ8al2UNDRWJfNZZ3lkhKwtsc6VL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668006; c=relaxed/simple;
	bh=YTFCA9gvO6AU95aTnp6eW+wRfI82MOnT5ifE/IA7XOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K2rDcguresZ/uiA5IdUF49i/IB63P7kjlMLrEo76LJe+kz6sONeFza+uwFXKbwQ8HRgl5yz6Oo07tNr4U3H1YI3Z6D/G00apnELDVHazQWEsuEAJ5/aCWh2NVqwdGe67ERoOstLMya2mhPc/VshXWS/0OoQ0rfXM5N1OFrqhJU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1d4uS8v; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1d4uS8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791668003; x=1823204003;
  h=date:from:to:cc:subject:message-id;
  bh=YTFCA9gvO6AU95aTnp6eW+wRfI82MOnT5ifE/IA7XOM=;
  b=Z1d4uS8vDxja2PYu9kCiBG+TqAKxyw2xbduIzbVGIUi3I/1MudXPjd1r
   MmWh+M9FJEiEH023Vdy4NjrMzfEXDTjjM8X2LNae0XfSoHWN71/SYJaZe
   iY78hOCJU0ow74HbopPcGsp8TN0St4LnT+aLwoz4gywr1tb0FJcq4hlvx
   OYjqJ1C0xWmoNa3NP9GfYyJ75bbO65rgVT/3lwU2kq4YAE6WIz/AK3xJU
   D75vesM07Buvu+vSMlobOUxxwxATqr73xmcfJ3/W3ahi4QpitYmNn2QEV
   Ml8WWAhLHBI/nk7iucPp4QBXyB0lLgxuFjb2TlEBftEsQfV366GQ8CFJk
   Q==;
X-CSE-ConnectionGUID: S5bHzNKuSra1vqkYI1O91g==
X-CSE-MsgGUID: iIxDzHEBQFm6DxBvZM3AOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="308563"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="308563"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 14:33:22 -0700
X-CSE-ConnectionGUID: ck5gPe0gTwymE4Uf0dpfOw==
X-CSE-MsgGUID: KD1bdnrnTuusV4VP6ifMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="942070"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2026 14:33:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFegv-00000000A5c-1zZP;
	Sat, 10 Oct 2026 21:33:17 +0000
Date: Sun, 11 Oct 2026 05:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhang <zhangyu1@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>,
 Wei Liu <wei.liu@kernel.org>,
 Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
 Jacob Pan <jacob.pan@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 15752/16158]
 drivers/iommu/hyperv/hv-iommu-guest.c:574:undefined reference to
 `pci_request_acs'
Message-ID: <202610110511.Nk1sZ8SG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   becb95e45ef0dda9ffb35156d909d3da7a2789c3
commit: 2690d4156b51f7e9fe874dd480fc928594615552 [15752/16158] iommu/hyperv: Add para-virtualized IOMMU support for Hyper-V guest
config: x86_64-buildonly-randconfig-1004-20261010 (https://download.01.org/0day-ci/archive/20261011/202610110511.Nk1sZ8SG-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110511.Nk1sZ8SG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610110511.Nk1sZ8SG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/hyperv/hv-iommu-guest.o: in function `hv_iommu_init':
>> drivers/iommu/hyperv/hv-iommu-guest.c:574:(.init.text+0x17c): undefined reference to `pci_request_acs'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


vim +574 drivers/iommu/hyperv/hv-iommu-guest.c

   531	
   532	int __init hv_iommu_init(void)
   533	{
   534		u64 status;
   535		int ret = 0;
   536		struct hv_iommu_dev *hv_iommu = NULL;
   537		struct hv_output_get_iommu_capabilities hv_iommu_cap = {0};
   538	
   539		if (no_iommu || iommu_detected)
   540			return -ENODEV;
   541	
   542		if (!hv_is_hyperv_initialized())
   543			return -ENODEV;
   544	
   545		status = hv_iommu_detect(&hv_iommu_cap);
   546		if (!hv_result_success(status)) {
   547			if (hv_result(status) == HV_STATUS_INVALID_HYPERCALL_CODE)
   548				return -ENODEV;
   549	
   550			hv_status_err(status, "HVCALL_GET_IOMMU_CAPABILITIES failed\n");
   551			return hv_result_to_errno(status);
   552		}
   553	
   554		if (!hv_iommu_present(hv_iommu_cap.iommu_cap))
   555			return -ENODEV;
   556	
   557		if (!hv_iommu_s1_domain_supported(hv_iommu_cap.iommu_cap)) {
   558			pr_err("stage-1 translation not supported: cap=%#llx\n",
   559			       hv_iommu_cap.iommu_cap);
   560			return -ENODEV;
   561		}
   562	
   563		/*
   564		 * Require the base page size. The domain page-size bitmap is later
   565		 * restricted to the sizes supported by both iommupt and Hyper-V.
   566		 */
   567		if (!(hv_iommu_cap.pgsize_bitmap & PAGE_SIZE)) {
   568			pr_err("unsupported page sizes: pgsize_bitmap=0x%llx\n",
   569			       hv_iommu_cap.pgsize_bitmap);
   570			return -ENODEV;
   571		}
   572	
   573		iommu_detected = 1;
 > 574		pci_request_acs();

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
