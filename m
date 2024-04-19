Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A254D131
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713518142; cv=none; b=IZHk/5XBp1vByV9FUAZs47ko47fSR5vX8zO8hOL8y0AsHA+GxIikHAWyLQS2vUuwp98tmx3hda3fzxwy2zBzSH+0LTeCfMU0iRhp9i/Zm6zEaF9Xv2mhnB25eIIwtKjrNb6dmrM0ef1lAH1Vj0lOJrx2BT3s6ciGDgwjvu7bIro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713518142; c=relaxed/simple;
	bh=vOEVhDZl5rx+dvvclX+qUdnsKqtzhj8OWETf3OdORS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTkyTGKuqFM1D13fswkbf7SPHCRdMamnCZUIP7qEAc12oF53xHZ5rn54wr5NdEvZVNHyGVrfFZLZzvRkWZygVXH6sGs5M4FaFb0dEPWsxAn6HrOhhipyHIVuWEvYfAeG5grijbwd6PZq1ZTBwrP/83YlPB5aJkyXmOOF3Yu2r3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3v7yJoa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3v7yJoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713518141; x=1745054141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vOEVhDZl5rx+dvvclX+qUdnsKqtzhj8OWETf3OdORS4=;
  b=Z3v7yJoaG2TCKOIsvPy3PnSAZZDWDmRaU9ilo2c6+Yh4PBisiYM0hADY
   4iUo5x1GPn6GF/zrLkbiBh0piOKMBCnGJAvaxG8J73vwrIA1qHNM3YN8q
   5WmCfHSw644UlP38SrxjfM6mAUap6o4IB+UnA5pM7IjwKLnqeu4S28eei
   jsEqAL60DisbxSUxgT5gYrs00Fe08RwNVbG9SRzNnpeMWhvxfsCotyrFo
   atpx2Fcj7cJRT4KYYiFtoEGF9LaKo+llcns7liKt0VbXEX1PKXSpR7ZUE
   7f5ITLTxLqOcih23rzoPsCGHDRt/P3RoLXuy3ikBMOhkSaE686iclle7M
   w==;
X-CSE-ConnectionGUID: uLQRjzfgQOK2tqh73UZ0Xg==
X-CSE-MsgGUID: mjMrA6nkQeqAx4FJyDEClg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12054160"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12054160"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 02:15:40 -0700
X-CSE-ConnectionGUID: kh16MJX4SVWfl9GssLO3ig==
X-CSE-MsgGUID: gOzmdzUvS2mIkVlbT8gRTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23290685"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Apr 2024 02:15:39 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxkLJ-0009uY-0C;
	Fri, 19 Apr 2024 09:15:37 +0000
Date: Fri, 19 Apr 2024 17:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_lock 10/12] kernel/bpf/helpers.c:2554:1: sparse:
 sparse: symbol '__pcpu_scope_bpf_lock_inflight' was not declared. Should it
 be static?
Message-ID: <202404191703.ZC4wPD7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_lock
head:   b6ffb7fb4b4db0fefc36dbd504ce4a8fa8370f80
commit: 8ba2969c8a6df7a62a1beef5e2a464b1decd5452 [10/12] bpf: Introduce bpf_lock.
config: i386-randconfig-r123-20240419 (https://download.01.org/0day-ci/archive/20240419/202404191703.ZC4wPD7q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404191703.ZC4wPD7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404191703.ZC4wPD7q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:2161:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2191:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
>> kernel/bpf/helpers.c:2554:1: sparse: sparse: symbol '__pcpu_scope_bpf_lock_inflight' was not declared. Should it be static?
   kernel/bpf/helpers.c:2499:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c: note: in included file (through include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/rcupdate.h:812:9: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +/__pcpu_scope_bpf_lock_inflight +2554 kernel/bpf/helpers.c

  2551	
  2552	#define LEVEL_SHIFT 8
  2553	struct bpf_lock_kern bpf_locks[NR_CPUS * 16 + 1];
> 2554	DEFINE_PER_CPU(u64, bpf_lock_inflight);
  2555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
