Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B168B652
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736555403; cv=none; b=XvAO2otmBI/FIoRgxiL2jaq+5akB49VQopwLEsXcgNBCB8wTN6HDruTu6dYQO7Rc2pzpC+tQD5tkZHoUNpcnQmeyLbbJcuXeeIagCFjmdMWMKpalfJaxKVp8c0HF6fLBCtSbagn4N6I8p/2PmmiLz1JyZ1D0LuoC66DtSi75HJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736555403; c=relaxed/simple;
	bh=ubvP+rgCvQ9JRqueTqw2a7T97GHGV2vMBBPTeDEznEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjN8meHeDBqaKKu1pqwKeoUqhKJL2EPmRz7jC3ngQfdN4KrNTl4pHMVpGG4bQNWTeEKC6FNusHMn5DqITQ+TPnc7O/0Bm1GL5SLXeTWceg47UWEEenEM5bFGT9oy20mPH50Lifdy161sB+SYPB9Uwl/u+5acxJWPTX74J8FeDOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDn+o35F; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDn+o35F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736555402; x=1768091402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubvP+rgCvQ9JRqueTqw2a7T97GHGV2vMBBPTeDEznEM=;
  b=HDn+o35FwTs5Kfyqm2D3TCTgQyVj+Wz8iZxWhAmStS78uY6XIghn2J54
   IarJR8AX7u+HzsMJu4cFn9rMMhH61i0OiSZ2p2PVP+Ld/aHTQeKbI0Tio
   K0pjbR9hRqvACaf2bdHAfTvRrbRDxW/vNk+Sx2/fidmDB3LTI82936y0I
   OmiWG8dGxcJyqgGlLlc6ko80igfMZEgEzl534RerLWxltaBJ6I0syo1fy
   8aI8jQWsLjojuRbIp4R1YF/y0OIS6UF11ABM2PNKq1My5sVuDN5u3o+IB
   xONeLqxMHryJDJOE0yOVAlzfS4jfvxo8a+0xKbxz2Y5SOT7LLnxHXTKCU
   w==;
X-CSE-ConnectionGUID: 2jC0GdsxRgOosSaDfDc2FA==
X-CSE-MsgGUID: 0n2q26oURQO24p8czrznWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47857615"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47857615"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 16:30:02 -0800
X-CSE-ConnectionGUID: EpXx7BV5SxCR+Hr7JKiJvA==
X-CSE-MsgGUID: JUm7DS8tQb+w91wgsNgNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127167883"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jan 2025 16:30:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWPO2-000JxS-1F;
	Sat, 11 Jan 2025 00:29:58 +0000
Date: Sat, 11 Jan 2025 08:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.07a 55/56] include/linux/srcutiny.h:78:22:
 sparse: sparse: cast removes address space '__percpu' of expression
Message-ID: <202501110825.2fflNtEI-lkp@intel.com>
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
commit: 8d2e5d645a9efc9be32fd58476c279bc8eaee9db [55/56] srcu: Move SRCU Tree/Tiny definitions from srcu.h
config: x86_64-randconfig-121-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110825.2fflNtEI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110825.2fflNtEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110825.2fflNtEI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/rcutorture.c:711:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   kernel/rcu/rcutorture.c:711:21: sparse:     expected struct srcu_ctr *scp
   kernel/rcu/rcutorture.c:711:21: sparse:     got struct srcu_ctr [noderef] __percpu *
   kernel/rcu/rcutorture.c:712:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct srcu_ctr [noderef] __percpu *scpp @@     got struct srcu_ctr *scp @@
   kernel/rcu/rcutorture.c:712:52: sparse:     expected struct srcu_ctr [noderef] __percpu *scpp
   kernel/rcu/rcutorture.c:712:52: sparse:     got struct srcu_ctr *scp
   kernel/rcu/rcutorture.c:742:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct srcu_ctr [noderef] __percpu *scp @@     got struct srcu_ctr * @@
   kernel/rcu/rcutorture.c:742:67: sparse:     expected struct srcu_ctr [noderef] __percpu *scp
   kernel/rcu/rcutorture.c:742:67: sparse:     got struct srcu_ctr *
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/rcu/rcutorture.c:439:22: sparse: sparse: context imbalance in 'rcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'rcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, arch/x86/include/asm/uprobes.h, ...):
>> include/linux/srcutiny.h:78:22: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/srcutiny.h:93:39: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/rcu/rcutorture.c:742:38: sparse: sparse: context imbalance in 'srcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:2047:9: sparse: sparse: context imbalance in 'rcutorture_one_extend' - different lock contexts for basic block
   kernel/rcu/rcutorture.c:3927:41: sparse: sparse: context imbalance in 'rcu_torture_init_srcu_lockdep' - unexpected unlock
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/__percpu +78 include/linux/srcutiny.h

    75	
    76	static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
    77	{
  > 78		return (int)(intptr_t)scpp;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
