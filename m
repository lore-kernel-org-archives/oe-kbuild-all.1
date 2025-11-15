Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90034414
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 01:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763169845; cv=none; b=JkQPQ2oTvohDU8S6xiLI0YWEZNgAwhcV10nLKVHkNhQ7Enc4Gf6SRCH9hqaTCT5ywWpYx8flX6r7/uE+c6tZXdwgSgHYjxbxbuhCMF5pD6R/Vkl8FFdMom0P1a283GAdq+upvG9RBi32ILvKEEfH5du1/oHmJ0ojvZ3PhnohNuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763169845; c=relaxed/simple;
	bh=omtdT/qcogvxU/JhFpFk8/40cFSqPFCgKFnv01FUmmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhGmgkryXEHE4IJLH/kJdlO1vb5Fbhddz/wfapG88j30ZgtQyf+roigAgXpkmmO/vN0hrFEF38fGIQOeaaPjyqc77dmBMiKxs8qI4yzclnk7rk9cWL0VQnmGVIY3lTYWgdaqimrG4+IpUVj95hWVIjxhXLYomLeoQ933osqVbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGx39Ry8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGx39Ry8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763169843; x=1794705843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=omtdT/qcogvxU/JhFpFk8/40cFSqPFCgKFnv01FUmmQ=;
  b=cGx39Ry8NKyVoVxZYI2vRuFs84dHg+WiDjGz8RMUb/enusL58kVX50RY
   xivi2sRFhVyi1RDPSoKDvkPx/OySC6b7jZFwpiYAXq3eoVhl1ESRUtKRX
   G6XXhdrE4iyOBlSO0lqJHdGUcc+EGxHR2cJb/b87b39y9DlZXIIftEphs
   J4dS2Mn9vgoiw1iv/UgS8ulsSGfA9Jm8qW6QkPqhzS2GdSp5QnUWMWL2v
   0G1ci3cr82POUW/2B1C+nY7zgdIr78XpCiVjJFL+Feb340yvwmNskEGIo
   njxXLkFO1EDCp8MWbx1HyMvldBninmPPGD3WIoqdPVlSUxBea0Mxt8N3x
   A==;
X-CSE-ConnectionGUID: usgopIjnRuO0ZyVhcOPTxQ==
X-CSE-MsgGUID: O7lXOD4VTfuhIE0rccO3bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75947590"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="75947590"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 17:24:02 -0800
X-CSE-ConnectionGUID: A2yjUbOySvWhrPakZCPT7A==
X-CSE-MsgGUID: 9S9cPstuR42sOEMu4s/mYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="190101738"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2025 17:24:00 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK51B-0007b9-2D;
	Sat, 15 Nov 2025 01:23:57 +0000
Date: Sat, 15 Nov 2025 09:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Chaitanya Kulkarni <kch@nvidia.com>, Jens Axboe <axboe@kernel.dk>
Subject: [brauner-github:vfs-6.19.iomap 39/44] fs/overlayfs/file.c:376:17:
 error: 'IOCB_DIO_CALLER_COMP' undeclared
