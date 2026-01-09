Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB3E3590CF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950786; cv=none; b=Ea7QPN+B9Jq5OPm51EjTHdT+xumTJoUN2Aq/CwWsVfA1GiA8kV4C9DRIklJXyBBjJAcad5Zm9pqn/o1huvFHW/9D2+AeF/SnAFCcHhZ6tosNHhTN7vka739okaV1bI18s/if4lkzuaKl/sX/jAlR1JrDJif+p0n4kG/Kycp4rs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950786; c=relaxed/simple;
	bh=bYksLR56tHTNPpcqOWjxqb4oC8A1bgAp6bm1Qon1oTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EgP1lR9zZXps7jLZK8wxH+Ox6WgpDn7UDwqHBrUF/aZ6d0RgE6Fz+CZ4vEdX1+C4g2wFZz5tPkORxEPbVT14Rk45auVOSzzP9tQ31rxJ/b8jrVP8WGsACXLMViqTCrkv2tJ0DFmRqFFD74ghbswCSWdC6ks997XBp4y9i0aEZ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUVoaumS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUVoaumS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767950784; x=1799486784;
  h=date:from:to:cc:subject:message-id;
  bh=bYksLR56tHTNPpcqOWjxqb4oC8A1bgAp6bm1Qon1oTI=;
  b=gUVoaumSV/74PlblXnzMhHsq3c2dsR66N5FPh1m862qYWq+DjDXgBA8/
   Dcm707P6O6Hl1pdIZ7U+bT8YfurvrkrRC4fyOL+BA//wD3JBA4YDdSSAD
   rpdWdjGiEwTn8NXuwT01vCYMogDGogf3z2njDU2fEKgB365dW2p6tU9vZ
   3xO6gWgpREbBflRTs9zMpKPiEFl4I1OyZacyp/FXoq1yQwDbO9ljCsHbD
   h8yZKHicTCFUazwMVx1rJDP3/C6MWHQhoW/rChdrwtYmHe4L907OgS1p+
   QwmTOh7xF8z+lMZWebRYn3cRvbFx6AnlvSLsyQQvm+qsL0aObUrTxwqLK
   A==;
X-CSE-ConnectionGUID: R+XQ6dwgQmiMKaRWPpDdPg==
X-CSE-MsgGUID: sfuBi4dHStW1ZZCmIkN10Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86919653"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="86919653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:26:22 -0800
X-CSE-ConnectionGUID: bI3tyANFQ/uHIIhUg3RlaQ==
X-CSE-MsgGUID: /9hVUfuzReqiYmhhglwosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="204250818"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2026 01:26:21 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve8l9-0000000022i-1Kjt;
	Fri, 09 Jan 2026 09:26:19 +0000
Date: Fri, 09 Jan 2026 10:26:17 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:user_path_file 2/2] fs/file_table.c:203:5: error:
 no member named 'f_security' in 'struct file'
Message-ID: <202601091049.yCdHuzbH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux user_path_file
head:   e01a54da66bb15db70e9c68e9c4fcfd458fab424
commit: e01a54da66bb15db70e9c68e9c4fcfd458fab424 [2/2] backing_file: store user_path_file
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260109/202601091049.yCdHuzbH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091049.yCdHuzbH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091049.yCdHuzbH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/file_table.c:63:14: warning: no previous prototype for function 'backing_file_user_path_file' [-Wmissing-prototypes]
      63 | struct file *backing_file_user_path_file(struct file *f)
         |              ^
   fs/file_table.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | struct file *backing_file_user_path_file(struct file *f)
         | ^
         | static 
>> fs/file_table.c:203:5: error: no member named 'f_security' in 'struct file'
     203 |         f->f_security   = NULL;
         |         ~  ^
   1 warning and 1 error generated.
--
>> Warning: fs/backing-file.c:35 function parameter 'user_cred' not described in 'backing_file_open'
>> Warning: fs/backing-file.c:35 function parameter 'user_cred' not described in 'backing_file_open'


vim +203 fs/file_table.c

   179	
   180	static void init_file(struct file *f, int flags)
   181	{
   182		spin_lock_init(&f->f_lock);
   183		/*
   184		 * Note that f_pos_lock is only used for files raising
   185		 * FMODE_ATOMIC_POS and directories. Other files such as pipes
   186		 * don't need it and since f_pos_lock is in a union may reuse
   187		 * the space for other purposes. They are expected to initialize
   188		 * the respective member when opening the file.
   189		 */
   190		mutex_init(&f->f_pos_lock);
   191		memset(&f->__f_path, 0, sizeof(f->f_path));
   192		memset(&f->f_ra, 0, sizeof(f->f_ra));
   193	
   194		f->f_flags	= flags;
   195		f->f_mode	= OPEN_FMODE(flags);
   196	
   197		f->f_op		= NULL;
   198		f->f_mapping	= NULL;
   199		f->private_data = NULL;
   200		f->f_inode	= NULL;
   201		f->f_owner	= NULL;
   202		f->f_cred	= NULL;
 > 203		f->f_security	= NULL;
   204	#ifdef CONFIG_EPOLL
   205		f->f_ep		= NULL;
   206	#endif
   207	
   208		f->f_iocb_flags = 0;
   209		f->f_pos	= 0;
   210		f->f_wb_err	= 0;
   211		f->f_sb_err	= 0;
   212	
   213		/*
   214		 * We're SLAB_TYPESAFE_BY_RCU so initialize f_ref last. While
   215		 * fget-rcu pattern users need to be able to handle spurious
   216		 * refcount bumps we should reinitialize the reused file first.
   217		 */
   218		file_ref_init(&f->f_ref, 1);
   219		/*
   220		 * Disable permission and pre-content events for all files by default.
   221		 * They may be enabled later by fsnotify_open_perm_and_set_mode().
   222		 */
   223		file_set_fsnotify_mode(f, FMODE_NONOTIFY_PERM);
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
