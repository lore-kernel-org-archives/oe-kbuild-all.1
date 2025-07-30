Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DDB26CE08
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753864715; cv=none; b=E5u/DEwCz4iHQ0C81vA8CKRf6Veab3gSxUygjOLKESOdMtO3Gl7r5/A+zxHdGU6gkan4F/9w6+4dlt461WHgyc+FI0xv8eSo+VG5eClWiA/RYV0bASVUlgnoiw2aVj3TCxpqvrmmYD/W3u8la1bIkbWEbVVnwaI+41tGLdg42D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753864715; c=relaxed/simple;
	bh=TS8Y6Y3pG8mJ6HhxlTILdV/S88+qGMniOrvnZ5Sc8Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6DQtXKO1bZRObgHXdP7z680YEJVGjkis8fESUdSAzC8C18xpocbvjMdc3WUeB9KYnWN9n60diB0APUL4h+0scT8yIzOkGSfA60BzSLsSvUv4tv8/Hw3T2C8lH06dTvfKA1H1/WoJOqXc7pXsWSRnbXUpaCGUmW6sKzFJCbgrt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkN/hhdU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkN/hhdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753864714; x=1785400714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TS8Y6Y3pG8mJ6HhxlTILdV/S88+qGMniOrvnZ5Sc8Cc=;
  b=WkN/hhdUdNAfFkufz5ZJJIMyCI4gMceUoog4KqWX2TyyzjX4/4svXejg
   PzWvtMJJVONv/xfzPwjAZ246VHN6Qcx6fzum7I7uiweSPCGUMnj0e0FI1
   9H3xJvJbtYn5E+3uFkySQ2b1tQVrfdFLn2nYqLfyfK9D9W3u55Y/4mPI4
   rF8ZxVDuknEb1yq/H8rROlAC3PGBqeesECygI3HUZsF4WkDct8+FbqPfD
   CkIakjuPQbrfDvQf62aGvl3PWeKaxVF7pqBCkInlU3Ae6Oz6ZI2xkcF/2
   M8htAgQyzbAhog3EORayciXsiLRnQVZN9ZftRs68jl2w0KqBMzLvzMrXU
   g==;
X-CSE-ConnectionGUID: XRUqBbz1T5eUGDLvFHMr/w==
X-CSE-MsgGUID: kSufJjyGSSiJcYHHVqAIbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55228156"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55228156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 01:38:33 -0700
X-CSE-ConnectionGUID: 79KZyljMSpq3gKPI7dz0Iw==
X-CSE-MsgGUID: mdjU6I+yR3q+h7NsCNLfBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193920020"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jul 2025 01:38:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh2KT-0002Dc-2Q;
	Wed, 30 Jul 2025 08:38:29 +0000
Date: Wed, 30 Jul 2025 16:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] fs/f2fs/f2fs.h:2189:42: error:
 no member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202507301638.j0J1Z1D2-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e24b0a3d324b3d8cf5abed53f562423e200dcad9
commit: 7a9cbd82c8b5f839a256b5b24b9775b2b09c7cf5 [3/3] ANDROID: vendor_hooks: add hooks for f2fs down read
config: i386-randconfig-141-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301638.j0J1Z1D2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301638.j0J1Z1D2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301638.j0J1Z1D2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
>> fs/f2fs/f2fs.h:2189:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2189 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 error generated.


vim +2189 fs/f2fs/f2fs.h

  2182	
  2183	void _trace_android_rvh_f2fs_down_read(wait_queue_head_t *read_waiters,
  2184					   struct rw_semaphore *rwsem, bool *skip);
  2185	
  2186	static inline void f2fs_down_read(struct f2fs_rwsem *sem)
  2187	{
  2188		bool skip = false;
> 2189		_trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
  2190		if (skip)
  2191			return;
  2192	#ifdef CONFIG_F2FS_UNFAIR_RWSEM
  2193		wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
  2194	#else
  2195		down_read(&sem->internal_rwsem);
  2196	#endif
  2197	}
  2198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
