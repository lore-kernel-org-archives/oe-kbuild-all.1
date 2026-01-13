Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526922083
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768333664; cv=none; b=lUzsXleD6P01ZRVM9ZsRk78ML+/qVTAHebbQtYlLwTElLlTYDCzEAdRwtDmKvBfW6gpKlsCJbYkQ6/nLuQ9S5Ul5IJiRWPKbQV72Bkv0ZKHWX3DY9s4atRLKjp8eJS/M3kQyVWsc1V+5uWh/CVbH8ax5tC8ip++GiBXeqE6+9po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768333664; c=relaxed/simple;
	bh=4nGng+MlNru4EttwAtUn/Mfl9pCyX+4K4UzsAA8jSeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BHjuYKxz9F6dlC3x2G8fBnmQF/TlqZ2AOEsjt1KFfRe4kuCmxlJpCSqbWvDuKHA7PapOb+LS15T0KOWuNxOt23cD+kkxgjWu+dI36KjpnVMgNWkuS2v818BV21PvAVA0RAy4157F2CO0Xo82MJSqJ7z0jK3YrVcENT5WHNvroXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0ee2D2f; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0ee2D2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768333663; x=1799869663;
  h=date:from:to:cc:subject:message-id;
  bh=4nGng+MlNru4EttwAtUn/Mfl9pCyX+4K4UzsAA8jSeA=;
  b=W0ee2D2fUxoFYj0n+/o+B+euIxiAQ5YpQJEJP4eUTeSCCdPBkBwX/WJj
   J1bamz7aPaR1wWRLs6j3YZKZ5hISXNdGUoyssVn3XXNO5lYzNICJ5rgCW
   yZ9WfdPbLqfxqGMhvRsBPJdlRjB5Lck/n9/ExNLr8heND91MWJVu70KAY
   uHxdgxLawUrzQfL+mjxx3KqwnHEca+ojlAFCaEY0gkprIOMXtSis3dCHu
   qIW3Vat4IXZE6t6miDJ0XFN5TQ9+65OFvWthXdEyKTgjfLRVNocituhBT
   xvDVmmCF1MTpjuggIT6uszWsj7b3FeeHrnxQR873A1SyZeq692UYG4e5K
   g==;
X-CSE-ConnectionGUID: bqXfh0OJSfi+V12Hq0rhyg==
X-CSE-MsgGUID: QkV6F2J0Srqbdaib2xlf8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73485800"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73485800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:47:42 -0800
X-CSE-ConnectionGUID: Ux2cp0h4ROyWSBfhQGUi+Q==
X-CSE-MsgGUID: 18Z21NjURhOZtxXvU3kAhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209519883"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jan 2026 11:47:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfkMc-00000000FIO-2MMQ;
	Tue, 13 Jan 2026 19:47:38 +0000
Date: Wed, 14 Jan 2026 03:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 kernel/locking/rwsem.c:1651:2: error: call to undeclared function
 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202601140327.ECKMbOOh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0954c27bd6794b82681041439dd14bcc1f51c378
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [0/2] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: x86_64-buildonly-randconfig-001-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140327.ECKMbOOh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140327.ECKMbOOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140327.ECKMbOOh-lkp@intel.com/

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
   <scratch space>:149:1: note: expanded from here
     149 | trace_android_vh_rwsem_write_wait_finish
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
