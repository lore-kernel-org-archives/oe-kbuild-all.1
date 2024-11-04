Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE61C9ED6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730743953; cv=none; b=Hzg84EgiPhAdVoZ72fQJN+Oc9nviMdbpdXor3KiIf4PATEvpNGNWsjW6+qpurmn7VrfMpz5BTM7hozRWiK3cSomaqpwTj++r5JzemhrQpBEkV3NywaNuzFy9l73cjF2SMaa5wtdmPMCDJd94Zn00yLNpqEC31FnYIC5Dhji8FYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730743953; c=relaxed/simple;
	bh=4jTapEbyYKp1NbNFNZ02TqEFZFxI1PBjFnPYKar6UCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FsKFILzcqwMiAzu4PEO7sJyrmGf2+yfuXIVHJZRJ9BWkYhqPPH7H4MBoumMCx7O6gue93cSmdtrJj/CY8CyEddpyJKNeSDd+gpit8XkZZm0f2bwT6FLyXmw3cVxvbCfmwy2WrvP6bxnKE1ppJWba8B36mJBH44eNbrgIEGPtfeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5+8MXBy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5+8MXBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730743952; x=1762279952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4jTapEbyYKp1NbNFNZ02TqEFZFxI1PBjFnPYKar6UCc=;
  b=G5+8MXBy1uedQA0aNLc6Qxea7O1tnqCYpv+Wfxo9qlKJiJ/+a+gTfbHw
   qhOdmMPzI88hRRaP8Xtn00+GZNJUDDTvN8NPUeMEMoGdOt+6fHyNyTVBr
   /tQCPjQ0pdWulufuRLz8qOKg1DLXWMLoXIm4Yn1TLrYbStHhUTTBC4oOs
   xkhg8SFwd8qlY34p3/MpM/MovzPMj4cubydruRI/Dp4vODyswmQQoLOWJ
   S8toJjMkRwJ9TI+HkGfY5Hm7O6eS5zQJ9UEOJCWTwhOb4LXpXPffPPF+8
   C3Pj1O98Hry7sCy9S0L6Dj3g7sYQ2tUGItSvnK/LqUgwwl1PB1VyRoPrR
   Q==;
X-CSE-ConnectionGUID: yyDNqx+oRHunqc8ewTwdfg==
X-CSE-MsgGUID: 2dxs5LSyTo+rZEQMgLzWSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30309139"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30309139"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:12:31 -0800
X-CSE-ConnectionGUID: AP8accjhQRWerai/sN9bBw==
X-CSE-MsgGUID: 6SH7stdTSZGD2p6eYDnw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="87670830"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 10:12:29 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t81Yx-000l6n-0R;
	Mon, 04 Nov 2024 18:12:27 +0000
Date: Tue, 5 Nov 2024 02:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 20/27] fs/nfs/localio.c:289:22:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202411050254.NkyAiUJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   011b3478732d0ccd6962aac6d9e01db32dce3748
commit: a37cec9d1b28435a2cfc8064ff99765f50b46bfd [20/27] nfs: cache open nfsd_file(s) in client
config: arc-randconfig-r122-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050254.NkyAiUJZ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241105/202411050254.NkyAiUJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050254.NkyAiUJZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/localio.c:289:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct nfsd_file [noderef] __rcu *_n_ @@     got struct nfsd_file *[assigned] new @@
   fs/nfs/localio.c:289:22: sparse:     expected struct nfsd_file [noderef] __rcu *_n_
   fs/nfs/localio.c:289:22: sparse:     got struct nfsd_file *[assigned] new
>> fs/nfs/localio.c:289:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct nfsd_file *[assigned] nf @@     got struct nfsd_file [noderef] __rcu *[assigned] _prev_ @@
   fs/nfs/localio.c:289:20: sparse:     expected struct nfsd_file *[assigned] nf
   fs/nfs/localio.c:289:20: sparse:     got struct nfsd_file [noderef] __rcu *[assigned] _prev_
   fs/nfs/localio.c: note: in included file (through include/linux/fs.h, include/linux/highmem.h, include/linux/bvec.h, ...):
   include/linux/ioprio.h:65:18: sparse: sparse: self-comparison always evaluates to false
   fs/nfs/localio.c:511:1: sparse: sparse: context imbalance in 'nfs_copy_boot_verifier' - different lock contexts for basic block

vim +289 fs/nfs/localio.c

   254	
   255	/*
   256	 * nfs_local_open_fh - open a local filehandle in terms of nfsd_file.
   257	 * First checking if the open nfsd_file is already cached, otherwise
   258	 * must __nfs_local_open_fh and insert the nfsd_file in nfs_fh.
   259	 *
   260	 * Returns a pointer to a struct nfsd_file or NULL.
   261	 */
   262	struct nfsd_file *
   263	nfs_local_open_fh(struct nfs_client *clp, const struct cred *cred,
   264			  struct nfs_fh *fh, const fmode_t mode)
   265	{
   266		struct nfs_fh_localio *nfh = (struct nfs_fh_localio *)fh;
   267		struct nfsd_file *nf, *new, __rcu **pnf;
   268	
   269		if (!nfs_server_is_local(clp))
   270			return NULL;
   271		if (mode & ~(FMODE_READ | FMODE_WRITE))
   272			return NULL;
   273	
   274		if (mode & FMODE_WRITE)
   275			pnf = &nfh->rw_file;
   276		else
   277			pnf = &nfh->ro_file;
   278	
   279		new = NULL;
   280		rcu_read_lock();
   281		nf = rcu_dereference(*pnf);
   282		if (!nf) {
   283			rcu_read_unlock();
   284			new = __nfs_local_open_fh(clp, cred, fh, mode);
   285			if (IS_ERR(new))
   286				return NULL;
   287			rcu_read_lock();
   288			/* try to swap in the pointer */
 > 289			nf = cmpxchg(pnf, NULL, new);
   290			if (!nf) {
   291				nf = new;
   292				new = NULL;
   293			}
   294		}
   295		nf = nfs_local_file_get(nf);
   296		rcu_read_unlock();
   297		if (new)
   298			nfs_to_nfsd_file_put_local(new);
   299		return nf;
   300	}
   301	EXPORT_SYMBOL_GPL(nfs_local_open_fh);
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
