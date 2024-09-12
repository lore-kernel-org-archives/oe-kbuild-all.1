Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC113D7A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726128461; cv=none; b=In66lcXw4R/+cqkrLOWyFeGqp7xawEFsrinvEWTlp9zArZPwUGew7CBBuAwwGGTdzR6d6FMW7Al7ZLaD6XnbIm2jEm+UlJ/rwIparXu4FkpsCVOozRJ9Vvyq3/sDNJMK1wOAK2qJKlAK0dM9GHQzA5f3it1gywU67Dh1Etfn6xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726128461; c=relaxed/simple;
	bh=cUeOs2H9u6KM3YWRbsDT1x/zYAXwy23mAIRIgkApuWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7GQ4PRfQDw/knrjRQOZ7+JClYujEUvQQ09ggN46ewndo7kt3MaFeKQScFUMcvoSX6QSi18AUSQ2XRoxPVTzl/eySrVqkoWNF26fSIG1ffaUKj9fQx0iuPUxbaOLwhKEtrcnbSTEYBpZtmZm06KICB1BlwRGkmvjjpsB4a8dGMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZG1LI7T; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZG1LI7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726128459; x=1757664459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cUeOs2H9u6KM3YWRbsDT1x/zYAXwy23mAIRIgkApuWY=;
  b=VZG1LI7Tv7oifKb1jOnp+vIHQQ7+mtOQKlx9Mx9iFQKSEgonB5Xoew82
   2RWbmQbN8AVTSyjjxp/FUWYwHS5O/HyB1Tc9cekOcdo4ugLnVb6hfVs0t
   iQVRZMwlBzn4rRUNIEhFYMh9wFuI0vYaPTZgjIeW5Gx7n/v8kHhOuSh/e
   QVr04icqfW0VhMTyzk9HfqkUQk57/nJMPcZIZAhsJTIBwk9Ana9Crp6E5
   OXnkA4iyRhWx0ivhCL9j6ZOYm/qYN14KJwaTN8TNAPbUEiOvrwv3Cuuf+
   8+v20G5IOqx34fUEtxNYVm7MmTiPsjD8N0EUcxCRF4sEjuMmuVQDpsr0H
   w==;
X-CSE-ConnectionGUID: Q0ihO2fVSBGyxQ6twci5Nw==
X-CSE-MsgGUID: SXDlyE59TKuMgB77ZlT5Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25067918"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="25067918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 01:07:38 -0700
X-CSE-ConnectionGUID: AvufuGNjQMK5r1IbuWMvjw==
X-CSE-MsgGUID: 0JqR2ZaITuCqDjeEuOq5Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="72627546"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Sep 2024 01:07:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soerX-0004gA-1S;
	Thu, 12 Sep 2024 08:07:35 +0000
Date: Thu, 12 Sep 2024 16:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 5685/30000] arch/arm64/mm/quick_kexec.c:21:13:
 warning: no previous prototype for 'reserve_quick_kexec'
Message-ID: <202409121642.JnGeDDHC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kefeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7c98201b2598a42ac2ce6a9036ee4e4349a406ac
commit: d61f4ca086e99bb481961b1120e10e7a4296c392 [5685/30000] arm64: quick_kexec: Move to stand-alone file
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240912/202409121642.JnGeDDHC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121642.JnGeDDHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121642.JnGeDDHC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/quick_kexec.c:21:13: warning: no previous prototype for 'reserve_quick_kexec' [-Wmissing-prototypes]
      21 | void __init reserve_quick_kexec(void)
         |             ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/quick_kexec.c:47:13: warning: no previous prototype for 'request_quick_kexec_res' [-Wmissing-prototypes]
      47 | void __init request_quick_kexec_res(struct resource *res)
         |             ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/reserve_quick_kexec +21 arch/arm64/mm/quick_kexec.c

    20	
  > 21	void __init reserve_quick_kexec(void)
    22	{
    23		unsigned long long mem_start, mem_len;
    24	
    25		mem_len = quick_kexec_res.end;
    26		if (mem_len == 0)
    27			return;
    28	
    29		/* Current arm64 boot protocol requires 2MB alignment */
    30		mem_start = memblock_find_in_range(0, arm64_dma_phys_limit,
    31				mem_len, SZ_2M);
    32		if (mem_start == 0) {
    33			pr_warn("cannot allocate quick kexec mem (size:0x%llx)\n",
    34				mem_len);
    35			quick_kexec_res.end = 0;
    36			return;
    37		}
    38	
    39		memblock_reserve(mem_start, mem_len);
    40		pr_info("quick kexec mem reserved: 0x%016llx - 0x%016llx (%lld MB)\n",
    41			mem_start, mem_start + mem_len,	mem_len >> 20);
    42	
    43		quick_kexec_res.start = mem_start;
    44		quick_kexec_res.end = mem_start + mem_len - 1;
    45	}
    46	
  > 47	void __init request_quick_kexec_res(struct resource *res)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
