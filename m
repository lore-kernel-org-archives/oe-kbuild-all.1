Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752B29D26C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755228453; cv=none; b=WPYyN7GtYhALzU2r38WvmKf3oesnME2+ot78VdaLOTidlNrO0MIKemLQvMFp2Ym5F4lJakkOvLC+ySbvfKqoKGCGz4nuqZSK7v7fAhix2xGf5OdGGH9DQ3fCQkpmaoYQrW1/I6/kXUayYK12aBnxSQl8O0Fr0eZ5RK/hlLpgC0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755228453; c=relaxed/simple;
	bh=aqYOEWf1zWeaENrtnV1xqvs+SjWUNGVaMkWzHJ26DpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C37TH5ghw6bnCYyPv5wmNJS4+sYrdZyR2zNn/exQ6fIe8qBMRP6tjSQRJf8iH3TGvGUaLAsPORI6bGNCwPeIorTEiWwoJ5h09vhXJPVEQQMt85NVbsAz1UyCRT7gOr1Dv+6140hdw6JQCMwr5YfzuWwyVTkmZeppnYKof+TQ7Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZJjHRd8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZJjHRd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755228451; x=1786764451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aqYOEWf1zWeaENrtnV1xqvs+SjWUNGVaMkWzHJ26DpE=;
  b=BZJjHRd8YdXwAFgpA6gYxeSFANbbVjDccEcN8zGhoYTh1BMDcJgn/gyB
   zxd2St60y6max/A3Yy+Woc/dYihB9fKMrV2hf+r7zPF/Z13vdoIHeWLhG
   0N0rODmZ0k4KMxhJ8GQSIw1CGDEtPE8/jn2C/iZLwNtRBb7T/EmDMqeS1
   H2dGzcOfNPiGHg3x9hpnMf3z5cP3SEZLAccCUdVuxTjNqRWUlolJ7sPvy
   W2KO+Qn+B4tWpFM+0Rsf6T3UnaVH4/F8jDcYly5zGXztMkAMYeVTovHns
   UKs+QFkZyBWiRG7VotdfYgMcLVh3ZHUMlKf6SZkekkS4qfpVtTe6fOFlx
   g==;
X-CSE-ConnectionGUID: KaW2O53qQAeU5Gq0oi+qoA==
X-CSE-MsgGUID: IpK7JM2LSjqeoVsRIgtcgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68931422"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68931422"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 20:27:31 -0700
X-CSE-ConnectionGUID: iA7ksRqkQIOcDjuzfXyA6g==
X-CSE-MsgGUID: Ba0aKl1nRNy9bOWNSonzmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166836596"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 14 Aug 2025 20:27:30 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uml6G-0000PX-0B;
	Fri, 15 Aug 2025 03:27:28 +0000
Date: Fri, 15 Aug 2025 05:27:04 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1755/1755] fs/xattr.c:222: warning:
 Function parameter or member 'dentry' not described in
 '__vfs_setxattr_locked'
