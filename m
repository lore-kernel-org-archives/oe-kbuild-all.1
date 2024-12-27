Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC6A3224
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 02:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735266060; cv=none; b=C2UpamUPUeyXqg8Wn9y9PYdRoEiT5LC/oLW1m/+fFcBYQ6Vlg00Yenqn7ZQQ8/EDH1s3w93TA0+z5+uZvH/Qfe8o0ffKPOsKqa8qVAIyJ8knP2gEjcgDn8cgCAb9Rq5/V1DnnTsf/LOLTn8+7Ec7WUjPY6oPEtgWFWOO0lhU1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735266060; c=relaxed/simple;
	bh=cdaJtLS93J4iG7Pgr8daPOp/w9GHT/dM0eViBDKlXnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HenbQWp77/3uLfGh8XZwNaXCaOomUErMEWd9hRLaU5yM1t2pZCoJU0/I1E82j7NtbCzp2q1V7FS4fIVr27S0fLCPPw7ZrUhRdlgIVuFa22DkbnJMxBM/ChBMx/nlV7azbmfeOsw10AbKNvDYV/y7FFgHTHhwy2AWRZ/Ylrhkyqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtOSbL3E; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtOSbL3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735266058; x=1766802058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdaJtLS93J4iG7Pgr8daPOp/w9GHT/dM0eViBDKlXnY=;
  b=KtOSbL3ENrCf20w+TimjtI4Bwvn/kCEZvurvB0VQ8KD6AaHSSNf3yYwI
   aoD50g4Gz95mDGc5VrIFcZQbG0DgzAldSMlePsZT2XXb7gfMsiEvrLK4d
   LGDSDZWVtSO2q/8T1XlQh2SIm0BGbajgqhExlmisXfqSRVCHAhwQFBa9y
   kEmGjXrpitRqoengiuS0KJ26TZ5A+bmK5Jo4hJ2lA4Ocd2vIALyazCaPB
   RmCNIEkIFaTur3haEOu9QY4dLX98L4Ni2eHQYFWT5cIk4MoDw2yB77Qgv
   2cxmElF0YyLjslTfdUy/g4MY4oofJ93+XzOsKd7Diua56Zu/no8uZR4YC
   g==;
X-CSE-ConnectionGUID: YFRNBkCnR66aI+myG8YNLg==
X-CSE-MsgGUID: YcTBdYDlTv2HHorGzqAYow==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35583453"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="35583453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 18:20:57 -0800
X-CSE-ConnectionGUID: K6gtM3sIR3yd1r7JGdoV+A==
X-CSE-MsgGUID: phOZiNgKREeCWM42xSaUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123314556"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Dec 2024 18:20:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQzy9-0002uu-2K;
	Fri, 27 Dec 2024 02:20:53 +0000
Date: Fri, 27 Dec 2024 10:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600] mm/clear_freelist_page.c:141:50:
 sparse: sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202412271034.6jlVqgfq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   951151c7a27bc2a9436c2c49ae12510c82137ec1
commit: 426b9efea56f9b065151d165caab2ebd32906505 [2600/2600] mm: Add sysctl to clear free list pages
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271034.6jlVqgfq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412271034.6jlVqgfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412271034.6jlVqgfq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/clear_freelist_page.c:141:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/clear_freelist_page.c:141:50: sparse:     expected void *
   mm/clear_freelist_page.c:141:50: sparse:     got void [noderef] __user *buffer
>> mm/clear_freelist_page.c:155:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/clear_freelist_page.c:155:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/clear_freelist_page.c:155:36: sparse:     got int ( * )( ... )

vim +141 mm/clear_freelist_page.c

   133	
   134	static int sysctl_clear_freelist_handler(struct ctl_table *table, int write,
   135			void __user *buffer, size_t *lenp, loff_t *ppos)
   136	{
   137		int ret;
   138		int val;
   139	
   140		table->data = &val;
 > 141		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   142	
   143		if (!ret && write)
   144			clear_freelist_pages();
   145	
   146		return ret;
   147	}
   148	
   149	static struct ctl_table clear_freelist_table[] = {
   150		{
   151			.procname   = "clear_freelist_pages",
   152			.data       = NULL,
   153			.maxlen     = sizeof(int),
   154			.mode       = 0200,
 > 155			.proc_handler   = &sysctl_clear_freelist_handler,
   156			.extra1     = SYSCTL_ONE,
   157			.extra2     = SYSCTL_ONE,
   158		},
   159		{ }
   160	};
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
