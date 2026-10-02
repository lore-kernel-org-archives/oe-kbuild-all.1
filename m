Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B413E1686
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 06:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921513; cv=none; b=R+ihvR+pH2+2697MWnCpKgTrL52C3qi/zrR3MkK6eI8KXxPPUQRWyRxI+UbkJPaPVbkqoDcX++3gzFnf0qaiUytsDbwj6H0Bga9sFGk8SDdCBvXZmMxpQ8zxKUcKXKlsJfTcB898LNOtiht/QnDcc3T5Ivu4IHZ98NQMwvpLmcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921513; c=relaxed/simple;
	bh=n42oK1beAAc6jVdbcwjEnG5GUM/+/7uAiy6QbxkKd5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W0+ttRbCrFfRYQnr0N4GNN0TUQ0+0yP2wmbRNrboACLyt0NIyKmhtj/PiNvYe4q3jnV2aX5J8xdvdOHDhpYjnhtMrE4CwgnLhPFszzdQVouBx/eXehd6jaaj4UI7mTLfdKF59zm8SW0eE51vxqhqc7Rm9C8ckgB8S8x+FPZZw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhkdwJ/5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhkdwJ/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790921512; x=1822457512;
  h=date:from:to:cc:subject:message-id;
  bh=n42oK1beAAc6jVdbcwjEnG5GUM/+/7uAiy6QbxkKd5k=;
  b=nhkdwJ/59hnpA2XiUgyf3r+AwJsQi18eVEvf7/CYM8jdw+bmMv7bjVGN
   4OGFA/sVzFemrkpqugHbaFxt8yROewj2twjQueP+p3QXcO1TvD/QThJdj
   lZ8a17cLerKHBDr8mzPxQlQFrJdfnIxnUGL6TChy3qzKW0Uxro4dkWMpW
   x1EaCwNKuzgcp/1zvBaG7QgeudYI994LQzgi8s7YcNdcFjA4ZUuOQeJ1s
   XU5qvSPu6tBlFIL1eiyy0GgNdvc1oJYZ9XE5DzUoz0klLtnKTCMAZo5bs
   neJ4jG4J4Akm21IorvT7tUWJiX3KQMsQbYs2HFyDzrpSi/Z2TmYJOB40v
   g==;
X-CSE-ConnectionGUID: ug/UG72qReO3FgGrZXi1eA==
X-CSE-MsgGUID: Cr8k/P5NTZGJ2bSwrp7tFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91707597"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91707597"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 23:11:51 -0700
X-CSE-ConnectionGUID: jJ+KTfb0RZiJ/2fDKiIEOQ==
X-CSE-MsgGUID: n8QfWtstSj6m0U+pcX1qyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275715553"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Oct 2026 23:11:49 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCWUi-000000000Qs-1RUR;
	Fri, 02 Oct 2026 06:11:44 +0000
Date: Fri, 02 Oct 2026 08:11:29 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map-v2 22/28] fs/fuse/iomode.c:231:11:
 warning: variable 'err' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202610020858.9R8H2Vqa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v2
head:   5c4fbaa4906d18f12935a5920c3b789b827a1b01
commit: ba6831ba66ccaf841f3cda3e6fc8dca0d8689cf1 [22/28] fuse: add helpers for EIO return value with kernel message
config: sparc64-randconfig-r2307-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020858.9R8H2Vqa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020858.9R8H2Vqa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020858.9R8H2Vqa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/iomode.c:231:11: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     231 |         else if (!fuse_file_cached_io_open(inode, ff))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/iomode.c:234:9: note: uninitialized use occurs here
     234 |         return err;
         |                ^~~
   fs/fuse/iomode.c:231:7: note: remove the 'if' if its condition is always true
     231 |         else if (!fuse_file_cached_io_open(inode, ff))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     232 |                 err = fuse_EIO("conflicting passthrough open");
   fs/fuse/iomode.c:193:9: note: initialize the variable 'err' to silence this warning
     193 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +231 fs/fuse/iomode.c

   187	
   188	/* Request access to submit new io to inode via open file */
   189	int fuse_file_io_open(struct file *file, struct inode *inode)
   190	{
   191		struct fuse_file *ff = file->private_data;
   192		struct fuse_inode *fi = get_fuse_inode(inode);
   193		int err;
   194	
   195		/*
   196		 * io modes are not relevant with virtiofs DAX and with server that does not
   197		 * implement open.
   198		 */
   199		if (FUSE_IS_VDAX(inode) || !ff->args)
   200			return 0;
   201	
   202		/*
   203		 * Server is expected to use FOPEN_PASSTHROUGH for all opens of an inode
   204		 * which is already open for passthrough.  Using incorrect open mode is
   205		 * a server mistake, which results in user visible failure of open()
   206		 * with EIO error.
   207		 */
   208		if (fuse_inode_backing(fi) && !(ff->open_flags & FOPEN_PASSTHROUGH))
   209			return fuse_EIO("FOPEN_PASSTHROUGH expected");
   210	
   211		/*
   212		 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
   213		 */
   214		if (!(ff->open_flags & FOPEN_DIRECT_IO))
   215			ff->open_flags &= ~FOPEN_PARALLEL_DIRECT_WRITES;
   216	
   217		/*
   218		 * First passthrough file open denies caching inode io mode.
   219		 * First caching file open enters caching inode io mode.
   220		 *
   221		 * Note that if user opens a file open with O_DIRECT, but server did
   222		 * not specify FOPEN_DIRECT_IO, a later fcntl() could remove O_DIRECT,
   223		 * so we put the inode in caching mode to prevent parallel dio.
   224		 */
   225		if ((ff->open_flags & FOPEN_DIRECT_IO) &&
   226		    !(ff->open_flags & FOPEN_PASSTHROUGH))
   227			return 0;
   228	
   229		if (ff->open_flags & FOPEN_PASSTHROUGH)
   230			err = fuse_file_passthrough_open(inode, file);
 > 231		else if (!fuse_file_cached_io_open(inode, ff))
   232			err = fuse_EIO("conflicting passthrough open");
   233	
   234		return err;
   235	}
   236	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
