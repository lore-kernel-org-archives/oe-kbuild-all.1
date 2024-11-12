Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EB3205E3F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731428858; cv=none; b=EZZFQov2Duk9DP4SsYsbfGcqjfi/sG3y2Xv6yYq4kRyPIP830TwT4IQiporQV2omPTDfd1/wgeJJLO/jMcKHtUu5yKBNH5DpvDjtncQf6m1GJMuO79lA7cCvZiV9WSXi6J3DSYz/Qx8TQE7Z96On3Al04s4nsocaXo2kktnbcRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731428858; c=relaxed/simple;
	bh=qcCM4Ck08A2FQJXyyXLlwaq1JmHM21LNqhAlWHqOEIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfLTltlsmBNTTfmV4V4/D/g7I+4DErIxpjs4NkzkO5QWXfB+2e1An5B83m1p5UiN+ixXEqjnwtGHjKN1ENuRq+nNEBFFp3G1qb+AMkSSmDs8WaUHsN0uw/jx7FZuhMWMvwx6WlSkxYY0y7WfzKe7/Csh3JYuKfouUaN/mNWItQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klWIEPKv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klWIEPKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731428856; x=1762964856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcCM4Ck08A2FQJXyyXLlwaq1JmHM21LNqhAlWHqOEIo=;
  b=klWIEPKvw8LNsVPqTG5Zg1J4brJ4okJO5IMMlUaTLrVHN4Kzpq8EfEKo
   KRNIbh6oKGKNx09Zhmd9KEj8uNCh0/XsPxey718JsShitleHDAp8xmUds
   NOoj1iHPwP44cGS1O9n9NNLAoqnuhd6B3gmAqL5XlmXu91h7LmvL7BKSP
   enBpo7QaWRr1gbFpONhna7GntZNiVVJrhKOUWpcanqbZ61z3HCAQKhWus
   Kd+3ZJvppHvh1znml/vYGH1/FZT88lTTLR8o/tptE5ml2fPctdyUnk24U
   kY8BO6Syr0Wxlc3f9dfLPcus6igp/tXbWkKrz9CzTP1ugBdeLxg6RnLvv
   w==;
X-CSE-ConnectionGUID: dthJ6dDkT4mhGdaaAsojHg==
X-CSE-MsgGUID: NI6K7rB8QASgN750/lGqqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41836529"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41836529"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:27:34 -0800
X-CSE-ConnectionGUID: tHi5XEy8RKG+fe2BKlmRSA==
X-CSE-MsgGUID: XOP1fAWYQVuSkWd30mGJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="88372371"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2024 08:27:33 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAtjm-0001WL-1W;
	Tue, 12 Nov 2024 16:27:30 +0000
Date: Wed, 13 Nov 2024 00:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1290/1290] arch/arm64/mm/init.c:784:17:
 error: 'mem_sleep_current' undeclared
Message-ID: <202411130037.24hgbc37-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   58ec866c31299a4b0d63a01cb026877c5f85e4d9
commit: fdda68feeca82610ccbcdcbda7250623a6d187d2 [1290/1290] arm64/ascend: Set mem_sleep_current to PM_SUSPEND_ON for ascend platform
config: arm64-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130037.24hgbc37-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130037.24hgbc37-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130037.24hgbc37-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/init.c:469:13: warning: no previous prototype for 'arm64_memblock_init' [-Wmissing-prototypes]
     469 | void __init arm64_memblock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c: In function 'ascend_enable_setup':
>> arch/arm64/mm/init.c:784:17: error: 'mem_sleep_current' undeclared (first use in this function)
     784 |                 mem_sleep_current = PM_SUSPEND_ON;
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:784:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/mem_sleep_current +784 arch/arm64/mm/init.c

   770	
   771	#ifdef CONFIG_ASCEND_FEATURES
   772	static int __init ascend_enable_setup(char *__unused)
   773	{
   774		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   775			enable_mmap_dvpp = 1;
   776	
   777		if (IS_ENABLED(CONFIG_ASCEND_IOPF_HIPRI))
   778			enable_iopf_hipri = 1;
   779	
   780		if (IS_ENABLED(CONFIG_ASCEND_CHARGE_MIGRATE_HUGEPAGES))
   781			enable_charge_mighp = 1;
   782	
   783		if (IS_ENABLED(CONFIG_SUSPEND))
 > 784			mem_sleep_current = PM_SUSPEND_ON;
   785	
   786		return 1;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
