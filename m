Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A3027A107
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 05:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735023; cv=none; b=cEbZALDWjj8I2haXQN4TGa799d2C0W+7jjJQkGzlGka9HJBLa6Vh5xF1pa6Nzz5QJHvlG3k0yIRPCj2LdzDXharcuSOZq1rgwJ2SGU8xFEjOlFPFS5JggxFJCk+6ufx2bdHow+edLaVSqJ7iw2DfwWYfY1s/I9UlWkr/OB7s0qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735023; c=relaxed/simple;
	bh=0JGC/bARbw6hKGQ242M4QLoInSaOFc9hHc9WonFS84s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GCTGTLn5N0Bff9Exo3c5taRbyflsY2fdB2wOl1fUW8KftbTYzjmPu/iqKEt3cwW29mmVhUdHPqSDkCUPHLZpG08XjYjoJBrTK5ad/ZcaxZGrp8tpkSVQsky8sGDhFBUhREwawUTMXjXxtmOEziDaayRzwPsGRaYiBw1MWijchgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eschJV6B; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eschJV6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778735023; x=1810271023;
  h=date:from:to:cc:subject:message-id;
  bh=0JGC/bARbw6hKGQ242M4QLoInSaOFc9hHc9WonFS84s=;
  b=eschJV6Bak60gvJD+JSbBNiN/dw5/RE+zzf3yNmLkmQ8OovsARbeyrA0
   n+WBGqe2w44SbhW6cRT5ZKODTUokZ1iufI8DNqg8iXRCE2JsMlZV1EVrR
   tLAzYDvsNbSTyLUlD9Nz1s1BcuXVmfE/a4rmbWLEeGunSnDyOpP7W+j+N
   A2blhvO8FxZIOWwbZ/Q4DKlNky1Hai4EPVy4Jd8mqYSzLOKoMF9PE6flt
   hElzjKiEr7Iy6wytfobsqpoqqEL0PeZN3WCBcCQxGHBX/a9UIEDlTIDKk
   TVjAgK6getUD8QhAUg8c3n3eY+FXcgaOqIBSdE+GSCqSARELzw0rHmXN0
   g==;
X-CSE-ConnectionGUID: 2KO7N9FoTXis/dmGrgS0Yg==
X-CSE-MsgGUID: fhNsb7lTTQ+2eyT+Blmljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="89976736"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="89976736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 22:03:42 -0700
X-CSE-ConnectionGUID: A/kVMladRHCZhQPfql4Ifg==
X-CSE-MsgGUID: lxXhODMqQAm24t/7vReiNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="243250071"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 May 2026 22:03:39 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNOET-000000005rD-0lQA;
	Thu, 14 May 2026 05:03:37 +0000
Date: Thu, 14 May 2026 13:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>
Subject: fs/nfs/nfs4super.c:232:17: sparse: sparse: incompatible
 types in conditional expression (different base types):
Message-ID: <202605141218.uA0wk544-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 6f57293abb8d087de830dd3f02e66d94b3e59973 sunrpc: Fix compilation error (`make W=1`) when dprintk() is no-op
date:   6 weeks ago
config: x86_64-randconfig-121-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141218.uA0wk544-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141218.uA0wk544-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6f57293abb8d ("sunrpc: Fix compilation error (`make W=1`) when dprintk() is no-op")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141218.uA0wk544-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/nfs4super.c:232:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/nfs4super.c:232:17: sparse:    void
   fs/nfs/nfs4super.c:232:17: sparse:    int
   fs/nfs/nfs4super.c:255:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/nfs4super.c:255:17: sparse:    void
   fs/nfs/nfs4super.c:255:17: sparse:    int
--
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
>> fs/nfs/namespace.c:304:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/namespace.c:304:17: sparse:    void
   fs/nfs/namespace.c:304:17: sparse:    int
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

vim +232 fs/nfs/nfs4super.c

fbdefd64428113 Bryan Schumaker 2012-07-16  217  
f2aedb713c2844 David Howells   2019-12-10  218  int nfs4_try_get_tree(struct fs_context *fc)
fbdefd64428113 Bryan Schumaker 2012-07-16  219  {
f2aedb713c2844 David Howells   2019-12-10  220  	struct nfs_fs_context *ctx = nfs_fc2context(fc);
f2aedb713c2844 David Howells   2019-12-10  221  	int err;
fbdefd64428113 Bryan Schumaker 2012-07-16  222  
f2aedb713c2844 David Howells   2019-12-10  223  	dfprintk(MOUNT, "--> nfs4_try_get_tree()\n");
fbdefd64428113 Bryan Schumaker 2012-07-16  224  
f2aedb713c2844 David Howells   2019-12-10  225  	/* We create a mount for the server's root, walk to the requested
f2aedb713c2844 David Howells   2019-12-10  226  	 * location and then create another mount for that.
f2aedb713c2844 David Howells   2019-12-10  227  	 */
62a55d088cd87d Scott Mayhew    2019-12-10  228  	err= do_nfs4_mount(nfs4_create_server(fc),
f2aedb713c2844 David Howells   2019-12-10  229  			   fc, ctx->nfs_server.hostname,
5eb005caf5383d David Howells   2019-12-10  230  			   ctx->nfs_server.export_path);
f2aedb713c2844 David Howells   2019-12-10  231  	if (err) {
c98e9daa59a611 Scott Mayhew    2021-01-05 @232  		nfs_ferrorf(fc, MOUNT, "NFS4: Couldn't follow remote path");
f2aedb713c2844 David Howells   2019-12-10  233  		dfprintk(MOUNT, "<-- nfs4_try_get_tree() = %d [error]\n", err);
f2aedb713c2844 David Howells   2019-12-10  234  	} else {
f2aedb713c2844 David Howells   2019-12-10  235  		dfprintk(MOUNT, "<-- nfs4_try_get_tree() = 0\n");
f2aedb713c2844 David Howells   2019-12-10  236  	}
f2aedb713c2844 David Howells   2019-12-10  237  	return err;
fbdefd64428113 Bryan Schumaker 2012-07-16  238  }
fbdefd64428113 Bryan Schumaker 2012-07-16  239  

:::::: The code at line 232 was first introduced by commit
:::::: c98e9daa59a611ff4e163689815f40380c912415 NFS: Adjust fs_context error logging

:::::: TO: Scott Mayhew <smayhew@redhat.com>
:::::: CC: Trond Myklebust <trond.myklebust@hammerspace.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
