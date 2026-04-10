Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22F340260
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 22:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775861423; cv=none; b=ZfL0MhdasJbe0TEn5vTBe7BgvjuZ6UAbsbLNToKrVq614R/JH3qyyVD83eIzAzNtGu76+ugH/5hjGD9ii06oo43phsrhwu6KIi4euXG4KVPFU/5WTk+dO6XVKbYKXQMneJ6WG2rtAI8NRyr3QqF7rdhP1solcejGiJqs8A0laK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775861423; c=relaxed/simple;
	bh=1RPsUnCr5ibc4M+IQBGf32XgixrJfu/6zTbEpDj4Hh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=roSL2SAw8NUE/wIhin8bt8yawvaNj4XorAJp3hoXBeh5h32xQ5SGIgkye2Zp8Rf1o77tCh27kUJSfJqs1YQ9XRCp85Bemvg14HhvqGmFzBD0ZcJm/DL76zE7XsrQENg4oVPjEd/oyj67nzKuXmOtQJHgq4RQ4ue80OstTYyFkoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzY3ku+f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzY3ku+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775861423; x=1807397423;
  h=date:from:to:cc:subject:message-id;
  bh=1RPsUnCr5ibc4M+IQBGf32XgixrJfu/6zTbEpDj4Hh4=;
  b=MzY3ku+fhSR5AQhysxtdScW8UEnXsyW9qmHxdBdYXIMQSxCFkLHJgezp
   TZXQ0DnaWZW5MGLZjze13QPOaF4mHDsrDF2FiILRmwlXBWD9NTJ2bZVCk
   omg4vHM+8AgBijgkJxf3YA0uZ8T2pk/qjPMN/ULp1F49U9+uf/+y9yhG2
   8YM/pm3yNZdFs8P1aDxYjbaUJmf2EVj64myW63laEaGri7iSWBybZdl8/
   yMqfQI53NOH02vaCk1TJFmv8aVjf4IfsKN2n7y3MQpfApA5K9ZuzDXSf1
   hnywAj9XKzYaRb/7NVOlExb0uGu3D+4IjxBOnjSAzi6JT9jl65m05K4+J
   g==;
X-CSE-ConnectionGUID: 6gboFCR3RZ6O4Znnb1Xc6A==
X-CSE-MsgGUID: 9SLDe/ZiRNGb0U0rVVgP7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76603219"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76603219"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:50:23 -0700
X-CSE-ConnectionGUID: O/EnRBjjRJWD3g+Ki4qKIQ==
X-CSE-MsgGUID: fuu5t7SRRK2PgflvU1US9g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 15:50:20 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBKg5-000000000KP-1D6U;
	Fri, 10 Apr 2026 22:50:17 +0000
Date: Sat, 11 Apr 2026 06:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 24/120] fs/nfs/getroot.c:90:17: sparse:
 sparse: incompatible types in conditional expression (different base types):
Message-ID: <202604110640.BQukhx5r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   1388f70447e3f27ea0e425ef172bf113d1071993
commit: 6f57293abb8d087de830dd3f02e66d94b3e59973 [24/120] sunrpc: Fix compilation error (`make W=1`) when dprintk() is no-op
config: i386-randconfig-r122-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110640.BQukhx5r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110640.BQukhx5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110640.BQukhx5r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/getroot.c:90:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/getroot.c:90:17: sparse:    void
   fs/nfs/getroot.c:90:17: sparse:    int
   fs/nfs/getroot.c:98:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/getroot.c:98:17: sparse:    void
   fs/nfs/getroot.c:98:17: sparse:    int
   fs/nfs/getroot.c:114:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/getroot.c:114:17: sparse:    void
   fs/nfs/getroot.c:114:17: sparse:    int
--
>> fs/nfs/nfs4super.c:232:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/nfs4super.c:232:17: sparse:    void
   fs/nfs/nfs4super.c:232:17: sparse:    int
   fs/nfs/nfs4super.c:255:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/nfs4super.c:255:17: sparse:    void
   fs/nfs/nfs4super.c:255:17: sparse:    int
--
>> fs/nfs/namespace.c:304:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/namespace.c:304:17: sparse:    void
   fs/nfs/namespace.c:304:17: sparse:    int
--
   fs/nfs/super.c:1170:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct rpc_xprt *xprt1 @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/super.c:1170:49: sparse:     expected struct rpc_xprt *xprt1
   fs/nfs/super.c:1170:49: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
   fs/nfs/super.c:1171:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct rpc_xprt *xprt2 @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/super.c:1171:49: sparse:     expected struct rpc_xprt *xprt2
   fs/nfs/super.c:1171:49: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
