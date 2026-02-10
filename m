Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA6040855
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704188; cv=none; b=Ij+ZAOEJM2sUxXqlPKf3nt0zWvGvcGc54KFu93GF65pn9WpSvGL2yiu7jzR5WIUTriy8CoggLQvSrfBCvvOaIDZ5WGsQy/opcAI/EOwE/xr8ebtLfJatox5cB1cJ59BesZMV9OBkDcR1xc3pYGojzOr9ASYyPSCvKxsyi+HYHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704188; c=relaxed/simple;
	bh=k6jwGmQd7FMYZop2ffPlYfpIhyfRBzzmSbBtMMnNNm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=czl2OTxPBTXZejTtq0fJYdzeMpVuxZAGhUXFHL/8BHiT8TJ2Ql7yISgLfwG9sSG0MQ9JgH+N+mzAeI5y19AS1JVIGgPc+hR1U9zEKgZTQVmoMSN9I9wGvqgVGkwf8kaSfVa+13xl/vQzbSqld9rXQsSF2+tG7SJCZycMv5MeFNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0/VG1ji; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0/VG1ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770704187; x=1802240187;
  h=date:from:to:cc:subject:message-id;
  bh=k6jwGmQd7FMYZop2ffPlYfpIhyfRBzzmSbBtMMnNNm4=;
  b=W0/VG1jiKaJhVnZNKYsgfviTDLNcYyiovea3w7eU05p8iksPDQHINOMr
   SbHcLx9ZDCOpAdPHoO2gDrJtCn2M5Oeg8+5Dy110VyzwMLT2ncNUUlMdV
   D16nb9M2zMgVJlaT2o+BQIcCrhG6ce9N8ULhFXZLAwXrdnz+wquBxS+FZ
   Fij+8I8tKInPrALPK/KdjH6aIScwuIPB/I9jlrSD6leKge2BC9pCFDqEh
   MScKNl/QiPuVbBYR1KXGWOsbo12+TfZzhUAjMDRmYalRQEqGPfSLPJ7OL
   qbDCOytEy4+17gN5cqoYNy7hFHR9U54RQx2cD9ajtSlaQX+1peg9RNdVu
   A==;
X-CSE-ConnectionGUID: UuCSO0qHQfCLgT5AGl243w==
X-CSE-MsgGUID: T3KOvPM1SLSVlDQKUzQQPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71546418"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71546418"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:16:27 -0800
X-CSE-ConnectionGUID: jK2l7n7vSgmbMY1Md/EdMg==
X-CSE-MsgGUID: nDIl1VneTDabbpTloW/0TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216327686"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2026 22:16:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vph2t-00000000oiS-1KQD;
	Tue, 10 Feb 2026 06:16:23 +0000
Date: Tue, 10 Feb 2026 14:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202602101420.ujRn39V1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3b54985e12634723f50be663b001e0f03e8643e1
commit: f966514ece78a211b2647e082fa9b85d000bc170 [2/2] ANDROID: madvise: add vendor hook to bypass process madvise
config: x86_64-randconfig-123-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101420.ujRn39V1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101420.ujRn39V1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101420.ujRn39V1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/madvise.c:427:28: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - unexpected unlock
   mm/madvise.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in 'madvise_free_pte_range' - unexpected unlock
   mm/madvise.c: note: in included file:
>> include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/madvise.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/madvise.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +10 include/trace/hooks/madvise.h

     9	
  > 10	DECLARE_RESTRICTED_HOOK(android_rvh_process_madvise_bypass,
    11		TP_PROTO(int pidfd, const struct iovec __user *vec, size_t vlen,
    12			int behavior, unsigned int flags, ssize_t *ret, bool *bypass),
    13		TP_ARGS(pidfd, vec, vlen, behavior, flags, ret, bypass), 1);
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
