Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DE5A47
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718153178; cv=none; b=bPMysrHJiWXAxOg3r++L+W2yiJMe1B3Phhi7pY0OQl9IGD4nlZq8lgmntMdiizl+ggtHG+JjHXRtDPklvbSfTFhkB1ViBjUEaVBQ5f6w78jLhnCXfu8NxIJ8YIvuYEe0ebQ2vfHGJeXvNwHi3dxKj/HFNAr4gWGL6b9QtwUTEpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718153178; c=relaxed/simple;
	bh=RS6VVS97LjK818B11Vq6U9VF2ibB7BYRjyq57IuOAp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nj81kn6yYl1K6Xl/Ppjl3Fu/iSkZT+/LStHxX5Kr60sek+aOoXsTujXHIXsYZk6LbaOnHBE/qv/A7g4isK9KgQQ0SeF52SHbd2cNm4Od/KSkRoj6NHIW2v3AotIdIyWMCPbWPdh/AEXj+UADdeQzmql6CWTj1w3mQvtYwNmbym4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+Wq3tJb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+Wq3tJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718153176; x=1749689176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RS6VVS97LjK818B11Vq6U9VF2ibB7BYRjyq57IuOAp4=;
  b=H+Wq3tJbBxXA6goQffIgXlu0u963r9L6+L/43BJaNqV165iGCPsHXBep
   D0oSn/uycmAsZ3n0sHAjB6kzhD07nZ1UsQcI914pN3tIjwDk3l3vNJ0+y
   6TMAzNc4vIJB+b28KmlfggkXX8B7KT6JvuCeglcE6An4iZAYINSLiNeEU
   f6C8LLdI4OCHLTHwB+rmmMDiFsY8vzSJsTOG82QjWj2bbOc+1JqTY5O9y
   SSh0iPFDLgjq4kR4/xmcCeap1JpoXJtQBvLaxwhrWTxGupJ3SUvmXPjwZ
   2i6J+KaKjJpzD5ATP0gFrAax6eC2G98fV15/Q6lRldHhCOT4ILZ6c7QRi
   g==;
X-CSE-ConnectionGUID: odJDvtKyQNuVH7BUiH6ZSQ==
X-CSE-MsgGUID: YiY7/QSCQcebzn1HEeF5sQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25473682"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="25473682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 17:46:15 -0700
X-CSE-ConnectionGUID: fBhhZ1CVS8uTPcDCnBN9BQ==
X-CSE-MsgGUID: zgjDah5dQOCl3l9vCJQRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="70816858"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jun 2024 17:46:14 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHC7w-00012Q-06;
	Wed, 12 Jun 2024 00:46:12 +0000
Date: Wed, 12 Jun 2024 08:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:nfs-localio-for-6.11.v1 13/30]
 fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202406120827.QkwA2GTi-lkp@intel.com>
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
config: powerpc64-randconfig-r133-20240612 (https://download.01.org/0day-ci/archive/20240612/202406120827.QkwA2GTi-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240612/202406120827.QkwA2GTi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120827.QkwA2GTi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file [noderef] __rcu *_n_ @@     got struct file *[assigned] new @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse:     expected struct file [noderef] __rcu *_n_
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse:     got struct file *[assigned] new
>> fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] filp @@     got struct file [noderef] __rcu * @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     expected struct file *[assigned] filp
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     got struct file [noderef] __rcu *
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
