Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52F310F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736647554; cv=none; b=FYgCsKQOWsJYIa8CJ49vh0KT96d1JoPWYKQfb/fICHrN5w+j5WZ/3+yk2PYYtRcHjf9N7978X/vrtLN5ayi0E3KuHa3J/0BQTPa4SvYQW8oVJhpfsR5FMkfnVn5amqTKvxOoR+0rmqZA1MqkEW9det4bK6ei2hdtNKmbe08P0bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736647554; c=relaxed/simple;
	bh=WVLRFtOg9q+nWKCCZPHQjxUcWUUqR1l95ckesnK0s4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sCVbzLJNjCr1QNn+AwScSlEsO0hjwZsoQFDSPvwpWMbAu609ccHqlUliIRFOf0lLuMyJYwibbu7swGpS4mEkyg+ZOBi+vKaCTXSt5VUhHZqNmVSCYDzTQxsqoRHcY4S3s1aSZEDbVeOgbpa675cefFctYwJzXUz8vKxYts0KdPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtpMKvwP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtpMKvwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736647553; x=1768183553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVLRFtOg9q+nWKCCZPHQjxUcWUUqR1l95ckesnK0s4w=;
  b=YtpMKvwP5Nf7DclV9DcrYSKXhWEJIXvVyDZdpoEAbX1CPJxUXcT43NTS
   /UHuoCAvEuz+Dj7TBGI8P3tcVgqzn3P0hrhShWSnWt+dg97ZURoBM9bQs
   aI+Hpuan4NHStzXOBwDeXtzLM9LtK1OkJVGK28Et3mDH8TUrVrMgV0GCm
   eiT8LfZraCTf8W7E0WhR6SoM6u9t8jkomv1p2y1jqTk6QdbfG6KZ8P/xd
   +yczVTiPRojdrb3+TjMLw7FctvMRw3wyWjjmSZYXnt+De9ofXz6BqzMx7
   NF2bE2/O05ZP5I/ktXsVubKloqLQUu14d9hkPbwc7KlmA+rfzqRSjtkOL
   w==;
X-CSE-ConnectionGUID: /Ed69SyJTBuFmhCZgxD5Bg==
X-CSE-MsgGUID: yGRL2et9QwKLAc/YVaf+Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36924531"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36924531"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 18:05:53 -0800
X-CSE-ConnectionGUID: 8FitF0METcOa/bjh8tZWwA==
X-CSE-MsgGUID: RxU4hehKTkiwFlNPVJTTCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108718150"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jan 2025 18:05:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWnMK-000LRT-2s;
	Sun, 12 Jan 2025 02:05:48 +0000
Date: Sun, 12 Jan 2025 10:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] fs/f2fs/f2fs.h:2183:47: error:
 'struct f2fs_rwsem' has no member named 'read_waiters'
Message-ID: <202501121033.kHEGykM1-lkp@intel.com>
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
head:   f740a3444f6d4e9a1b075e59e7d3eac392ad275c
commit: 29429c25a600ea41fc44db5d8de0f65bce2872ac [2/2] ANDROID: vendor_hooks: add hooks for f2fs down read
config: arm-randconfig-r112-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121033.kHEGykM1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121033.kHEGykM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121033.kHEGykM1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
   fs/f2fs/f2fs.h: In function 'f2fs_down_read':
>> fs/f2fs/f2fs.h:2183:47: error: 'struct f2fs_rwsem' has no member named 'read_waiters'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                               ^~
--
   In file included from fs/f2fs/file.c:28:
   fs/f2fs/f2fs.h: In function 'f2fs_down_read':
>> fs/f2fs/f2fs.h:2183:47: error: 'struct f2fs_rwsem' has no member named 'read_waiters'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                               ^~
   fs/f2fs/file.c: At top level:
   fs/f2fs/file.c:41:12: warning: no previous prototype for 'f2fs_filemap_fault' [-Wmissing-prototypes]
      41 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         |            ^~~~~~~~~~~~~~~~~~
--
   In file included from fs/f2fs/data.c:25:
   fs/f2fs/f2fs.h: In function 'f2fs_down_read':
>> fs/f2fs/f2fs.h:2183:47: error: 'struct f2fs_rwsem' has no member named 'read_waiters'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                               ^~
   fs/f2fs/data.c: In function 'f2fs_mpage_readpages':
   fs/f2fs/data.c:2413:17: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2413 |         pgoff_t index;
         |                 ^~~~~


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
