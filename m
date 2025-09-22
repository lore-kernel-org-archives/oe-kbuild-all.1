Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D631DF725
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 20:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758572233; cv=none; b=RFjrRf98S0+E0jdz6eaj10E0jM9kkfwcJ2OuUAvLp6QLQcsYNwsDPsISmTheRdDaZm3/a22oHNI2KEyuC+WO2eByXsTHiwaoQ1yvTmLVBm0f9BxohA5QV/fClVMOoy4oMgVjLhKFzHql7NiES4bM8YOxB7KXbVlO1D3PLzvAG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758572233; c=relaxed/simple;
	bh=x82tqBLzn79nGXiXrA9bNLnSCUuXszSlhj3LqYv+HLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NbaTbY8jMfxjAqoDdOfIG5KH7f/lNGbW8knFcQizgfjvBbUoBA5o2mgZ4GkOqy8GfwjQ275JgsZjAPfyNoDhAkFOcgMr10sTL+qgYpFJCOf7KSnvI3XvF2ADwHRdD9ELE31SOV5dicrGczRmHB1L83l2rbNWtts7k0rVzYwhRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcEWBDUi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcEWBDUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758572231; x=1790108231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x82tqBLzn79nGXiXrA9bNLnSCUuXszSlhj3LqYv+HLk=;
  b=XcEWBDUiWSyDvnJ04VANkJJAquela7zj6Ig3QHJaFRnvLhJ360gqpiYf
   5HWpeU1rBHR8IvMOFvPolS5mqQ+VC0X6dscKaO14BcLXWJDjCI1vnmiWW
   Nx5iYtUdPGNsILXorSdSFydEgx/tX1wc3Nwa7OLFCjLmR5sZZZ6LgznbD
   +0IquV5jR75mdeqyz+CsnHEC4G8CXo2QtAXNUeqvx3YWsxaOC6bMfwmnK
   JwjNqhK5uLGgefzCceE4FNzXj+DVOuv6ZGQyGQEG8oaFFx/UKK6ar7kec
   26mI+X3cLoVTSjb481JbvA2u4GOzEOo0fBa/C3/2jXUEYIV62fRihsZdx
   g==;
X-CSE-ConnectionGUID: Jm2GdxlHT+ueaxZIQ33LNA==
X-CSE-MsgGUID: 9RZwepUJSUK8TdryZiPgTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71951340"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="71951340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 13:17:10 -0700
X-CSE-ConnectionGUID: uDC2bXXtT92Mvo+tE20W7A==
X-CSE-MsgGUID: YyAIITCmQh+IB7j9sdTzFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176945798"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Sep 2025 13:17:09 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0myA-0002Sj-30;
	Mon, 22 Sep 2025 20:17:06 +0000
Date: Tue, 23 Sep 2025 04:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/24]
 kernel/locking/rwsem.c:1651:2: error: call to undeclared function
 'trace_android_vh_rwsem_write_finished'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202509230419.uxvOrgdR-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   a390416d0d0f981d5b15a7358987dd2bcace14f7
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [0/24] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: x86_64-buildonly-randconfig-005-20250923 (https://download.01.org/0day-ci/archive/20250923/202509230419.uxvOrgdR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230419.uxvOrgdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230419.uxvOrgdR-lkp@intel.com/

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
   <scratch space>:2:1: note: expanded from here
       2 | trace_android_vh_rwsem_write_wait_finish
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
