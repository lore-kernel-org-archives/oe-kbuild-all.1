Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C4125B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727487598; cv=none; b=a3DN/bEXxUL4tGnmFgWgoDRlOTCJbsG1kv2QcsOosJnNrBlxrA7wMBVwV9Urq8ykNSG3vxvf3QopYJwvwcBlD8U3h27wgmoGsDnX7O5CuEDipEvBuOuEj59DJinqht9f+xK6ks7sg0GCXtlL4DTZdw9wqgtZfP/m71rvMLKSL5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727487598; c=relaxed/simple;
	bh=FxGDVr5Y8nafmd1rvnsCBi0LlzIEVbtSe+ZV0RXc9Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IF9shHkIgUd/2wDENP0NcqtvYGgkVsl1B8N4y1f2O7sztwMov5IAYAUHC/TkLllmHR1nHzLNGxLqt3uOT9ksFLd6Z0zI/X8SX887ApkOrZwUEywfL1QVuJ2qgcfLk00iDz+MER1mjKOiHT+pe12haFXoqN4tFR9MD/kIoWo7hQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj0GXfPt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj0GXfPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727487596; x=1759023596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxGDVr5Y8nafmd1rvnsCBi0LlzIEVbtSe+ZV0RXc9Qw=;
  b=Qj0GXfPtTbhoKY9T+WFFG1ig8w3JsoZ0HRoP1rm8z/Z1o2ZlICr6RxdV
   m8MbrJj05X5P88cVNX+nVTS9byIzncCGDgjia9xLEazpX/JnnSUufQmP3
   xSvh2VtUU28Vv/Z0vLS5tTgrKyUQCrbH+xFep2KxDwoymsXLbSg94/KKB
   TuERxczzgdIjfY3tpSH9E1CZ8dbcx2+NMqjGdvhv9mJlic0twreo2skgH
   A4VcbB4ocelpkpJXhWsmGkOp2wgbTDhcWmY26S2Shsnlj51wmW+BqRvP1
   0vPvw3sj0fzTrCt+FHJhVmTUk61G4awWWDEgT1qOYdOmNsVh2QHjz69h7
   g==;
X-CSE-ConnectionGUID: tyFTyAA6SgKZyA+CcQic8A==
X-CSE-MsgGUID: lLQccI6ER5+bDRGRYMZVQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26776620"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26776620"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 18:39:56 -0700
X-CSE-ConnectionGUID: 2WsFdJIuRCufiOEWL4WvEg==
X-CSE-MsgGUID: dBscSpMpTkKQBSoqhQiEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77650239"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2024 18:39:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suMR6-000MpL-15;
	Sat, 28 Sep 2024 01:39:52 +0000
Date: Sat, 28 Sep 2024 09:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4701/30000] arch/arm64/mm/pmem_reserve.c:13:13:
 warning: no previous prototype for 'setup_reserve_pmem'
Message-ID: <202409280935.BxmRiHdQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhuling,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: db4cd75bc674e6f473c0a7303b1744155352882c [4701/30000] arm64: register persistent memory via protected memory
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280935.BxmRiHdQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280935.BxmRiHdQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280935.BxmRiHdQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/pmem_reserve.c:13:13: warning: no previous prototype for 'setup_reserve_pmem' [-Wmissing-prototypes]
      13 | void __init setup_reserve_pmem(u64 start, u64 size)
         |             ^~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/pmem_reserve.c:25:13: warning: no previous prototype for 'request_pmem_res_resource' [-Wmissing-prototypes]
      25 | void __init request_pmem_res_resource(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/pmem_reserve.c:40:13: warning: no previous prototype for 'reserve_pmem' [-Wmissing-prototypes]
      40 | void __init reserve_pmem(void)
         |             ^~~~~~~~~~~~


vim +/setup_reserve_pmem +13 arch/arm64/mm/pmem_reserve.c

    12	
  > 13	void __init setup_reserve_pmem(u64 start, u64 size)
    14	{
    15		if (pmem_res_cnt >= MAX_REGIONS) {
    16			pr_err("protected memory regions above upper limit %d\n", MAX_REGIONS);
    17			return;
    18		}
    19	
    20		pmem_res[pmem_res_cnt].start = start;
    21		pmem_res[pmem_res_cnt].end = start + size - 1;
    22		pmem_res_cnt++;
    23	}
    24	
  > 25	void __init request_pmem_res_resource(void)
    26	{
    27		struct resource *res;
    28		int i;
    29	
    30		for (i = 0; i < pmem_res_cnt; i++) {
    31			res = &pmem_res[i];
    32			res->name = "Persistent Memory (legacy)";
    33			res->flags = IORESOURCE_MEM;
    34			res->desc = IORES_DESC_PERSISTENT_MEMORY_LEGACY;
    35			if (res->start && res->end)
    36				request_resource(&iomem_resource, res);
    37		}
    38	}
    39	
  > 40	void __init reserve_pmem(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
