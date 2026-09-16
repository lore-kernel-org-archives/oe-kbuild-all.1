Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623392D7DE7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 04:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532061; cv=none; b=DRe3HGgP+V/sm+W03ZmA6T1lXyFSBCny4csGsf+L/iqvHhhpuM6JoO87gSRwRqQYQ5gE0YqDtsXsdW5EaOx4K4z9fCrDlIWOpV09g5yhfpMxNTphTGTJJ2HOViIQBivouZklZg21XvQ8A+wjb+QVLcal5y0JkMWOi2sFnl5vPkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532061; c=relaxed/simple;
	bh=njBBmc4kY3z4z3cV40OGqhkjkCVTorqh8hszwFm/yPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sSfTyEz3yIjbbnikvgpXq9l7tUHIEfYUgQW8Y0S+oYw4G+6TCHyoyf611iCBpbTsNZ/rOJzRXHWMkthDX7ldTd46rhlN7I3UyF4MXfJ+VbKkc/uTJ5hz6Ajh8louUzPz8s2uSTLedkePZoiqTam+iqglg5oyD7Fhf0BN1DkoYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oy9ZG3QT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oy9ZG3QT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789532060; x=1821068060;
  h=date:from:to:cc:subject:message-id;
  bh=njBBmc4kY3z4z3cV40OGqhkjkCVTorqh8hszwFm/yPw=;
  b=Oy9ZG3QT1Gz5SerYlZImgS1AspL/94C0Glm3GPrTDEUN+PREwgsWll97
   tvtWpu6eQ8ypB7TOgHb0O0TwO6DMtNdSsET6tj4hKYk+kbjO6ARkBrSez
   yzMxA2+R8POiQokEAIkybSkSiftWKjDj3ACSY6+TFbNnrwdd01F0JEDnn
   f0BoNNQO41f/aqWcv99j9Qveuqabvbx3hd8b9WzqVAgDfb67B1b1vcUcS
   TsHMqwODx9Yq3lpOvgljEf13mOUi5ZHpoMo93sgNqA9LMQtgpfZXjIWMK
   gI+EXufShXX/tX1cqYzpEsHZo6HrpRZH3DyobA8BTjx80X+QoO5CEkmYx
   Q==;
X-CSE-ConnectionGUID: GLYvlXt7TB+Y6su7zDbYwA==
X-CSE-MsgGUID: TW+gFrZ6S76mzfGDt84duw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89947480"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89947480"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:14:19 -0700
X-CSE-ConnectionGUID: zg7vka8STFuII205E9zDhw==
X-CSE-MsgGUID: Rs3fsd7oROS3diGzHV0rXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276742343"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Sep 2026 21:14:18 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6h2F-000000000vH-0rJh;
	Wed, 16 Sep 2026 04:14:15 +0000
Date: Wed, 16 Sep 2026 06:13:54 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 0/2]
 fs/fuse/fuse_bpf_backing.c:1973:50-51: Unneeded semicolon
Message-ID: <202609160640.5NNFGTWD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   e6b87e11eff11fa0feb518d0e1ec06b3b700b129
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [0/2] ANDROID: fuse-bpf: fuse-bpf v1.3
config: x86_64-randconfig-102-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160640.5NNFGTWD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160640.5NNFGTWD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/fuse/fuse_bpf_backing.c:1973:50-51: Unneeded semicolon

vim +1973 fs/fuse/fuse_bpf_backing.c

  1964	
  1965	static void fuse_stat_to_attr(struct fuse_conn *fc, struct inode *inode,
  1966			struct kstat *stat, struct fuse_attr *attr)
  1967	{
  1968		unsigned int blkbits;
  1969	
  1970		/* see the comment in fuse_change_attributes() */
  1971		if (fc->writeback_cache && S_ISREG(inode->i_mode)) {
  1972			stat->size = i_size_read(inode);
> 1973			stat->mtime.tv_sec = inode_get_mtime_sec(inode);;
  1974			stat->mtime.tv_nsec = inode_get_mtime_nsec(inode);
  1975			stat->ctime.tv_sec = inode_get_ctime_sec(inode);
  1976			stat->ctime.tv_nsec = inode_get_ctime_nsec(inode);
  1977		}
  1978	
  1979		attr->ino = stat->ino;
  1980		attr->mode = (inode->i_mode & S_IFMT) | (stat->mode & 07777);
  1981		attr->nlink = stat->nlink;
  1982		attr->uid = from_kuid(fc->user_ns, stat->uid);
  1983		attr->gid = from_kgid(fc->user_ns, stat->gid);
  1984		attr->atime = stat->atime.tv_sec;
  1985		attr->atimensec = stat->atime.tv_nsec;
  1986		attr->mtime = stat->mtime.tv_sec;
  1987		attr->mtimensec = stat->mtime.tv_nsec;
  1988		attr->ctime = stat->ctime.tv_sec;
  1989		attr->ctimensec = stat->ctime.tv_nsec;
  1990		attr->size = stat->size;
  1991		attr->blocks = stat->blocks;
  1992	
  1993		if (stat->blksize != 0)
  1994			blkbits = ilog2(stat->blksize);
  1995		else
  1996			blkbits = inode->i_sb->s_blocksize_bits;
  1997	
  1998		attr->blksize = 1 << blkbits;
  1999	}
  2000	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