>> fs/nfs/super.c:1307:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/super.c:1307:17: sparse:    void
   fs/nfs/super.c:1307:17: sparse:    int
   fs/nfs/super.c:1333:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/super.c:1333:17: sparse:    void
   fs/nfs/super.c:1333:17: sparse:    int
--
>> fs/nfs/fs_context.c:1120:9: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/fs_context.c:1120:9: sparse:    void
   fs/nfs/fs_context.c:1120:9: sparse:    int
   fs/nfs/fs_context.c:1123:9: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/fs_context.c:1123:9: sparse:    void
   fs/nfs/fs_context.c:1123:9: sparse:    int
   fs/nfs/fs_context.c:1126:9: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/fs_context.c:1126:9: sparse:    void
   fs/nfs/fs_context.c:1126:9: sparse:    int
   fs/nfs/fs_context.c:1591:9: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/fs_context.c:1591:9: sparse:    void
   fs/nfs/fs_context.c:1591:9: sparse:    int
   fs/nfs/fs_context.c:1605:9: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/fs_context.c:1605:9: sparse:    void
   fs/nfs/fs_context.c:1605:9: sparse:    int

vim +90 fs/nfs/getroot.c

b09b9417d074e01 Trond Myklebust 2007-10-25  63  
54ceac451598603 David Howells   2006-08-22  64  /*
6d26c5e4d83cd39 Li Lingfeng     2024-08-24  65   * get a root dentry from the root filehandle
54ceac451598603 David Howells   2006-08-22  66   */
62a55d088cd87d4 Scott Mayhew    2019-12-10  67  int nfs_get_root(struct super_block *s, struct fs_context *fc)
54ceac451598603 David Howells   2006-08-22  68  {
62a55d088cd87d4 Scott Mayhew    2019-12-10  69  	struct nfs_fs_context *ctx = nfs_fc2context(fc);
eae00c5d6e48ccb Scott Mayhew    2021-06-22  70  	struct nfs_server *server = NFS_SB(s), *clone_server;
54ceac451598603 David Howells   2006-08-22  71  	struct nfs_fsinfo fsinfo;
62a55d088cd87d4 Scott Mayhew    2019-12-10  72  	struct dentry *root;
54ceac451598603 David Howells   2006-08-22  73  	struct inode *inode;
62a55d088cd87d4 Scott Mayhew    2019-12-10  74  	char *name;
62a55d088cd87d4 Scott Mayhew    2019-12-10  75  	int error = -ENOMEM;
779df6a5480f130 Scott Mayhew    2020-03-03  76  	unsigned long kflags = 0, kflags_out = 0;
54ceac451598603 David Howells   2006-08-22  77  
62a55d088cd87d4 Scott Mayhew    2019-12-10  78  	name = kstrdup(fc->source, GFP_KERNEL);
b1942c5f8cf3bea Al Viro         2011-03-16  79  	if (!name)
62a55d088cd87d4 Scott Mayhew    2019-12-10  80  		goto out;
b1942c5f8cf3bea Al Viro         2011-03-16  81  
54ceac451598603 David Howells   2006-08-22  82  	/* get the actual root for this mount */
d755ad8dc752d44 Anna Schumaker  2021-10-22  83  	fsinfo.fattr = nfs_alloc_fattr_with_label(server);
62a55d088cd87d4 Scott Mayhew    2019-12-10  84  	if (fsinfo.fattr == NULL)
62a55d088cd87d4 Scott Mayhew    2019-12-10  85  		goto out_name;
54ceac451598603 David Howells   2006-08-22  86  
62a55d088cd87d4 Scott Mayhew    2019-12-10  87  	error = server->nfs_client->rpc_ops->getroot(server, ctx->mntfh, &fsinfo);
54ceac451598603 David Howells   2006-08-22  88  	if (error < 0) {
54ceac451598603 David Howells   2006-08-22  89  		dprintk("nfs_get_root: getattr error = %d\n", -error);
ce8866f0913ff15 Scott Mayhew    2019-12-10 @90  		nfs_errorf(fc, "NFS: Couldn't getattr on root");

:::::: The code at line 90 was first introduced by commit
:::::: ce8866f0913ff157edc098f06bad07763ad317e7 NFS: Attach supplementary error information to fs_context.

:::::: TO: Scott Mayhew <smayhew@redhat.com>
:::::: CC: Anna Schumaker <Anna.Schumaker@Netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
