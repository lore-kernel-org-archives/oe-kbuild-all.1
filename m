Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C079F2C21C6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 19:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765222928; cv=none; b=AIjrVtRLP+UeWtCihLuNlgr0lxPt+yAQwUsJBv4863LheSBWZd8xLhAilm2APaLPyVJ8wzyc72oLvbEo9+MAlGK+68s5+V9B0YluuN9TTMNmIIr6/OwKXBjuWDDBzCv/2Y+86TIwt+c/vAYXlcqUTKhoGYGMUu1KDnGBqs2Z0F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765222928; c=relaxed/simple;
	bh=Lf1vQXV/7Ny+lAR7iQGTMlgFCALo4PhO9jC4Q3N7YzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvdpjXLRKSihVD35aXfPv31x5gxWJS1nliU0CxcKrfPh+vlIoL4Tn4m0dnat0f1pOPtI4aJpWuRzjrOabccc5Lcu4ICGyTtGeA8oWoa1ILz8B5cWGpbmRAX4h+pA2Izd6VMswVLWAD6QITQkQk5//084TfnSlkkzHv/eR9FmkJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Idk5b2bG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Idk5b2bG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765222927; x=1796758927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lf1vQXV/7Ny+lAR7iQGTMlgFCALo4PhO9jC4Q3N7YzQ=;
  b=Idk5b2bG+pm2eTNLqW7CNKNeug/56rGQoI8oEymY2xPfU8S+0uB9looe
   8KaBfo02eSZe6ISINASwSyEgz9/a0Yb5jSP326/2eEFWWdw8IZfTiEoco
   Ex86NwPTQteaXBoSztgW42f6YAZC7FDHfGqu/WapUaheIxlxqc3z/s1Wv
   LKQDf8qYljIkunjI1B1uRhlFw/kxbFOkpZXiQrTG9TV7jJROVcH7lO8+o
   mHTGjNojDzSFeD1jwgNrHjH1Av6ezCpQAgvEKneYtlrzHksmH7NtUEbMi
   dqg28f84qZYJgC7h4gl6eLK0ZDHX+8A7XBiw84+k7KIMyfm1KwpG3UMqp
   Q==;
X-CSE-ConnectionGUID: fWbDAJshQoSId2NLhRUVow==
X-CSE-MsgGUID: mrV7qRrgQQSKA3kpcseaJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54713975"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="54713975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:42:06 -0800
X-CSE-ConnectionGUID: h3WGaCjmTgyyWZ1xhN7FGw==
X-CSE-MsgGUID: 75gTYqW3SLauxqQvpf9v6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195921600"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Dec 2025 11:42:05 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSh7T-000000002FF-17Jr;
	Mon, 08 Dec 2025 19:42:03 +0000
Date: Mon, 8 Dec 2025 20:41:37 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3386/3386] arch/x86/mm/kasan_init_64.c:128:15:
 warning: variable 'p' set but not used
Message-ID: <202512082005.aJ6IUacC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   69d9543977fd7abe8b555406c7a3e5d64d8292f8
commit: 68ee705da160d123656dcbf9ebd449fb77b54bc0 [3386/3386] scripts: kernel-doc: Fix syntax error due to undeclared args variable
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512082005.aJ6IUacC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082005.aJ6IUacC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082005.aJ6IUacC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/kasan_init_64.c: In function 'kasan_populate_pgd':
>> arch/x86/mm/kasan_init_64.c:128:15: warning: variable 'p' set but not used [-Wunused-but-set-variable]
     128 |         void *p;
         |               ^
   arch/x86/mm/kasan_init_64.c: In function 'kasan_shallow_populate_pgds':
   arch/x86/mm/kasan_init_64.c:270:15: warning: variable 'p' set but not used [-Wunused-but-set-variable]
     270 |         void *p;
         |               ^
--
   lib/test_blackhole_dev.c: In function 'test_blackholedev_init':
>> lib/test_blackhole_dev.c:32:24: warning: variable 'ethh' set but not used [-Wunused-but-set-variable]
      32 |         struct ethhdr *ethh;
         |                        ^~~~
--
>> drivers/acpi/cppc_acpi.c:450: warning: Function parameter or member 'cpc_pptr' not described in '__acpi_get_psd_map'
   drivers/acpi/cppc_acpi.c:700: warning: Function parameter or member 'pcc_ss_id' not described in 'pcc_data_alloc'
   drivers/acpi/cppc_acpi.c:1566: warning: Function parameter or member 'cpu_num' not described in 'cppc_get_transition_latency'
--
>> net/netfilter/nf_tables_api.c:9162: warning: Function parameter or member 'preg' not described in 'nft_parse_register'


vim +/p +128 arch/x86/mm/kasan_init_64.c

2aeb07365bcd48 Andrey Ryabinin 2017-11-15  124  
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  125  static void __init kasan_populate_pgd(pgd_t *pgd, unsigned long addr,
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  126  				      unsigned long end, int nid)
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  127  {
2aeb07365bcd48 Andrey Ryabinin 2017-11-15 @128  	void *p;
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  129  	p4d_t *p4d;
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  130  	unsigned long next;
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  131  
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  132  	if (pgd_none(*pgd)) {
0d39e2669d7b0f Andrey Ryabinin 2018-01-10  133  		p = early_alloc(PAGE_SIZE, nid, true);
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  134  		pgd_populate(&init_mm, pgd, p);
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  135  	}
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  136  
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  137  	p4d = p4d_offset(pgd, addr);
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  138  	do {
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  139  		next = p4d_addr_end(addr, end);
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  140  		kasan_populate_p4d(p4d, addr, next, nid);
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  141  	} while (p4d++, addr = next, addr != end);
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  142  }
2aeb07365bcd48 Andrey Ryabinin 2017-11-15  143  

:::::: The code at line 128 was first introduced by commit
:::::: 2aeb07365bcd489620f71390a7d2031cd4dfb83e x86/mm/kasan: Don't use vmemmap_populate() to initialize shadow

:::::: TO: Andrey Ryabinin <aryabinin@virtuozzo.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
