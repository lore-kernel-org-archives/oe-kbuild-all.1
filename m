Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73577111
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 23:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745538910; cv=none; b=fgf8WHlvGfolM50OCeVX1G/9GP91FR4VT5t5i3Y3ri9QM+6eZec63M62qaosXiARI+0PB/6Qny542yfZ6nP2WEe+XWC8sFU0roTc91kaP3Oki4v/QGZ/vVYJ49HINpfqlWt+mNds+7yocKsqCykH33k+ywjiGafIW2cnbCJ8Ej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745538910; c=relaxed/simple;
	bh=ln403cV9H5ENkmXkbZlfg4Ef5XEHYJiMM3JbZGdB+SI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhYGkZlvDtyaTiTgEWkm2Cg9V/dGdxqRtJwJnrd8SKSQMzlRt6H+24o7jUwRJKW+mcaw+/GksjeN5Qkc1Eju4VZr0zvkEb7G91ROmWARV1gh2viB/55Kk2nRsOEQLING3AMVw+eMSMnwkmmTRCcADHHRuOzsJfxSMtgGwvdkFnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9hkPjNd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9hkPjNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745538907; x=1777074907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ln403cV9H5ENkmXkbZlfg4Ef5XEHYJiMM3JbZGdB+SI=;
  b=F9hkPjNdqPUt0J5RdGOfFHgKEgJ73pokesKNedItIG04qw3etMtima+f
   8AYvMEHFNrX6X4UigNsNKlILL0Y0jirRKfIkr8qe0F9+O6wrgDgHkKaM6
   W96t0UG22zwmvczHOW5AEmJkPIpGUKAuMWu80P05Habz7cgVgbRTAntV9
   cUbYsJVnwvrrf/AgFD5N0DOU64D50ca1UjTL+JXcEar9Mj/nmihalBGrP
   gYTPTdjG1HipzHSA3KuYuFNt+1NVgKDOx1zv84n12kFG1zDd8fX9m6uYF
   NJumOUk/uVWxpjVlyMQUian/HWzIQb58e0aOvQCvFByNlxbF261Qtp751
   Q==;
X-CSE-ConnectionGUID: Gkwo6A6xRKagErqQDXmqsg==
X-CSE-MsgGUID: uJzZcuX/SaewyFJDnIwP+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47329190"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="47329190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 16:55:07 -0700
X-CSE-ConnectionGUID: JibMcxrZSTmp6GOmbuAD5Q==
X-CSE-MsgGUID: M4XhOBQCREOVQzPt6pinfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="137557862"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Apr 2025 16:55:05 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u86PH-0004fd-2o;
	Thu, 24 Apr 2025 23:55:03 +0000
Date: Fri, 25 Apr 2025 07:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 14/14]
 fs/f2fs/f2fs.h:2189:42: error: no member named 'read_waiters' in 'struct
 f2fs_rwsem'
Message-ID: <202504250707.tcVUvEgd-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6f5ca3715b0a5bc576e642ca1e2f2d3a86c9090e
commit: 7a9cbd82c8b5f839a256b5b24b9775b2b09c7cf5 [14/14] ANDROID: vendor_hooks: add hooks for f2fs down read
config: arm-randconfig-003-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250707.tcVUvEgd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250707.tcVUvEgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250707.tcVUvEgd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/recovery.c:12:
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
