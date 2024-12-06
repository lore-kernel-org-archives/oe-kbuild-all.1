Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF422C6C0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733520805; cv=none; b=ctif3A309AF+xvREGpdAvmTBMq44kxygcBdflVo+oWaZfNAWpNAyLBM6RYJFNGTXU4tEfBV2ahgi52AEfc03qXEReyzqIV7RqSt82nfZW2bwCObrr/QRZOKT2CxaK/4qhAZAE6JIjVbX0CC1iQBKnOGhxRB6dDxtKVfSw5ocxnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733520805; c=relaxed/simple;
	bh=zs1/aGbVPnVzvgr2E8oPPZBUdxXsnj5oblNeWk0fook=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ME02uPOZ8er/rIvxyasrLeEMTX96PP2BBvWA5xc1swWJJNlBjpnxetD4OCZixlJqYNnnY7JfVYUzHuZEJGuXTrrprae6rLbaxuaIgPPq6MEqurXVzreglm+PVhzekZwV9BbhXCbXUzIy+RoWqhdwlGseGSnm2yT7YpOag0RMQ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pay5xDQ4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pay5xDQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733520803; x=1765056803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zs1/aGbVPnVzvgr2E8oPPZBUdxXsnj5oblNeWk0fook=;
  b=Pay5xDQ4DGkwuobAivBQ7UIQAtrKKR2bnPz1O8HFEMnu13bEYaIv057P
   8ZVqV5A3oyAJJN/92dROa5QAo6yt3mBXLJ+LaVdHyJLSs5twns36U9uP6
   ieAF9Xv2Cp07THOgnN6RAArFKP2PVjuf2fQQH2uU6UJpvoFDDH+ri7FYo
   IZm7vaUjYZQ81zkXInMr8UucrM6xeeLpnRkmvDstMffQ5NHUu0S6SY3BD
   6hmHtSQS1LzPR9mY/MWSHS9nFh7jSfNkwJbr1KUJ8iFE9dCfmQSbjwPo0
   m/W23l21Cia+2FW/1vOMyW0EsG6+dDDB+42tzBbIGdmWy4R3FeyGSGDKV
   Q==;
X-CSE-ConnectionGUID: tkZiqOevRXyvk6gJJjcnEA==
X-CSE-MsgGUID: OI1VN+LLTi2+1k2Su6St4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="36720382"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="36720382"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 13:33:22 -0800
X-CSE-ConnectionGUID: 2Ohk9KJTTGKJqJZPFMYKGw==
X-CSE-MsgGUID: WqdptnbgTIuiioFSL8cyVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="99456573"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Dec 2024 13:33:21 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJfwt-0002Gn-0a;
	Fri, 06 Dec 2024 21:33:19 +0000
Date: Sat, 7 Dec 2024 05:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/14]
 include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202412070547.PSCdBJFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   74c0232c5b36765c11b577e9b81df9cfc95c2432
commit: c9b85866c78e7e00085c89ee4fd3b93f54659682 [2/14] ANDROID: madvise: add vendor hook to bypass process madvise
config: i386-randconfig-062 (https://download.01.org/0day-ci/archive/20241207/202412070547.PSCdBJFJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070547.PSCdBJFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070547.PSCdBJFJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/madvise.c: note: in included file:
   include/trace/hooks/madvise.h:21:31: sparse: sparse: no newline at end of file
   mm/madvise.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - unexpected unlock
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - unexpected unlock
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
    14	struct vm_area_struct;
    15	DECLARE_HOOK(android_vh_update_vma_flags,
    16		TP_PROTO(struct vm_area_struct *vma),
    17		TP_ARGS(vma));
    18	
    19	#endif
    20	
  > 21	#include <trace/define_trace.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
