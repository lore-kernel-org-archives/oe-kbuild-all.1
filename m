Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642349;
	b=ZgovLcm4F8Ly+1drSCP8dLFk3UiEQPOM1Rq/w8a9E123Io1CUWuBACPeQEbq4jGyJItt
	 wD5DmfIgluQJm5Qm0WcB5Jt8f34Xpzz1UMSLPflNDNxfwJyT48oc8U04PbrlkCD4zfd2R
	 jphks0qCqwPb+StmJv5vTYY21CVdluv9AFR1ShmhPrVIqhgJHhFupd+nWj5zaxHxgOKq8
	 ankZVo5mNkC6VtH6L33NB3vf0n+9p9EGBRBHbO+SgLGR1BHsJwDdld8zC/uXqGn+wyBvU
	 GOVEPSO5zDtVlTlcl9yoiZYvmbBKM+YsDYDLKkP6jm6WFGYuALPl0R1CrjQ0aUhsgYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642349;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vWmXuRYjeHsBwKTHQ/Du9I+N71eislIOp/+P75Xvg/U=;
	b=biNLqg4pbRrgAH9trNhhRxSWNUhns5hItKHjUEyrKpjcC9tcWrezm8q+gIszaQ+9jlk+
	 BtFx+8Lc5CkWY4KWTUE2RroaL7wdbNwvZqaqrc4uscMfTZ1RbOLDLgOTWcdl3sBj280mV
	 jTC1lKbU4qCNSPrR0Kk1YKj0QpPycE4gl4zpi1SXPfR5Su7hS28+O7ontd5WJ4wT6J9y8
	 O5B7nsf2vebMTTUxw5NsraRWtAXNwDwA6I9NQr/1MZE1bgUUW8RE+BwjfsvNCEhxD9O6s
	 mOw8kkthuUA7aqcIoTKmtSEiMZnjQElsfzSRi4d7f0dRpRUtCs8KPq6zBd09h/P3FeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dLGpkkFA;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBFC606A321
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 21:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FBFC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dLGpkkFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795642349; x=1827178349;
  h=date:from:to:cc:subject:message-id;
  bh=5OkynNiLfcsvBZHN4wzt0KG7VhQkfGPitxkAiFx/3xQ=;
  b=dLGpkkFAyo+Gv5H9W6es63Q6dxCz4kD3YKiD3mEhEvcxQe4yvfsvACeB
   fKUdJpzAA19UGbMKAWCBSWOxjAHGhxD7+0Sxdp0Zp4U4GQoqECM346euf
   YYPf4lEvm3GwNvJ+3hpIjAEm3Mp0SAzjhms+16lcpoPZ5OO1lLEtoh6Pl
   OXVuffanomxZwsZNV0Ib7t5xwDJLVmhlNKfCy635omdZbuN7rGj4/p43Y
   e5N1SzWnRUzUqRixfKJYJnZ8mmBnrl/uLnIBpEMFeWw1dZdP+ITzbFeBH
   oHLGjrsabb52egGTO+8KbGL/V5AhoGs/D9UWEv/UYCzFbEFCi4be+O6qO
   w==;
X-CSE-ConnectionGUID: BoeKLErFTqmdbkV9BEF0ug==
X-CSE-MsgGUID: gr9r7v2kR0yX2UffNyRN9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4445416"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4445416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:32:28 -0800
X-CSE-ConnectionGUID: QIZyZKU7SPWnQwUndYrx+w==
X-CSE-MsgGUID: oSLlFAhZRMygzYIOExsJuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12291425"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Nov 2026 13:32:27 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWKbI-0000000006R-0ijj;
	Wed, 25 Nov 2026 21:32:24 +0000
Date: Wed, 25 Nov 2026 22:31:32 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 56/115]
 drivers/iommu/riscv/iommu.c:1363:16: error: implicit declaration of function
 'virt_to_pfn'; did you mean 'virt_to_kpte'?
Message-ID: <20261125223034.eaiM2zvB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   d77c0270e18de0b01434fec8027d8a61ae1f7c00
commit: d2441e4c43d5274642f2659edf11513586aacc7e [56/115] iommu/riscv: Prepare MSI table updates for interrupt remapping
config: sparc-randconfig-r2100-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125223034.eaiM2zvB-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125223034.eaiM2zvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125223034.eaiM2zvB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu.c: In function 'riscv_iommu_msi_table_set_dc':
>> drivers/iommu/riscv/iommu.c:1363:16: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_kpte'? [-Werror=implicit-function-declaration]
      dc->msiptp = virt_to_pfn(msi_table->root) |
                   ^~~~~~~~~~~
                   virt_to_kpte
   cc1: some warnings being treated as errors


vim +1363 drivers/iommu/riscv/iommu.c

  1358	
  1359	static void riscv_iommu_msi_table_set_dc(struct riscv_iommu_msi_table *msi_table,
  1360						 struct riscv_iommu_dc *dc, bool activate)
  1361	{
  1362		if (activate) {
> 1363			dc->msiptp = virt_to_pfn(msi_table->root) |
  1364				     FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1365						RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1366			dc->msi_addr_mask = msi_table->msi_addr_mask;
  1367			dc->msi_addr_pattern = msi_table->msi_addr_pattern;
  1368		} else {
  1369			dc->msiptp = 0;
  1370			dc->msi_addr_mask = 0;
  1371			dc->msi_addr_pattern = 0;
  1372		}
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
