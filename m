Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341951F55EF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742031256; cv=none; b=Pc7hKDFkLdSOS+nLXpxixFqLe7FaiKco9PogtGMVS0ZeTMc08hGCZBXy23f60lFvdD+XR7eYeGUaFvbYk0HMie+n+qjJxVds515YexxlcBmfDwk8tERUgaskX/toTM+F1WTmVtb9hlwn7FYLwiWkwPHp94+bu/5Bi30MnrHp2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742031256; c=relaxed/simple;
	bh=vCL+B4NCtYKwlCvDnIQ9/hPa0E/RzVcPHOelxN0JUoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GfUI0TMG5KdEGbko5YtED/xK1kXNokftRQvsxzdJ7UYQntQuRzqO0LtIWZ/eeBD61srXr5glTFlev5uvEn+QjbGh4gywB3Pq0eqoNeHKxYkdDjbjm9dNvW4kgob+L7hn7iqMljWiuK2M57jUxLik4NWDAFGMUjIDURa0mA5Tmxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCfUPYwx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCfUPYwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742031255; x=1773567255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCL+B4NCtYKwlCvDnIQ9/hPa0E/RzVcPHOelxN0JUoE=;
  b=gCfUPYwx2EE6ItMPrXj2+m7N0jbrFC92UeCnbWleBb8hYUEedhYQdT4h
   rBQsor+nH3Kd1mVi+UOPTmHD2JE9kTtumnOsUKx9CgoZmcq0V6iCnw4Wh
   lEylV3cQgGzkm26amGJ9J8oEsu59h5Ng64H6xHveV5mBwzzGKOyNoaEVP
   U3DhoB1iMYpoVeRsnu4eYJ2aijxSwldGQfX7mNPqfO5n+TWrWjzk4im4d
   lGXIDfGMdsUqfkliWaaLU9BAWuXfs+LaDdUbARroEUpqH+tGBeiArHsAs
   GXOGXfsw7tjwIyr3YoQdYiN/lZNasJbEzahfpkplWKDTDqE+XCJGwGclw
   w==;
X-CSE-ConnectionGUID: 5TEVjGD2RV+OMQicU+FH4g==
X-CSE-MsgGUID: O9iyjHgxS/eexrekslhJ/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54179094"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="54179094"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 02:34:13 -0700
X-CSE-ConnectionGUID: lzScax7tQ8iow/Zkbt0y6g==
X-CSE-MsgGUID: EXGd7w7JTuW3238MEgoDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="158653054"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2025 02:34:12 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttNuD-000BDw-1d;
	Sat, 15 Mar 2025 09:34:09 +0000
Date: Sat, 15 Mar 2025 17:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 9/14] fs/nfsd/nfsproc.c:508:9: error:
 implicit declaration of function 'trace_nfsd_proc_symlink'; did you mean
 'nfsd_proc_symlink'?