Message-ID: <202511150951.b1e7K2Po-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.19.iomap
head:   d9b964dbfd3e15635eae30da757e91c70f9d4628
commit: 56749ed317e256c6dc3ca83e246fc17479366f83 [39/44] fs, iomap: remove IOCB_DIO_CALLER_COMP
config: arc-randconfig-002-20251115 (https://download.01.org/0day-ci/archive/20251115/202511150951.b1e7K2Po-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150951.b1e7K2Po-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511150951.b1e7K2Po-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/overlayfs/file.c: In function 'ovl_write_iter':
>> fs/overlayfs/file.c:376:17: error: 'IOCB_DIO_CALLER_COMP' undeclared (first use in this function)
     376 |         ifl &= ~IOCB_DIO_CALLER_COMP;
         |                 ^~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/file.c:376:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/IOCB_DIO_CALLER_COMP +376 fs/overlayfs/file.c

16914e6fc7e174 Miklos Szeredi    2018-07-18  344  
2a92e07edc5ede Miklos Szeredi    2018-07-18  345  static ssize_t ovl_write_iter(struct kiocb *iocb, struct iov_iter *iter)
2a92e07edc5ede Miklos Szeredi    2018-07-18  346  {
2a92e07edc5ede Miklos Szeredi    2018-07-18  347  	struct file *file = iocb->ki_filp;
2a92e07edc5ede Miklos Szeredi    2018-07-18  348  	struct inode *inode = file_inode(file);
d66907b51ba074 Amir Goldstein    2024-11-05  349  	struct file *realfile;
2a92e07edc5ede Miklos Szeredi    2018-07-18  350  	ssize_t ret;
c86243b090bc25 Vivek Goyal       2020-08-31  351  	int ifl = iocb->ki_flags;
a6293b3e285cd0 Amir Goldstein    2023-11-22  352  	struct backing_file_ctx ctx = {
a6293b3e285cd0 Amir Goldstein    2023-11-22  353  		.cred = ovl_creds(inode->i_sb),
f03b296e8b516d Amir Goldstein    2024-10-14  354  		.end_write = ovl_file_end_write,
a6293b3e285cd0 Amir Goldstein    2023-11-22  355  	};
2a92e07edc5ede Miklos Szeredi    2018-07-18  356  
2a92e07edc5ede Miklos Szeredi    2018-07-18  357  	if (!iov_iter_count(iter))
2a92e07edc5ede Miklos Szeredi    2018-07-18  358  		return 0;
2a92e07edc5ede Miklos Szeredi    2018-07-18  359  
2a92e07edc5ede Miklos Szeredi    2018-07-18  360  	inode_lock(inode);
2a92e07edc5ede Miklos Szeredi    2018-07-18  361  	/* Update mode */
2878dffc7db0b5 Christian Brauner 2022-04-04  362  	ovl_copyattr(inode);
2a92e07edc5ede Miklos Szeredi    2018-07-18  363  
d66907b51ba074 Amir Goldstein    2024-11-05  364  	realfile = ovl_real_file(file);
d66907b51ba074 Amir Goldstein    2024-11-05  365  	ret = PTR_ERR(realfile);
d66907b51ba074 Amir Goldstein    2024-11-05  366  	if (IS_ERR(realfile))
2a92e07edc5ede Miklos Szeredi    2018-07-18  367  		goto out_unlock;
2a92e07edc5ede Miklos Szeredi    2018-07-18  368  
c86243b090bc25 Vivek Goyal       2020-08-31  369  	if (!ovl_should_sync(OVL_FS(inode->i_sb)))
c86243b090bc25 Vivek Goyal       2020-08-31  370  		ifl &= ~(IOCB_DSYNC | IOCB_SYNC);
c86243b090bc25 Vivek Goyal       2020-08-31  371  
2d1b3bbc3dd56f Jens Axboe        2023-09-25  372  	/*
2d1b3bbc3dd56f Jens Axboe        2023-09-25  373  	 * Overlayfs doesn't support deferred completions, don't copy
2d1b3bbc3dd56f Jens Axboe        2023-09-25  374  	 * this property in case it is set by the issuer.
2d1b3bbc3dd56f Jens Axboe        2023-09-25  375  	 */
2d1b3bbc3dd56f Jens Axboe        2023-09-25 @376  	ifl &= ~IOCB_DIO_CALLER_COMP;
d66907b51ba074 Amir Goldstein    2024-11-05  377  	ret = backing_file_write_iter(realfile, iter, iocb, ifl, &ctx);
2a92e07edc5ede Miklos Szeredi    2018-07-18  378  
2a92e07edc5ede Miklos Szeredi    2018-07-18  379  out_unlock:
2a92e07edc5ede Miklos Szeredi    2018-07-18  380  	inode_unlock(inode);
2a92e07edc5ede Miklos Szeredi    2018-07-18  381  
2a92e07edc5ede Miklos Szeredi    2018-07-18  382  	return ret;
2a92e07edc5ede Miklos Szeredi    2018-07-18  383  }
2a92e07edc5ede Miklos Szeredi    2018-07-18  384  

:::::: The code at line 376 was first introduced by commit
:::::: 2d1b3bbc3dd56fc8364350eb93e5d67a05cb2c23 ovl: disable IOCB_DIO_CALLER_COMP

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
