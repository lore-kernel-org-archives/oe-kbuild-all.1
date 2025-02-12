Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAABE7D07D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739325277; cv=none; b=lFkAGfOXg52PpPnaKSBg3XJ04jsUDEe23zTkqQy8axSPVyxCSYgBXT2yHNOOhqoGNMmCM5tFbNHXDXjrXrPzC46B14VjOxcvydZyCozZNpG0sZloTzF3LYpiI+LBiokb61zYwR+3hMjX0TcMZ5cGagBKNVcCAaOinfbLNcEYfzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739325277; c=relaxed/simple;
	bh=jz7rup3Bh+ElQ3sSR1MGpDY+0VuXbVaWM2NQgw1ynXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jTQjjKjvT8Wttp/Lw/0WnR2sJiRueRUqXOjehen5prYuxIRP0mLK6Ik9Ns6M28L/CCUZdaKxpvC/rTWXT4n4aF7b8BZ2Q/sS8IKGB2CU0njXEcEXe+8hFNXquz2r59e90oToURggvRWHcf4JSvQAJAXDyFSrSYWOrtha7KjrJfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+3VigLy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+3VigLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739325276; x=1770861276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jz7rup3Bh+ElQ3sSR1MGpDY+0VuXbVaWM2NQgw1ynXA=;
  b=D+3VigLyTvucM/AKGD4vuvhariCzczV4ijrqleZaCGR8ysZyV8Zt3rPV
   kHgxZ3VNWJX9im/jW3Ow0/IhyYbtlsP0ocEsjQBGFgK72h5JlRW7s/4JS
   SlSkH1B+xZDrt+zNjLAcDxCw+mRiLW7OLQVGTLhcqddI1E3tBAguR1e+p
   B28GH9DEyVi2h9d/xiDo10XcUOgFJQL7uPc55YKFbUN1lSU4+XmMDHD7N
   pdSn8n+ayO4NM61MWqM8Lkf9LPnCMvGY2edeg8SsglC01Nqjj3SLyF6Qc
   Vp0gUUjSYKDU9tu3VzmTWak33XZTe/FSxVk8j1l9+Grb9nqUR/qbaDVWa
   w==;
X-CSE-ConnectionGUID: F+1MhK++Q7y9f1xrAHMYhQ==
X-CSE-MsgGUID: hsE8efZ6R5i+ioZ+rxQZtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39202125"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="39202125"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 17:54:35 -0800
X-CSE-ConnectionGUID: 5PbueE0WRfKHoM4C4Kv3Pg==
X-CSE-MsgGUID: jy71XoeUTySTMgtyG/qjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112434328"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2025 17:54:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti1xQ-0014xm-0H;
	Wed, 12 Feb 2025 01:54:32 +0000
Date: Wed, 12 Feb 2025 09:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 27/29] include/linux/mm.h:848:2: warning:
 releasing rw_semaphore 'vmf->.vma->vm_mm->.mmap_lock' that was not held
Message-ID: <202502120936.I4Zljem9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   62e4de14389b44299be85eea5a580e6b497fdf43
commit: 414681ab8e33c58b10bf195293559b9c1e9cf5f9 [27/29] DO-NOT-SEND: tree-wide: Assorted annotations
config: x86_64-buildonly-randconfig-004-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120936.I4Zljem9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120936.I4Zljem9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120936.I4Zljem9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/stackdepot.c:23:
>> include/linux/mm.h:848:2: warning: releasing rw_semaphore 'vmf->.vma->vm_mm->.mmap_lock' that was not held [-Wthread-safety-analysis]
     848 |         mmap_read_unlock(vmf->vma->vm_mm);
         |         ^
   1 warning generated.


vim +848 include/linux/mm.h

32af81af2f6f4c Lokesh Gidra       2024-02-15  845  
1235ccd05b6dd6 Suren Baghdasaryan 2023-06-30  846  static inline void release_fault_lock(struct vm_fault *vmf)
1235ccd05b6dd6 Suren Baghdasaryan 2023-06-30  847  {
1235ccd05b6dd6 Suren Baghdasaryan 2023-06-30 @848  	mmap_read_unlock(vmf->vma->vm_mm);
1235ccd05b6dd6 Suren Baghdasaryan 2023-06-30  849  }
1235ccd05b6dd6 Suren Baghdasaryan 2023-06-30  850  

:::::: The code at line 848 was first introduced by commit
:::::: 1235ccd05b6dd6970ff50baea99aa994023fbc4a mm: handle swap page faults under per-VMA lock

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
