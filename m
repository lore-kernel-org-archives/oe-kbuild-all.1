Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8ED142621
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 06:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724047588; cv=none; b=nGi0l0QqzCnsZ3vwAxmSEQuZyK1r4WzSa+EM49SNsVTqBWpMS8WO3207cqBQwCc/RD2ogkzK3w59y6XnoOjh9C7+sgC+HzSDvIVW89thPmUYxmAcX/mmo+V2QuRaU0C0ieIlKlHw3isWDloNLtfW6opUsxLt+o356zmOaxHGMEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724047588; c=relaxed/simple;
	bh=VrjPuFPLOwZnJsMu2h879gS3p56Zw4shdBSAlHO2DK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uqs9IAKJyWUO2Y3h/HK46O/JPUMBfmEvhsm1c7rihFlf001ABLF+SsEUeXmn5gZmROIDFLkEGqhkhIi836wT71+XM43a6ypeC5jJ1Qr6SX1a6qryV7bf4EFfsFzzngQvA9FlTeZI0R3JHc0+56ng77RCeiRDwNWvnukhXDSUaw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8hGZc3z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8hGZc3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724047587; x=1755583587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VrjPuFPLOwZnJsMu2h879gS3p56Zw4shdBSAlHO2DK0=;
  b=H8hGZc3zMeBDCHKXDivYng69FJ8DCTsm+RdebF8NTVRApGA49EDeVedW
   nSMNLDte2GO1yf5jq2znl7NlWYU20mwDcEVygCV6Dngj5D8KnrACoAh7i
   72ny3jO6dMhWWoc3x1XX5LLZJ6110RNe9I8egQ4E64DyKvhmEcKdTYdcK
   ih6YwwB+TQaEP4QqwXHirc2gZHPW+MYtZ6Du+/cmpzzyuVahL5ExcB5pI
   EVkAB0l5IvGUwWakamyRgdroxcSaZu0Z9n5L3OS0LYqOcs1bRYXmdG1pb
   aUzWOvpSivVu9Kw+Gmvvo66BxSadmDGSl3tvAWZlsVN7hZpLrmhvz8OsR
   A==;
X-CSE-ConnectionGUID: JHksP9m1SzWR2FXETPewTQ==
X-CSE-MsgGUID: diLaSo16TlSPDgltBRF8nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22417989"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="22417989"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 23:06:26 -0700
X-CSE-ConnectionGUID: gVKhT4nqRDO9jLXVn31Urg==
X-CSE-MsgGUID: zksnIPp6RISeHWFi93cPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="60563806"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2024 23:06:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfvX4-0008gC-0K;
	Mon, 19 Aug 2024 06:06:22 +0000
Date: Mon, 19 Aug 2024 14:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next-nfsd_file 25/25]
 fs/nfs/flexfilelayout/flexfilelayout.c:202:21: error: assignment to 'struct
 nfsd_file *' from incompatible pointer type 'struct file *'
Message-ID: <202408191345.iuoOwk3V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next-nfsd_file
head:   60f26fd3eccfac7de2bab5613745670132e08ae7
commit: 60f26fd3eccfac7de2bab5613745670132e08ae7 [25/25] nfs: switch client to use nfsd_file for localio
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240819/202408191345.iuoOwk3V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408191345.iuoOwk3V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408191345.iuoOwk3V-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_local_open_fh':
>> fs/nfs/flexfilelayout/flexfilelayout.c:202:21: error: assignment to 'struct nfsd_file *' from incompatible pointer type 'struct file *' [-Werror=incompatible-pointer-types]
     202 |                 new = nfs_local_open_fh(clp, cred, fh, mode);
         |                     ^
>> fs/nfs/flexfilelayout/flexfilelayout.c:219:20: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     219 |                 clp->nfsd_file_put(new);
         |                    ^~
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_free_mirror':
   fs/nfs/flexfilelayout/flexfilelayout.c:304:20: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     304 |                 clp->nfsd_file_put(nf);
         |                    ^~
   fs/nfs/flexfilelayout/flexfilelayout.c:307:20: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     307 |                 clp->nfsd_file_put(nf);
         |                    ^~
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_alloc_lseg':
   fs/nfs/flexfilelayout/flexfilelayout.c:593:78: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     593 |                                                 mirror->mirror_ds->ds->ds_clp->nfsd_file_put(nf);
         |                                                                              ^~
   fs/nfs/flexfilelayout/flexfilelayout.c:601:78: error: 'struct nfs_client' has no member named 'nfsd_file_put'
     601 |                                                 mirror->mirror_ds->ds->ds_clp->nfsd_file_put(nf);
         |                                                                              ^~
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_io_track_ds_error':
   fs/nfs/flexfilelayout/flexfilelayout.c:1302:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1302 |         int err;
         |             ^~~
   cc1: some warnings being treated as errors


vim +202 fs/nfs/flexfilelayout/flexfilelayout.c

