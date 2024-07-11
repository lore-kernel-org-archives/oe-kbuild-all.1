Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CBE16EBE0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720723243; cv=none; b=K09Son7HAHs2aD1srPG84sNdfbsObom2+HQjKI13sUmoZ+thYKOIoCQExO2wKOYtZCn+uFE0y7LHG2o5ptCnFcQKvKhvs/xD3tf0nY8TyjKW2obaTErE34NmhxVMu7DoYnDETtnWKwTpSTHyGJHWV8cJtVJpkbwrWHlGdvkdtuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720723243; c=relaxed/simple;
	bh=G+6tr1vVqwDnENC0OHf1R2vN8xCz2lAaGVHnxL9Gty0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SduBalRtgjZEM0TBqPsi9E4syRvvE5EFcZDrnXsnyHSoYJHsQZa7qBYQUZFxQEd0FJZgNO2fFOaFPPRvocLpMKsE5AjM4+q26Sya809nM9NyiepXWk1dj2qkEFIUhMY4OG2hhUIWARX9JlD6USSN5aDFNGukKCqKysMrmoJhMJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/nnGymM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/nnGymM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720723241; x=1752259241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+6tr1vVqwDnENC0OHf1R2vN8xCz2lAaGVHnxL9Gty0=;
  b=N/nnGymMMeAsyeqdobatbgvxnaSbXl36EGx5WUeaG7hhUj18AtgoTQuG
   q1I5+2hPWC5GvsMtB245+zkIuErsxeKHVI324vlGQOs/8SFOpw3RbVyak
   TtReN8HdAPsruK9pUhQLoqNtT5rKlc1pDJbESAmENb5Po8SsDoi493bbK
   GcGBA35gTwVoWNneWy0L76UhpKDNsRaZgaTN4W4GWSVqqk3YD9IcO4lD/
   eFj05JKc2U4dYrkDbqFCQxDxzIvINnalAIKUa9oTyWc04hQnjYLwZ5NCU
   UZDYqsrj/++hHuMjash4fW19VfW7aZDF3ReDZdhcVmxQ81z0DkhcuZeZn
   Q==;
X-CSE-ConnectionGUID: VkwJEF8dQha58TuLbp8n4A==
X-CSE-MsgGUID: WpazUDSeSB+tkbzZITmW2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35675837"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="35675837"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 11:40:40 -0700
X-CSE-ConnectionGUID: +4QK4/UNQPuCquq438teww==
X-CSE-MsgGUID: wK37gRFxS7uFP1pmrDOayQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="79351833"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jul 2024 11:40:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRyia-000ZfW-2y;
	Thu, 11 Jul 2024 18:40:36 +0000
Date: Fri, 12 Jul 2024 02:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 33/33] fs/nfsd/localio.c:116: warning:
 Function parameter or struct member 'cl_nfssvc_dom' not described in
 'nfsd_open_local_fh'
Message-ID: <202407120219.GDEe5mgV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   83e2a6e79d49a7eecc3ec2aa42212cd365df17b3
commit: 495e691fbf633f01b563dc817bc0e55b6dce8267 [33/33] nfs/nfsd: switch nfsd_open_local_fh() to using nfsd_file_acquire_local()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407120219.GDEe5mgV-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120219.GDEe5mgV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120219.GDEe5mgV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/localio.c:116: warning: Function parameter or struct member 'cl_nfssvc_dom' not described in 'nfsd_open_local_fh'


vim +116 fs/nfsd/localio.c

