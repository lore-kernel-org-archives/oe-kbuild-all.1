Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972EA1CF8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 00:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739407689; cv=none; b=DJzLRdEmd1NvqB61JTIjHfDS7Ym18EKvK09LC8hsnTIP5URpZ5/ugagg31BXdaZGng/3Yn5phl6xVfztDpYCn5XqqDh/uKtR89b+zvEHLmwAqHv9oKEgLBIFgMUaok41KOGTk7GNpphNJh7BMYJHa2VoaAxuQmMbu7aadptcofE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739407689; c=relaxed/simple;
	bh=MnEztE8c4kiiq6vCdH9GvJQM83G7wpFFjl/tzKhjZcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dyw++ESM5HTavPHS2ZfxZfmyG2gqYYJYiGcBWbLBhWtkoI1cq1Mj+7twS9UpfyaGlYYJsNkvBi2eU7kmaTC93m3okvchiRztrX/cSAStsGAysumGsKw0Cv2CVMYumUfsnmiG5Rt2a88nLj6ag/jzAFYyyJnqtdTRFYp7cDuDtkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQd2UKCr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQd2UKCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739407687; x=1770943687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MnEztE8c4kiiq6vCdH9GvJQM83G7wpFFjl/tzKhjZcs=;
  b=LQd2UKCrtobK0lJPnMKy0oWcUx1Xefj3hKSmswTLVsDiTbJGYFFJMMkd
   b3XkL/AIWmpxv7nq0bKJfPUCnHotvvSppzKd7YrA2KTIMR9W2CTdXaKXg
   xHircqiceK8ONOl9Je6d8LnX50jeN31CcyPLbbkrGBw9lHgpHfZZI8FQv
   jdngw/RxpOwF1VMwZ56n0VBJRLiqK3/J3L1TICirdeZnQNa1yA35U3VKC
   JNIeEIlv79BJk6lqge+HTYqyxd9up0p3OHJt7cJ28cn72dIbB8QnB3T+B
   N+xAbM0wGsWCobkYaDcAvF8sUyPZ6/+DMLJ9UWhEmmstFCshuuXC2Iwo8
   Q==;
X-CSE-ConnectionGUID: WWnbZX/3SQOl69/3P00vFA==
X-CSE-MsgGUID: ETYJ+etnQ66jtGfbNyebzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65448259"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="65448259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 16:48:07 -0800
X-CSE-ConnectionGUID: UIXUVJW4R6ix7E39E2yN6g==
X-CSE-MsgGUID: 0g52SWHnTESmOc+tcnnCcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113889034"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Feb 2025 16:48:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiNOd-0016KB-1y;
	Thu, 13 Feb 2025 00:48:03 +0000
Date: Thu, 13 Feb 2025 08:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/f2fs/f2fs.h:2183:47: error:
 'struct f2fs_rwsem' has no member named 'read_waiters'
Message-ID: <202502130836.Zl5K8dsI-lkp@intel.com>
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
head:   33f3d212e8d80da8f8fb647de5199976d1fc93dd
commit: 29429c25a600ea41fc44db5d8de0f65bce2872ac [1/1] ANDROID: vendor_hooks: add hooks for f2fs down read
config: x86_64-buildonly-randconfig-002-20250213 (https://download.01.org/0day-ci/archive/20250213/202502130836.Zl5K8dsI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130836.Zl5K8dsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130836.Zl5K8dsI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/sysfs.c:17:
   fs/f2fs/f2fs.h: In function 'f2fs_down_read':
>> fs/f2fs/f2fs.h:2183:47: error: 'struct f2fs_rwsem' has no member named 'read_waiters'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                               ^~


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
