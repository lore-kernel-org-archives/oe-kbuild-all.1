Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D424B24E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 23:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736551430; cv=none; b=Ak2qo3eDN/5w2Hj977r+QRvTtLwIicKHtEtQPN9acLpSZpIPCrMssSKsbkrOsgCtapvrwPAfN3o4yZOJmrXPTHK6bkFuWw0Qu7P9BXhahNSPKPy9huI6QvyME9mkjE2vrQMx8EZViC+dsc7QWQ4xTM9bnUBVsSCisgTdGlpPO8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736551430; c=relaxed/simple;
	bh=+8Wu30gEImFxSacFcU97mZ8vWrqVRKyhs1P02hmxnGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXypQMezKOWrDpQhD3jo1cSNoNV3ws+H1ZE+7LNl985Yd3HRNEhEIhxmDP4eMIyReeF6ORjELRbjS4A2WKFn+UAxtyHXVXSV3frPFRjR/BQfLsba56xesbPWvvnGthddcfRCBK84MoAh936ff0GPNcKvOd9M/hqvLSlhOVa9rmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnCYzk77; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnCYzk77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736551428; x=1768087428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+8Wu30gEImFxSacFcU97mZ8vWrqVRKyhs1P02hmxnGU=;
  b=YnCYzk77W2WbHSomb/OS74m/BprC3NZ+Jik1G4FEGHftKU1jH/ak2ACd
   3cbXwPgNmIHVa8+mmtIBb/7yw3lQh1iw3Is0D6w0e0xx0kFF4cvGl3/zl
   l4CxwXpA0ZEv52s6OK7X2dtzuWuZvOMRyqAZBH4cQaqjw/R9pw/QdAfRP
   AsZYakL9D+4L7HHBpg8u95Hb7qBxVVkVuDmOjQnNLKqTeeZGYWKAsQhEF
   ykbAwvk7XtCOYn63tRTd/rzVSx3eN+iAhZzh1dWMGetik44kgp8zwpr7D
   muWlfxFrCLI0c4BcwSQEnQ6nmHMbA/XIUwQdhQ/qVfRy0ldIy9/BOpY9i
   Q==;
X-CSE-ConnectionGUID: BqKsSHeyRLCuwrX9JKTQAQ==
X-CSE-MsgGUID: NbBp3mnVQq+VkcOFzsclvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47521277"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47521277"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 15:23:47 -0800
X-CSE-ConnectionGUID: YffOW46hR8untOsh7cK/xA==
X-CSE-MsgGUID: euZwKusRSn27eYs3sepfQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="134701402"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2025 15:23:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWOLw-000Jsp-0c;
	Fri, 10 Jan 2025 23:23:44 +0000
Date: Sat, 11 Jan 2025 07:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.07a 46/56] include/linux/srcutree.h:225:36:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Message-ID: <202501110742.I309TB2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.01.07a
head:   88e44a908bff076d1e7f47634f06a8a4560c19e9
commit: 88b0a38dd85e2d8a633c78ad39dd82168b9b4e94 [46/56] srcu: Pull integer-to-pointer conversion into __srcu_ctr_to_ptr()
config: i386-randconfig-062-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110742.I309TB2E-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110742.I309TB2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110742.I309TB2E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/srcutree.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:262:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   include/linux/srcutree.h:262:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:262:9: sparse:     got int *
   include/linux/srcutree.h:262:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   include/linux/srcutree.h:262:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:262:9: sparse:     got int *
   kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:768:9: sparse:     got int *
   kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:768:9: sparse:     got int *
   kernel/rcu/srcutree.c:371:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_sdp_contention' - wrong count at exit
   kernel/rcu/srcutree.c:389:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_ssp_contention' - wrong count at exit
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:225:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:225:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:225:36: sparse:     got struct srcu_ctr [noderef] __percpu *
   kernel/rcu/srcutree.c:1008:9: sparse: sparse: context imbalance in 'srcu_funnel_exp_start' - unexpected unlock
   kernel/rcu/srcutree.c: note: in included file (through include/linux/mutex.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/rcu/srcutree.c:1097:9: sparse: sparse: context imbalance in 'srcu_funnel_gp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1349:35: sparse: sparse: context imbalance in 'srcu_gp_start_if_needed' - unexpected unlock

vim +225 include/linux/srcutree.h

   220	
   221	// Converts an integer to a per-CPU pointer to the corresponding
   222	// ->srcu_ctrs[] array element.
   223	static inline struct srcu_ctr *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
   224	{
 > 225		return &ssp->sda->srcu_ctrs[idx];
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
