Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F2146A86
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727852344; cv=none; b=dcdkHHriFHSJg7ILucrwiYS/pOac37Yq0VQ4PLClhe8XOwOs4E70qyG4B3LZnPYFrYKGwVOFf660fFDPbJoF54lCL1jHM4X3mPQCcePD+iNdZsJZJSIxXEEf/ZwZtk+9PXKTfCJ2NSN/F1RyIbS61QsT73VBc0SdD8ZOvDvOcrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727852344; c=relaxed/simple;
	bh=Y/4S05cD6l4g/GPMkNId8jePMPnf8btRFD9XxlxJi/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLgIjppEVkdtesVuoe73vlso15H9JoR810Uj5KRNTUMgBrOYGznvC8nOYVnkSyp9vhA7DAbKEz2hrBLXRzhYdvu2EgQCJm5K6va8olKjcEiJ65iryHX18CG/9v4OWL+WgvBYQQ9b8Adc4YtSJUzKOH78kAoY0sAuXve82Z4erfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l88ZAZrj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l88ZAZrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727852342; x=1759388342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/4S05cD6l4g/GPMkNId8jePMPnf8btRFD9XxlxJi/M=;
  b=l88ZAZrjd4r/3O7PZ9CbfGLygls0EhVHCchRrx/OrlajZhwR7Jnn19/s
   xoU2X8xLnQfu/oCNxpocju2mAcWBCFpeLa1w36Vxt+0uQ4Q2R6Q34puXa
   m9TI7Hb26CbCUpDGTmdX4B4pR8DcMuqlBo73TsD9zvU2o9dChihvaIFga
   +eCo306FiLGIhEAUmuSDao4lNSwwz1H7lFUy8sCiAgYHAdL7YmFNz6xIj
   DxSiTL3FdiIgh/hKc/wLWfi6VCk9moRlW5kHgjzd87WjEBB/Qrl2OY8DV
   /ZW/xUaUManiQZIi+7QJS39Uy+7Tgh5oEEq9x56fLLhzJO46soloZ95ip
   g==;
X-CSE-ConnectionGUID: SFuxoKUOQVWBUXtsKKHyPQ==
X-CSE-MsgGUID: Pf3hAHjPQr+ZnpHpQL/Rsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26475311"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26475311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 23:59:00 -0700
X-CSE-ConnectionGUID: VwoxEYtzRIGKeweyONOu3Q==
X-CSE-MsgGUID: UJypFLLgTS2FNIv68si+9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73795138"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2024 23:58:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svtK3-000Rej-2y;
	Wed, 02 Oct 2024 06:58:55 +0000
Date: Wed, 2 Oct 2024 14:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Weston Andros Adamson <dros@primarydata.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mike Snitzer <snitzer@kernel.org>, NeilBrown <neilb@suse.de>,
	Jeff Layton <jlayton@kernel.org>
