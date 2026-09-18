Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE33A8755
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723286; cv=none; b=WOjaxJpo/1TVWrivgo5fiQ1fTEjPrsWA2V+iMAs3OKZiW5kg/BVgbJhP/y0DWl/5KsX/LfMi7Ppur2YJHJC9syacb2RAPkZi1dZZjOLC6H+F37rBsWZ7c+LU4WhQM3weV32U+Ruy+1myI5oAuV51x9AHhYmYEUXK2GKThC4T0nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723286; c=relaxed/simple;
	bh=sugcK8kk4oPBwqTOpLxifPNArF3H6+7L4KX1z9Qsb94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N3V0Em6WeZeMKJgdld8neUVN3r2QK3QPV+Vvvd8hB4wazP7ojIsQxn0SxF/S0X3uBWp2GI328GbHUzzhpyut2jrTVyNSg2mwFWN2TYmqqR2m+Ev+jwuB72448hpRTUlZ3aqKG6ldB5eUuOTS7HWIr9g1hifvsIguMYOp1NFyEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWduPns9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWduPns9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789723285; x=1821259285;
  h=date:from:to:cc:subject:message-id;
  bh=sugcK8kk4oPBwqTOpLxifPNArF3H6+7L4KX1z9Qsb94=;
  b=JWduPns9Y6ZpPFryd4aLI416sxqzxq+OY5SAL3SCRtEmj/QDsIkdkOQp
   Y9J3oo3i3NdKa37ft/+y8HMbJogLwdHu0K48ZKVOjatNDcWmVfkfbo97X
   RG7vrQtNPoqvjmJjm/dQSwaq5tIAmg7nLWSsiFzs60gwxFAnQfYzj0Mlt
   t7tNpcgaYl8meawFaRLPQRIEItFAaoNKWDdvYfHIHT8l+BhoehSnGXrS/
   bTz3nlUH1s73KDcQOBrbcykwTiPwKLJWiFsKb7JbL0ebWjQn/UBRPMbkS
   KP/F6wDEzFGClKpfQmgTSYbiAtoQUQgW569C2tm1iXO+FYNls/iWknhn1
   w==;
X-CSE-ConnectionGUID: jFR8RNzDRw6yQFD3G4NsSA==
X-CSE-MsgGUID: NrfOaCflQfS7S6mG0N5wQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90082779"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90082779"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:21:22 -0700
X-CSE-ConnectionGUID: 9bVMfRTGTpulN8zJx3D//g==
X-CSE-MsgGUID: ivE6KdaQR/qj+n3fDxJhOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297781972"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2026 02:21:21 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7UmV-00000000132-0Fiz;
	Fri, 18 Sep 2026 09:21:19 +0000
Date: Fri, 18 Sep 2026 11:20:43 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 fs/fuse/backing.c:1928:50-51: Unneeded semicolon
Message-ID: <202609181136.tA8jaaJH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17176090d7cd105744a132763a325200ccb3840b
commit: 8be90ef631b70dedc3c43b247aeae296a633dcb2 [0/3] ANDROID: fuse-bpf: fuse-bpf v1.2
config: i386-randconfig-2101-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181136.tA8jaaJH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181136.tA8jaaJH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:1928:50-51: Unneeded semicolon

vim +1928 fs/fuse/backing.c

  1919	
  1920	static void fuse_stat_to_attr(struct fuse_conn *fc, struct inode *inode,
  1921			struct kstat *stat, struct fuse_attr *attr)
  1922	{
  1923		unsigned int blkbits;
  1924	
  1925		/* see the comment in fuse_change_attributes() */
  1926		if (fc->writeback_cache && S_ISREG(inode->i_mode)) {
  1927			stat->size = i_size_read(inode);
> 1928			stat->mtime.tv_sec = inode_get_mtime_sec(inode);;
  1929			stat->mtime.tv_nsec = inode_get_mtime_nsec(inode);
  1930			stat->ctime.tv_sec = inode_get_ctime_sec(inode);
  1931			stat->ctime.tv_nsec = inode_get_ctime_nsec(inode);
  1932		}
  1933	
  1934		attr->ino = stat->ino;
  1935		attr->mode = (inode->i_mode & S_IFMT) | (stat->mode & 07777);
  1936		attr->nlink = stat->nlink;
  1937		attr->uid = from_kuid(fc->user_ns, stat->uid);
  1938		attr->gid = from_kgid(fc->user_ns, stat->gid);
  1939		attr->atime = stat->atime.tv_sec;
  1940		attr->atimensec = stat->atime.tv_nsec;
  1941		attr->mtime = stat->mtime.tv_sec;
  1942		attr->mtimensec = stat->mtime.tv_nsec;
  1943		attr->ctime = stat->ctime.tv_sec;
  1944		attr->ctimensec = stat->ctime.tv_nsec;
  1945		attr->size = stat->size;
  1946		attr->blocks = stat->blocks;
  1947	
  1948		if (stat->blksize != 0)
  1949			blkbits = ilog2(stat->blksize);
  1950		else
  1951			blkbits = inode->i_sb->s_blocksize_bits;
  1952	
  1953		attr->blksize = 1 << blkbits;
  1954	}
  1955	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
