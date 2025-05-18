Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1988615A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747572003; cv=none; b=TWrgJjO2z7VxwgurIXHzO3kRjZtyFz7y1S8gMbXU5aMRKS0kYM44mnUhY03rr6UNGFjeSYC1guIhOCY/KlWYehvHdjxSMLA4l8aX5/AeI1Q4G/NKR31/wz5NEe2JbWd/QGmXO1+W2isHGWwGQ8SedfJhDdPXOw3yosgNSo9YTLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747572003; c=relaxed/simple;
	bh=qZrbnIpMwuNCbxsuXgrm/6i4zfhhJrRtTYraa64SU/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qLgLJ0LMSfY1YM7hBL4Oe+7dctZYvZVkyUUkOfa2ejl8W44oQa+fOZfKS2WlYFQH+UqYhFA7BX2MZehI/oGzN/Gp3XXGG3LypvRvGaW5Y5Y+QYLHxghs/Hx3+PegrRdMCBpGvcv1C+b4gi868/qSn3llIJITv5VzosrgezvVwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dipxWKDW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dipxWKDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747572001; x=1779108001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qZrbnIpMwuNCbxsuXgrm/6i4zfhhJrRtTYraa64SU/M=;
  b=dipxWKDWoIjOeod3zXpq1Hd8OqgPpLIHwGdYQGY96nCfW4JBJ6YDENE9
   kN6UnvpMvqatW7D+EeoDpWVeIeT85ZDF2o472C3RmWYShu2faoAVfldEh
   EPQPDlWoKb3lz4cgNx4q6U9pFQq2Lq9y6ouaPRmB/u9OTGGwTKbi/cnFx
   WfwKgHjcFW0pZ5LaTeqTnRMEhvMwHqVCvB6zQ1TVyNieNFeoa7dfEotm6
   g7JHSXWwTQo65OpTs56BLYD/XaHqbf7g3WjYGBZH3yCW33LZ02cF940UG
   c2grP2M4ETaYcXFbZm3mpgg4vy2w/RQLq5EFiGLbNBRxv1RQLvqHKz7zq
   A==;
X-CSE-ConnectionGUID: SA+ovZgMRs+r8Lbs5AZGCA==
X-CSE-MsgGUID: TzmTnwh/RvSrvnKbHxcNUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49382025"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49382025"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 05:40:00 -0700
X-CSE-ConnectionGUID: +MTZbQDFRl+QkCQyY1/MlQ==
X-CSE-MsgGUID: ggEDV13DQ/6n9Reur5qnXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="170170716"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 May 2025 05:40:00 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGdJ7-0000h9-1q;
	Sun, 18 May 2025 12:39:57 +0000
Date: Sun, 18 May 2025 20:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-05-exp 0/1]
 kernel/locking/rwsem.c:1651:2: error: call to undeclared function
 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202505182033.CmEPMbLz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-05-exp
head:   318fd288f5897bd4bfdde5ba64cd16619c9f2c3a
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [0/1] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: x86_64-buildonly-randconfig-2003-20250518 (https://download.01.org/0day-ci/archive/20250518/202505182033.CmEPMbLz-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182033.CmEPMbLz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505182033.CmEPMbLz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1651:2: error: call to undeclared function 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1651 |         trace_android_vh_rwsem_write_finished(sem);
         |         ^
   kernel/locking/rwsem.c:1651:2: note: did you mean 'trace_android_vh_rwsem_write_wait_finish'?
   include/trace/hooks/dtask.h:44:1: note: 'trace_android_vh_rwsem_write_wait_finish' declared here
      44 | DECLARE_HOOK(android_vh_rwsem_write_wait_finish,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:605:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     605 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:124:1: note: expanded from here
     124 | trace_android_vh_rwsem_write_wait_finish
         | ^
   kernel/locking/rwsem.c:1662:2: error: call to undeclared function 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1662 |         trace_android_vh_rwsem_write_finished(sem);
         |         ^
   2 errors generated.


vim +/trace_android_vh_rwsem_write_finished +1651 kernel/locking/rwsem.c

  1644	
  1645	/*
  1646	 * release a write lock
  1647	 */
  1648	void up_write(struct rw_semaphore *sem)
  1649	{
  1650		rwsem_release(&sem->dep_map, _RET_IP_);
> 1651		trace_android_vh_rwsem_write_finished(sem);
  1652		__up_write(sem);
  1653	}
  1654	EXPORT_SYMBOL(up_write);
  1655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
