Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A284055
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718251174; cv=none; b=c+e1F/ndZezvy1kXTgJOzlWTX9z6k7gNwB6rQ1me3FJqmmKWEeFeSJ4N8RGP++dLPycwcVQm2wKGtt04zNZEQvpi8zlPuBsfaSk6dOkcCqFILrQId1XT5XKY/DHnJLBkvrQ02wzBvC6UArl8FfXvziOZyBGdKa/so/Yr+DqmMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718251174; c=relaxed/simple;
	bh=6hr7vj8ju959mSMnhhqcBq+jyMEJewnYW/n4D00iLNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OSuPMuY2iDbaftwn/x8pJPi7NuhaYKconrvsBqCu7sGt4GvswWGxB/2vvxK9G7qljWDF1isxHbkfMKmfbNQSgVemxPMJIPJsO3xxP6skWxxOx5XnL+TAXor2KzajvcastFjhi/cnAAsjL2C158TZtGyiUW/e2MH/6i0lIOxhnZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fv79sxd1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fv79sxd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718251173; x=1749787173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6hr7vj8ju959mSMnhhqcBq+jyMEJewnYW/n4D00iLNU=;
  b=fv79sxd1sUhO2oHS39uvFSU1cMqHbvpHULncfqmvyH/vZSSif7RuCpjc
   mJQKvxYDavN7+t/YD8T6OZi+NrB6GnqtxB4hSvHpYREgw1chy0TxKq1S1
   UX93zTExGWOgn6sNgm+K455+q4SYyfGT5xmCBb4HVjtU/dL/qn/aNr0kI
   KPe2CMJbNfQocemoFxdQvAwIlK3nw/McldfkatpNZTt1RAJAe420KAjXc
   jzsDTYDpsTmxMOdo+7N+XLJ8Ua03HDjT9kOG4fuOdE4kewPRjmM8cUmSb
   Z4UsX7pZfcf/sR0b7pLgV9X9y5sPbtBc3EFRcXMnUiJN+/xN2xdLUUTR5
   Q==;
X-CSE-ConnectionGUID: ro0gm/FbTJSRYBxE8AXMfA==
X-CSE-MsgGUID: chNh9zmGSdu8fq3qQlnlgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15200456"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15200456"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:59:32 -0700
X-CSE-ConnectionGUID: QMEL9O6eTfOhar81VKW13A==
X-CSE-MsgGUID: iA/ICpNBRvaSfnqvDhcy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="77455915"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2024 20:59:31 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbcW-0002CY-0d;
	Thu, 13 Jun 2024 03:59:28 +0000
Date: Thu, 13 Jun 2024 11:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:nfs-localio-for-6.11.v1 13/30]
 fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202406131154.Hw8ZQhQs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11.v1
head:   1789fdef7360bae52432cff137a064a63327d6ae
commit: be78132d36211d2280fc09baf5857a024d31ed36 [13/30] pnfs/flexfiles: Enable localio for flexfiles I/O
config: s390-randconfig-r112-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131154.Hw8ZQhQs-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240613/202406131154.Hw8ZQhQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131154.Hw8ZQhQs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] filp @@     got struct file [noderef] __rcu *[assigned] __ret @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     expected struct file *[assigned] filp
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     got struct file [noderef] __rcu *[assigned] __ret
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse:     expected struct file [noderef] __rcu **f
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse:     got struct file **
   fs/nfs/flexfilelayout/flexfilelayout.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/nfs/flexfilelayout/flexfilelayout.c:336:38: sparse: sparse: self-comparison always evaluates to false
   fs/nfs/flexfilelayout/flexfilelayout.c:339:62: sparse: sparse: self-comparison always evaluates to false

vim +199 fs/nfs/flexfilelayout/flexfilelayout.c

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
