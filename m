Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5EA1ABED9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 03:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776743544; cv=none; b=hnpuIRO4u2sUURa63Sx2IA9ICamg6DvRw5Bi1PUSMRKR93lsLvK4FQ7rKdaJuuAg2fAVFeEapeXbys5MpdIZHsdY2OwnoS59DLg41VuN9zc8CpY10M2S1URLgndz1eZylWFhdOjXJkenoyzaBVdFEqVcOmK5WpmFysOSBsuOdXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776743544; c=relaxed/simple;
	bh=jEnEipf9nxcI66lKCUWvvZHyOxEz9na+mAAucAru0Vo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tn0Gl2xEkZPYQyT+Dx764rX66MwfWfZp8HhxIoF/eWw6A5lnlk2Y3aAe/9Dcmce0Kox9WazFItYEq/kGV5wCLO9LKdw6vYXreymLMzDUeoiJKproi13/UV68uXWX6iSbqJdnmvCGtJce8hCWsU5hGUsBiGbfLbP2r9iX2tlsOeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beRxyWbH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beRxyWbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776743542; x=1808279542;
  h=date:from:to:cc:subject:message-id;
  bh=jEnEipf9nxcI66lKCUWvvZHyOxEz9na+mAAucAru0Vo=;
  b=beRxyWbHRwCD5ZpwVz0mm9z1uEOqnpyTSuUh3x7N2ugdtY7YN2qIJO7r
   pY9WDu4Xl4hefBlN833fcsG7rOTLOW8BCLM2EenuwzoJNUEncvm4w5cJe
   o2T2RIRIIF9MdMMjuBYX0Ck/m9uCZotgrKFX1YhXmKdagGxVxcdHKCp21
   SDhnaZYyNiReXITrDoZ5zY0ueAVmA6bbj3QxdDkA5Uc7DC/KKac7Y1vHj
   8YipNISJQnyahqepS1xKcvbV54Vq4LR7iPBq24Lgvj0oiZjewx6fLch+x
   v2yA8T7VV1Lgcpx7nOIG3XWxdeS9uuPerAhWShLkH0M6y1B2gwiMK7lvm
   A==;
X-CSE-ConnectionGUID: HiiONwmwQIy9Mokg7kOmjg==
X-CSE-MsgGUID: ZYhyraSUSLONv3pwar3ssA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95081722"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="95081722"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 20:52:22 -0700
X-CSE-ConnectionGUID: oZ5OLN1dQSio60kiOd/iXw==
X-CSE-MsgGUID: cnhJIe6dRqSYYb8GyTDA2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="231036495"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Apr 2026 20:52:21 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF29q-000000003CG-1Coi;
	Tue, 21 Apr 2026 03:52:18 +0000
Date: Tue, 21 Apr 2026 11:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] fs/f2fs/f2fs.h:2392:42:
 error: no member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202604211137.Kmo7HV6a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   2b232de60acc345669d0e8773b9445db098042c8
commit: 4e1c4268094aed2888ea52c2626905886854a5c2 [1/1] ANDROID: vendor_hooks: add hooks for f2fs down read
config: i386-buildonly-randconfig-004-20260421 (https://download.01.org/0day-ci/archive/20260421/202604211137.Kmo7HV6a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604211137.Kmo7HV6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604211137.Kmo7HV6a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/hash.c:18:
>> fs/f2fs/f2fs.h:2392:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2392 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]


vim +2392 fs/f2fs/f2fs.h

  2385	
  2386	void _trace_android_rvh_f2fs_down_read(wait_queue_head_t *read_waiters,
  2387					   struct rw_semaphore *rwsem, bool *skip);
  2388	
  2389	static inline void f2fs_down_read(struct f2fs_rwsem *sem)
  2390	{
  2391		bool skip = false;
> 2392		_trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
  2393		if (skip)
  2394			return;
  2395	#ifdef CONFIG_F2FS_UNFAIR_RWSEM
  2396		wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
  2397	#else
  2398		down_read(&sem->internal_rwsem);
  2399	#endif
  2400	}
  2401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
