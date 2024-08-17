Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74B8C13
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723906966; cv=none; b=V+EUDN5RyVmYgq87llIHCdBcKNgTiCLEQKOrXmIYc6b2iF53hsY23w3joVYm3xU6PKA3l5kU7c/JuFThMSXUODPEn2UItFlXIYAyC/CpEYop3VvC11rOib8cQ3mHtZxfGOToLFLnbE2LD/5AW0gwPbEfPg1K1k9RtAW6sAwtuz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723906966; c=relaxed/simple;
	bh=f7b6lyKAANpaSBtCar04OA2ro4UxJ5SBNXaGW0D9500=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POZxseQ9dY3WE03IKa1S8Y1fPYSpIclX3ErvapKVmqfaElqwL9mwfVbYB50ss9H17g255qgkSxz7r8q/ERzhcNHdK0Kt164lvjfN4WfPxJ0fL2euRP7uzx1e4LPIbF65CCuWKrs6b/hRbl3z6CkDDY7Z6kqujPerqdrMQnsveRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAhgO/zQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAhgO/zQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723906965; x=1755442965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f7b6lyKAANpaSBtCar04OA2ro4UxJ5SBNXaGW0D9500=;
  b=MAhgO/zQty1y3GkfoUMnnHHzG0m5yIZOxsby1IUEbM9MHBVXCR4c3tel
   j9ZmrScKS27Fy8DLKJ2yIZOCj/I0gKJjSmh/crcMD72lnap3ssSa/Ett6
   CkBVTKfiJHVw4cKv0SDtgP6ZjPpIV6D3O8uoyR6tmjaQN5hM141YOhLgm
   0AGLq5S46aGpzSWGObeSraTz1e2UwJmGmlCgXjkEe1JKgAAdVxFcFrDNU
   dxC51NnZ1Bwrvp7oNaIECH92QbGGUSl3JYFs3s6nEjsx0BirAaeBcgKu5
   JaCQTZMvFjIitg3V4KMn8j119Vk9wxV4tw+8KqQ8v80/hnxM3gDJgzZ3i
   Q==;
X-CSE-ConnectionGUID: FsD94kexQDWVGXgPxhDTjQ==
X-CSE-MsgGUID: 2aYrkCLsR6Syn+FWruHE3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22334490"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="22334490"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 08:02:44 -0700
X-CSE-ConnectionGUID: JChkwqdCRcqoPPmLlHV7rA==
X-CSE-MsgGUID: lEiuI8iUR/2suvIjmoY7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="59645645"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2024 08:02:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfKwy-0007a6-0S;
	Sat, 17 Aug 2024 15:02:40 +0000
Date: Sat, 17 Aug 2024 23:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next-6.11-rc3 26/26]
 fs/nfs/flexfilelayout/flexfilelayout.c:202:21: error: assignment to 'struct
 nfsd_file *' from incompatible pointer type 'struct file *'
Message-ID: <202408172327.2okeBsqw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next-6.11-rc3
head:   d185b803ff9694a70f39b5e1cf3ea404782ef6dd
commit: d185b803ff9694a70f39b5e1cf3ea404782ef6dd [26/26] nfs: switch client to use nfsd_file for localio
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240817/202408172327.2okeBsqw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408172327.2okeBsqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408172327.2okeBsqw-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_local_open_fh':
>> fs/nfs/flexfilelayout/flexfilelayout.c:202:21: error: assignment to 'struct nfsd_file *' from incompatible pointer type 'struct file *' [-Wincompatible-pointer-types]
     202 |                 new = nfs_local_open_fh(clp, cred, fh, mode);
         |                     ^
>> fs/nfs/flexfilelayout/flexfilelayout.c:213:17: error: 'struct nfs_client' has no member named 'nfsd_file_get'
     213 |         nf = clp->nfsd_file_get(nf);
         |                 ^~
>> fs/nfs/flexfilelayout/flexfilelayout.c:216:20: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     216 |                 clp->nfsd_file_put(new);
         |                    ^~
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_free_mirror':
   fs/nfs/flexfilelayout/flexfilelayout.c:301:20: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     301 |                 clp->nfsd_file_put(nf);
         |                    ^~
   fs/nfs/flexfilelayout/flexfilelayout.c:304:20: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     304 |                 clp->nfsd_file_put(nf);
         |                    ^~
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_alloc_lseg':
   fs/nfs/flexfilelayout/flexfilelayout.c:590:78: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     590 |                                                 mirror->mirror_ds->ds->ds_clp->nfsd_file_put(nf);
         |                                                                              ^~
   fs/nfs/flexfilelayout/flexfilelayout.c:598:78: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     598 |                                                 mirror->mirror_ds->ds->ds_clp->nfsd_file_put(nf);
         |                                                                              ^~
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_io_track_ds_error':
   fs/nfs/flexfilelayout/flexfilelayout.c:1299:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1299 |         int err;
         |             ^~~


