Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3C92AD2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 03:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996175; cv=none; b=ZkPu8dOF4yCjOhZWkH9ci44+i0b+bvTGgGaF3/4WJRvH3Q/izZ0UnB2YZVSHw1Fsx1pk4li1PnPKfHvdxoi3P+E7xj9kYPFh+X3GYUUhpKM6cjUlg/mcx/za6EFdyNd9eM0F0i1hjdxjzEGAbiCbpBLSieYwAKNxFmK2nGdgkyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996175; c=relaxed/simple;
	bh=t2EpZB7BOpP/7L5lb/4+iGLDhkJYvDHB6HNXyM5g7x4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bn7lpAA0PMoKBfldqQe+K3SDJ5Tk4V56wZ02Gkq1bpuWrpRvx6M35ZJyzcMWq7azzw29nIfkps7r9wW+ISyIw1yYn2QiEn8kMtIz16B40Ipma2/SCfcUgtHWGT1bFfzM7ulu68dtcsetYpwkF5dH9ppqzbIGG0T1Vv5REihLeVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9pnoe3O; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9pnoe3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750996174; x=1782532174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2EpZB7BOpP/7L5lb/4+iGLDhkJYvDHB6HNXyM5g7x4=;
  b=R9pnoe3O5E+CkFKIxcUJe/A7rQ99GZPx07NTkFE3raldtOHdMTJIj/Rc
   WBQJCrD3iZVSCpDVN32Tkf3H8a9GYW6zDL462fnAEZuTSFGkbrDrLjVOc
   q8ogAA9QlGM5nPEKjTZC3mKaOsWSRyth90qcvBmmUrZiIfY0YXuBzhWMV
   bUS1oVSciuSW7CC89JIpVdYAUi4YFHHC1CFe6RM5chZUBjVXI4FIauwQn
   cRSKbsRD1djHoiaM+KgSuxrBDaUivffqSWv/CZnzkOdXogl5L58TvLV7D
   W9VQAWSCDf62l6gnnx08pRKsLfMiA9/EH2u7+Z06+8NzzdC59TuZ3SZCU
   g==;
X-CSE-ConnectionGUID: /3WK/+DGRrWYuSCBEjezmg==
X-CSE-MsgGUID: oa3a6LPhQ8KnfWs89B2uRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53177962"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53177962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 20:49:33 -0700
X-CSE-ConnectionGUID: CnfCvf4JSBaXhYk6xvOD7w==
X-CSE-MsgGUID: IkG59ZArQmK2Iu0rUqTI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="152787940"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 20:49:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV05h-000Vld-0K;
	Fri, 27 Jun 2025 03:49:29 +0000
Date: Fri, 27 Jun 2025 11:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 6/6] kernel/locking/rwsem.c:1651:2:
 error: call to undeclared function 'trace_android_vh_rwsem_write_finished';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202506271143.q7WU1yPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   111ee63e22d9e01cb68d95a9e4012cafa5f4ef08
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [6/6] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: x86_64-buildonly-randconfig-004-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271143.q7WU1yPB-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271143.q7WU1yPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271143.q7WU1yPB-lkp@intel.com/

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
   <scratch space>:181:1: note: expanded from here
     181 | trace_android_vh_rwsem_write_wait_finish
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