Subject: fs/nfs/localio.c:166: undefined reference to `nfs_to'
Message-ID: <202410021451.Dj3s8Owx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
commit: 70ba381e1a431245c137ed597ec6a05991c79bd9 nfs: add LOCALIO support
date:   9 days ago
config: x86_64-randconfig-002-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021451.Dj3s8Owx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021451.Dj3s8Owx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021451.Dj3s8Owx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/nfs/localio.o: in function `nfs_local_iocb_alloc':
>> fs/nfs/localio.c:166: undefined reference to `nfs_to'
>> ld: fs/nfs/localio.c:166: undefined reference to `nfs_to'
>> ld: fs/nfs/localio.c:166: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o: in function `nfs_local_pgio_release':
   fs/nfs/localio.c:220: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:220: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o:fs/nfs/localio.c:220: more undefined references to `nfs_to' follow
   ld: fs/nfs/localio.o: in function `nfs_local_disable':
>> fs/nfs/localio.c:80: undefined reference to `nfs_uuid_invalidate_one_client'
   ld: fs/nfs/localio.o: in function `nfs_local_open_fh':
>> fs/nfs/localio.c:110: undefined reference to `nfs_open_local_fh'
   ld: fs/nfs/localio.o: in function `nfs_local_doio':
   fs/nfs/localio.c:443: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:443: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:468: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:468: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o: in function `nfs_local_release_commit_data':
   fs/nfs/localio.c:519: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o:fs/nfs/localio.c:519: more undefined references to `nfs_to' follow


vim +166 fs/nfs/localio.c

    71	
    72	/*
    73	 * nfs_local_disable - disable local i/o for an nfs_client
    74	 */
    75	void nfs_local_disable(struct nfs_client *clp)
    76	{
    77		spin_lock(&clp->cl_localio_lock);
    78		if (test_and_clear_bit(NFS_CS_LOCAL_IO, &clp->cl_flags)) {
    79			trace_nfs_local_disable(clp);
  > 80			nfs_uuid_invalidate_one_client(&clp->cl_uuid);
    81		}
    82		spin_unlock(&clp->cl_localio_lock);
    83	}
    84	
    85	/*
    86	 * nfs_local_probe - probe local i/o support for an nfs_server and nfs_client
    87	 */
    88	void nfs_local_probe(struct nfs_client *clp)
    89	{
    90	}
    91	EXPORT_SYMBOL_GPL(nfs_local_probe);
    92	
    93	/*
    94	 * nfs_local_open_fh - open a local filehandle in terms of nfsd_file
    95	 *
    96	 * Returns a pointer to a struct nfsd_file or NULL
    97	 */
    98	struct nfsd_file *
    99	nfs_local_open_fh(struct nfs_client *clp, const struct cred *cred,
   100			  struct nfs_fh *fh, const fmode_t mode)
   101	{
   102		struct nfsd_file *localio;
   103		int status;
   104	
   105		if (!nfs_server_is_local(clp))
   106			return NULL;
   107		if (mode & ~(FMODE_READ | FMODE_WRITE))
   108			return NULL;
   109	
 > 110		localio = nfs_open_local_fh(&clp->cl_uuid, clp->cl_rpcclient,
   111					    cred, fh, mode);
   112		if (IS_ERR(localio)) {
   113			status = PTR_ERR(localio);
   114			trace_nfs_local_open_fh(fh, mode, status);
   115			switch (status) {
   116			case -ENOMEM:
   117			case -ENXIO:
   118			case -ENOENT:
   119				nfs_local_disable(clp);
   120			}
   121			return NULL;
   122		}
   123		return localio;
   124	}
   125	EXPORT_SYMBOL_GPL(nfs_local_open_fh);
   126	
   127	static struct bio_vec *
   128	nfs_bvec_alloc_and_import_pagevec(struct page **pagevec,
   129			unsigned int npages, gfp_t flags)
   130	{
   131		struct bio_vec *bvec, *p;
   132	
   133		bvec = kmalloc_array(npages, sizeof(*bvec), flags);
   134		if (bvec != NULL) {
   135			for (p = bvec; npages > 0; p++, pagevec++, npages--) {
   136				p->bv_page = *pagevec;
   137				p->bv_len = PAGE_SIZE;
   138				p->bv_offset = 0;
   139			}
   140		}
   141		return bvec;
   142	}
   143	
   144	static void
   145	nfs_local_iocb_free(struct nfs_local_kiocb *iocb)
   146	{
   147		kfree(iocb->bvec);
   148		kfree(iocb);
   149	}
   150	
   151	static struct nfs_local_kiocb *
   152	nfs_local_iocb_alloc(struct nfs_pgio_header *hdr,
   153			     struct nfsd_file *localio, gfp_t flags)
   154	{
   155		struct nfs_local_kiocb *iocb;
   156	
   157		iocb = kmalloc(sizeof(*iocb), flags);
   158		if (iocb == NULL)
   159			return NULL;
   160		iocb->bvec = nfs_bvec_alloc_and_import_pagevec(hdr->page_array.pagevec,
   161				hdr->page_array.npages, flags);
   162		if (iocb->bvec == NULL) {
   163			kfree(iocb);
   164			return NULL;
   165		}
 > 166		init_sync_kiocb(&iocb->kiocb, nfs_to->nfsd_file_file(localio));
   167		iocb->kiocb.ki_pos = hdr->args.offset;
   168		iocb->localio = localio;
   169		iocb->hdr = hdr;
   170		iocb->kiocb.ki_flags &= ~IOCB_APPEND;
   171		return iocb;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
