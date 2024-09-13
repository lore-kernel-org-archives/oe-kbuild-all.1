Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D682D052
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726245730; cv=none; b=l6QYHCxYZ9fKBIj1OAGXwjH/uiLjzKhLwNbM1liRec2JdFNjcZHlXk+i/FXIYPrx1ZDe3Qzs6bb86xE0UPAamWrk880A05QPuFYTPw7o3CCWmxv3vlagcPRdNjlcKxu1tuUYiiEQ3BK/tGltxt0xg/n0VGlHv3dQmVet8y6FxKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726245730; c=relaxed/simple;
	bh=ae6v24hwtukCnuww0t1c8NPiZ8apk6zCh8JSQGKkDsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2606jkDF0c0sYWwqqb65kHsAi3U62btAZDQ3Y8tgQMyxfcXs2vDvwEi3cWjw1iZBCiYCCMXZNHWRDZermwmCkeXQWQjzQvysDmLU7BhyDwC7KuVkGfi9kkFN7zNANBErQ9nuzPgbq4492lucohI4E8XlIJONsmeDwApXJsW8F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTP0VXoJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTP0VXoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726245729; x=1757781729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ae6v24hwtukCnuww0t1c8NPiZ8apk6zCh8JSQGKkDsI=;
  b=NTP0VXoJJ0L8cuw7D2FxieR3J6n4jKl/WYj+SEhkoXJ57/71aLIvsNpo
   NajS7wKag/nXrBqPCreLC9eWtJekoEpyrBArXtDBnz4ADycIp7Nb6FMZH
   rcCq4rDPIhi/5REwcVYtymQi0UpWMb6k74ElI70C/ksLdmFhi0kZmWeIM
   sh7yOpJ+2f4A4hNtCfohQOToDxRi7Rz4e1uGjf9ZsbtEANE32DYbD9eF6
   Hw9z5jSudSxAqbg1Oj6MclHAKh+QmlwquphZEhTJDDQzDkPJuM7xlzc+9
   LQf9UZfd5Tcq4ZKyb4PSFLzkMiZv/y2G7mKtvwx6OqZxflGrveuYO0e92
   A==;
X-CSE-ConnectionGUID: qYcnoPrSSxa7fyB7RjZRrA==
X-CSE-MsgGUID: wgJFjI8mQDelEts8QtNeYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25034501"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25034501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 09:42:08 -0700
X-CSE-ConnectionGUID: JEZByD+tQzq/gcQjAzSYdQ==
X-CSE-MsgGUID: 5qZP2UsYSKCwsuHKI0krZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68368388"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Sep 2024 09:42:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp9Mz-0006hY-0J;
	Fri, 13 Sep 2024 16:42:05 +0000
Date: Sat, 14 Sep 2024 00:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4908/30000] arch/arm64/mm/pmem_reserve.c:13:13:
 warning: no previous prototype for 'setup_reserve_pmem'
Message-ID: <202409140022.9cw3pzYT-lkp@intel.com>
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
head:   5a1d9701155c6908c76c68951170f10279685143
commit: db4cd75bc674e6f473c0a7303b1744155352882c [4908/30000] arm64: register persistent memory via protected memory
config: arm64-randconfig-004-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140022.9cw3pzYT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140022.9cw3pzYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140022.9cw3pzYT-lkp@intel.com/

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
