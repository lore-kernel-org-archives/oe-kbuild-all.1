Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F20315A85D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719491539; cv=none; b=QN7YvRjpMvmLxmGo9v4ncQ/IRVjUm5FcL3LrMgWpxqf46b3fPxFeIGOR2B8O8+B45mnEzCP2Ay5M18lhFTF6GBE9nYfF+7GyDrZKgnJhuQAWHpi+An1GIpLrQDQ7Bf71UrDXaCejkj97H/bTsL9o1Icb/QSOgZXURUJa3MPVBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719491539; c=relaxed/simple;
	bh=8od7xzYTahGX+qED2sx9UMAMShkviLPc8NOL0xgaUKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKXf1WerMObhawcS+Q7MpwU4oTaDcyugH7G5gmEVxv8BngCdCgKCxLGIVy4ukfMUteczfHU2w41/6MmLtzLA3R7e/O6TimeciB1BPEYg5VL0ufmj9nei45WtlYvHsGRB+gA/gUFYZ2/Zb9mk72dkRko0pSlym+hRZddpWyUBwC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yogs07zH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yogs07zH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719491538; x=1751027538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8od7xzYTahGX+qED2sx9UMAMShkviLPc8NOL0xgaUKM=;
  b=Yogs07zHzRVjIvBGAaDHu5rzCpeX5O7MyR+sGt5/ZnTVeooHD9I15FdF
   PjMSEkF4V5uUEJjl6+FeCFw1XWbc/tyaKschfl6iHmSrOXObaQXsKNCJQ
   aJ0Yoqywszpw4lI7YHgLli6AhSZ3vIzxzj1j2gpDOagt4RkUq3iC5hPf8
   2dyFdVD/v5K6r+wM7eX0L0i83BNe4J8It7Q7EGq1KkNQIPAeMKa9fNUPX
   RdF12wbkDvYVo/eVz9C6aQ3mzy7A3/MxtZEG9ViNPb/f3oayc4/GV7Gor
   pwjT1y67Xyx6/HGucaEgPC1ouivuIM8gmMt34NQ4Jj9njhGAWcyGdH09h
   g==;
X-CSE-ConnectionGUID: 0l1qLVBBRNCcOBDrNOwq1w==
X-CSE-MsgGUID: pMuihbYqTJ639yCcMOVMfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34151343"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="34151343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 05:32:14 -0700
X-CSE-ConnectionGUID: Kj82W2XrR8+EvRDBDcD/ZQ==
X-CSE-MsgGUID: Vcz2MP0/Ri6WEjA+81vIKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="75115197"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2024 05:32:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMoIM-000GC2-1R;
	Thu, 27 Jun 2024 12:32:10 +0000
Date: Thu, 27 Jun 2024 20:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>
Subject: [linux-next:master 7343/8016] mm/kmsan/instrumentation.c:318:42:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202406272033.KejtfLkw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: 46e281044468bb35b00581f099d195702fdec1ec [7343/8016] kmsan: enable on s390
config: s390-randconfig-r123-20240627 (https://download.01.org/0day-ci/archive/20240627/202406272033.KejtfLkw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406272033.KejtfLkw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406272033.KejtfLkw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kmsan/instrumentation.c:318:42: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/instrumentation.c:319:69: sparse: sparse: Using plain integer as NULL pointer
--
>> mm/kmsan/hooks.c:269:14: sparse: sparse: cast removes address space '__user' of expression
>> mm/kmsan/hooks.c:271:75: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void const *user_addr @@     got void [noderef] __user *to @@
   mm/kmsan/hooks.c:271:75: sparse:     expected void const *user_addr
   mm/kmsan/hooks.c:271:75: sparse:     got void [noderef] __user *to
   mm/kmsan/hooks.c:280:50: sparse: sparse: cast removes address space '__user' of expression
>> mm/kmsan/hooks.c:306:59: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:319:79: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:325:79: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:421:78: sparse: sparse: Using plain integer as NULL pointer

vim +318 mm/kmsan/instrumentation.c

f80be4571b19b9 Alexander Potapenko 2022-09-15  307  
f80be4571b19b9 Alexander Potapenko 2022-09-15  308  /*
f80be4571b19b9 Alexander Potapenko 2022-09-15  309   * Report that an uninitialized value with the given origin was used in a way
f80be4571b19b9 Alexander Potapenko 2022-09-15  310   * that constituted undefined behavior.
f80be4571b19b9 Alexander Potapenko 2022-09-15  311   */
62a9bbf2e999b9 Alexander Potapenko 2023-01-12  312  void __msan_warning(u32 origin);
f80be4571b19b9 Alexander Potapenko 2022-09-15  313  void __msan_warning(u32 origin)
f80be4571b19b9 Alexander Potapenko 2022-09-15  314  {
f80be4571b19b9 Alexander Potapenko 2022-09-15  315  	if (!kmsan_enabled || kmsan_in_runtime())
f80be4571b19b9 Alexander Potapenko 2022-09-15  316  		return;
f80be4571b19b9 Alexander Potapenko 2022-09-15  317  	kmsan_enter_runtime();
f80be4571b19b9 Alexander Potapenko 2022-09-15 @318  	kmsan_report(origin, /*address*/ 0, /*size*/ 0,
f80be4571b19b9 Alexander Potapenko 2022-09-15  319  		     /*off_first*/ 0, /*off_last*/ 0, /*user_addr*/ 0,
f80be4571b19b9 Alexander Potapenko 2022-09-15  320  		     REASON_ANY);
f80be4571b19b9 Alexander Potapenko 2022-09-15  321  	kmsan_leave_runtime();
f80be4571b19b9 Alexander Potapenko 2022-09-15  322  }
f80be4571b19b9 Alexander Potapenko 2022-09-15  323  EXPORT_SYMBOL(__msan_warning);
f80be4571b19b9 Alexander Potapenko 2022-09-15  324  

:::::: The code at line 318 was first introduced by commit
:::::: f80be4571b19b9fd8dd1528cd2a2f123aff51f70 kmsan: add KMSAN runtime core

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
