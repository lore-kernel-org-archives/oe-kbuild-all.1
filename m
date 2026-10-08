Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C715431E71
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 21:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494972; cv=none; b=ig053LR71QKFC7GPWcsOrp/2m6h1h2c8UUVlmncG4AUcKyDd9lChwjrZrOpSFswk99pWKmYllg41rnaYAl+VVTD9xC7dRhF0cOX4gASngxkb3x+6ir/DG3RPChosDFUfY1hHY2JDCOYJtK1iJta+wycylvwzFEu7d1pG28RHRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494972; c=relaxed/simple;
	bh=nEPwrDxNIhpfyBRBGMSDgOOdmkVkO0gRvF1NAsdmW1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NfYm0lqw9+XHEFpC7iPaneefVzfR4L/E1finvwkuugXCJcjh7YlwRcTrr6qjc106/2kJAZ0sPbl+T806BdCgvjamY3M8WpQs1N/0ZX6xiefFR935Nd/JZX/9VciIb1QwodUgdy+GsnHNcy09VzlOa7SkZ+FNDuPAvTioQsVgxdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGcntqX7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGcntqX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791494972; x=1823030972;
  h=date:from:to:cc:subject:message-id;
  bh=nEPwrDxNIhpfyBRBGMSDgOOdmkVkO0gRvF1NAsdmW1M=;
  b=FGcntqX7ACnBeBjAOBSsUeUBGN3uE0bJbPKGHV6vLTtSbc+XJXa2mkwI
   l3GGvTM3QBqTH6J9cpIDS5ub7etVj+BRC6DO/a+VN8hrBvHULevR010bZ
   6vmxuwlxeqeJuQ8xnJXoYZ5U75uw0BV/grRvtlGEThxa6smxovfXfSGTU
   bLR04u4qOMpPETWvzu65ViNMTeqF8gkcMgfHUQDMdcMHghca33lMylms2
   fPUo4+yy2tsYNJYHBUk48Jad2IbmjyBf/+oubdd78lwplDDHgZewT0y6+
   SVij7nYg7VYE/A+vaKz8dgbyfptIJY4S75f9Nbrlb6O56SLnoc/JTas24
   Q==;
X-CSE-ConnectionGUID: 6DxRwIFmQKuFXkIdIF+hSQ==
X-CSE-MsgGUID: 2LPg/38pQrS33er+hQcWyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="316805"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="316805"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:29:30 -0700
X-CSE-ConnectionGUID: w6I304edQvmTOSG+NqeQlA==
X-CSE-MsgGUID: aw3vF794TSK5JkvIU6UZJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="237687"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2026 14:29:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEvg6-0000000066f-0LAX;
	Thu, 08 Oct 2026 21:29:26 +0000
Date: Thu, 08 Oct 2026 23:29:17 +0200
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>
Subject: [linux-next:master 610/15343]
 drivers/gpu/drm/amd/ras/core/ras_umc.c:207:2-3: Unneeded semicolon
Message-ID: <202610082300.Z1qJuCOl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: 2103bfff1c603593789e30003c9d552c6967a7b7 [610/15343] drm/amdgpu/ras: use flip-bit mask to generalize bad page address derivation
config: x86_64-randconfig-2100-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082300.Z1qJuCOl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610082300.Z1qJuCOl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/ras/core/ras_umc.c:207:2-3: Unneeded semicolon

vim +207 drivers/gpu/drm/amd/ras/core/ras_umc.c

   179	
   180	static int ras_umc_expand_row_pages(struct ras_core_context *ras_core,
   181		struct eeprom_umc_record *record, uint64_t *page_pfns, uint32_t nr_page_pfns)
   182	{
   183		uint64_t retired_addr = RAS_PFN_TO_ADDR(record->cur_nps_retired_row_pfn);
   184		uint64_t flip_mask = record->cur_nps_pa_flip_mask;
   185		uint64_t subset;
   186		uint64_t row_pa, addr;
   187		uint32_t count = 0;
   188	
   189		if (!retired_addr || !flip_mask || !page_pfns || !nr_page_pfns)
   190			return -ENOEXEC;
   191	
   192		row_pa = retired_addr & ~(flip_mask);
   193	
   194		if (count < nr_page_pfns)
   195			page_pfns[count++] = RAS_ADDR_TO_PFN(row_pa);
   196	
   197		subset = flip_mask;
   198		while (subset) {
   199			addr = row_pa ^ subset;
   200	
   201			if (count >= nr_page_pfns)
   202				break;
   203	
   204			page_pfns[count++] = RAS_ADDR_TO_PFN(addr);
   205	
   206			subset = (subset - 1) & flip_mask;
 > 207		};
   208	
   209		return count;
   210	}
   211	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
