Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403520FA98
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765523; cv=none; b=tAQWfiTrSQcGbylp77pLG8n+VSB7RuuhuNOQk5isFZGFR6Pttq5shnUwovAVY9sZip97PXohOm+e4gE6pdiAjSwxvGAni7VPJZKguqUliXvgzKGuSN/uvO/G75VZUTjXxEA17HFJsrUdd9HuBNFCSFlbepmn0pXwHSiFWiwPSmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765523; c=relaxed/simple;
	bh=mVLbzkGwQ4AD5W6ZOyn7UJpMrgzkWVuHKyP4aVTrJcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnOXfAVQN+rcna4t5NKarSxGmcFlJmp/Z5tKD5h5jidt61o/d0b4RGc3ALLVEqP9htSwlIRolY/I9wZZkxJGyWIQoKHtvne4X6PAB5FAXKQSCBkFiLtrLeAL2pIEY3AdRHFBfT4lym8jxrL1abh0PnxYv/OQrUJGYmjgq1LTAg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ9YiOlS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ9YiOlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741765522; x=1773301522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVLbzkGwQ4AD5W6ZOyn7UJpMrgzkWVuHKyP4aVTrJcc=;
  b=dJ9YiOlSRBPBzrbba+ECVcbed618DU/QNnROjsWAgikSyRQXvcl16g7O
   7nfMC8zyBnugWV2RD4LqObC6bxxWnJ4HQm5tBi+1QEQ+aYDiOV7SNtX8q
   iGpLMLydqA8mfXnvYqwXFlQc2EOsX/Mxirppg1KlT+nU+UeynkaKpiJVy
   yh9XxkrJ/PLVvouKX34F7h9j1/a7+02R2ilKcddN02vqOW6MF0PnfEHdt
   4uXkY1uJoPrvOtB1vZCB8TDBhu02EjEOu3qvP8lCgiydWY5l9SZ29xLSu
   1Mr67Nadfxb2Kwk53vI/c/vrRRhksiBVgOqpmsa75jvaAf+L/tubuwJG8
   A==;
X-CSE-ConnectionGUID: bac5+pSETbeUr+tjNkXrFQ==
X-CSE-MsgGUID: d/dU4i27Qtyxr7tIAkvR4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46614211"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="46614211"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 00:45:21 -0700
X-CSE-ConnectionGUID: +UjOgzANTB6NVAzdxiY1uQ==
X-CSE-MsgGUID: uQPXZDcWSZi9HXCo7XUb1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125594289"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Mar 2025 00:45:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsGmD-0008Ek-2q;
	Wed, 12 Mar 2025 07:45:17 +0000
Date: Wed, 12 Mar 2025 15:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:xfs-atomic-write-v4-0day 9/12]
 fs/xfs/xfs_file.c:743:15: error: too few arguments to function
 'xfs_file_write_checks'
Message-ID: <202503121507.S15gl7Bc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux xfs-atomic-write-v4-0day
head:   7f5154778e40aa40fdde0b510bee235176a24f5a
commit: 14f058aa56a8844532e0c5ed7838e866e3f32337 [9/12] xfs: Add xfs_file_dio_write_atomic()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250312/202503121507.S15gl7Bc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121507.S15gl7Bc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121507.S15gl7Bc-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_file.c: In function 'xfs_file_dio_write_atomic':
>> fs/xfs/xfs_file.c:743:15: error: too few arguments to function 'xfs_file_write_checks'
     743 |         ret = xfs_file_write_checks(iocb, from, &iolock);
         |               ^~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_file.c:434:1: note: declared here
     434 | xfs_file_write_checks(
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/xfs_file_write_checks +743 fs/xfs/xfs_file.c

   727	
   728	static noinline ssize_t
   729	xfs_file_dio_write_atomic(
   730		struct xfs_inode	*ip,
   731		struct kiocb		*iocb,
   732		struct iov_iter		*from)
   733	{
   734		unsigned int		iolock = XFS_IOLOCK_SHARED;
   735		unsigned int		dio_flags = 0;
   736		ssize_t			ret;
   737	
   738	retry:
   739		ret = xfs_ilock_iocb_for_write(iocb, &iolock);
   740		if (ret)
   741			return ret;
   742	
 > 743		ret = xfs_file_write_checks(iocb, from, &iolock);
   744		if (ret)
   745			goto out_unlock;
   746	
   747		if (dio_flags & IOMAP_DIO_FORCE_WAIT)
   748			inode_dio_wait(VFS_I(ip));
   749	
   750		trace_xfs_file_direct_write(iocb, from);
   751		ret = iomap_dio_rw(iocb, from, &xfs_atomic_write_iomap_ops,
   752				&xfs_dio_write_ops, dio_flags, NULL, 0);
   753	
   754		if (ret == -EAGAIN && !(iocb->ki_flags & IOCB_NOWAIT) &&
   755		    !(dio_flags & IOMAP_DIO_ATOMIC_SW)) {
   756			xfs_iunlock(ip, iolock);
   757			dio_flags = IOMAP_DIO_ATOMIC_SW | IOMAP_DIO_FORCE_WAIT;
   758			iolock = XFS_IOLOCK_EXCL;
   759			goto retry;
   760		}
   761	
   762	out_unlock:
   763		if (iolock)
   764			xfs_iunlock(ip, iolock);
   765		return ret;
   766	}
   767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
