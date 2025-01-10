Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6286EB7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 03:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736479443; cv=none; b=OAHR6NDeBWDMJulkkD5VxDMxdFnijf/EvkepFJ1/61CSK8ZbKfzB8Nzww6bybzxS7fq0iw7e0rmRC2213NgQR2/9atanLL4DNEFH7DE1k9zpg589ox1suS2htuEXlvoolcYDlZyu51TSILNQzYMzoBACpRXTnhFnIuo1wnokA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736479443; c=relaxed/simple;
	bh=2rckmfrbKfpZBnBEDp46L9zPTa67/uOYs0C916cgvO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZiM06pJfIZEoKVCkFkrZOJK2H8LRbMBytDn+yQcltJBjQTLEBrmt9H4KyOzqeKrO5kVpMGDe22U2/fV2c8aLfkODlzN/XVwErzRx/mSLlvMSGGBsh1EonojOC6QgaoduxmCQSBXi+ZJniWIQ8kdbqoxKW2pNtjTVlLST5FTdg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAtEiPkW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAtEiPkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736479441; x=1768015441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rckmfrbKfpZBnBEDp46L9zPTa67/uOYs0C916cgvO8=;
  b=AAtEiPkW4VFamas8Z39O/YzdR8t6T6a2tqa5UtJjq1ChPhK3zvzOHBEs
   /yQbGSAt9CmbwNtfzjCMc0e8QfXd/FhfZkGRxRbL74CjmLBqY0bHQkZ66
   L6zZSw7wxBgPaS5JZiK2+0JKDaUMk5LLHIGSQ/0ntmWPfGHG53YSCL1Pz
   hfQQBK7TCQIum1T8lKgu/dM1M4FSj7wgGttPZLxkIffG7qF7s0NDAfMKa
   k7JCdvwjLAGEIv5/BYDsl4b1Re2fu4YJfesMYJqhBDBEFQfwRHcD7YDwI
   lZD9VK8OizLxBPF4cOnb57oOFWjST0DA61hxWFD10l0XOVY4MbBxYZMYJ
   Q==;
X-CSE-ConnectionGUID: SM7CRtWASMyoO6n/eTyWRg==
X-CSE-MsgGUID: /ptqHxswR1KJ0kER3a6HPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39585950"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="39585950"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 19:24:01 -0800
X-CSE-ConnectionGUID: x+PBLrKpSD2Es/4uV442Pw==
X-CSE-MsgGUID: Edr7oAunSkO5adGLOQ5PCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="103402136"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jan 2025 19:24:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW5cr-000IV9-2s;
	Fri, 10 Jan 2025 03:23:57 +0000
Date: Fri, 10 Jan 2025 11:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.07a 46/56] kernel/rcu/srcutree.c:800:52:
 error: incompatible type for argument 1 of 'atomic_long_inc'
Message-ID: <202501101104.mW1l9cG5-lkp@intel.com>
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
config: arm-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101104.mW1l9cG5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101104.mW1l9cG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101104.mW1l9cG5-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/srcutree.c: In function '__srcu_read_unlock_nmisafe':
>> kernel/rcu/srcutree.c:800:52: error: incompatible type for argument 1 of 'atomic_long_inc'
     800 |         atomic_long_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
         |                                                    |
         |                                                    atomic_long_t {aka atomic_t}
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from kernel/rcu/srcutree.c:19:
   include/linux/atomic/atomic-instrumented.h:3589:32: note: expected 'atomic_long_t *' {aka 'atomic_t *'} but argument is of type 'atomic_long_t' {aka 'atomic_t'}
    3589 | atomic_long_inc(atomic_long_t *v)
         |                 ~~~~~~~~~~~~~~~^
   kernel/rcu/srcutree.c:797:27: warning: unused variable 'sdp' [-Wunused-variable]
     797 |         struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
         |                           ^~~


vim +/atomic_long_inc +800 kernel/rcu/srcutree.c

   789	
   790	/*
   791	 * Removes the count for the old reader from the appropriate per-CPU
   792	 * element of the srcu_struct.  Note that this may well be a different
   793	 * CPU than that which was incremented by the corresponding srcu_read_lock().
   794	 */
   795	void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
   796	{
   797		struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
   798	
   799		smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
 > 800		atomic_long_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
   801	}
   802	EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
