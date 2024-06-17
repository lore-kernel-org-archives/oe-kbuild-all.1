Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7CDF58
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 02:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718591555; cv=none; b=eiSVg3qzTrS0mvelWSHH+9jzbbqygK3xGRUTDmiMWFUX+pVn3Aj+IwVlLGMNEgyGqV2/pTj+0eHd1G1jay9PgaokSxAQKoCdSCDI3WHn76gZs/9d9lhj/KgYvUWCKE4ivVBsmLnAThfZ5MuDH9G1laz7MSfU7ZhuM7Z596LNoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718591555; c=relaxed/simple;
	bh=E3lu/CEcwkKUvLdaOD7yP57BlfGfry9SkW0OvmYgvwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kx/l2bGeVCJKD9sRdTMvv/s0Twb+Su88qQZOLcnzGKEim7wCXTHxjDg/OKKQC3fiD41XuVvaZ9U9zxBcP2CpHh8Tz2KMPtFjqc3dt9C7PuWGbm+1pCCVWXx0WPw8HDmlWWZXR9PpsmJgKusMndZjasYouUmgemryh+AjcL9Yti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhpUd4Bv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhpUd4Bv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718591554; x=1750127554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3lu/CEcwkKUvLdaOD7yP57BlfGfry9SkW0OvmYgvwI=;
  b=LhpUd4Bv1kcsrXX6/RETcIyG3TmahBV89vbXX3HcFc0M/cHjmw0bxnIs
   ahk1SL1Tt4rT13k6s4siwXz/Ocr2r2xWTmKEWpAJ3ZyqicjOrfsKZVFp3
   fpUVTS9oM2fPVAjlpe1e7UTcdzNocMfgFsEVF5+DGOFlngCn1KWmciaSv
   fHqmPOAjuOOBJiOTfKiIYgVoo0FeZFiTHQ/VLFqCogWirbEdmyn7O/rgU
   HJN/0NuzxD3AegSd5un2eUQ8ai2Zy5A4obFnXaazljvu9henVyU1Me6Vd
   SyVGMAdJuxm7QsuY5r/zrajOF3l8xoI0vXyXcrMmo07R8aPVkJTgmaEPQ
   g==;
X-CSE-ConnectionGUID: RadgH/pwTm+r0holpgfrng==
X-CSE-MsgGUID: 4O/9BLhfSMi+s3afE9tWiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="25985328"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="25985328"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 19:32:33 -0700
X-CSE-ConnectionGUID: v2E14Jh2R8qwNAq31MpVhA==
X-CSE-MsgGUID: omBqmnfmR82IZoIY3Pptnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="64263412"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2024 19:32:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ2AW-0003gA-1S;
	Mon, 17 Jun 2024 02:32:28 +0000
Date: Mon, 17 Jun 2024 10:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-6.11.v3 17/18] fs/nfsd/nfsctl.c:682:35:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202406171057.T5fJtSI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11.v3
head:   5b36866f5984332a804217319f0966c3391bae2c
commit: 559561b2d71eb8b509233ae7ccbea4f9318f883a [17/18] nfsd: use SRCU to dereference nn->nfsd_serv
config: arc-randconfig-r111-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171057.T5fJtSI5-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240617/202406171057.T5fJtSI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171057.T5fJtSI5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfsctl.c:682:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfsctl.c:682:35: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfsctl.c:682:35: sparse:     got void [noderef] __rcu *nfsd_serv
>> fs/nfsd/nfsctl.c:710:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfsctl.c:710:14: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfsctl.c:710:14: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfsctl.c:742:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfsctl.c:742:14: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfsctl.c:742:14: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfsctl.c:1701:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfsctl.c:1701:22: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfsctl.c:1701:22: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfsctl.c:1775:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfsctl.c:1775:14: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfsctl.c:1775:14: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfsctl.c:1983:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfsctl.c:1983:14: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfsctl.c:1983:14: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfsctl.c:2139:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svc_serv *serv @@     got void [noderef] __rcu *nfsd_serv @@
   fs/nfsd/nfsctl.c:2139:14: sparse:     expected struct svc_serv *serv
   fs/nfsd/nfsctl.c:2139:14: sparse:     got void [noderef] __rcu *nfsd_serv
   fs/nfsd/nfsctl.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +682 fs/nfsd/nfsctl.c

