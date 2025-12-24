Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCA95B21A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 05:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766553180; cv=none; b=A8QiR/xc5sU5qHFQnQ3eBm7DoWk2wuRjA8jClpzs3L5oOiQ+DOQewuR9Qp61816fKEWP2gn89+TPy4RHb91Te1Ld+tjlXu1hGnexcYF+WN203v2hISV3tp3N6UkSstePAT35LexKnvAdbBJgiQX+CQas9+AvtUT9SuxuTB+KvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766553180; c=relaxed/simple;
	bh=SRuEsqcvTu8W87lpjkzU0dBkznk4LNmjNWqmQzExZ54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ki0jcRZ9cCjePIqD6it2dobi8+TDv2JAZ506iLCSVRhtxoD6gVF2M4PEyM8dfU8UEivhw5FYjE6LdAKkuPa0R+Tch7sJyREDmk2PZ9enwGLXU6NWIP3iqXZJBaWDzMMi6WkkfAccaaXrd1wycc+F2E4TgVp8GQS71J5KNpsCrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfWhF+9u; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfWhF+9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766553179; x=1798089179;
  h=date:from:to:cc:subject:message-id;
  bh=SRuEsqcvTu8W87lpjkzU0dBkznk4LNmjNWqmQzExZ54=;
  b=RfWhF+9uUeHiQAaZuxD82j0OGgdyu6Edmu+TPD71oR0er6VrMjsk/BvC
   RmIThht7NDK10apyYe2wb08JhO3vQhvCMqJIHwTjcE5aSeEbKS1oLQsNg
   39f9B4Q7y6ph5CITIhgLZZC8xDTUjDC5gOIDAHkfKcsPTyd+2prCwxXBG
   kf0EuocYFoNaP3tzTibfBILx40EzbBynzLNzovtlPbVQxSxSjgmAaM3ql
   QwAofwheOCL0X7271dW2B3CPiMPQCoOg35Yc/hTwdahDMFWRY/9MYR2tc
   I9T6qVUTZxSCo1KWjUPOj9kGUztsmhWbr3rFDEX4zgKzQfX1rHiOYWoTq
   w==;
X-CSE-ConnectionGUID: F4G/EbzgTbiH3svVKt+grw==
X-CSE-MsgGUID: /7xWel2cReuNb+d3k/qoAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72248388"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="72248388"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 21:12:58 -0800
X-CSE-ConnectionGUID: vJmReA7XQP+geEnEEH1ldg==
X-CSE-MsgGUID: fzhjdhrYSLGd1gxEWWk0rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="204870755"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Dec 2025 21:12:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYHB8-000000002iX-3G0t;
	Wed, 24 Dec 2025 05:12:54 +0000
Date: Wed, 24 Dec 2025 13:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:kerne-unload 6/6]
 arch/s390/kernel/machine_kexec.c:254:2: error: call to undeclared function
 'tracing_off'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202512241352.Ec4E1Goi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux kerne-unload
head:   a2b83b8a1af321f2206864668e042008f27a0fbf
commit: a2b83b8a1af321f2206864668e042008f27a0fbf [6/6] drop trace_printk.h
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251224/202512241352.Ec4E1Goi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241352.Ec4E1Goi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241352.Ec4E1Goi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/machine_kexec.c:254:2: error: call to undeclared function 'tracing_off'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     254 |         tracing_off();
         |         ^
   1 error generated.


vim +/tracing_off +254 arch/s390/kernel/machine_kexec.c

2c2df118a64407 Heiko Carstens     2010-02-26  247  
60a0c68df2632f Michael Holzheu    2011-10-30  248  /*
60a0c68df2632f Michael Holzheu    2011-10-30  249   * Reset system and call either kdump or normal kexec
60a0c68df2632f Michael Holzheu    2011-10-30  250   */
60a0c68df2632f Michael Holzheu    2011-10-30  251  static void __machine_kexec(void *data)
60a0c68df2632f Michael Holzheu    2011-10-30  252  {
60a0c68df2632f Michael Holzheu    2011-10-30  253  	pfault_fini();
3ab121ab186692 Michael Holzheu    2012-03-11 @254  	tracing_off();
3ab121ab186692 Michael Holzheu    2012-03-11  255  	debug_locks_off();
10ad34bc76dfbc Martin Schwidefsky 2015-01-14  256  #ifdef CONFIG_CRASH_DUMP
1a36a39e225d35 Martin Schwidefsky 2015-10-29  257  	if (((struct kimage *) data)->type == KEXEC_TYPE_CRASH)
1a36a39e225d35 Martin Schwidefsky 2015-10-29  258  		__machine_kdump(data);
10ad34bc76dfbc Martin Schwidefsky 2015-01-14  259  #endif
1a36a39e225d35 Martin Schwidefsky 2015-10-29  260  	__do_machine_kexec(data);
60a0c68df2632f Michael Holzheu    2011-10-30  261  }
60a0c68df2632f Michael Holzheu    2011-10-30  262  

:::::: The code at line 254 was first introduced by commit
:::::: 3ab121ab18669226742891416fe7ecc86dadb047 [S390] kernel: Add z/VM LGR detection

:::::: TO: Michael Holzheu <holzheu@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
