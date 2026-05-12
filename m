Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864C3ACF0F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578777; cv=none; b=QZRV1G9dSGEJCiQHxmyA8SumagtIuhNocqo3XmTVn/xfjPgj0GBKPKDSkRJnts2oVotJU/TJRBExegybVPmJ4iu760p0nIr8EHY035ZvHfJAAsVfrVCq1bkNygXIT8yT5OMirmySIo3bPe84a6ltgZekEOtmmvOswmJG33+9pJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578777; c=relaxed/simple;
	bh=LvXz7JT/aV6I03N7rIR6SN0+S3vRJZ1NoU4kQDsI1cg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g+XjfLgcGtc4Rk2CQIvZbi5idG/KThE8kqTSKpMUBEX2MeocNbXSd6EHzE7KUgYBR9Lzvg7T5Gjpa42XjmmJEEiXMiqljjh6igPe2gsmHFzqwZ5jWP7n9cjt8iGJlElb326f8nXWUCotgfyn/v6WYDc8HrFfDc+DjClL54FW3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPTZHKGQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPTZHKGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778578773; x=1810114773;
  h=date:from:to:cc:subject:message-id;
  bh=LvXz7JT/aV6I03N7rIR6SN0+S3vRJZ1NoU4kQDsI1cg=;
  b=mPTZHKGQrT+PjymrgnKZW5pFTfOrU+NbQFIJSsN4gS8bnDOpPm1sMRIx
   qtSOMmG+uy38jgcgtsGg3JgHFCDq1VjknRYe2DtbKE+cCFPmrKZnt1HLp
   Hsb2yxCEGMXnBD+YgiYpzorSDEBPeAOEeEaSDYgvNctEYCiogAItmtbu/
   iOBfPE3oMPvMydsHaVuiNbWw3qnTUv6smWNMdRydKCUDNq19BxQnlxadL
   bamwfwE42jbcOaEiFmotIC130Ik+1+jAMpLnMo3OepZFvTIaXQEBeDqvL
   bRUMUM9MVXbKTNlRzAeIJvPGULeUY5UxG9Nluy511VJnSnucH8AYjQAyL
   Q==;
X-CSE-ConnectionGUID: 8N2pUjnOQXiblrRjb5LEMw==
X-CSE-MsgGUID: NwCCVAJhSNSq45qjTxQHYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104938854"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104938854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 02:39:29 -0700
X-CSE-ConnectionGUID: lnfdqnYtT3u4gvbo5fFF0A==
X-CSE-MsgGUID: oGx8mNprSPei1BsTA9qUkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242688292"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 02:39:26 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMjaE-000000001wA-3PAy;
	Tue, 12 May 2026 09:39:22 +0000
Date: Tue, 12 May 2026 17:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, Nutty Liu <nutty.liu@hotmail.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [iommu:riscv 2/2]
 drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: incompatible
 types for operation (>):
Message-ID: <202605121749.gYSaqjqs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git riscv
head:   6c21eb174c6c7aebdecaf5c39e3100e6beb35faa
commit: 6c21eb174c6c7aebdecaf5c39e3100e6beb35faa [2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits
config: um-randconfig-r112-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121749.gYSaqjqs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121749.gYSaqjqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121749.gYSaqjqs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_riscv64.c: note: in included file (through drivers/iommu/generic_pt/fmt/iommu_template.h):
   drivers/iommu/generic_pt/fmt/riscv.h:67:22: sparse: sparse: bad constant expression
   drivers/iommu/generic_pt/fmt/riscv.h:68:22: sparse: sparse: bad constant expression
>> drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: incompatible types for operation (>):
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse:    unsigned long long
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse: sparse: incompatible types for operation (>):
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    unsigned long long
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse: sparse: incompatible types for operation (|):
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    void
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse: sparse: incompatible types for operation (>):
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse:    unsigned long long
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:195:27: sparse: sparse: incompatible types for operation (|):
   drivers/iommu/generic_pt/fmt/riscv.h:195:27: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:195:27: sparse:    void
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:196:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:195:27: sparse: sparse: incompatible types for operation (|):
   drivers/iommu/generic_pt/fmt/riscv.h:195:27: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:195:27: sparse:    void
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse: sparse: incompatible types for operation (>):
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse:    unsigned long long
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse: sparse: incompatible types for operation (>):
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse:    unsigned long long
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:98:24: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:101:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse: sparse: incompatible types for operation (|):
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    void
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse: sparse: incompatible types for operation (|):
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    void
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse: sparse: incompatible types for operation (|):
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    void
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse: sparse: incompatible types for operation (|):
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    void
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse: sparse: incompatible types for operation (|):
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse:    void
   drivers/iommu/generic_pt/fmt/riscv.h:89:16: sparse: sparse: cast from unknown type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse: sparse: incompatible types for operation (<<):
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    bad type
   drivers/iommu/generic_pt/fmt/riscv.h:169:17: sparse:    int
   drivers/iommu/generic_pt/fmt/riscv.h:168:27: sparse: sparse: incompatible types for operation (|):

vim +89 drivers/iommu/generic_pt/fmt/riscv.h

e71e00127110ded Jason Gunthorpe 2026-02-27  86  
e71e00127110ded Jason Gunthorpe 2026-02-27  87  static inline pt_oaddr_t riscvpt_table_pa(const struct pt_state *pts)
e71e00127110ded Jason Gunthorpe 2026-02-27  88  {
e71e00127110ded Jason Gunthorpe 2026-02-27 @89  	return oalog2_mul(FIELD_GET(RISCVPT_PPN, pts->entry), PT_GRANULE_LG2SZ);
e71e00127110ded Jason Gunthorpe 2026-02-27  90  }
e71e00127110ded Jason Gunthorpe 2026-02-27  91  #define pt_table_pa riscvpt_table_pa
e71e00127110ded Jason Gunthorpe 2026-02-27  92  

:::::: The code at line 89 was first introduced by commit
:::::: e71e00127110dedc6a9e746178282b4dac97ed96 iommupt: Add the RISC-V page table format

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