3dd98a3bccb1bd Jeff Layton          2008-06-10  674  
0a5372d8a13c3f Chuck Lever          2009-04-23  675  /*
0a5372d8a13c3f Chuck Lever          2009-04-23  676   * Zero-length write.  Return a list of NFSD's current listener
0a5372d8a13c3f Chuck Lever          2009-04-23  677   * transports.
0a5372d8a13c3f Chuck Lever          2009-04-23  678   */
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  679  static ssize_t __write_ports_names(char *buf, struct net *net)
0a5372d8a13c3f Chuck Lever          2009-04-23  680  {
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  681  	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
0cdf79b2cd9560 Mike Snitzer         2024-06-13 @682  	struct svc_serv *serv = nn->nfsd_serv;
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  683  
0cdf79b2cd9560 Mike Snitzer         2024-06-13  684  	if (serv == NULL)
0a5372d8a13c3f Chuck Lever          2009-04-23  685  		return 0;
0cdf79b2cd9560 Mike Snitzer         2024-06-13  686  	return svc_xprt_names(serv, buf, SIMPLE_TRANSACTION_LIMIT);
0a5372d8a13c3f Chuck Lever          2009-04-23  687  }
0a5372d8a13c3f Chuck Lever          2009-04-23  688  
0b7c2f6fc7e068 Chuck Lever          2009-04-23  689  /*
0b7c2f6fc7e068 Chuck Lever          2009-04-23  690   * A single 'fd' number was written, in which case it must be for
0b7c2f6fc7e068 Chuck Lever          2009-04-23  691   * a socket of a supported family/protocol, and we use it as an
0b7c2f6fc7e068 Chuck Lever          2009-04-23  692   * nfsd listener.
0b7c2f6fc7e068 Chuck Lever          2009-04-23  693   */
4df493a260d4c1 Trond Myklebust      2019-04-09  694  static ssize_t __write_ports_addfd(char *buf, struct net *net, const struct cred *cred)
0b7c2f6fc7e068 Chuck Lever          2009-04-23  695  {
0b7c2f6fc7e068 Chuck Lever          2009-04-23  696  	char *mesg = buf;
0b7c2f6fc7e068 Chuck Lever          2009-04-23  697  	int fd, err;
9dd9845f084cda Stanislav Kinsbursky 2012-12-06  698  	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
64e6304169f1e1 Jeff Layton          2024-01-03  699  	struct svc_serv *serv;
0b7c2f6fc7e068 Chuck Lever          2009-04-23  700  
0b7c2f6fc7e068 Chuck Lever          2009-04-23  701  	err = get_int(&mesg, &fd);
0b7c2f6fc7e068 Chuck Lever          2009-04-23  702  	if (err != 0 || fd < 0)
0b7c2f6fc7e068 Chuck Lever          2009-04-23  703  		return -EINVAL;
39d432fc76301c Chuck Lever          2023-05-15  704  	trace_nfsd_ctl_ports_addfd(net, fd);
0b7c2f6fc7e068 Chuck Lever          2009-04-23  705  
6777436b0f072f Stanislav Kinsbursky 2012-12-10  706  	err = nfsd_create_serv(net);
0b7c2f6fc7e068 Chuck Lever          2009-04-23  707  	if (err != 0)
0b7c2f6fc7e068 Chuck Lever          2009-04-23  708  		return err;
0b7c2f6fc7e068 Chuck Lever          2009-04-23  709  
64e6304169f1e1 Jeff Layton          2024-01-03 @710  	serv = nn->nfsd_serv;
64e6304169f1e1 Jeff Layton          2024-01-03  711  	err = svc_addsock(serv, net, fd, buf, SIMPLE_TRANSACTION_LIMIT, cred);
0b7c2f6fc7e068 Chuck Lever          2009-04-23  712  
0cdf79b2cd9560 Mike Snitzer         2024-06-13  713  	if (!serv->sv_nrthreads && list_empty(&serv->sv_permsocks))
17419aefcbfd98 NeilBrown            2023-12-15  714  		nfsd_destroy_serv(net);
17419aefcbfd98 NeilBrown            2023-12-15  715  
ea068bad27cefc Chuck Lever          2009-04-23  716  	return err;
0b7c2f6fc7e068 Chuck Lever          2009-04-23  717  }
0b7c2f6fc7e068 Chuck Lever          2009-04-23  718  

:::::: The code at line 682 was first introduced by commit
:::::: 0cdf79b2cd95600567c1ab296631c3897763961e nfsd: prepare to use SRCU to dereference nn->nfsd_serv

:::::: TO: Mike Snitzer <snitzer@kernel.org>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
