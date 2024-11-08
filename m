Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041B321A710
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080591; cv=none; b=UAR/4mcdcen1xTJ3mMhSo/5zjxTDAWzPzxnbSfH0GFMblHAf3ODCIoOhfgTQ1QC01Cq9/tK11DPv+wiFqWt3I3juqpRKqJtmMYt4XmLgVI+eHaGTdjzP59GKCg417J/lHsbSsJTUjCQhhAgBykDa2IV6fQxbaW72S+UQ94xdUH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080591; c=relaxed/simple;
	bh=vyOjS/jMIcaSsDv4MoP1c/SuD5KWAs3V57NhkxLpe9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jUycmOCpc3vWEqL4BF2aoqI13MqAP0F0DS94GtgmIe/P5qUsKTSpRDbGuxGNAuE9MmXwvK4TsvrcCWKLZwVxeIWNvAaIsDKmNRhWfTWKZkv5AaFsF5kLtPb4Jv/9tATEB2R6UQPMfJ+YDXvylVw08dTe7+ZF4eHg7Dt3ZseF0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGx6/l5P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGx6/l5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731080590; x=1762616590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vyOjS/jMIcaSsDv4MoP1c/SuD5KWAs3V57NhkxLpe9k=;
  b=CGx6/l5P8nUFT9DwpAG6bamDJIZeuXOPIHz5TC07UCwkPC4noNFXK+Te
   g54ekSEVmgiGThYcKbMnTFMiydJqE6xqnsJHdzLhJ6ppw3KFcmMcbusxf
   6fmJvmeoS3lRHXGddyAHyuUBVS8lityp3NFkGX38d7Par5qwrpOfms4Lr
   FL7geLndCHd4SbuE4yHOupG991AJ9KJOvU/0TBbHhP61tqUeRWrul/5kb
   hgbtuAdymVRyqE5SBBH2O9Ek6xIkrSp4YDtkfT80Pf1gw2MuCvbmUbkJq
   vnlpT79N0G+7+ZQldOEIdUnXcuXq8Q4cMVbnhRzHbFTr+E0TlPg5pCxWY
   A==;
X-CSE-ConnectionGUID: Cyv2htrkQkSoG1ySUzrpQw==
X-CSE-MsgGUID: ZXD//eNLT5Sde4c7R2DFmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42354894"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="42354894"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 07:43:09 -0800
X-CSE-ConnectionGUID: u6jWxObMSQWxCAL2FoiJgw==
X-CSE-MsgGUID: Rt6oBA0fRRWgIWp7WjDSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="85595297"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Nov 2024 07:43:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9R8c-000rYZ-0W;
	Fri, 08 Nov 2024 15:43:06 +0000
Date: Fri, 8 Nov 2024 23:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/5] kernel/locking/rwsem.c:1651:2:
 error: call to undeclared function 'trace_android_vh_rwsem_write_finished';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202411082343.K8LoKEk1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   431080f1eec555b831c42ef8574446ba0d1217e2
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [2/5] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: x86_64-buildonly-randconfig-003-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082343.K8LoKEk1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082343.K8LoKEk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411082343.K8LoKEk1-lkp@intel.com/

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
   <scratch space>:114:1: note: expanded from here
     114 | trace_android_vh_rwsem_write_wait_finish
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
