Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCC6157A40
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717748574; cv=none; b=ATl8wAnsi5TtSPPW97eBy8A1ODdxTISr9AJBKL4gHFAvB56338kmGCquwuYUekLiniXSWSE82U32Cjml9wmNMaGDFqR0EsW0Mi9KUayKwmC+fWFFfiR9lqDNJ0VSmxDYe4mg9pVQjfKWMu4NsNwVQOAyFz2irgY89O1BC5OqsEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717748574; c=relaxed/simple;
	bh=cbXA27wD0IUQyRghWSAez2f+hf7ijWWpek58GFZTkmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fF3wEitSE4zXDFWlSfhxwOMMATtfWEhrbVvRDsDaoT+bYtCJA0fWe5RM5/kzJ6EIr+FF73NCIjPZzJxpv+0v2DH0sBpjy1Ui5KGwuqYf0zw58dj7Xyh7rjYeb6gXPUWMPK7nsrf2Lg4+CinBFZm//Tw2v9b9MdtGx7QeOq2430Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atITQXEn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atITQXEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717748572; x=1749284572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cbXA27wD0IUQyRghWSAez2f+hf7ijWWpek58GFZTkmo=;
  b=atITQXEn++aLUqqcdV95lR/kALDhjfd1Ml54GnGSKchNZRbqgBR+wOhU
   tzsSVJfU0RbyRbrcCb0m4M9745fRUbhFcBEA1yMn+B3ppN4mQHgkfsZyU
   oK1FQd7W616lDigOINm3RYlxPmBsd5RzpqM3eGsHYbmGMttEURfQps+zm
   OsgTxdLCyS4F3dHEY//Ca5A/9qf94eMEZoRuBzqbg1sLWxs96LPxyY+tv
   38uXdf8YFJq/F240FepJjpeQ+/rpDKeSwo54OrOMWu67RdjGd3pJ25pKO
   YgUH2BuAm3w4SN3acj6amvDPCJoDtr/AVPmpc4z3XVNfaUUl2mdbmegu3
   w==;
X-CSE-ConnectionGUID: 72FY/EQ+T1GSeoq/VR4HZQ==
X-CSE-MsgGUID: pDJM03HiQAWBibxCxYiPJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14615722"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14615722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 01:22:52 -0700
X-CSE-ConnectionGUID: zwc/Cp0NQ3GOYTjT2eG/kA==
X-CSE-MsgGUID: ZgyOhBhYRIWzeo02F+4faQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38823471"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Jun 2024 01:22:51 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFUrh-0004Fi-2g;
	Fri, 07 Jun 2024 08:22:35 +0000
Date: Fri, 7 Jun 2024 16:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:nfs-localio-for-6.11 13/29]
 fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202406071836.IOK5vz73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11
head:   1dadc081b646bfa3fca1c0e117e0be8f4de62509
commit: 51267937be8090c58d3741df1005db6b633bfc1e [13/29] pnfs/flexfiles: Enable localio for flexfiles I/O
config: arc-randconfig-r133-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071836.IOK5vz73-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240607/202406071836.IOK5vz73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071836.IOK5vz73-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file [noderef] __rcu *_n_ @@     got struct file *[assigned] new @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse:     expected struct file [noderef] __rcu *_n_
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse:     got struct file *[assigned] new
>> fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] filp @@     got struct file [noderef] __rcu *[assigned] _prev_ @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     expected struct file *[assigned] filp
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     got struct file [noderef] __rcu *[assigned] _prev_
>> fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse:     expected struct file [noderef] __rcu **f
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse:     got struct file **
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
 > 205		filp = get_file_rcu(&filp);
   206		rcu_read_unlock();
   207		if (new)
   208			fput(new);
   209		return filp;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