Message-ID: <202503151700.DSZSysRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-tracepoints
head:   406b15fe7fc917eb20c0cfe48d441442adad9918
commit: 481c829d4945fb5f4f83828214f5e36c02f67f6c [9/14] nfsd: add tracepoints for symlink events
config: csky-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151700.DSZSysRq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151700.DSZSysRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151700.DSZSysRq-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsproc.c: In function 'nfsd_proc_create':
   fs/nfsd/nfsproc.c:295:9: error: implicit declaration of function 'trace_nfsd_proc_create'; did you mean 'nfsd_proc_create'? [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_create
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
>> fs/nfsd/nfsproc.c:508:9: error: implicit declaration of function 'trace_nfsd_proc_symlink'; did you mean 'nfsd_proc_symlink'? [-Wimplicit-function-declaration]
     508 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
>> fs/nfsd/nfsproc.c:542:1: error: invalid storage class for function 'nfsd_proc_mkdir'
     542 | nfsd_proc_mkdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_mkdir':
   fs/nfsd/nfsproc.c:550:9: error: implicit declaration of function 'trace_nfsd_proc_mkdir'; did you mean 'nfsd_proc_mkdir'? [-Wimplicit-function-declaration]
     550 |         trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_mkdir
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_symlink':
>> fs/nfsd/nfsproc.c:575:1: error: invalid storage class for function 'nfsd_proc_rmdir'
     575 | nfsd_proc_rmdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:589:13: error: invalid storage class for function 'nfsd_init_dirlist_pages'
     589 | static void nfsd_init_dirlist_pages(struct svc_rqst *rqstp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:611:1: error: invalid storage class for function 'nfsd_proc_readdir'
     611 | nfsd_proc_readdir(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:639:1: error: invalid storage class for function 'nfsd_proc_statfs'
     639 | nfsd_proc_statfs(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~
>> fs/nfsd/nfsproc.c:824:28: error: initializer element is not constant
     824 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:824:28: note: (near initialization for 'nfsd_procedures2[14].pc_func')
   fs/nfsd/nfsproc.c:836:28: error: initializer element is not constant
     836 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:836:28: note: (near initialization for 'nfsd_procedures2[15].pc_func')
   fs/nfsd/nfsproc.c:847:28: error: initializer element is not constant
     847 |                 .pc_func = nfsd_proc_readdir,
         |                            ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:847:28: note: (near initialization for 'nfsd_procedures2[16].pc_func')
   fs/nfsd/nfsproc.c:857:28: error: initializer element is not constant
     857 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
   fs/nfsd/nfsproc.c:857:28: note: (near initialization for 'nfsd_procedures2[17].pc_func')
>> fs/nfsd/nfsproc.c:878:1: error: expected declaration or statement at end of input
     878 | };
         | ^
   fs/nfsd/nfsproc.c:871:26: warning: unused variable 'nfsd_version2' [-Wunused-variable]
     871 | const struct svc_version nfsd_version2 = {
         |                          ^~~~~~~~~~~~~
   fs/nfsd/nfsproc.c: At top level:
   fs/nfsd/nfsproc.c:499:1: warning: 'nfsd_proc_symlink' defined but not used [-Wunused-function]
     499 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^~~~~~~~~~~~~~~~~


vim +508 fs/nfsd/nfsproc.c

   497	
   498	static __be32
   499	nfsd_proc_symlink(struct svc_rqst *rqstp)
   500	{
   501		struct nfsd_symlinkargs *argp = rqstp->rq_argp;
   502		struct nfsd_stat *resp = rqstp->rq_resp;
   503		struct nfsd_attrs attrs = {
   504			.na_iattr	= &argp->attrs,
   505		};
   506		struct svc_fh	newfh;
   507	
 > 508		trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
   509					argp->tname, argp->tlen);
   510	
   511		if (argp->tlen == 0) {
   512		if (argp->tlen > NFS_MAXPATHLEN) {
   513			resp->status = nfserr_nametoolong;
   514			goto out;
   515		}
   516	
   517		argp->tname = svc_fill_symlink_pathname(rqstp, &argp->first,
   518							page_address(rqstp->rq_arg.pages[0]),
   519							argp->tlen);
   520		if (IS_ERR(argp->tname)) {
   521			resp->status = nfserrno(PTR_ERR(argp->tname));
   522			goto out;
   523		}
   524	
   525		fh_init(&newfh, NFS_FHSIZE);
   526		resp->status = nfsd_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
   527					    argp->tname, &attrs, &newfh);
   528	
   529		kfree(argp->tname);
   530		fh_put(&argp->ffh);
   531		fh_put(&newfh);
   532	out:
   533		resp->status = nfsd_map_status(resp->status);
   534		return rpc_success;
   535	}
   536	
   537	/*
   538	 * Make directory. This operation is not idempotent.
   539	 * N.B. After this call resp->fh needs an fh_put
   540	 */
   541	static __be32
 > 542	nfsd_proc_mkdir(struct svc_rqst *rqstp)
   543	{
   544		struct nfsd_createargs *argp = rqstp->rq_argp;
   545		struct nfsd_diropres *resp = rqstp->rq_resp;
   546		struct nfsd_attrs attrs = {
   547			.na_iattr	= &argp->attrs,
   548		};
   549	
   550		trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
   551	
   552		if (resp->fh.fh_dentry) {
   553			printk(KERN_WARNING
   554				"nfsd_proc_mkdir: response already verified??\n");
   555		}
   556	
   557		argp->attrs.ia_valid &= ~ATTR_SIZE;
   558		fh_init(&resp->fh, NFS_FHSIZE);
   559		resp->status = nfsd_create(rqstp, &argp->fh, argp->name, argp->len,
   560					   &attrs, S_IFDIR, 0, &resp->fh);
   561		fh_put(&argp->fh);
   562		if (resp->status != nfs_ok)
   563			goto out;
   564	
   565		resp->status = fh_getattr(&resp->fh, &resp->stat);
   566	out:
   567		resp->status = nfsd_map_status(resp->status);
   568		return rpc_success;
   569	}
   570	
   571	/*
   572	 * Remove a directory
   573	 */
   574	static __be32
 > 575	nfsd_proc_rmdir(struct svc_rqst *rqstp)
   576	{
   577		struct nfsd_diropargs *argp = rqstp->rq_argp;
   578		struct nfsd_stat *resp = rqstp->rq_resp;
   579	
   580		dprintk("nfsd: RMDIR    %s %.*s\n", SVCFH_fmt(&argp->fh), argp->len, argp->name);
   581	
   582		resp->status = nfsd_unlink(rqstp, &argp->fh, S_IFDIR,
   583					   argp->name, argp->len);
   584		fh_put(&argp->fh);
   585		resp->status = nfsd_map_status(resp->status);
   586		return rpc_success;
   587	}
   588	
 > 589	static void nfsd_init_dirlist_pages(struct svc_rqst *rqstp,
   590					    struct nfsd_readdirres *resp,
   591					    u32 count)
   592	{
   593		struct xdr_buf *buf = &resp->dirlist;
   594		struct xdr_stream *xdr = &resp->xdr;
   595	
   596		memset(buf, 0, sizeof(*buf));
   597	
   598		/* Reserve room for the NULL ptr & eof flag (-2 words) */
   599		buf->buflen = clamp(count, (u32)(XDR_UNIT * 2), (u32)PAGE_SIZE);
   600		buf->buflen -= XDR_UNIT * 2;
   601		buf->pages = rqstp->rq_next_page;
   602		rqstp->rq_next_page++;
   603	
   604		xdr_init_encode_pages(xdr, buf, buf->pages,  NULL);
   605	}
   606	
   607	/*
   608	 * Read a portion of a directory.
   609	 */
   610	static __be32
 > 611	nfsd_proc_readdir(struct svc_rqst *rqstp)
   612	{
   613		struct nfsd_readdirargs *argp = rqstp->rq_argp;
   614		struct nfsd_readdirres *resp = rqstp->rq_resp;
   615		loff_t		offset;
   616	
   617		dprintk("nfsd: READDIR  %s %d bytes at %d\n",
   618			SVCFH_fmt(&argp->fh),		
   619			argp->count, argp->cookie);
   620	
   621		nfsd_init_dirlist_pages(rqstp, resp, argp->count);
   622	
   623		resp->common.err = nfs_ok;
   624		resp->cookie_offset = 0;
   625		offset = argp->cookie;
   626		resp->status = nfsd_readdir(rqstp, &argp->fh, &offset,
   627					    &resp->common, nfssvc_encode_entry);
   628		nfssvc_encode_nfscookie(resp, offset);
   629	
   630		fh_put(&argp->fh);
   631		resp->status = nfsd_map_status(resp->status);
   632		return rpc_success;
   633	}
   634	
   635	/*
   636	 * Get file system info
   637	 */
   638	static __be32
 > 639	nfsd_proc_statfs(struct svc_rqst *rqstp)
   640	{
   641		struct nfsd_fhandle *argp = rqstp->rq_argp;
   642		struct nfsd_statfsres *resp = rqstp->rq_resp;
   643	
   644		dprintk("nfsd: STATFS   %s\n", SVCFH_fmt(&argp->fh));
   645	
   646		resp->status = nfsd_statfs(rqstp, &argp->fh, &resp->stats,
   647					   NFSD_MAY_BYPASS_GSS_ON_ROOT);
   648		fh_put(&argp->fh);
   649		resp->status = nfsd_map_status(resp->status);
   650		return rpc_success;
   651	}
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
