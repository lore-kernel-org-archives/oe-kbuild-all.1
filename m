Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893E514B945
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720186909; cv=none; b=owFqKBeEYyzOu3JI4qonzOZd6Hj9FTczFgLeElC1jkn3/v66M01SAEIPuEZkrk6joMGbMN2CgcQUcoJj36UoCTzHrCLRDs4+bJbiZxxOTcVCdkXT9wHPJVbrqyLI79GpqdX5H5Y/qCkGAJ2WvI5cDtYfj7I/x0t7D+lZfERNGEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720186909; c=relaxed/simple;
	bh=/WXroGKIX7rYwY64iE0klAfol86NAn1qQpxOdeYeOWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ov1X+xqHMlDmXXuGhTYTYMBjnCoWRGrpFtqqKNkPmcpUm4nXoc22KJK44+EsfhMy6nrVnxsvKrtA+rVxRRRCujGDwKotnOEbobaGzMp1Wmlz0nR47oIfBbFsqxHjI+5VTyGd2fXoFqMylM+gVW3xGf0cgFHNQ65/RwaEBfXA+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5OvDp+T; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5OvDp+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720186908; x=1751722908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/WXroGKIX7rYwY64iE0klAfol86NAn1qQpxOdeYeOWs=;
  b=c5OvDp+TSP3re1cTyslfu9h4qh3wWSCInQIsys2AyJlY3En247d13vzd
   gddKi97aL3P8I32rm44HlJpEgiaDmbjfEFY+2mpuyNM3mvHFKUBCyD7vG
   47NfZvpKBf0zt9vszi+lnGGYCZz2N3gRcJI+HhMQ4rWuYuN7SxOLUYC5r
   XDr1FkcSW3lF52OJZQmObxkD60GIpY3IhsE35EFI6k1CLjK/EAxvCOvuJ
   GAhaDP5HIvbRqT0RDWIvESuye9Bx+/G3pkfmI4/DWUqEcpRXcMdhBzDkL
   g9SvdiFYNePlfpuF6dlE87W+0LToJzLPGnH4wJYrHGqqxY5G+PZNQ1Yxr
   Q==;
X-CSE-ConnectionGUID: X7xcPI0fQiSeaJiCETe7Sg==
X-CSE-MsgGUID: ZUL4z6KXSlaMO0H1jamolg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21249283"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="21249283"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 06:41:47 -0700
X-CSE-ConnectionGUID: h1c8kuGeRV2pi+N5m36U0g==
X-CSE-MsgGUID: LHUu15EITLW3ZdAPdzcakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="52068166"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2024 06:41:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPjC2-000SQm-0V;
	Fri, 05 Jul 2024 13:41:42 +0000
Date: Fri, 5 Jul 2024 21:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
	Peng Tao <tao.peng@primarydata.com>,
	Lance Shelton <lance.shelton@hammerspace.com>
Subject: [snitzer:nfs-localio-for-6.11.v9 9/19]
 fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202407052130.EJw4VWBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11.v9
head:   9c9a58ba4dec6cafa8fb3f570ad52db6151824bc
commit: 6a6d59e5a4813e7d471b6a0e682c94176c1ce3d0 [9/19] pnfs/flexfiles: Enable localio for flexfiles I/O
config: riscv-randconfig-r132-20240705 (https://download.01.org/0day-ci/archive/20240705/202407052130.EJw4VWBK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407052130.EJw4VWBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407052130.EJw4VWBK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file [noderef] __rcu *__new @@     got struct file *[assigned] new @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse:     expected struct file [noderef] __rcu *__new
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse:     got struct file *[assigned] new
>> fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: cast removes address space '__rcu' of expression
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] filp @@     got struct file [noderef] __rcu * @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     expected struct file *[assigned] filp
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     got struct file [noderef] __rcu *
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse:     expected struct file [noderef] __rcu **f
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse:     got struct file **
   fs/nfs/flexfilelayout/flexfilelayout.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/nfs/flexfilelayout/flexfilelayout.c:336:38: sparse: sparse: self-comparison always evaluates to false
   fs/nfs/flexfilelayout/flexfilelayout.c:339:62: sparse: sparse: self-comparison always evaluates to false

vim +/__rcu +199 fs/nfs/flexfilelayout/flexfilelayout.c

   165	
   166	static struct file *
   167	ff_local_open_fh(struct pnfs_layout_segment *lseg,
   168			 u32 ds_idx,
   169			 struct nfs_client *clp,
   170			 const struct cred *cred,
   171			 struct nfs_fh *fh,
   172			 fmode_t mode)
   173	{
   174		struct nfs4_ff_layout_mirror *mirror = FF_LAYOUT_COMP(lseg, ds_idx);
   175		struct file *filp, *new, __rcu **pfile;
   176	
   177		if (!nfs_server_is_local(clp))
   178			return NULL;
   179		if (mode & FMODE_WRITE) {
   180			/*
   181			 * Always request read and write access since this corresponds
   182			 * to a rw layout.
   183			 */
   184			mode |= FMODE_READ;
   185			pfile = &mirror->rw_file;
   186		} else
   187			pfile = &mirror->ro_file;
   188	
   189		new = NULL;
   190		rcu_read_lock();
   191		filp = rcu_dereference(*pfile);
   192		if (!filp) {
   193			rcu_read_unlock();
   194			new = nfs_local_open_fh(clp, cred, fh, mode);
   195			if (IS_ERR(new))
   196				return NULL;
   197			rcu_read_lock();
   198			/* try to swap in the pointer */
 > 199			filp = cmpxchg(pfile, NULL, new);
   200			if (!filp) {
   201				filp = new;
   202				new = NULL;
   203			}
   204		}
   205		filp = get_file_rcu(&filp);
   206		rcu_read_unlock();
   207		if (new)
   208			fput(new);
   209		return filp;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
