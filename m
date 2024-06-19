Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9081411D7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718818597; cv=none; b=EnJFrjRxdzuEJiAFU1yr1RCDUEfceJmdkrdQQV7W8aBDnnmErCMNL3PRWncQbesxKDyLvYGqhUz7XGS2vl+8rbFpi1//6941qxxmeF5wXJideooc11Iy89huu8T8uFFdjwFWvX2qU+5gEXRpPdsqV/nHYbE1jSEvaWdfnENCKlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718818597; c=relaxed/simple;
	bh=ws9IylyuguPOVcRDjthQYhIZ3ueuJwMIkqHSlnU3r1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JgOCr6gfzLy3+1rsmInMK9MWhKYtVVz/vdnjhoAalqNzVY25GM7aPs5lGJYkg/Q9sY8iTejLX0WU9q6XrSLnXB6zfY8GjUh4z7d0DqXHZlpfm6J8Qzs30/iwqUFs9fZewRvy7DFqaPy1xQEKiDs4hQusYJLHKOgk4kleCu626b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FB+j2UsT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FB+j2UsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718818596; x=1750354596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ws9IylyuguPOVcRDjthQYhIZ3ueuJwMIkqHSlnU3r1M=;
  b=FB+j2UsTrZWecFuNcSliWaR0OJB5dpOS0osXqbNof88R3KT9d9RBAFVR
   4Nyrgfw2XeZ689fzA/6lJ8iXtMgdiGaAePR7ktO3TCurGD/dihoVpBYfg
   68HkaF1PjJqk90BhDOW670Qq071o5YzrL5k19MeWaL1r4OW0HxiV5f/LZ
   HSx1/SKi3IEaWiCLGMa/Iix1F7OVK4dlUR7q7Fb+5bHsUswpanlLDOKyM
   roNqoOC7r9g4ilh6y7cwDcPnNM9qtFrBf8JoZS0bE4f6MgNbcCZeXCWFe
   o7kKO11aqtqY6QeeAK07KCDQFSWJZ/piANQpdxyE4/SJwsKFcD9DSYJz4
   w==;
X-CSE-ConnectionGUID: E7XKuB/ZSQeW80GkiXVKsw==
X-CSE-MsgGUID: +56KEoZuR5qmQu1kBfRPvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27189749"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="27189749"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 10:36:35 -0700
X-CSE-ConnectionGUID: vVwI3pdiRMiyzPBYPPK7KA==
X-CSE-MsgGUID: BB7CqHRxRs+1RXBQmRaPyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="65230757"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2024 10:36:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJzEU-0006p0-2w;
	Wed, 19 Jun 2024 17:36:30 +0000
Date: Thu, 20 Jun 2024 01:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
	Peng Tao <tao.peng@primarydata.com>,
	Lance Shelton <lance.shelton@hammerspace.com>
Subject: [snitzer:nfs-localio-for-6.11.v4 8/18]
 fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202406200126.dzLssGrF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11.v4
head:   5f16a352e5126c614e3c7130110341e13e09e68b
commit: 8560ceb5695d6ea3cfca97073bc16c1658d32852 [8/18] pnfs/flexfiles: Enable localio for flexfiles I/O
config: hexagon-randconfig-r122-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200126.dzLssGrF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce: (https://download.01.org/0day-ci/archive/20240620/202406200126.dzLssGrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200126.dzLssGrF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file [noderef] __rcu *__new @@     got struct file *[assigned] new @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse:     expected struct file [noderef] __rcu *__new
   fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse:     got struct file *[assigned] new
>> fs/nfs/flexfilelayout/flexfilelayout.c:199:24: sparse: sparse: Using plain integer as NULL pointer
>> fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] filp @@     got struct file [noderef] __rcu *[assigned] __oldval @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     expected struct file *[assigned] filp
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     got struct file [noderef] __rcu *[assigned] __oldval
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
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