vim +202 fs/nfs/flexfilelayout/flexfilelayout.c

d185b803ff9694 Mike Snitzer    2024-08-14  173  
d185b803ff9694 Mike Snitzer    2024-08-14  174  static struct nfsd_file *
341000a1f1d534 Trond Myklebust 2019-11-03  175  ff_local_open_fh(struct pnfs_layout_segment *lseg,
341000a1f1d534 Trond Myklebust 2019-11-03  176  		 u32 ds_idx,
341000a1f1d534 Trond Myklebust 2019-11-03  177  		 struct nfs_client *clp,
341000a1f1d534 Trond Myklebust 2019-11-03  178  		 const struct cred *cred,
341000a1f1d534 Trond Myklebust 2019-11-03  179  		 struct nfs_fh *fh,
341000a1f1d534 Trond Myklebust 2019-11-03  180  		 fmode_t mode)
341000a1f1d534 Trond Myklebust 2019-11-03  181  {
341000a1f1d534 Trond Myklebust 2019-11-03  182  	struct nfs4_ff_layout_mirror *mirror = FF_LAYOUT_COMP(lseg, ds_idx);
d185b803ff9694 Mike Snitzer    2024-08-14  183  	struct nfsd_file *nf, *new, __rcu **pnf;
341000a1f1d534 Trond Myklebust 2019-11-03  184  
341000a1f1d534 Trond Myklebust 2019-11-03  185  	if (!nfs_server_is_local(clp))
341000a1f1d534 Trond Myklebust 2019-11-03  186  		return NULL;
341000a1f1d534 Trond Myklebust 2019-11-03  187  	if (mode & FMODE_WRITE) {
341000a1f1d534 Trond Myklebust 2019-11-03  188  		/*
341000a1f1d534 Trond Myklebust 2019-11-03  189  		 * Always request read and write access since this corresponds
341000a1f1d534 Trond Myklebust 2019-11-03  190  		 * to a rw layout.
341000a1f1d534 Trond Myklebust 2019-11-03  191  		 */
341000a1f1d534 Trond Myklebust 2019-11-03  192  		mode |= FMODE_READ;
d185b803ff9694 Mike Snitzer    2024-08-14  193  		pnf = &mirror->rw_file;
341000a1f1d534 Trond Myklebust 2019-11-03  194  	} else
d185b803ff9694 Mike Snitzer    2024-08-14  195  		pnf = &mirror->ro_file;
341000a1f1d534 Trond Myklebust 2019-11-03  196  
341000a1f1d534 Trond Myklebust 2019-11-03  197  	new = NULL;
341000a1f1d534 Trond Myklebust 2019-11-03  198  	rcu_read_lock();
d185b803ff9694 Mike Snitzer    2024-08-14  199  	nf = rcu_dereference(*pnf);
d185b803ff9694 Mike Snitzer    2024-08-14  200  	if (!nf) {
341000a1f1d534 Trond Myklebust 2019-11-03  201  		rcu_read_unlock();
341000a1f1d534 Trond Myklebust 2019-11-03 @202  		new = nfs_local_open_fh(clp, cred, fh, mode);
341000a1f1d534 Trond Myklebust 2019-11-03  203  		if (IS_ERR(new))
341000a1f1d534 Trond Myklebust 2019-11-03  204  			return NULL;
341000a1f1d534 Trond Myklebust 2019-11-03  205  		rcu_read_lock();
341000a1f1d534 Trond Myklebust 2019-11-03  206  		/* try to swap in the pointer */
d185b803ff9694 Mike Snitzer    2024-08-14  207  		nf = cmpxchg(pnf, NULL, new);
d185b803ff9694 Mike Snitzer    2024-08-14  208  		if (!nf) {
d185b803ff9694 Mike Snitzer    2024-08-14  209  			nf = new;
341000a1f1d534 Trond Myklebust 2019-11-03  210  			new = NULL;
341000a1f1d534 Trond Myklebust 2019-11-03  211  		}
341000a1f1d534 Trond Myklebust 2019-11-03  212  	}
d185b803ff9694 Mike Snitzer    2024-08-14 @213  	nf = clp->nfsd_file_get(nf);
341000a1f1d534 Trond Myklebust 2019-11-03  214  	rcu_read_unlock();
341000a1f1d534 Trond Myklebust 2019-11-03  215  	if (new)
d185b803ff9694 Mike Snitzer    2024-08-14 @216  		clp->nfsd_file_put(new);
d185b803ff9694 Mike Snitzer    2024-08-14  217  	return nf;
341000a1f1d534 Trond Myklebust 2019-11-03  218  }
341000a1f1d534 Trond Myklebust 2019-11-03  219  

:::::: The code at line 202 was first introduced by commit
:::::: 341000a1f1d534755829800b27ffd46890e4fa9e pnfs/flexfiles: enable localio support

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
