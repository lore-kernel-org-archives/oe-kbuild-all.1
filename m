Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B669D31
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 07:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718608629; cv=none; b=PplOBqRvZ7TYarauupcXDU3z9KFgLcF2/FYDa257iWWC+/o8roPVw+qQ9RBnQH85YUOH+PZW1quGoTqhS6lNsnV49bB2wAn0mIHmfM0KucyMpFaobpxHqzBQTg8sAnGUjeGS8mMZ2uSE+Lp1/SWwYxUNi7k1YLchp40Rtv2lJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718608629; c=relaxed/simple;
	bh=is7dneWiltOI6D/hE7KABaFBLa3Q6p6ERyq/eC8ugPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBdn2slYq/Lv4tb7YFzxnGUuLS8w7pJD7e6TX2dLx2/3Sa1FAD+g3/G+KCuaBEyCso2vY736SExm2bI8AjuCaIPaYVQyu+SfYg7qS+3UsdlzyRF7Fqoz7ZWrml0oXxewV2TdB962s+FUYSx1+ALVJXNAIBAAEAaqayiPcKWHuZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbtjJwQN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbtjJwQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718608627; x=1750144627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=is7dneWiltOI6D/hE7KABaFBLa3Q6p6ERyq/eC8ugPo=;
  b=YbtjJwQNwE2tgD6bTNj59pp1fr0BOcLbNFcfXtaoZoJfwv7cMMWo0FmE
   OfHVBF5tVrFJySrcpe888gI8H9CcYFZTHk7tAPYqvBFKhgHactSTALKHe
   bHCDCuUl6VsDEHPGoSDttbaBX5c662vVs1XzRekUTr8wOB3ai0y8DzEqI
   Qm8j7HOmbDrF9bOqaZ7reYoOX7cc27hXHFAeVD8AYTs3qJr7T4/NalBUy
   N1kb7UFxENI8bjnfp8/CXx0fI4a13+YlMLd6fm0HmMZ6K7ki2ZdH3Qj7+
   DoyCtJvnALUzVDYUXhRb0VQFW5uyTDfcHc18yfGSWSOBF+RFoMxLQ1Pa2
   w==;
X-CSE-ConnectionGUID: lvzSTYXMTOSWUhi8UTNlSQ==
X-CSE-MsgGUID: 2xNSoarjSfScZF85hIVooA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26841395"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26841395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 00:17:06 -0700
X-CSE-ConnectionGUID: Dr0H9LZbTxudC2Dl6TJI2w==
X-CSE-MsgGUID: xo7s5wzQREeOKIk6vr8ypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46063039"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2024 00:17:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ6bu-0003wI-2K;
	Mon, 17 Jun 2024 07:17:02 +0000
Date: Mon, 17 Jun 2024 15:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-6.11.v3.debug 17/19]
 fs/nfsd/nfssvc.c:335:14: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202406171501.ijrVnFDx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11.v3.debug
head:   051785906941a90cf1747482d796cdd0e5d47bb3
commit: 7ccd11e99fab3ac4b4cb98f8f4ab4f96bbd9c1b2 [17/19] nfsd: use SRCU to dereference nn->nfsd_serv
config: arm-randconfig-r111-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171501.ijrVnFDx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240617/202406171501.ijrVnFDx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171501.ijrVnFDx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfssvc.c:335:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfssvc.c:335:14: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfssvc.c:335:14: sparse:     got void [noderef] __rcu *nfsd_serv
>> fs/nfsd/nfssvc.c:346:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfssvc.c:346:35: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfssvc.c:346:35: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfssvc.c:616:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfssvc.c:616:35: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfssvc.c:616:35: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfssvc.c:716:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfssvc.c:716:14: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfssvc.c:716:14: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfssvc.c:783:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfssvc.c:783:35: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfssvc.c:783:35: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfssvc.c:794:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfssvc.c:794:35: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfssvc.c:794:35: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfssvc.c:809:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfssvc.c:809:35: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfssvc.c:809:35: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfssvc.c:886:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfssvc.c:886:14: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfssvc.c:886:14: sparse:     got void [noderef] __rcu *nfsd_serv

vim +335 fs/nfsd/nfssvc.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  327  
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  328  int nfsd_nrthreads(struct net *net)
^1da177e4c3f41 Linus Torvalds       2005-04-16  329  {
c7d106c90ec40a Neil Brown           2008-06-12  330  	int rv = 0;
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  331  	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
ec75d8047f15a2 Mike Snitzer         2024-06-13  332  	struct svc_serv *serv;
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  333  
c7d106c90ec40a Neil Brown           2008-06-12  334  	mutex_lock(&nfsd_mutex);
ec75d8047f15a2 Mike Snitzer         2024-06-13 @335  	serv = nn->nfsd_serv;
ec75d8047f15a2 Mike Snitzer         2024-06-13  336  	if (serv)
ec75d8047f15a2 Mike Snitzer         2024-06-13  337  		rv = serv->sv_nrthreads;
c7d106c90ec40a Neil Brown           2008-06-12  338  	mutex_unlock(&nfsd_mutex);
c7d106c90ec40a Neil Brown           2008-06-12  339  	return rv;
^1da177e4c3f41 Linus Torvalds       2005-04-16  340  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  341  
4df493a260d4c1 Trond Myklebust      2019-04-09  342  static int nfsd_init_socks(struct net *net, const struct cred *cred)
59db4a0c102e0d J. Bruce Fields      2010-07-21  343  {
59db4a0c102e0d J. Bruce Fields      2010-07-21  344  	int error;
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  345  	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
ec75d8047f15a2 Mike Snitzer         2024-06-13 @346  	struct svc_serv *serv = nn->nfsd_serv;
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  347  
ec75d8047f15a2 Mike Snitzer         2024-06-13  348  	if (!list_empty(&serv->sv_permsocks))
59db4a0c102e0d J. Bruce Fields      2010-07-21  349  		return 0;
59db4a0c102e0d J. Bruce Fields      2010-07-21  350  
ec75d8047f15a2 Mike Snitzer         2024-06-13  351  	error = svc_xprt_create(serv, "udp", net, PF_INET, NFS_PORT,
4df493a260d4c1 Trond Myklebust      2019-04-09  352  				SVC_SOCK_DEFAULTS, cred);
59db4a0c102e0d J. Bruce Fields      2010-07-21  353  	if (error < 0)
59db4a0c102e0d J. Bruce Fields      2010-07-21  354  		return error;
59db4a0c102e0d J. Bruce Fields      2010-07-21  355  
ec75d8047f15a2 Mike Snitzer         2024-06-13  356  	error = svc_xprt_create(serv, "tcp", net, PF_INET, NFS_PORT,
4df493a260d4c1 Trond Myklebust      2019-04-09  357  				SVC_SOCK_DEFAULTS, cred);
59db4a0c102e0d J. Bruce Fields      2010-07-21  358  	if (error < 0)
59db4a0c102e0d J. Bruce Fields      2010-07-21  359  		return error;
59db4a0c102e0d J. Bruce Fields      2010-07-21  360  
59db4a0c102e0d J. Bruce Fields      2010-07-21  361  	return 0;
59db4a0c102e0d J. Bruce Fields      2010-07-21  362  }
59db4a0c102e0d J. Bruce Fields      2010-07-21  363  

:::::: The code at line 335 was first introduced by commit
:::::: ec75d8047f15a27a3f391c48c49f4c102410c639 nfsd: prepare to use SRCU to dereference nn->nfsd_serv

:::::: TO: Mike Snitzer <snitzer@kernel.org>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