Message-ID: <202508150542.jyItpbw4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8723dc57de6371f9cc8764e15d4cc9e57ae592ee
commit: 9f6e50a6f05d96c8ae495e278d86daa132b84085 [1755/1755] xattr: break delegations in {set, remove}xattr
config: x86_64-buildonly-randconfig-2002-20250811 (https://download.01.org/0day-ci/archive/20250815/202508150542.jyItpbw4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150542.jyItpbw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150542.jyItpbw4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xattr.c:171: warning: Function parameter or member 'dentry' not described in '__vfs_setxattr_noperm'
   fs/xattr.c:171: warning: Function parameter or member 'name' not described in '__vfs_setxattr_noperm'
   fs/xattr.c:171: warning: Function parameter or member 'value' not described in '__vfs_setxattr_noperm'
   fs/xattr.c:171: warning: Function parameter or member 'size' not described in '__vfs_setxattr_noperm'
   fs/xattr.c:171: warning: Function parameter or member 'flags' not described in '__vfs_setxattr_noperm'
>> fs/xattr.c:222: warning: Function parameter or member 'dentry' not described in '__vfs_setxattr_locked'
>> fs/xattr.c:222: warning: Function parameter or member 'name' not described in '__vfs_setxattr_locked'
>> fs/xattr.c:222: warning: Function parameter or member 'value' not described in '__vfs_setxattr_locked'
>> fs/xattr.c:222: warning: Function parameter or member 'size' not described in '__vfs_setxattr_locked'
>> fs/xattr.c:222: warning: Function parameter or member 'flags' not described in '__vfs_setxattr_locked'
>> fs/xattr.c:222: warning: Function parameter or member 'delegated_inode' not described in '__vfs_setxattr_locked'
>> fs/xattr.c:429: warning: Function parameter or member 'dentry' not described in '__vfs_removexattr_locked'
>> fs/xattr.c:429: warning: Function parameter or member 'name' not described in '__vfs_removexattr_locked'
>> fs/xattr.c:429: warning: Function parameter or member 'delegated_inode' not described in '__vfs_removexattr_locked'


vim +222 fs/xattr.c

b1ab7e4b2a88d3 David P. Quigley     2009-09-03  205  
9f6e50a6f05d96 Frank van der Linden 2020-09-22  206  /**
9f6e50a6f05d96 Frank van der Linden 2020-09-22  207   * __vfs_setxattr_locked: set an extended attribute while holding the inode
9f6e50a6f05d96 Frank van der Linden 2020-09-22  208   * lock
9f6e50a6f05d96 Frank van der Linden 2020-09-22  209   *
9f6e50a6f05d96 Frank van der Linden 2020-09-22  210   *  @dentry - object to perform setxattr on
9f6e50a6f05d96 Frank van der Linden 2020-09-22  211   *  @name - xattr name to set
9f6e50a6f05d96 Frank van der Linden 2020-09-22  212   *  @value - value to set @name to
9f6e50a6f05d96 Frank van der Linden 2020-09-22  213   *  @size - size of @value
9f6e50a6f05d96 Frank van der Linden 2020-09-22  214   *  @flags - flags to pass into filesystem operations
9f6e50a6f05d96 Frank van der Linden 2020-09-22  215   *  @delegated_inode - on return, will contain an inode pointer that
9f6e50a6f05d96 Frank van der Linden 2020-09-22  216   *  a delegation was broken on, NULL if none.
9f6e50a6f05d96 Frank van der Linden 2020-09-22  217   */
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  218  int
9f6e50a6f05d96 Frank van der Linden 2020-09-22  219  __vfs_setxattr_locked(struct dentry *dentry, const char *name,
9f6e50a6f05d96 Frank van der Linden 2020-09-22  220  		const void *value, size_t size, int flags,
9f6e50a6f05d96 Frank van der Linden 2020-09-22  221  		struct inode **delegated_inode)
b1ab7e4b2a88d3 David P. Quigley     2009-09-03 @222  {
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  223  	struct inode *inode = dentry->d_inode;
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  224  	int error;
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  225  
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  226  	error = xattr_permission(inode, name, MAY_WRITE);
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  227  	if (error)
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  228  		return error;
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  229  
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  230  	error = security_inode_setxattr(dentry, name, value, size, flags);
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  231  	if (error)
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  232  		goto out;
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  233  
9f6e50a6f05d96 Frank van der Linden 2020-09-22  234  	error = try_break_deleg(inode, delegated_inode);
9f6e50a6f05d96 Frank van der Linden 2020-09-22  235  	if (error)
9f6e50a6f05d96 Frank van der Linden 2020-09-22  236  		goto out;
9f6e50a6f05d96 Frank van der Linden 2020-09-22  237  
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  238  	error = __vfs_setxattr_noperm(dentry, name, value, size, flags);
b1ab7e4b2a88d3 David P. Quigley     2009-09-03  239  
5be196e5f925da Christoph Hellwig    2006-01-09  240  out:
9f6e50a6f05d96 Frank van der Linden 2020-09-22  241  	return error;
9f6e50a6f05d96 Frank van der Linden 2020-09-22  242  }
9f6e50a6f05d96 Frank van der Linden 2020-09-22  243  EXPORT_SYMBOL_GPL(__vfs_setxattr_locked);
9f6e50a6f05d96 Frank van der Linden 2020-09-22  244  

:::::: The code at line 222 was first introduced by commit
:::::: b1ab7e4b2a88d3ac13771463be8f302ce1616cfc VFS: Factor out part of vfs_setxattr so it can be called from the SELinux hook for inode_setsecctx.

:::::: TO: David P. Quigley <dpquigl@tycho.nsa.gov>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
