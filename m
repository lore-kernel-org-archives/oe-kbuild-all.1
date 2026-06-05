Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06FD3438AA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639278; cv=none; b=RdKCTPv2Cn7vts8YQNdGQVFL0ugYDBPm84dDA/hjN+dyWWEuats3uDXfE7DCQXWUETP9epMTM/xBbTf38Pk5LusH6k7bLvXzRKe+aDtl5eT5NRsnUAq7ZGTm7g2Us0xmEe+uztDi9pJjlygPtsNJkQ+e1Ruu/ZVeAKxdtpo3qQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639278; c=relaxed/simple;
	bh=jImbtI0U6R7vRkjSlBum4sxvvrEyiiavhTNOgV2icSg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C2ISPv6fVaeFeHf8NZ9tZxFVkzFD7TT4olmLywnztAoh+IkNvDXLIJdeMM6Yr2d4z/lnkEnLT4HucbvujWjSnQrFmZ9YRsoEVOwkS9TEdVr4anMubfI6v+Y5yIO0V94Hwg2+KK6CJcO1XR/vP5za6d8iF2NG/J8etMIG4/Aziis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etyjRZcx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etyjRZcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780639278; x=1812175278;
  h=date:from:to:cc:subject:message-id;
  bh=jImbtI0U6R7vRkjSlBum4sxvvrEyiiavhTNOgV2icSg=;
  b=etyjRZcxHvgdv5f72FJ+YoOmYvjO5UIQLpIR3iZXE1qArvqRcsr40WGf
   yZnw7Z8/nyHa/z/ekKwZC0gdhKPcE2D2QDMsKY7A8x6fNVTQulFvYBLN7
   o0tLVekq4AQ8IvqzyKO77zs68FBJ4lgjkDiPiXmYGfl6M3GoIVhGKRuDB
   sibfRixLXgB47dJ/17XaNaSkx50arq8VgVw8RcFkjgYp9DqxuNZ8CpSdT
   Xzz3NVuZ2cEA/tMQmxbQfuE4zZNiKMEGdaHKJ0Kdzt+/esoUINurFiUE4
   GR43bzLglyJueACI88GLTqPqw9tzl/YfZKhs0gS379rxW87FpZ06jVksY
   A==;
X-CSE-ConnectionGUID: +smSA9a9SfWP4enLWFcxJg==
X-CSE-MsgGUID: jLWZdenrQ6W0z9KVCNh+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="91786418"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="91786418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 23:01:18 -0700
X-CSE-ConnectionGUID: Fseg69twQmK9DfDoSFVKQw==
X-CSE-MsgGUID: fPjIIMKJQ0yyGLzPV2zx+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249088728"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jun 2026 23:01:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVNcH-00000000Fas-1nmW;
	Fri, 05 Jun 2026 06:01:13 +0000
Date: Fri, 05 Jun 2026 14:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/6]
 kernel/locking/rwsem.c:1651:2: error: call to undeclared function
 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606051331.zEJAFdrV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ebfd5e9b1ca6c242f5eba9976801a2175e863a5b
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [0/6] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: i386-buildonly-randconfig-001-20260605 (https://download.01.org/0day-ci/archive/20260605/202606051331.zEJAFdrV-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051331.zEJAFdrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051331.zEJAFdrV-lkp@intel.com/

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
   <scratch space>:72:1: note: expanded from here
      72 | trace_android_vh_rwsem_write_wait_finish
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
