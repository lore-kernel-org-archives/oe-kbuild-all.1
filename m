Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8E5D2F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 04:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L20LOlW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701836677; x=1733372677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LcBejFhBpZxA6lX8jUnyOBnyNE8kOq/fK77RRWmm8I0=;
  b=L20LOlW1ESe96RIj8sD0YPsG6nghjJB3TnGZHDdIjcFK1tgk2QPc4/ZL
   zhNGDJhF6vsL0kyNX4alCGVlddIioY1rT9pM/dvH7PMg1hRNAwW6AFYD8
   wEuzkLjaE/v4TX8LG8otGeaF8oGinRPwigxbKXnNTuMbGwIsY7AgDyCXW
   1hoJ7x1M2AnDQcOJD/dgE/FN9O2MT82R5gDZyKvbawqnMTMJs4ZiuMH3X
   jYbevPb0mCvoKWVBgaKPxUFjTGU8OT8cHrjOzv9MkWOCAEidgrnKYjM8s
   8vNWaLJ3emNb8MqBelH6OFYtOm7lMtKfmEbmbGp5yGYqMdL2ncYseX/Qp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396794382"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="396794382"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837189477"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="837189477"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2023 20:24:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjSb-000AFW-0M;
	Wed, 06 Dec 2023 04:24:33 +0000
Date: Wed, 6 Dec 2023 12:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/kvm 3/11] net/tipc/tipc.o: warning: objtool:
 __SCT__tp_func_tipc_skb_dump+0x0: retpoline_safe hint not an indirect
 jump/call/ret/nop
Message-ID: <202312061241.qgj4jVQV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: b7a510b43b1833fc6b0543c0295970c1dd87fbde [3/11] objtool: Convert ANNOTATE_RETPOLINE_SAFE to ANNOTATE
config: x86_64-randconfig-161-20231202 (https://download.01.org/0day-ci/archive/20231206/202312061241.qgj4jVQV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061241.qgj4jVQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061241.qgj4jVQV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/tipc/tipc.o: warning: objtool: __SCT__tp_func_tipc_skb_dump+0x0: retpoline_safe hint not an indirect jump/call/ret/nop
--
>> fs/nfs/nfsv4.o: warning: objtool: __SCT__tp_func_nfs4_setclientid+0x0: retpoline_safe hint not an indirect jump/call/ret/nop
--
>> fs/afs/kafs.o: warning: objtool: __SCT__tp_func_afs_receive_data+0x0: retpoline_safe hint not an indirect jump/call/ret/nop
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu.o: warning: objtool: __SCT__tp_func_amdgpu_device_rreg+0x0: retpoline_safe hint not an indirect jump/call/ret/nop
--
>> drivers/gpu/drm/i915/i915.o: warning: objtool: __SCT__tp_func_i915_gem_object_create+0x0: retpoline_safe hint not an indirect jump/call/ret/nop
--
>> drivers/infiniband/core/ib_core.o: warning: objtool: __SCT__tp_func_ib_mad_error_handler+0x0: retpoline_safe hint not an indirect jump/call/ret/nop
--
>> net/ipv6/ipv6.o: warning: objtool: __SCT__tp_func_fib6_table_lookup+0x0: retpoline_safe hint not an indirect jump/call/ret/nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
