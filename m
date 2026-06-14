Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E08129B766
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781466587; cv=none; b=LTqPbdaqyA43OhcdwZBj8OVjOwqNSmLquEbdPmiVp9wF/N8PYML/lAA9xu15EtWET/wPGiPX7p4OEw3uIbfXuRzTOu4Fty/JxcWVmT9/RWsn/Y+GGgI89TqNVgzxVTLPerR6V8ukJnIp5f2htSfPMgMZsFMhnmuCEW4FA4zhs4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781466587; c=relaxed/simple;
	bh=6RIZLIITJMnYQuKD3gENrTzGkrT50zZEOguz50hpDX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S0X+JCNGBwmdkq1MFDnKQJ0YVbnKj0ZZvcjyReiNkimh+XA/3nVlP3I8UkWr54233yiEMMg1ciQMvFVqZ1qTgqeOV54RYw9l1nCGnmLnNOsX/bDBI5lnhkjlxJ/oSWEFaJ2Ze7KBni9qm43AoxsGdVes3GdLVGhP+Hc7khKj1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqDUvX8R; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqDUvX8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781466586; x=1813002586;
  h=date:from:to:cc:subject:message-id;
  bh=6RIZLIITJMnYQuKD3gENrTzGkrT50zZEOguz50hpDX4=;
  b=NqDUvX8Rpn7ntbrrsjJie+Ob7A7vp3sRLhblEQW3EeARhUHSRzDBYXga
   QbNUBvf1T9s+8BY9hIkgyW5t0zGfG89k95Sj4NyhoJeCEG0fwPj7nQRzM
   cZXYJXOmytjpRvrOwSG4ZwEgO0f3rhd1ZQFcRmnw5HG4oF5kg69olWt/A
   mQjaeAiWP3QrW1HdeY5a8fRbbZUUlUARlYov/VRr6x/a4ZjjJ+5KUD2g0
   6XBW6I++EOdlV3IyydfaGqwinMHC9gNLOe/N+MJySyRzTfrccaC3uxsWn
   MjDjs9aA/w9TqxE00Ine/OXlISxwzdEy/DqafVt2rz9MU2cFG5lO5QFx7
   w==;
X-CSE-ConnectionGUID: m6onRxW7RqOAliRXJhGsPw==
X-CSE-MsgGUID: MoDMQ7tlQGuAr+hl9kOhmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82278283"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82278283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 12:49:46 -0700
X-CSE-ConnectionGUID: 0GKHMsVgRFahcI0E4gWS2g==
X-CSE-MsgGUID: g2zwuKDPTw23ylcndEPemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="247169720"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jun 2026 12:49:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYqpw-00000000RAQ-2NXc;
	Sun, 14 Jun 2026 19:49:40 +0000
Date: Mon, 15 Jun 2026 03:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>
Subject: fs/nfs/nfs4super.c:232:17: sparse: sparse: incompatible
 types in conditional expression (different base types):
Message-ID: <202606150326.Vlnrh7T1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 6f57293abb8d087de830dd3f02e66d94b3e59973 sunrpc: Fix compilation error (`make W=1`) when dprintk() is no-op
date:   3 months ago
config: i386-randconfig-062 (https://download.01.org/0day-ci/archive/20260615/202606150326.Vlnrh7T1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150326.Vlnrh7T1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6f57293abb8d ("sunrpc: Fix compilation error (`make W=1`) when dprintk() is no-op")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150326.Vlnrh7T1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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

vim +232 fs/nfs/nfs4super.c

fbdefd644281139 Bryan Schumaker 2012-07-16  217  
f2aedb713c28442 David Howells   2019-12-10  218  int nfs4_try_get_tree(struct fs_context *fc)
fbdefd644281139 Bryan Schumaker 2012-07-16  219  {
f2aedb713c28442 David Howells   2019-12-10  220  	struct nfs_fs_context *ctx = nfs_fc2context(fc);
f2aedb713c28442 David Howells   2019-12-10  221  	int err;
fbdefd644281139 Bryan Schumaker 2012-07-16  222  
f2aedb713c28442 David Howells   2019-12-10  223  	dfprintk(MOUNT, "--> nfs4_try_get_tree()\n");
fbdefd644281139 Bryan Schumaker 2012-07-16  224  
f2aedb713c28442 David Howells   2019-12-10  225  	/* We create a mount for the server's root, walk to the requested
f2aedb713c28442 David Howells   2019-12-10  226  	 * location and then create another mount for that.
f2aedb713c28442 David Howells   2019-12-10  227  	 */
62a55d088cd87d4 Scott Mayhew    2019-12-10  228  	err= do_nfs4_mount(nfs4_create_server(fc),
f2aedb713c28442 David Howells   2019-12-10  229  			   fc, ctx->nfs_server.hostname,
5eb005caf5383dd David Howells   2019-12-10  230  			   ctx->nfs_server.export_path);
f2aedb713c28442 David Howells   2019-12-10  231  	if (err) {
c98e9daa59a611f Scott Mayhew    2021-01-05 @232  		nfs_ferrorf(fc, MOUNT, "NFS4: Couldn't follow remote path");
f2aedb713c28442 David Howells   2019-12-10  233  		dfprintk(MOUNT, "<-- nfs4_try_get_tree() = %d [error]\n", err);
f2aedb713c28442 David Howells   2019-12-10  234  	} else {
f2aedb713c28442 David Howells   2019-12-10  235  		dfprintk(MOUNT, "<-- nfs4_try_get_tree() = 0\n");
f2aedb713c28442 David Howells   2019-12-10  236  	}
f2aedb713c28442 David Howells   2019-12-10  237  	return err;
fbdefd644281139 Bryan Schumaker 2012-07-16  238  }
fbdefd644281139 Bryan Schumaker 2012-07-16  239  

:::::: The code at line 232 was first introduced by commit
:::::: c98e9daa59a611ff4e163689815f40380c912415 NFS: Adjust fs_context error logging

:::::: TO: Scott Mayhew <smayhew@redhat.com>
:::::: CC: Trond Myklebust <trond.myklebust@hammerspace.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
