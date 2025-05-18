Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A565F4E2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747583625; cv=none; b=k2Jl9L1qJWdV3BpTAK9dd7JIecI6z5Uo4uI7cxPIUSV+3u2n7Qi6rrE3SNqGWuKGPFuDwQAMkueFqpFXw+62Y2RUqg+GMyfHHML/t4MDnXlIBlCEw5izVyxM6f6q3O8H8mKqKrAq6Im4JiPmo26DY9kvPJfTW//9jH7R0gROAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747583625; c=relaxed/simple;
	bh=mu6aqFbbDiJZqNGO27vcCbZ97OYEDr50rBvHJdRIhV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNrd2gobeLxXU4mYxs2uMOs1kgt94B7FEvvVctd2hyOvrdXrSIDDw/yALfMuurwNyV5n53PU4d7ksbXwN7MjoNwbspCeX0hPjUbPGuu/+3E1HD27EmXG+n/4QKYBCA16ImzCu3kmAFQJrdsqy4AV9AqMuYRTvwgIsWJonSgLqhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxE3LWL0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxE3LWL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747583623; x=1779119623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mu6aqFbbDiJZqNGO27vcCbZ97OYEDr50rBvHJdRIhV4=;
  b=IxE3LWL0f5FDVcZ1f97C6ra9HkgEin8ah8E1yjAnVyvqPcKU8Mo3Mwc5
   dESl9Fxn74xxxGiepQQ+5K0bEh5xP9ShThw6I3zrGjh40hsvs4ZYSjeaA
   4E80R1lvnQjq31uzBwL6U3xTMWn+VhiufutPLlSKk42JucZTL7DmLLUBA
   ZorF8+IGs75T8OK3vRWHBY6UmTIR1bhovhyR/ZNOdo1GPH5PdB+Ykvpta
   OHWPB+UeLFCkUC+NdPE4QG8BMfx7g2UwpcpKHcRFIlq50wQ7/2qMK3c0j
   6Y/fiJmhfu3g/A1nriNCuVGT3jleVVLz+8A1whgCugbL1ADKkeyAE93YE
   g==;
X-CSE-ConnectionGUID: Jw6BEEroRjCt8zxIoafpgg==
X-CSE-MsgGUID: HA2+HB3WRE+pLuQSFeDVxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49419252"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="49419252"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 08:53:43 -0700
X-CSE-ConnectionGUID: /HhgIUbwTeKVsafOid8Q4g==
X-CSE-MsgGUID: 1S+XlmyVT/mx4HnCda/C/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="144275362"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 May 2025 08:53:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGgKZ-000KrP-0V;
	Sun, 18 May 2025 15:53:39 +0000
Date: Sun, 18 May 2025 23:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11]
 drivers/crypto/ccp/psp-dev.c:24:10: warning: no previous prototype for
 function 'atomic64_exchange'
Message-ID: <202505182351.NwZg6R5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: 87d126c2301662f465ca1a9407722874c4675299 [11/11] anolis: crypto: ccp: concurrent psp access support between user and kernel space
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250518/202505182351.NwZg6R5T-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182351.NwZg6R5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505182351.NwZg6R5T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/psp-dev.c:24:10: warning: no previous prototype for function 'atomic64_exchange' [-Wmissing-prototypes]
      24 | uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
         |          ^
   drivers/crypto/ccp/psp-dev.c:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      24 | uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
         | ^
         | static 
>> drivers/crypto/ccp/psp-dev.c:29:5: warning: no previous prototype for function 'psp_mutex_init' [-Wmissing-prototypes]
      29 | int psp_mutex_init(struct psp_mutex *mutex)
         |     ^
   drivers/crypto/ccp/psp-dev.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | int psp_mutex_init(struct psp_mutex *mutex)
         | ^
         | static 
>> drivers/crypto/ccp/psp-dev.c:37:5: warning: no previous prototype for function 'psp_mutex_trylock' [-Wmissing-prototypes]
      37 | int psp_mutex_trylock(struct psp_mutex *mutex)
         |     ^
   drivers/crypto/ccp/psp-dev.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | int psp_mutex_trylock(struct psp_mutex *mutex)
         | ^
         | static 
>> drivers/crypto/ccp/psp-dev.c:45:5: warning: no previous prototype for function 'psp_mutex_lock_timeout' [-Wmissing-prototypes]
      45 | int psp_mutex_lock_timeout(struct psp_mutex *mutex, uint64_t ms)
         |     ^
   drivers/crypto/ccp/psp-dev.c:45:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      45 | int psp_mutex_lock_timeout(struct psp_mutex *mutex, uint64_t ms)
         | ^
         | static 
>> drivers/crypto/ccp/psp-dev.c:61:5: warning: no previous prototype for function 'psp_mutex_unlock' [-Wmissing-prototypes]
      61 | int psp_mutex_unlock(struct psp_mutex *mutex)
         |     ^
   drivers/crypto/ccp/psp-dev.c:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      61 | int psp_mutex_unlock(struct psp_mutex *mutex)
         | ^
         | static 
   5 warnings generated.


vim +/atomic64_exchange +24 drivers/crypto/ccp/psp-dev.c

    23	
  > 24	uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
    25	{
    26		return xchg(dst, val);
    27	}
    28	
  > 29	int psp_mutex_init(struct psp_mutex *mutex)
    30	{
    31		if (!mutex)
    32			return -1;
    33		mutex->locked = 0;
    34		return 0;
    35	}
    36	
  > 37	int psp_mutex_trylock(struct psp_mutex *mutex)
    38	{
    39		if (atomic64_exchange(&mutex->locked, 1))
    40			return 0;
    41		else
    42			return 1;
    43	}
    44	
  > 45	int psp_mutex_lock_timeout(struct psp_mutex *mutex, uint64_t ms)
    46	{
    47		int ret = 0;
    48		unsigned long je;
    49	
    50		je = jiffies + msecs_to_jiffies(ms);
    51		do {
    52			if (psp_mutex_trylock(mutex)) {
    53				ret = 1;
    54				break;
    55			}
    56		} while (time_before(jiffies, je));
    57	
    58		return ret;
    59	}
    60	
  > 61	int psp_mutex_unlock(struct psp_mutex *mutex)
    62	{
    63		if (!mutex)
    64			return -1;
    65	
    66		atomic64_exchange(&mutex->locked, 0);
    67		return 0;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
