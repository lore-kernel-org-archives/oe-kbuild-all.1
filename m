Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C996221FBF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938729; cv=none; b=WaA3jLT5eXAHlLbWVLBsn5UmjEGV5ynsRU52hwVMMPuodduutun9GHzYapT1hkXk5uFWvyTA3TbvcYPtVbP5JFcA+rHjHwbLXUIeJSoLCn2DK01TeCT2AD51JaHM9xQ7kNh9H1j/7Vge5wJTpOFNJuv9FGB60L8Dl45LhwUB7+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938729; c=relaxed/simple;
	bh=KhB8JY8uG26ojpgP0+mT7fWiNDBZj9m5wQzUBC5yTJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0NDajSkUw+3+t2yyVp5zp+pYyYhzH5LO0B7w8hDU0P3ZsVCoNHLoMSOEzoVSozUVjQjyPbCfFEk3sKEKKBXI1yyc6sv1EETC0Yjwc1szfRizJyQCS990oyj3mXv+rPPm3SoeNSjAyMujjdpMW1EL2UuTN4eekdRiSt3LLibkWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVZI76K3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVZI76K3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750938727; x=1782474727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KhB8JY8uG26ojpgP0+mT7fWiNDBZj9m5wQzUBC5yTJY=;
  b=kVZI76K3bDJI8e8d2wOf2dJpyDXhWF0QciTdoSy+7S0X4fi3DPMf4/dv
   DFUMpBUozUJCjXvNkj8hOzvpIFMmhnvx27K1uqOMTbfY5LF9J6T3mSO8p
   Mgp/MA66iVPBYvmXGg8R06/TmSfrrsFqrFxiWmJYKtgVa8Wvb1WZ72ng9
   +gv7Qtj4lb2x4tqkDPpKPrMk0Im2vZ6L1u1z8dmLULZKDy32tO290cYmI
   fHJ3PFTNq/MAhqQbtSb+Ee0d+IT/hIKyxnZ2BJx6jb3BJJcVlplxcKTie
   cv5yOUue+13QPWL+IQFT5yTTj2WgWJ/P0He9RVs7SayYiFA4kJVGzsYDf
   w==;
X-CSE-ConnectionGUID: 9hl0V9uOSyOWG1AcftD4+g==
X-CSE-MsgGUID: AQNZYZZyTTyUHcTLy07HQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="75777483"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="75777483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:52:06 -0700
X-CSE-ConnectionGUID: jhilsby8Sgy+pIYlKtZ28A==
X-CSE-MsgGUID: x/iA/hw6SEOtm3uCb/1K8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="156533691"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jun 2025 04:52:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUl99-000U10-3A;
	Thu, 26 Jun 2025 11:52:03 +0000
Date: Thu, 26 Jun 2025 19:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/f2fs/f2fs.h:2183:42: error: no
 member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202506261923.3M3rH91t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   fe3caa5756634542c9d65436ad7c196fac7edcde
commit: 29429c25a600ea41fc44db5d8de0f65bce2872ac [1/1] ANDROID: vendor_hooks: add hooks for f2fs down read
config: x86_64-buildonly-randconfig-004-20250626 (https://download.01.org/0day-ci/archive/20250626/202506261923.3M3rH91t-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261923.3M3rH91t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261923.3M3rH91t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/data.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2234:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/f2fs/data.c:25:
>> fs/f2fs/f2fs.h:2183:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 warning and 1 error generated.


vim +2183 fs/f2fs/f2fs.h

  2176	
  2177	void _trace_android_rvh_f2fs_down_read(wait_queue_head_t *read_waiters,
  2178					   struct rw_semaphore *rwsem, bool *skip);
  2179	
  2180	static inline void f2fs_down_read(struct f2fs_rwsem *sem)
  2181	{
  2182		bool skip = false;
> 2183		_trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
  2184		if (skip)
  2185			return;
  2186	#ifdef CONFIG_F2FS_UNFAIR_RWSEM
  2187		wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
  2188	#else
  2189		down_read(&sem->internal_rwsem);
  2190	#endif
  2191	}
  2192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