a14e12f25fe366 Weston Andros Adamson 2024-06-25   89  
a14e12f25fe366 Weston Andros Adamson 2024-06-25   90  /**
a14e12f25fe366 Weston Andros Adamson 2024-06-25   91   * nfsd_open_local_fh - lookup a local filehandle @nfs_fh and map to @file
a14e12f25fe366 Weston Andros Adamson 2024-06-25   92   *
a14e12f25fe366 Weston Andros Adamson 2024-06-25   93   * @cl_nfssvc_net: the 'struct net' to use to get the proper nfsd_net
a14e12f25fe366 Weston Andros Adamson 2024-06-25   94   * @rpc_clnt: rpc_clnt that the client established, used for sockaddr and cred
a14e12f25fe366 Weston Andros Adamson 2024-06-25   95   * @cred: cred that the client established
a14e12f25fe366 Weston Andros Adamson 2024-06-25   96   * @nfs_fh: filehandle to lookup
a14e12f25fe366 Weston Andros Adamson 2024-06-25   97   * @fmode: fmode_t to use for open
a14e12f25fe366 Weston Andros Adamson 2024-06-25   98   * @pfilp: returned file pointer that maps to @nfs_fh
a14e12f25fe366 Weston Andros Adamson 2024-06-25   99   *
a14e12f25fe366 Weston Andros Adamson 2024-06-25  100   * This function maps a local fh to a path on a local filesystem.
a14e12f25fe366 Weston Andros Adamson 2024-06-25  101   * This is useful when the nfs client has the local server mounted - it can
a14e12f25fe366 Weston Andros Adamson 2024-06-25  102   * avoid all the NFS overhead with reads, writes and commits.
a14e12f25fe366 Weston Andros Adamson 2024-06-25  103   *
a14e12f25fe366 Weston Andros Adamson 2024-06-25  104   * On successful return, caller is responsible for calling path_put. Also
a14e12f25fe366 Weston Andros Adamson 2024-06-25  105   * note that this is called from nfs.ko via find_symbol() to avoid an explicit
a14e12f25fe366 Weston Andros Adamson 2024-06-25  106   * dependency on knfsd. So, there is no forward declaration in a header file
a14e12f25fe366 Weston Andros Adamson 2024-06-25  107   * for it that is shared with the client.
a14e12f25fe366 Weston Andros Adamson 2024-06-25  108   */
a14e12f25fe366 Weston Andros Adamson 2024-06-25  109  int nfsd_open_local_fh(struct net *cl_nfssvc_net,
495e691fbf633f Mike Snitzer          2024-07-08  110  			 struct auth_domain *cl_nfssvc_dom,
a14e12f25fe366 Weston Andros Adamson 2024-06-25  111  			 struct rpc_clnt *rpc_clnt,
a14e12f25fe366 Weston Andros Adamson 2024-06-25  112  			 const struct cred *cred,
a14e12f25fe366 Weston Andros Adamson 2024-06-25  113  			 const struct nfs_fh *nfs_fh,
a14e12f25fe366 Weston Andros Adamson 2024-06-25  114  			 const fmode_t fmode,
a14e12f25fe366 Weston Andros Adamson 2024-06-25  115  			 struct file **pfilp)
a14e12f25fe366 Weston Andros Adamson 2024-06-25 @116  {
a14e12f25fe366 Weston Andros Adamson 2024-06-25  117  	int mayflags = NFSD_MAY_LOCALIO;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  118  	int status = 0;
0819f4fa7cf510 Mike Snitzer          2024-06-12  119  	struct nfsd_net *nn;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  120  	const struct cred *save_cred;
495e691fbf633f Mike Snitzer          2024-07-08  121  	struct svc_cred rq_cred;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  122  	struct svc_fh fh;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  123  	struct nfsd_file *nf;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  124  	__be32 beres;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  125  
0819f4fa7cf510 Mike Snitzer          2024-06-12  126  	if (nfs_fh->size > NFS4_FHSIZE)
0819f4fa7cf510 Mike Snitzer          2024-06-12  127  		return -EINVAL;
0819f4fa7cf510 Mike Snitzer          2024-06-12  128  
0819f4fa7cf510 Mike Snitzer          2024-06-12  129  	/* Not running in nfsd context, must safely get reference on nfsd_serv */
0819f4fa7cf510 Mike Snitzer          2024-06-12  130  	cl_nfssvc_net = maybe_get_net(cl_nfssvc_net);
0819f4fa7cf510 Mike Snitzer          2024-06-12  131  	if (!cl_nfssvc_net)
0819f4fa7cf510 Mike Snitzer          2024-06-12  132  		return -ENXIO;
0819f4fa7cf510 Mike Snitzer          2024-06-12  133  	nn = net_generic(cl_nfssvc_net, nfsd_net_id);
0819f4fa7cf510 Mike Snitzer          2024-06-12  134  
033fad6cf114d3 Mike Snitzer          2024-06-25  135  	/* The server may already be shutting down, disallow new localio */
033fad6cf114d3 Mike Snitzer          2024-06-25  136  	if (unlikely(!nfsd_serv_try_get(nn))) {
0819f4fa7cf510 Mike Snitzer          2024-06-12  137  		status = -ENXIO;
0819f4fa7cf510 Mike Snitzer          2024-06-12  138  		goto out_net;
0819f4fa7cf510 Mike Snitzer          2024-06-12  139  	}
0819f4fa7cf510 Mike Snitzer          2024-06-12  140  
a14e12f25fe366 Weston Andros Adamson 2024-06-25  141  	/* Save creds before calling into nfsd */
a14e12f25fe366 Weston Andros Adamson 2024-06-25  142  	save_cred = get_current_cred();
a14e12f25fe366 Weston Andros Adamson 2024-06-25  143  
a14e12f25fe366 Weston Andros Adamson 2024-06-25  144  	/* nfs_fh -> svc_fh */
a14e12f25fe366 Weston Andros Adamson 2024-06-25  145  	fh_init(&fh, NFS4_FHSIZE);
a14e12f25fe366 Weston Andros Adamson 2024-06-25  146  	fh.fh_handle.fh_size = nfs_fh->size;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  147  	memcpy(fh.fh_handle.fh_raw, nfs_fh->data, nfs_fh->size);
a14e12f25fe366 Weston Andros Adamson 2024-06-25  148  
a14e12f25fe366 Weston Andros Adamson 2024-06-25  149  	if (fmode & FMODE_READ)
a14e12f25fe366 Weston Andros Adamson 2024-06-25  150  		mayflags |= NFSD_MAY_READ;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  151  	if (fmode & FMODE_WRITE)
a14e12f25fe366 Weston Andros Adamson 2024-06-25  152  		mayflags |= NFSD_MAY_WRITE;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  153  
495e691fbf633f Mike Snitzer          2024-07-08  154  	rpcauth_map_to_svc_cred_local(rpc_clnt->cl_auth, cred, &rq_cred);
495e691fbf633f Mike Snitzer          2024-07-08  155  
495e691fbf633f Mike Snitzer          2024-07-08  156  	beres = nfsd_file_acquire_local(cl_nfssvc_net, &rq_cred, rpc_clnt->cl_vers,
495e691fbf633f Mike Snitzer          2024-07-08  157  					cl_nfssvc_dom, &fh, mayflags, &nf);
a14e12f25fe366 Weston Andros Adamson 2024-06-25  158  	if (beres) {
a14e12f25fe366 Weston Andros Adamson 2024-06-25  159  		status = nfs_stat_to_errno(be32_to_cpu(beres));
a14e12f25fe366 Weston Andros Adamson 2024-06-25  160  		goto out_fh_put;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  161  	}
a14e12f25fe366 Weston Andros Adamson 2024-06-25  162  	*pfilp = get_file(nf->nf_file);
a14e12f25fe366 Weston Andros Adamson 2024-06-25  163  	nfsd_file_put(nf);
a14e12f25fe366 Weston Andros Adamson 2024-06-25  164  out_fh_put:
a14e12f25fe366 Weston Andros Adamson 2024-06-25  165  	fh_put(&fh);
495e691fbf633f Mike Snitzer          2024-07-08  166  	if (rq_cred.cr_group_info)
495e691fbf633f Mike Snitzer          2024-07-08  167  		put_group_info(rq_cred.cr_group_info);
a14e12f25fe366 Weston Andros Adamson 2024-06-25  168  	revert_creds(save_cred);
033fad6cf114d3 Mike Snitzer          2024-06-25  169  	nfsd_serv_put(nn);
0819f4fa7cf510 Mike Snitzer          2024-06-12  170  out_net:
0819f4fa7cf510 Mike Snitzer          2024-06-12  171  	put_net(cl_nfssvc_net);
a14e12f25fe366 Weston Andros Adamson 2024-06-25  172  	return status;
a14e12f25fe366 Weston Andros Adamson 2024-06-25  173  }
a14e12f25fe366 Weston Andros Adamson 2024-06-25  174  EXPORT_SYMBOL_GPL(nfsd_open_local_fh);
a14e12f25fe366 Weston Andros Adamson 2024-06-25  175  

:::::: The code at line 116 was first introduced by commit
:::::: a14e12f25fe366c2456249e0e6ddc04e096b06cc nfsd: add "localio" support

:::::: TO: Weston Andros Adamson <dros@primarydata.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
