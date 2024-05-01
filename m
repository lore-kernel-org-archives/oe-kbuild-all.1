Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940F2D05D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714567282; cv=none; b=GKmKRcqDJIBa4gbM09PQNauzCAMMXbyUKQYOBY4db2UEi5imBqLz+w11nZm2op/CfloI8Ayk3vwJL+J/tn8ibbzKyZR5UzErKRJRv8NDu4to29CoLSaXET0G9wfkWRrJlrhfEVYjtimvNVpvn7VCiw1HzzR6r5nvJLfLXs4mgPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714567282; c=relaxed/simple;
	bh=tH+HIYc6N8Z44e9kbULuZZ9FgVOTk+FUYK/4VeiD2TI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Daw8pfR9WH/DMw2KpYK7ABGPO8sipq10+FF4aPJ+I0o2ETyLA5il+zGpNzI/PszcVx9fs7J5jxWEzisgyt0o+77oW+EfFfP1p+yXzGLbRG01KGrsvOC8GwGSQslWJbuDyPKgghe8MBShqKlZEFkHHtFL5550F75VwjQq9bv7LBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPJoECDH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPJoECDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714567280; x=1746103280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tH+HIYc6N8Z44e9kbULuZZ9FgVOTk+FUYK/4VeiD2TI=;
  b=GPJoECDH2oZDy4XvaQTFb0e8EjhB46pbYL05AhKOmPxZ+j1JDbB0gqmq
   VabY3FgWPQUUXYCnAI3I6aWK1KhSUGzvmzy7yVNE9Byqw80mnM87gFMTj
   ynowimVb8/QsV+MmQ9QcF78KgFpAQy9uuafDU/GWE4yWaIyxgs47h8S0j
   5xrJ//315ZGmmO2GG/T4YujNMaLBuMUk8eBrQX5p0oh+G9wMB1dLzshhs
   j78R4NMDYmZCRHWuc+UA+cIF4ywProGNjCgsGVxWXgTFYzAi2n/74QZKr
   WoeDe7JlmgBoCSqnpCJVbVugjAnkOjqr24XsEE8M0CIARpbiNQoBjD7h4
   g==;
X-CSE-ConnectionGUID: Iz9hsxVkRWifkjHsH2WUaA==
X-CSE-MsgGUID: 5uXCT/RyR5iX3t7qqPKinQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20907380"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="20907380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 05:41:19 -0700
X-CSE-ConnectionGUID: RvS5NKhBSvGzIu9PqA2JyA==
X-CSE-MsgGUID: imn7PLGaRKeBkUOe6xM9XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="57966801"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2024 05:41:18 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s29Gt-0009Wa-2J;
	Wed, 01 May 2024 12:41:15 +0000
Date: Wed, 1 May 2024 20:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Subject: [weiny2:cxl-cper-testing 2/5] include/linux/cxl-event.h:156:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202405012016.bEomkRqy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   9561664438db543f4d61ee0dde4fa9722239fb13
commit: f64693ceeed628d8036c8ac75f655bb3292d5bcf [2/5] acpi/ghes: Process CXL Component Events
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405012016.bEomkRqy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012016.bEomkRqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012016.bEomkRqy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/cxl/cxlmem.h:9,
                    from drivers/cxl/pci.c:14:
>> include/linux/cxl-event.h:156:1: error: expected identifier or '(' before '{' token
     156 | {
         | ^
   include/linux/cxl-event.h:161:1: error: expected identifier or '(' before '{' token
     161 | {
         | ^
>> include/linux/cxl-event.h:155:19: warning: 'cxl_cper_register_work' declared 'static' but never defined [-Wunused-function]
     155 | static inline int cxl_cper_register_work(struct work_struct *work);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/cxl-event.h:160:19: warning: 'cxl_cper_unregister_work' declared 'static' but never defined [-Wunused-function]
     160 | static inline int cxl_cper_unregister_work(struct work_struct *work);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/cxl/cxlmem.h:9,
                    from drivers/cxl/core/trace.h:14,
                    from drivers/cxl/core/trace.c:8:
>> include/linux/cxl-event.h:156:1: error: expected identifier or '(' before '{' token
     156 | {
         | ^
   include/linux/cxl-event.h:161:1: error: expected identifier or '(' before '{' token
     161 | {
         | ^
   In file included from drivers/cxl/core/trace.h:713:
   include/trace/define_trace.h:95:42: fatal error: ./trace.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |                                          ^
   compilation terminated.


vim +156 include/linux/cxl-event.h

   149	
   150	#ifdef CONFIG_ACPI_APEI_GHES
   151	int cxl_cper_register_work(struct work_struct *work);
   152	int cxl_cper_unregister_work(struct work_struct *work);
   153	int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd);
   154	#else
 > 155	static inline int cxl_cper_register_work(struct work_struct *work);
 > 156	{
   157		return 0;
   158	}
   159	
 > 160	static inline int cxl_cper_unregister_work(struct work_struct *work);
   161	{
   162		return 0;
   163	}
   164	static inline int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd)
   165	{
   166		return 0;
   167	}
   168	#endif
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
