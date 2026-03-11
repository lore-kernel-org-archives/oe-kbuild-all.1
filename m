Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB1C3E7156
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253613; cv=none; b=UDNWdLdpDZ8uCDHfZgxJGcjNbNa823TjWUzsTrfBsEbrX0qzCWnaUtQYlMVgrNqj7U11uj8SNbxX37WRaWDxwPQO30FTF5iLAiLIzZm+6qtXhlZlbiWqS4HQFbXD/iY58cWQgyE/IjakXBQlJtL74jspKK/QB1PthATmu0wQYFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253613; c=relaxed/simple;
	bh=xoV/4eR2gUtxnexrNvDu/9ZRXXU1lYqil7vbXac0aSI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YV9b+9xP9OUs74ZxRzDjsm4pRfcnxhPjCAUivwj8GBIVUR1zscNkOnQvt6A7IzowIF6Lo7MYiSShbRRTeUFNjMklOxqP9Ii2GPZpNYLlFs/LhCxZQ2jksAJQcD/JKGYQetYW6VrfkOcR/KcjWFN4++gKQSwWpEFitUi+ikbXh3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmBPsJDn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmBPsJDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773253610; x=1804789610;
  h=date:from:to:cc:subject:message-id;
  bh=xoV/4eR2gUtxnexrNvDu/9ZRXXU1lYqil7vbXac0aSI=;
  b=ZmBPsJDn+cPkQVM6anM0hHn/Oajdso0lvIZfgjUTMkZdrgmlBxa4/ZJ4
   JogV6vRHwGWxFvv4kQ6SzK0Xbbs39bXS2QyJe5My9LqUWUEvwtIIoiZKT
   tdsbBJFs1sFgdQPyFf/ZUoyPHKhTsPzOPRqUguatKwlC6S5Uol/q90Cyy
   GF7eLNi883mZc59wQ1Y/7dRReCbMM7nNrhu6LsBZxapUxEUmFo0q1pRmG
   tAsW1eKJ0SolDJO8ae5cJEhsFXZdMRb7QBODQIkbGSyI/qIPZSZ8bS6oQ
   Vbsxrso7fIZ72HnLyBpfg72jPb6SirqvSZxUWk53tG8j+gK5HPW4SGt+S
   g==;
X-CSE-ConnectionGUID: 0342WOjCTS663UhAYjAfsA==
X-CSE-MsgGUID: q3LPHZXMTTmN+fRcdEz29A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85421106"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85421106"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:26:50 -0700
X-CSE-ConnectionGUID: g5K7pHNWQB2ZNnE2H7s28Q==
X-CSE-MsgGUID: b7gTr0U8QzaNOt+x3ch0WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219686867"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2026 11:26:49 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0OGc-000000001Zx-2yeG;
	Wed, 11 Mar 2026 18:26:46 +0000
Date: Thu, 12 Mar 2026 02:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 8/8] fs/f2fs/f2fs.h:2392:42:
 error: no member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202603120231.Vm5fsmop-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9c404f25f968c9e826cfb6d821b9ddc16d67bee8
commit: 4e1c4268094aed2888ea52c2626905886854a5c2 [8/8] ANDROID: vendor_hooks: add hooks for f2fs down read
config: x86_64-randconfig-076-20260310 (https://download.01.org/0day-ci/archive/20260312/202603120231.Vm5fsmop-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120231.Vm5fsmop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120231.Vm5fsmop-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/checkpoint.c:21:
>> fs/f2fs/f2fs.h:2392:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2392 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 error generated.


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
