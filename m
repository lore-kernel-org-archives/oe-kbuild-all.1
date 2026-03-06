Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3834DCDF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 23:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839577; cv=none; b=GCNsgy0L/GLqQnk8OP9SxYd/etObXME/jQX43Yy7kXj6mRvekX1Z+W2206iQuz4qylvG6WhfZu+PihHgxjlTeadNi5LC4Nj2JbSCowkDeqMVLzIbzsXWQoLRzM+SfM6LPCS7TaeR4fnyx/Fab1GlHuUHwIWqNeJdTxJe6tZxFho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839577; c=relaxed/simple;
	bh=0MU/QKt8ycR5+L9b9XIlEAJqv0jj1OZ3gFialPmmyXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OglZes9YWCvRu1gwh4gDLTp9IX/zEWwOUOzQGjrjRSn5J/U/zfBfFd60m4dOVzQTiy/ebc8OKP9DXIr/kD10tCclxnhGk61mAXEeL/CvAug5OWlwHoSQsYQql7Eplja9PYfGfDESAnCqH5DPdipZOL90mOq8+wQithLWJZTnmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnCROcS6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnCROcS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772839575; x=1804375575;
  h=date:from:to:cc:subject:message-id;
  bh=0MU/QKt8ycR5+L9b9XIlEAJqv0jj1OZ3gFialPmmyXQ=;
  b=gnCROcS6isaXcFgFe5Fas0jDKRLFSCTihT1kZG7ZHpEjj6h9X6TZX422
   YYHmvocYKBxHbOUV/tSDrKZVHd08v+k1rMIi1IZuo+cXcpeGBANbmeKNt
   uADOVk+vWXVwQQAUaOHM7D89p2GSFXZrINnmTVKBa0Sim1020wsd9EO2q
   evpl87ONyBv3enRFDOw9Q2N+BWgWcrHNwZLSyr+XMKUE+n6VYnhLyvlCd
   MlSYpA2eB2eROXhK1Pum8FeIJ+4fRRDkJhkxLnrn7m90PLe/7tSW454wL
   FuCrxjtvlVjcDHI+9YoLT5Ms+elKhd/jpgwPvOV8c3InmALVuM6DuVYPm
   g==;
X-CSE-ConnectionGUID: nn97kaktTW+GHLF7hn6xIQ==
X-CSE-MsgGUID: JxW4xX9pQCKyEe7kb1jyYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77802977"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77802977"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 15:26:15 -0800
X-CSE-ConnectionGUID: a0NYkoMbSpiCOGKB8calPA==
X-CSE-MsgGUID: SUqzwgQuR1CBSK3kDZW3gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="257067943"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2026 15:26:13 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyeYc-000000001TJ-2Nd1;
	Fri, 06 Mar 2026 23:26:10 +0000
Date: Sat, 07 Mar 2026 07:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_mark_userns 4/10] fs/erofs/ishare.c:117:2:
 error: call to undeclared function 'backing_file_set_user_path'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202603070720.Q19LixIn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fan_mark_userns
head:   4d7cad2f077449767de4cc8ab6d869f080a121a2
commit: b66d24d8d654b23fbadf70e520e34d945219e8e5 [4/10] backing_file: store user_path_file
config: i386-randconfig-002-20260307 (https://download.01.org/0day-ci/archive/20260307/202603070720.Q19LixIn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070720.Q19LixIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070720.Q19LixIn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/erofs/ishare.c:109:72: error: too few arguments to function call, expected 3, have 2
     109 |         realfile = alloc_empty_backing_file(O_RDONLY|O_NOATIME, current_cred());
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~                                   ^
   fs/erofs/../internal.h:109:14: note: 'alloc_empty_backing_file' declared here
     109 | struct file *alloc_empty_backing_file(int flags, const struct cred *cred,
         |              ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     110 |                                       const struct cred *user_cred);
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/ishare.c:117:2: error: call to undeclared function 'backing_file_set_user_path'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         backing_file_set_user_path(realfile, &file->f_path);
         |         ^
   fs/erofs/ishare.c:117:2: note: did you mean 'backing_file_open_user_path'?
   fs/erofs/../internal.h:111:6: note: 'backing_file_open_user_path' declared here
     111 | void backing_file_open_user_path(struct file *f, const struct path *path);
         |      ^
   2 errors generated.


vim +/backing_file_set_user_path +117 fs/erofs/ishare.c

5ef3208e3be50aa Hongzhen Luo 2026-01-23  101  
5ef3208e3be50aa Hongzhen Luo 2026-01-23  102  static int erofs_ishare_file_open(struct inode *inode, struct file *file)
5ef3208e3be50aa Hongzhen Luo 2026-01-23  103  {
5ef3208e3be50aa Hongzhen Luo 2026-01-23  104  	struct inode *sharedinode = EROFS_I(inode)->sharedinode;
5ef3208e3be50aa Hongzhen Luo 2026-01-23  105  	struct file *realfile;
5ef3208e3be50aa Hongzhen Luo 2026-01-23  106  
5ef3208e3be50aa Hongzhen Luo 2026-01-23  107  	if (file->f_flags & O_DIRECT)
5ef3208e3be50aa Hongzhen Luo 2026-01-23  108  		return -EINVAL;
5ef3208e3be50aa Hongzhen Luo 2026-01-23 @109  	realfile = alloc_empty_backing_file(O_RDONLY|O_NOATIME, current_cred());
5ef3208e3be50aa Hongzhen Luo 2026-01-23  110  	if (IS_ERR(realfile))
5ef3208e3be50aa Hongzhen Luo 2026-01-23  111  		return PTR_ERR(realfile);
5ef3208e3be50aa Hongzhen Luo 2026-01-23  112  	ihold(sharedinode);
5ef3208e3be50aa Hongzhen Luo 2026-01-23  113  	realfile->f_op = &erofs_file_fops;
5ef3208e3be50aa Hongzhen Luo 2026-01-23  114  	realfile->f_inode = sharedinode;
5ef3208e3be50aa Hongzhen Luo 2026-01-23  115  	realfile->f_mapping = sharedinode->i_mapping;
5ef3208e3be50aa Hongzhen Luo 2026-01-23  116  	path_get(&file->f_path);
5ef3208e3be50aa Hongzhen Luo 2026-01-23 @117  	backing_file_set_user_path(realfile, &file->f_path);
5ef3208e3be50aa Hongzhen Luo 2026-01-23  118  
5ef3208e3be50aa Hongzhen Luo 2026-01-23  119  	file_ra_state_init(&realfile->f_ra, file->f_mapping);
5ef3208e3be50aa Hongzhen Luo 2026-01-23  120  	realfile->private_data = EROFS_I(inode);
5ef3208e3be50aa Hongzhen Luo 2026-01-23  121  	file->private_data = realfile;
5ef3208e3be50aa Hongzhen Luo 2026-01-23  122  	return 0;
5ef3208e3be50aa Hongzhen Luo 2026-01-23  123  }
5ef3208e3be50aa Hongzhen Luo 2026-01-23  124  

:::::: The code at line 117 was first introduced by commit
:::::: 5ef3208e3be50aa08b4e7a2832f34e16d42c08b3 erofs: introduce the page cache share feature

:::::: TO: Hongzhen Luo <hongzhen@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
