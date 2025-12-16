Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE82135B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 10:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765882066; cv=none; b=E3XcOa3pUAdPINzCYtskeKw00i8mv7GGMSHoIiNpjtX14TgajkQcX7m2UUhAsWlshpvrdT8nixm773aKOcKyuS0zjfB4N47QbtVMZPgFJ4y1RDZ3zy1Pve+gYHh6DTcFWefdV/Td7IIgngJgVQW2xJCwl+1PH3vx6foA8A73jks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765882066; c=relaxed/simple;
	bh=dfQtx7Drz/G6BIzTlwN3oa3iguNgLF++uCmuFj93uDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocujl2dtREnbSnYwABbKyCjsCwevsHiaJinqx8aKWoGV+n4X1Kn5el6x1inOEkZo4HHmQgQwLerbBQpn+ouBXVp79k5eMqqemq2OgECymuqJF5I4z93qoSouU6ICXuSSoZ1Wc8l5wdBvpPuEXeEzf2q2w75Vk/M22tvBw3iaQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDmfKT2q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDmfKT2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765882065; x=1797418065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfQtx7Drz/G6BIzTlwN3oa3iguNgLF++uCmuFj93uDs=;
  b=bDmfKT2qu5254L2fRiwCctRMYnmwPufaPOzvLE/z7f4mT3c2vJxsvoRY
   GCaF+Cl9eh04gSTg1ZASp9ZlCo+UuY3cNokZfZ8DF6VO5oV1uL9O6BXRt
   jhUBMFq4/S/j+cQEGDiPdaSdsl7NLKH9FicbczCCbr5udwkNVzCdxzYUJ
   UdGUQ8SB1VAENY64H7puNTSA4jNsXEnpwkEjCz1S5ZuA9u8oPahep10+/
   KlLyvInOCI6cv1Yxb6/BSOa58raCOcxsQSsNAYj62HAa3SHCHyuFoW9Av
   SgpFkcgwHOFCmGUGnnRwrPznCKC6ozTWne+07OVstGB0clit0cm2vMc6q
   Q==;
X-CSE-ConnectionGUID: wcWMuK60Tzi7tE6aiV6+8Q==
X-CSE-MsgGUID: Vf7WYc4/Qx2DH6ugnolx5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66986155"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="66986155"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:47:32 -0800
X-CSE-ConnectionGUID: qFzQnScRQ0uEKeuE/IpQqw==
X-CSE-MsgGUID: kGCcanIiSYunBQo9fNSpMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198244963"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2025 02:47:31 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVSaX-000000001Vp-1REu;
	Tue, 16 Dec 2025 10:47:29 +0000
Date: Tue, 16 Dec 2025 18:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 30/35] include/linux/srcutiny.h:115:1:
 warning: srcu_struct 'ssp' is still held at the end of function
Message-ID: <202512161858.NMPUZDdz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   982f41984aa2e06402a8080e95499ae6c10a4e74
commit: 909029ea2f537071fd692f46d1ab7d217d0bcca4 [30/35] stackdepot: Enable context analysis
config: sparc64-randconfig-001-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161858.NMPUZDdz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161858.NMPUZDdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161858.NMPUZDdz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1534:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:83:
>> include/linux/srcutiny.h:115:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     115 | }
         | ^
   include/linux/srcutiny.h:114:32: note: srcu_struct acquired here
     114 |         return __srcu_ctr_to_ptr(ssp, __srcu_read_lock(ssp));
         |                                       ^
>> include/linux/srcutiny.h:120:2: warning: releasing srcu_struct 'ssp' that was not held [-Wthread-safety-analysis]
     120 |         __srcu_read_unlock(ssp, __srcu_ptr_to_ctr(ssp, scp));
         |         ^
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1534:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
>> include/linux/srcu.h:374:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     374 | }
         | ^
   include/linux/srcu.h:364:41: note: srcu_struct acquired here
     364 | static inline struct srcu_ctr __percpu *srcu_read_lock_fast_updown(struct srcu_struct *ssp)
         |                                         ^
   include/linux/srcu.h:408:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     408 | }
         | ^
   include/linux/srcu.h:402:41: note: srcu_struct acquired here
     402 | static inline struct srcu_ctr __percpu *srcu_down_read_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
>> include/linux/srcu.h:521:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     521 | }
         | ^
   include/linux/srcu.h:514:86: note: srcu_struct acquired here
     514 | srcu_read_unlock_fast_updown(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp) __releases_shared(ssp)
         |                                                                                      ^
   include/linux/compiler-context-analysis.h:382:32: note: expanded from macro '__releases_shared'
     382 | #define __releases_shared(...)  __releases_shared_ctx_lock(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-context-analysis.h:22:57: note: expanded from macro '__releases_shared_ctx_lock'
      22 | # define __releases_shared_ctx_lock(...)        __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1534:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:549:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     549 | }
         | ^
   include/linux/srcu.h:543:2: note: srcu_struct acquired here
     543 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-context-analysis.h:382:32: note: expanded from macro '__releases_shared'
     382 | #define __releases_shared(...)  __releases_shared_ctx_lock(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-context-analysis.h:22:57: note: expanded from macro '__releases_shared_ctx_lock'
      22 | # define __releases_shared_ctx_lock(...)        __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
   6 warnings generated.


vim +/ssp +115 include/linux/srcutiny.h

c4020620528e4e Paul E. McKenney 2025-01-09  111  
d3f52f53a56278 Paul E. McKenney 2025-11-05  112  static inline struct srcu_ctr __percpu *__srcu_read_lock_fast_updown(struct srcu_struct *ssp)
d3f52f53a56278 Paul E. McKenney 2025-11-05  113  {
d3f52f53a56278 Paul E. McKenney 2025-11-05  114  	return __srcu_ctr_to_ptr(ssp, __srcu_read_lock(ssp));
d3f52f53a56278 Paul E. McKenney 2025-11-05 @115  }
d3f52f53a56278 Paul E. McKenney 2025-11-05  116  
d3f52f53a56278 Paul E. McKenney 2025-11-05  117  static inline
d3f52f53a56278 Paul E. McKenney 2025-11-05  118  void __srcu_read_unlock_fast_updown(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
d3f52f53a56278 Paul E. McKenney 2025-11-05  119  {
d3f52f53a56278 Paul E. McKenney 2025-11-05 @120  	__srcu_read_unlock(ssp, __srcu_ptr_to_ctr(ssp, scp));
d3f52f53a56278 Paul E. McKenney 2025-11-05  121  }
d3f52f53a56278 Paul E. McKenney 2025-11-05  122  

:::::: The code at line 115 was first introduced by commit
:::::: d3f52f53a56278ce5ffeafa3cc6cfb3ecef770fe srcu: Create an SRCU-fast-updown API

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Frederic Weisbecker <frederic@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
