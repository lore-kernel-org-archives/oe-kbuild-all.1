Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA92B9CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193313; cv=none; b=MgbmihzuoJAvxPCcWS5dNZTHvrt3FRNhdEWFIdf4xAufVvmeel8WMX3gj7WnoqsxQEyyYd4fHBjLA6qkvw8fTOhg58GHMVzb0TvDGbeYZQx+JkaVzCDPT0ZiGM5rG9zUHAzuuJfexhB4N/HO9SwQ4ngBGV3MwxHi4zLoGh0Uq6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193313; c=relaxed/simple;
	bh=cDr4zZVdlTH7yJeJ+4I0JsDzxobBRSjOckAu2so+U/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGP3gnokHJSVy1SRF5qyEGs9Ofs4S44RiRSkhkU39Fi6waH/m7bW/xSchO1JQ1jLSv81/1zqgm2JM7wpTTslbvbPYr7VOj3nZ1rN7k2q3LDI0UZk7Wh/hXlXkhJlRfDKtzgpbXe96lN+1hZl3855MfeCsMrqK/ZrKb4S+5zeGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8c8C/0y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8c8C/0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744193312; x=1775729312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDr4zZVdlTH7yJeJ+4I0JsDzxobBRSjOckAu2so+U/s=;
  b=C8c8C/0yPgAODnKBSjO2gsSGALqpUAMymcJaFLC8T/jcA6AH0ke+G2/E
   qKJ8VX77jhJFg2ozGZU983jY9Zdp/AexqpdMPojdDj5t4YnrRvHDiT7C/
   f3TxTyyqg4eFtgKwmqvlS5BYqdIDRrhtxclCXUYp8OpPVXTSte1xcApVC
   PgcaJqTTzSDKSbrgFCx+u9JaM8GWyOjG7pp5lj6MYqi8hsZ39HF0B4scd
   tNA6pWQTNVUPFyXz23mzhD3Cmuak4hqy9t58joe2Jd+GCjJYsegQLUi6m
   IC7F8EBM4VUKVmEXAIGXYzyaxCz+93n2BAUPClBqqq+z2IzEyD/3XipLE
   Q==;
X-CSE-ConnectionGUID: 9O4dZcfMTxyUgWP/g7OOnA==
X-CSE-MsgGUID: 0XqgzyidQ2qKV3p937+PuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44802394"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="44802394"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:08:31 -0700
X-CSE-ConnectionGUID: F4iSFAhXSpW1f18NWhyW8Q==
X-CSE-MsgGUID: n3z30/JxQyqNWaIYGPAqSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="151729326"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2025 03:08:27 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2SM4-0008eh-2Y;
	Wed, 09 Apr 2025 10:08:24 +0000
Date: Wed, 9 Apr 2025 18:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Ubuntu <boqun@boqun-dev.hftby5fapqku5diuciwhsax2zf.phxx.internal.cloudapp.net>
Subject: [boqun:dev-shazptr 2/10] kernel/locking/shazptr.c:23:31: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202504091759.v1glackA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git dev-shazptr
head:   0fbc6b71ef0f91f95ff29a914a60376af724e574
commit: 166fbb1e298af7aee3147ba520c695fcfe23b371 [2/10] Introduce simple hazard pointers
config: hexagon-randconfig-r131-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091759.v1glackA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250409/202504091759.v1glackA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091759.v1glackA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/shazptr.c:23:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got void ** @@
   kernel/locking/shazptr.c:23:31: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/locking/shazptr.c:23:31: sparse:     got void **

vim +23 kernel/locking/shazptr.c

    16	
    17	void synchronize_shazptr(void *ptr)
    18	{
    19		int cpu;
    20	
    21		smp_mb(); /* Synchronize with the smp_mb() in shazptr_acquire(). */
    22		for_each_possible_cpu(cpu) {
  > 23			void **slot = per_cpu_ptr(&shazptr_slots, cpu);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
