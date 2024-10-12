Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE8C136330
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728727383; cv=none; b=X2RkGFQh9yVmHdx1ixvtw1I2vYQCA1yaBHy5Xt5MGWBymzusjwvcCUOF+p72prodO4OjY1cOlfO7G6wL9jaMhZxEUFWSbNMyizCBjj8U2uPxfB4wu9lk+hj5r4eyGmiIKu/A5ulViUPn8jb5qnQisKXPNk171aKBidf0DCDGwq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728727383; c=relaxed/simple;
	bh=nmlAjfNGi3ABER0TwECO9DOevtZq/1Of4BYl9YiL5NM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ALWATTYfEuuZkUdWcnTk4LG99/TKgOdx2JS+YNz2REtSWO0fIlJJGlRg+fRghmZRYwFlT1LF6LQOgw3yRB2xSXegm07sMzXEmDDTvMlHIacIc2EWboGHCMr/v9xA65NJJLAuRtAjnT2+eXAXZ5BfWYcqb2O1fAtQ6oD7+3NUEDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwcziJ4J; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwcziJ4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728727382; x=1760263382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmlAjfNGi3ABER0TwECO9DOevtZq/1Of4BYl9YiL5NM=;
  b=iwcziJ4JLWiY5p9LBm2Kctzb4ksW2qw3cN8XIoRr6wyypFEmpHJSJYbT
   ZkuzeIpdKwY4OCY1d6p8OPb/HwJEh7j4dcg3vJqiGBnxkpHLlKQZatUoN
   Ip/H5ATYIg5MWcurRg6W31gr0FE2FnaA2Kp/mJtYGf0DyoNZK4b7bCLZF
   +Sz95hPIRcNK5ymKQYfOVBOpU52ayZPjv7uqiHmvfg39RUjpDuSWdyr4+
   KUm4sTp2qESKH+dIvOmwu9/PZONVXWISqXaleHX9aWNNsLtqMmeLGWWp3
   Fh+Jeq/NVlKWt5KrJDwGrGM5hxB4Pqd8gQjvx+jHqas7ZQZyCuQeGzBsB
   w==;
X-CSE-ConnectionGUID: HJ1UJZCnS8ayKblaiJXyKQ==
X-CSE-MsgGUID: hAif+P7VR+GCIVzjqEz+GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28001383"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="28001383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:03:01 -0700
X-CSE-ConnectionGUID: NEOS3dfdRgSuLzPxNJpnCg==
X-CSE-MsgGUID: D4ziohFRTgasoSZlA47ktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77947693"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Oct 2024 03:03:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szYxd-000DGZ-2M;
	Sat, 12 Oct 2024 10:02:57 +0000
Date: Sat, 12 Oct 2024 18:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/14]
 include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202410121830.39GFesS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5f5ee6d2aa03c08776343157079820a6c07748bc
commit: c9b85866c78e7e00085c89ee4fd3b93f54659682 [2/14] ANDROID: madvise: add vendor hook to bypass process madvise
config: i386-randconfig-061-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121830.39GFesS8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121830.39GFesS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121830.39GFesS8-lkp@intel.com/

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
