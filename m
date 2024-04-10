Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C36C1E893
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712746063; cv=none; b=QXDHPLjk8c3FA9mLhnHWDKFLmjtOGPZE7h855/4Yw3u7sdDwnNPPB+Qa8P0yJfBquRZlZUQdfr0wwXmlvKYaJqR1jRq1wxbbDLJVEnw1b1+gjR8AFzYNVBa8ilB7wraUqKTrLhk7a65LDh4Un7fdPdKECbFevMh6rC9Ani94eCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712746063; c=relaxed/simple;
	bh=LSEDY7jl83lbvQv0sne2v5NsfIEZ82E7EHUYccK4lJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZWHkV0fYVU+IsYy9u8B2LyPWfeC1U4cOF1I270J2S5UvFf/O2qZo9iafdyY35PgSMXztQGiIzf9WLrfLtaSKxEiaK3awCqz+MZVaUaKJWEPWgP2Ls1bcqNujqhDE166uVnP71QLaBsCT56IRHGktMHQ2AjWfs2OEQuRzwcb/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZjiOp/a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZjiOp/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712746062; x=1744282062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSEDY7jl83lbvQv0sne2v5NsfIEZ82E7EHUYccK4lJw=;
  b=mZjiOp/adMwHQn+y4e7KbuuDA4B3bxqyHL7yi90lFcIBLlVVjg5nUTap
   L+3WRYUgoI3lnSiLU4Kko5wdDUgRsKmZeFxhDVypZP2fn1qpTtGA/UcGu
   wJ21mt+9712q1hs+RhpWCRReQKABktRMT+WfRl9sDht2clbNrnqcbShyp
   mCKyUt/3ecga8ZP7abGh1Z3Z5258pAoAp8OcPSdQl/E4/TIQPQRLGI1M1
   R65D5+USmHqVXnIK5oJgndUhgg3vLuIh2yaTFSLpMZNSMga1sBoOoqqPR
   hSKFndJ3m5gAaa5gq+pRmgKaO3uzNnWBfCC18ETsPSoqYP7z3Gdb6D3eo
   g==;
X-CSE-ConnectionGUID: x2CrA0DiT4q0t8by9TEpag==
X-CSE-MsgGUID: kw7CEHkZReC2lyBAEXFkJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7957511"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7957511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 03:47:41 -0700
X-CSE-ConnectionGUID: LQz93kGoSFa1YSh3x8yTAg==
X-CSE-MsgGUID: m/w1r70BRE6OjGG4tTkAAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="43760545"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2024 03:47:40 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruVUP-0007E6-1B;
	Wed, 10 Apr 2024 10:47:37 +0000
Date: Wed, 10 Apr 2024 18:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 360/367] drivers/sbus/char/oradax.c:217:33:
 error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)'
 {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible
 pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {ak...
Message-ID: <202404101801.F0Kpv1kP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ad69a5a8c930e58537ce092334af08caaa412900
commit: aacad67149b1cfcbbc59bdf278ba5713ed86e0bb [360/367] sbus: oradax: convert to read/write iterators
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101801.F0Kpv1kP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101801.F0Kpv1kP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101801.F0Kpv1kP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/sbus/char/oradax.c:217:33: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
     217 |         .read_iter      =       dax_read,
         |                                 ^~~~~~~~
   drivers/sbus/char/oradax.c:217:33: note: (near initialization for 'dax_fops.read_iter')
>> drivers/sbus/char/oradax.c:218:33: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, const char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
     218 |         .write_iter     =       dax_write,
         |                                 ^~~~~~~~~
   drivers/sbus/char/oradax.c:218:33: note: (near initialization for 'dax_fops.write_iter')
>> drivers/sbus/char/oradax.c:544:16: error: conflicting types for 'dax_read'; have 'ssize_t(struct kiocb *, struct iov_iter *)' {aka 'long int(struct kiocb *, struct iov_iter *)'}
     544 | static ssize_t dax_read(struct kiocb *iocb, struct iov_iter *to)
         |                ^~~~~~~~
   drivers/sbus/char/oradax.c:207:16: note: previous declaration of 'dax_read' with type 'ssize_t(struct file *, char *, size_t,  loff_t *)' {aka 'long int(struct file *, char *, long unsigned int,  long long int *)'}
     207 | static ssize_t dax_read(struct file *filp, char __user *buf,
         |                ^~~~~~~~
>> drivers/sbus/char/oradax.c:561:16: error: conflicting types for 'dax_write'; have 'ssize_t(struct kiocb *, struct iov_iter *)' {aka 'long int(struct kiocb *, struct iov_iter *)'}
     561 | static ssize_t dax_write(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~
   drivers/sbus/char/oradax.c:209:16: note: previous declaration of 'dax_write' with type 'ssize_t(struct file *, const char *, size_t,  loff_t *)' {aka 'long int(struct file *, const char *, long unsigned int,  long long int *)'}
     209 | static ssize_t dax_write(struct file *filp, const char __user *buf,
         |                ^~~~~~~~~
   drivers/sbus/char/oradax.c: In function 'dax_write':
>> drivers/sbus/char/oradax.c:576:42: error: 'buf' undeclared (first use in this function)
     576 |                 return dax_ccb_exec(ctx, buf, count, ppos); /* CCB EXEC */
         |                                          ^~~
   drivers/sbus/char/oradax.c:576:42: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/sbus/char/oradax.c:576:54: error: 'ppos' undeclared (first use in this function)
     576 |                 return dax_ccb_exec(ctx, buf, count, ppos); /* CCB EXEC */
         |                                                      ^~~~
   drivers/sbus/char/oradax.c: At top level:
>> drivers/sbus/char/oradax.c:207:16: warning: 'dax_read' used but never defined
     207 | static ssize_t dax_read(struct file *filp, char __user *buf,
         |                ^~~~~~~~
>> drivers/sbus/char/oradax.c:209:16: warning: 'dax_write' used but never defined
     209 | static ssize_t dax_write(struct file *filp, const char __user *buf,
         |                ^~~~~~~~~
>> drivers/sbus/char/oradax.c:561:16: warning: 'dax_write' defined but not used [-Wunused-function]
     561 | static ssize_t dax_write(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~
>> drivers/sbus/char/oradax.c:544:16: warning: 'dax_read' defined but not used [-Wunused-function]
     544 | static ssize_t dax_read(struct kiocb *iocb, struct iov_iter *to)
         |                ^~~~~~~~
   cc1: some warnings being treated as errors


vim +217 drivers/sbus/char/oradax.c

   204	
   205	/* driver public entry points */
   206	static int dax_open(struct inode *inode, struct file *file);
 > 207	static ssize_t dax_read(struct file *filp, char __user *buf,
   208				size_t count, loff_t *ppos);
 > 209	static ssize_t dax_write(struct file *filp, const char __user *buf,
   210				 size_t count, loff_t *ppos);
   211	static int dax_devmap(struct file *f, struct vm_area_struct *vma);
   212	static int dax_close(struct inode *i, struct file *f);
   213	
   214	static const struct file_operations dax_fops = {
   215		.owner	=	THIS_MODULE,
   216		.open	=	dax_open,
 > 217		.read_iter	=	dax_read,
 > 218		.write_iter	=	dax_write,
   219		.mmap	=	dax_devmap,
   220		.release =	dax_close,
   221	};
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
