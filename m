Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8B28F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729348418; cv=none; b=oTsQOQ1c6DJNVasS9RGiLJlgq8ZLHkNza3rn2dRX4wcYwifvhdfytjFZ6QLlL3/jxfjJVD8ezAI4NsJklc/HUX94rY1ED5yaPBaSt1Dmn5DAEt/AjNN0hoyd1Me48UEIH/0CqBtkGd1InelZDLOjCOmQM3fwvFLxfSm77LqKYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729348418; c=relaxed/simple;
	bh=oee9P7T6DjEbCPZmLHPl8M1hVgQHXhwIi4GF2jeGLHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iqY/W2vfLz0gCxhquBxZ2tDu0YCaPhRJZpSbiFrHJ8ps8n10xZolBNUR24Cc7kp7eQhKWsaEwKsS0kZp4MzLxRYg+uTr/IYIckYdeVy9EG6zgt+LMD8fx7Wr7TR1E72Tsegv9yw7JfTYRBSDFuEw6wL647s2D7B66+flfMCemTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XM4UK7Q+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XM4UK7Q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729348416; x=1760884416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oee9P7T6DjEbCPZmLHPl8M1hVgQHXhwIi4GF2jeGLHQ=;
  b=XM4UK7Q+ccnMXuDHvIkNpfVu+mlPZbQyWZMcGgwxsKOJKKxxeSloP9RE
   xf832tvAGriPWNM78mOyCj2U4Op3AWqrRg0pfsoKJxN+njUzz5XHFpUpm
   +m0y0+lfq3gA4kFsMUxZexAoGSbcpQ4r/lkTecoK9gj8Ua6PhFGHNwIw1
   SM500eDiOMYBBhY7sJKyp82vwFXkP+Dpox2NPs+qkZAQMTg72gkU8+W8W
   nlrPUkdL+G+IYeIGK+Uw0s3lJu4HyBRqOsmobRXhtDSrPBOX55HGPK+Ee
   C5znbffjLFg5WcDeAloRTCf1dVxbRleffrtfPkQabcc6Y4t/AV1OtOogL
   A==;
X-CSE-ConnectionGUID: 4fPXEeXDQiOBnU5ofrTg0A==
X-CSE-MsgGUID: 1UJWrpyxR7O7fFQtqdbKVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28754770"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28754770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 07:33:36 -0700
X-CSE-ConnectionGUID: Jxwrr5J5RSmNwmhaA6Yxhw==
X-CSE-MsgGUID: NaftmJ0jTWurQtIF6It4MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="83744077"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Oct 2024 07:33:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2AWK-000P4e-2v;
	Sat, 19 Oct 2024 14:33:32 +0000
Date: Sat, 19 Oct 2024 22:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/3] fs/f2fs/f2fs.h:2183:47: error:
 'struct f2fs_rwsem' has no member named 'read_waiters'
Message-ID: <202410192228.5o1PedGq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9f59c8aa7339b2a81478ff2fcace2928263aee67
commit: 29429c25a600ea41fc44db5d8de0f65bce2872ac [2/3] ANDROID: vendor_hooks: add hooks for f2fs down read
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241019/202410192228.5o1PedGq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410192228.5o1PedGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410192228.5o1PedGq-lkp@intel.com/

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
