Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F41D3D96A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 02:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736562352; cv=none; b=PR8NNKHkuWiy1cNmb2bLhsxycbtUEP2qb6ZOV9z43JBiL4/5ZzeJ4EPsA4KhZzspC2bDm7WJ167qsNXkLLL2RyGauyTaU/qXXh62OHqsYQ4cUVJALWJ7+0tdYIc+ljBZ5l5CITNEcTOBUsD+lNd/OkqOZgZ59iJfvLqxYxlfTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736562352; c=relaxed/simple;
	bh=mc9CaE3z4B3SWPUyCZ0V9l3jvlqqf6hjGbnJa2uDw44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=opv1u5ojd3M8TXqWN2edqZsI9I6K9tk75UJ3L6UhLnKzMhC3h81e0UB57BxVzVLSq5BpNRcuT0PaKXXz2bggelf9DgrKh3ZZ0mhVY/IVLkkebdIH/n/1zKjpbw66EJvmYlxD7CaQOIIcEIwuOY2kNHKLHn1ISsXUsWuTk1xkMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGNJVCHv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGNJVCHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736562340; x=1768098340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mc9CaE3z4B3SWPUyCZ0V9l3jvlqqf6hjGbnJa2uDw44=;
  b=NGNJVCHv3976os76GUfz6TTqUmdTpnRvkI/lRqOyBKs52VT5FTwN0Fai
   40SPy9IUVcEznCsnVLyMBZKMO7fdDlMbSrGQ7hAlJiX8jiZ+/Uf9aOsa+
   eAiZ5A3035wAAC5s3ZoAi4D1F5M5O+qJUBH3RXCvYX6dYtHSL98GwWtxy
   rS7+I3k6lhy87b+qbvsls4gLTngQ1so9x7VHu8J3wc8qAqI5966RO+Hpi
   zpUHItZZQ0k4TMvmk0KgKl/Ri7l2IqQ6his2Jm34lFxMlOArBWr7cuQHQ
   m7KEj7JR+W/ap0TnWdMUNV04VvF+b40n70rnR5vCfQdbuTnmSMvP62XFV
   Q==;
X-CSE-ConnectionGUID: d5RU9Sl6QwySQbyVB//RGg==
X-CSE-MsgGUID: a+LYVIAsSKWPQ0rZ7qQflQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36553339"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36553339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 18:25:37 -0800
X-CSE-ConnectionGUID: 4GMW4MEvTHuIWUUL5EFuwA==
X-CSE-MsgGUID: OWT1FFIWRN+DICu88ZnpzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="104455017"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2025 18:25:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWRBr-000K2q-1i;
	Sat, 11 Jan 2025 02:25:31 +0000
Date: Sat, 11 Jan 2025 10:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.07a 56/56] kernel/rcu/refscale.c:225:21:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202501111020.ConYIOJC-lkp@intel.com>
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
commit: 88e44a908bff076d1e7f47634f06a8a4560c19e9 [56/56] refscale: Add srcu_read_lock_fast() support using "srcu-fast"
config: x86_64-randconfig-121-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111020.ConYIOJC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111020.ConYIOJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111020.ConYIOJC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rcu/refscale.c:225:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   kernel/rcu/refscale.c:225:21: sparse:     expected struct srcu_ctr *scp
   kernel/rcu/refscale.c:225:21: sparse:     got struct srcu_ctr [noderef] __percpu *
>> kernel/rcu/refscale.c:226:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct srcu_ctr [noderef] __percpu *scp @@     got struct srcu_ctr *scp @@
   kernel/rcu/refscale.c:226:50: sparse:     expected struct srcu_ctr [noderef] __percpu *scp
   kernel/rcu/refscale.c:226:50: sparse:     got struct srcu_ctr *scp
   kernel/rcu/refscale.c:236:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   kernel/rcu/refscale.c:236:21: sparse:     expected struct srcu_ctr *scp
   kernel/rcu/refscale.c:236:21: sparse:     got struct srcu_ctr [noderef] __percpu *
   kernel/rcu/refscale.c:238:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct srcu_ctr [noderef] __percpu *scp @@     got struct srcu_ctr *scp @@
   kernel/rcu/refscale.c:238:50: sparse:     expected struct srcu_ctr [noderef] __percpu *scp
   kernel/rcu/refscale.c:238:50: sparse:     got struct srcu_ctr *scp
   kernel/rcu/refscale.c:745:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/rcu/refscale.c:745:24: sparse:    struct refscale_typesafe [noderef] __rcu *
   kernel/rcu/refscale.c:745:24: sparse:    struct refscale_typesafe *
   kernel/rcu/refscale.c:195:37: sparse: sparse: context imbalance in 'srcu_ref_scale_read_section' - unexpected unlock
   kernel/rcu/refscale.c:206:37: sparse: sparse: context imbalance in 'srcu_ref_scale_delay_section' - unexpected unlock
   kernel/rcu/refscale.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, arch/x86/include/asm/uprobes.h, ...):
   include/linux/srcutiny.h:93:39: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/rcu/refscale.c:226:38: sparse: sparse: context imbalance in 'srcu_fast_ref_scale_read_section' - unexpected unlock
   include/linux/srcutiny.h:93:39: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/rcu/refscale.c:237:17: sparse: sparse: context imbalance in 'srcu_fast_ref_scale_delay_section' - unexpected unlock
   kernel/rcu/refscale.c:255:42: sparse: sparse: context imbalance in 'srcu_lite_ref_scale_read_section' - unexpected unlock
   kernel/rcu/refscale.c:266:42: sparse: sparse: context imbalance in 'srcu_lite_ref_scale_delay_section' - unexpected unlock
   kernel/rcu/refscale.c:700:13: sparse: sparse: context imbalance in 'typesafe_lock_acquire' - wrong count at exit
   kernel/rcu/refscale.c:707:13: sparse: sparse: context imbalance in 'typesafe_lock_release' - unexpected unlock

vim +225 kernel/rcu/refscale.c

   218	
   219	static void srcu_fast_ref_scale_read_section(const int nloops)
   220	{
   221		int i;
   222		struct srcu_ctr *scp;
   223	
   224		for (i = nloops; i >= 0; i--) {
 > 225			scp = srcu_read_lock_fast(srcu_ctlp);
 > 226			srcu_read_unlock_fast(srcu_ctlp, scp);
   227		}
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
