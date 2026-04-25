Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26315243951
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777086010; cv=none; b=EoLgJC0B94VgcJ3KfRN17H5K6wbb/UKxQp+F+NRsCUvz6QY7KtCIpfhZLTMGIVYr0LSUK8aQXPqOlPTBkGeDpWHWapTrVGjZ13w8UJvseC6s0p9nPjnt6//oQk8n4Q1DIRQYVGkXmbB/h5MbkhoQ9BQsRcVUltQButNeJGaGHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777086010; c=relaxed/simple;
	bh=ThSYCn53KgEkg2sTdf/2pxuLXUubBBe5+rHpqIh7YSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X6Ws4qEw+ls8RqfVB+JHwV47ui151krLnJMQ5WDRopDPyX15CD0idLy7If+fM4UT7Uw90FOmi7pt/eYn2mxraoiRzrrRhEKEOrbhMlbc9GOizkjwrqMqBWprEpnFC1r1lnVI2XGfrwfLQRs+0bCPTxzjP8QE7jCJoxgZLv/I9z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2woCdkh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2woCdkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777086010; x=1808622010;
  h=date:from:to:cc:subject:message-id;
  bh=ThSYCn53KgEkg2sTdf/2pxuLXUubBBe5+rHpqIh7YSs=;
  b=J2woCdkhdwssqfkgSNnZ11tZXRXM/sYoE2sTmfzctgbOOvN3F0lnn0Hm
   p8sxpd7q8aLLsHX4A0eLQBbnfJP3vzRK7nyj28dvKHWrItgOVgCpSTzjw
   gvJSBY8H+RBWDT5oJgS4I5j989SIIFTFtM474hcbdSDj1a78X7eA31KWU
   +XVu6C/PAdazHPmk//F2T+xS7xbjCOqaPN4mvuL9k6lAwk/pS5zoAymp4
   ykIUc7CXdtKXjrM+hUB1Ow9U9lzcJI0MnQx8Jcbu8OxWp7wN3fWxny+Hu
   5PgpySK6jxURu9d5f6gSMABS4D1mABBxcmbMIB5o0PUOmXfZyCM4CSpUk
   w==;
X-CSE-ConnectionGUID: 3PLBc5pqRsSiVi/omL6jGA==
X-CSE-MsgGUID: dXLnP1E7Q+Od85n9MmhMjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="81927704"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="81927704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 20:00:09 -0700
X-CSE-ConnectionGUID: TLQrjLX2SPOEfqOG5RcA8w==
X-CSE-MsgGUID: lu6gZQ93Rlizc9p7WJlvsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="229915624"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2026 20:00:07 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGTFU-000000006O1-43Xq;
	Sat, 25 Apr 2026 03:00:04 +0000
Date: Sat, 25 Apr 2026 10:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 kernel/locking/rwsem.c:1651:2: error: call to undeclared function
 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202604251053.EinObDHB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   1c5ded243bc242777bc62632c082c086b90ed490
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [2/2] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: arm64-randconfig-002-20260425 (https://download.01.org/0day-ci/archive/20260425/202604251053.EinObDHB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604251053.EinObDHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604251053.EinObDHB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:37:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      37 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:369:9: note: previous definition is here
     369 | #define __SANITIZE_THREAD__ 1
         |         ^
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
   <scratch space>:43:1: note: expanded from here
      43 | trace_android_vh_rwsem_write_wait_finish
         | ^
   kernel/locking/rwsem.c:1662:2: error: call to undeclared function 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1662 |         trace_android_vh_rwsem_write_finished(sem);
         |         ^
   1 warning and 2 errors generated.


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