60f26fd3eccfac Mike Snitzer    2024-08-14  173  
60f26fd3eccfac Mike Snitzer    2024-08-14  174  static struct nfsd_file *
d93f7d110bf0b5 Trond Myklebust 2019-11-03  175  ff_local_open_fh(struct pnfs_layout_segment *lseg,
d93f7d110bf0b5 Trond Myklebust 2019-11-03  176  		 u32 ds_idx,
d93f7d110bf0b5 Trond Myklebust 2019-11-03  177  		 struct nfs_client *clp,
d93f7d110bf0b5 Trond Myklebust 2019-11-03  178  		 const struct cred *cred,
d93f7d110bf0b5 Trond Myklebust 2019-11-03  179  		 struct nfs_fh *fh,
d93f7d110bf0b5 Trond Myklebust 2019-11-03  180  		 fmode_t mode)
d93f7d110bf0b5 Trond Myklebust 2019-11-03  181  {
d93f7d110bf0b5 Trond Myklebust 2019-11-03  182  	struct nfs4_ff_layout_mirror *mirror = FF_LAYOUT_COMP(lseg, ds_idx);
60f26fd3eccfac Mike Snitzer    2024-08-14  183  	struct nfsd_file *nf, *new, __rcu **pnf;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  184  
d93f7d110bf0b5 Trond Myklebust 2019-11-03  185  	if (!nfs_server_is_local(clp))
d93f7d110bf0b5 Trond Myklebust 2019-11-03  186  		return NULL;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  187  	if (mode & FMODE_WRITE) {
d93f7d110bf0b5 Trond Myklebust 2019-11-03  188  		/*
d93f7d110bf0b5 Trond Myklebust 2019-11-03  189  		 * Always request read and write access since this corresponds
d93f7d110bf0b5 Trond Myklebust 2019-11-03  190  		 * to a rw layout.
d93f7d110bf0b5 Trond Myklebust 2019-11-03  191  		 */
d93f7d110bf0b5 Trond Myklebust 2019-11-03  192  		mode |= FMODE_READ;
60f26fd3eccfac Mike Snitzer    2024-08-14  193  		pnf = &mirror->rw_file;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  194  	} else
60f26fd3eccfac Mike Snitzer    2024-08-14  195  		pnf = &mirror->ro_file;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  196  
d93f7d110bf0b5 Trond Myklebust 2019-11-03  197  	new = NULL;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  198  	rcu_read_lock();
60f26fd3eccfac Mike Snitzer    2024-08-14  199  	nf = rcu_dereference(*pnf);
60f26fd3eccfac Mike Snitzer    2024-08-14  200  	if (!nf) {
d93f7d110bf0b5 Trond Myklebust 2019-11-03  201  		rcu_read_unlock();
d93f7d110bf0b5 Trond Myklebust 2019-11-03 @202  		new = nfs_local_open_fh(clp, cred, fh, mode);
d93f7d110bf0b5 Trond Myklebust 2019-11-03  203  		if (IS_ERR(new))
d93f7d110bf0b5 Trond Myklebust 2019-11-03  204  			return NULL;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  205  		rcu_read_lock();
d93f7d110bf0b5 Trond Myklebust 2019-11-03  206  		/* try to swap in the pointer */
60f26fd3eccfac Mike Snitzer    2024-08-14  207  		nf = cmpxchg(pnf, NULL, new);
60f26fd3eccfac Mike Snitzer    2024-08-14  208  		if (!nf) {
60f26fd3eccfac Mike Snitzer    2024-08-14  209  			nf = new;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  210  			new = NULL;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  211  		}
d93f7d110bf0b5 Trond Myklebust 2019-11-03  212  	}
60f26fd3eccfac Mike Snitzer    2024-08-14  213  	/*
60f26fd3eccfac Mike Snitzer    2024-08-14  214  	 * nfs_local_open_fh() uses nfsd_file caching, which uses nfsd_file
60f26fd3eccfac Mike Snitzer    2024-08-14  215  	 * refcount'ing, so no need for extra reference on backing nf->nf_file
60f26fd3eccfac Mike Snitzer    2024-08-14  216  	 */
d93f7d110bf0b5 Trond Myklebust 2019-11-03  217  	rcu_read_unlock();
d93f7d110bf0b5 Trond Myklebust 2019-11-03  218  	if (new)
60f26fd3eccfac Mike Snitzer    2024-08-14 @219  		clp->nfsd_file_put(new);
60f26fd3eccfac Mike Snitzer    2024-08-14  220  	return nf;
d93f7d110bf0b5 Trond Myklebust 2019-11-03  221  }
d93f7d110bf0b5 Trond Myklebust 2019-11-03  222  

:::::: The code at line 202 was first introduced by commit
:::::: d93f7d110bf0b55b484fa6f55ef2d3b89f7cd7e2 pnfs/flexfiles: enable localio support

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
