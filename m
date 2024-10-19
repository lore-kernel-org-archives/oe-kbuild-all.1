Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7E8C144
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729345899; cv=none; b=uPgQlvOX86ccGzA0XiHu6TeU5TxO7AKMmCqCGolqXMt5+ZuyXaawS9nV5itnEEHla4DCNaRrbFJiorXWzbC15U9fdfG6OW5cuua+sM0jrRV5pUz1wG8KagHKSbQrEVyhQtP/KGX1J/3+pKv0i/n3luxkmMSqCSPuClHK3Ak2KE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729345899; c=relaxed/simple;
	bh=d3D3jlTs3vJPRzRP1jgNJG+KtsKKv2C8fZ0UCvKToTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uqVd/LdH8yYv479xfpoQyh6nOTaVmMAtzxrhu6Chjjr7SXa5f6mQggcXgBspQjkeMGOiI+VHkW7bSQeHW9qHjnkbb1G3hGlhDQHc1y+K9uIub6nvepgwF2Dc851diOal/OxGpJD/cg260jOFaJvXPWReiceCmFBpaTjMcgKkEl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEbacdOL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEbacdOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729345896; x=1760881896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d3D3jlTs3vJPRzRP1jgNJG+KtsKKv2C8fZ0UCvKToTE=;
  b=kEbacdOLojBC65GLVPNlGyV+VBeVSRjsEduSCpgIYsGnibBz47KRjCPr
   OqpVic1xaMy1ah+Jfee2LZynCDRxCnl/NE7iGqcckudifGj6SuVQ//z8r
   met7WRIUDlcPIBD/WPVCGk9niKaHpkVgv0uPPoFg4GIFi9jqOMqNTjG1U
   mEcaLffRXbfonLoZuyM7JP+x/GlR5R/HexfhMOd1+1kCbzXp4YqapbDMq
   sLDQXgJXlmVCD3O1jIYsMFp6wqYvRaUFXkGeBshUGGB6MUbqckaZckBL/
   jl06dwOyPjk60AZc0i3wurDWAfbMesWl+XtvhFMP5MoPnYk/8wLpztoF3
   w==;
X-CSE-ConnectionGUID: PjxabghQQIOt6I3dUkO/dg==
X-CSE-MsgGUID: JSX4uc72SxakmLnZVNkIng==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="32671949"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="32671949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 06:51:36 -0700
X-CSE-ConnectionGUID: udY38Gc4StOqANPN+45Nyg==
X-CSE-MsgGUID: W3yhjvlnShCstRAznDbMVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79259721"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2024 06:51:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t29rf-000P3F-2q;
	Sat, 19 Oct 2024 13:51:31 +0000
Date: Sat, 19 Oct 2024 21:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/3] fs/f2fs/f2fs.h:2183:42: error: no
 member named 'read_waiters' in 'struct f2fs_rwsem'
Message-ID: <202410192157.53pfQt4P-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241019/202410192157.53pfQt4P-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410192157.53pfQt4P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410192157.53pfQt4P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
>> fs/f2fs/f2fs.h:2183:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   1 error generated.
--
   In file included from fs/f2fs/file.c:28:
>> fs/f2fs/f2fs.h:2183:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   fs/f2fs/file.c:41:12: warning: no previous prototype for function 'f2fs_filemap_fault' [-Wmissing-prototypes]
      41 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         |            ^
   fs/f2fs/file.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         | ^
         | static 
   1 warning and 1 error generated.
--
   In file included from fs/f2fs/data.c:25:
>> fs/f2fs/f2fs.h:2183:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   fs/f2fs/data.c:2413:10: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2413 |         pgoff_t index;
         |                 ^
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
