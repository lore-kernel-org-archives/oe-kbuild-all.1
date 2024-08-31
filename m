Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D53133CF1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 19:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725132560; cv=none; b=J84JYOM0DS8ar8Z3RZqT74nSSkn1MGws4xnFpnbg3UUAuDI67sxlAz2cc5JOsWP1J64gFvluzXcUreojP/xE9ggK5HteWWzJlOMcWb508XAefMUQOPHBuWxPdHzvgf4bkcaadQK8JeiN97UxIQ1N+EakFsKU745o/wsquPMmWkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725132560; c=relaxed/simple;
	bh=tGiCsakdMPfE7p4auFfVRcWgkqQdQnRX82kkVE0IcmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqlFfylcF4iIKX0UZ/NlPBaWYvRr7h4s1LGZ8ZMM0dXgXpkSIBcLL68OCn8E6UaZIKChkO45XPKxPg1VPnkHqklkeoJIQu8AK+oz49gRsT3nd28H2+rCtZIMRnhtip7wfv9g6niulilQou0pO5PiPhr+vqTbVBmTu5WKR5SwL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgfgUpfG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgfgUpfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725132558; x=1756668558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGiCsakdMPfE7p4auFfVRcWgkqQdQnRX82kkVE0IcmY=;
  b=JgfgUpfGst5xdubWx3ikAdd/muJCsXS9f3MoLkl896bkdF4v/8vIdgNr
   Y3vufYXHXS0rkLP/+RwgFfdC7AshJ63/QuuCfjt8CSNLbHgG1OmYsUgrO
   hdnTv17ZK/hYgxylhKyuzqtPj7HYdkOSi6IO8EDhJvWccWUpgu6F8Am8e
   pqmtmbzaA2MgcQpPZJceo26CnjqKApMLweaTwPlnkbURXL6itv0KgihjR
   PdSO/4ut8mQ68zYuZBtzYTKKjpnLG3m3KXUdgkgaR1t0djt3KGWKBbgxv
   lA89Q6KBqJCFLP/feNKgVl/BgN9oMC1XO9EQVt34awyoBYdCVKk5gMPxp
   w==;
X-CSE-ConnectionGUID: AqICrr5rR6mrD2RDS9fhkQ==
X-CSE-MsgGUID: nguF7kwmS3qPWIDoIiQpmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34325177"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="34325177"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 12:29:17 -0700
X-CSE-ConnectionGUID: yUYAQCLYTFKRuviGIZG1Mw==
X-CSE-MsgGUID: su2dBc3vT2WCeLaOV2IkKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="69002556"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Aug 2024 12:29:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skTmc-00032f-2e;
	Sat, 31 Aug 2024 19:29:14 +0000
Date: Sun, 1 Sep 2024 03:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next.v14-neilb 26/26]
 fs/nfsd/localio.c:73:24: error: returning 'int' from a function with return
 type 'struct nfs_localio_ctx *' makes pointer from integer without a cast
Message-ID: <202409010339.rYRlblg8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v14-neilb
head:   70cce93a681fa1956cb736e574953994bfd5aae0
commit: 70cce93a681fa1956cb736e574953994bfd5aae0 [26/26] neilb's __module_get changes
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240901/202409010339.rYRlblg8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010339.rYRlblg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010339.rYRlblg8-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/localio.c: In function 'nfsd_open_local_fh':
>> fs/nfsd/localio.c:73:24: error: returning 'int' from a function with return type 'struct nfs_localio_ctx *' makes pointer from integer without a cast [-Wint-conversion]
      73 |                 return -ENXIO;
         |                        ^


vim +73 fs/nfsd/localio.c

    25	
    26	/**
    27	 * nfsd_open_local_fh - lookup a local filehandle @nfs_fh and map to nfsd_file
    28	 *
    29	 * @cl_nfssvc_net: the 'struct net' to use to get the proper nfsd_net
    30	 * @cl_nfssvc_dom: the 'struct auth_domain' required for localio access
    31	 * @rpc_clnt: rpc_clnt that the client established, used for sockaddr and cred
    32	 * @cred: cred that the client established
    33	 * @nfs_fh: filehandle to lookup
    34	 * @fmode: fmode_t to use for open
    35	 *
    36	 * This function maps a local fh to a path on a local filesystem.
    37	 * This is useful when the nfs client has the local server mounted - it can
    38	 * avoid all the NFS overhead with reads, writes and commits.
    39	 *
    40	 * On successful return, returned nfs_localio_ctx will have its nfsd_file and
    41	 * nfsd_net members set. Caller is responsible for calling nfsd_file_put and
    42	 * nfsd_serv_put (via nfs_localio_ctx_free).
    43	 */
    44	struct nfs_localio_ctx *
    45	nfsd_open_local_fh(nfs_uuid_t *uuid,
    46			   struct rpc_clnt *rpc_clnt, const struct cred *cred,
    47			   const struct nfs_fh *nfs_fh, const fmode_t fmode)
    48		__must_hold(rcu)
    49	{
    50		int mayflags = NFSD_MAY_LOCALIO;
    51		int status = 0;
    52		struct nfsd_net *nn = NULL;
    53		struct net *net;
    54		struct svc_cred rq_cred;
    55		struct svc_fh fh;
    56		struct nfs_localio_ctx *localio;
    57		__be32 beres;
    58	
    59		if (nfs_fh->size > NFS4_FHSIZE)
    60			return ERR_PTR(-EINVAL);
    61	
    62		/*
    63		 * Not running in nfsd context, so must safely get reference on nfsd_serv.
    64		 * But the server may already be shutting down, if so disallow new localio.
    65		 * uuid->net is NOT a counted reference, but rcu_read_lock() ensures that if
    66		 * uuid->net is not NULL, then nfsd_serv_try_get() is safe and if that succeeds
    67		 * we will have an implied reference to the net.
    68		 */
    69		net = READ_ONCE(uuid->net);
    70		if (net)
    71			nn = net_generic(net, nfsd_net_id);
    72		if (unlikely(!nn || !nfsd_serv_try_get(nn)))
  > 73			return -ENXIO;
    74	
    75		/* Drop the rcu lock for alloc and nfsd_file_acquire_local() */
    76		rcu_read_unlock();
    77	
    78		localio = nfs_localio_ctx_alloc();
    79		if (!localio) {
    80			localio = ERR_PTR(-ENOMEM);
    81			nfsd_serv_put(nn);
    82			goto out_localio;
    83		}
    84	
    85		/* nfs_fh -> svc_fh */
    86		fh_init(&fh, NFS4_FHSIZE);
    87		fh.fh_handle.fh_size = nfs_fh->size;
    88		memcpy(fh.fh_handle.fh_raw, nfs_fh->data, nfs_fh->size);
    89	
    90		if (fmode & FMODE_READ)
    91			mayflags |= NFSD_MAY_READ;
    92		if (fmode & FMODE_WRITE)
    93			mayflags |= NFSD_MAY_WRITE;
    94	
    95		svcauth_map_clnt_to_svc_cred_local(rpc_clnt, cred, &rq_cred);
    96	
    97		beres = nfsd_file_acquire_local(uuid->net, &rq_cred, uuid->dom,
    98						&fh, mayflags, &localio->nf);
    99		if (beres) {
   100			status = nfs_stat_to_errno(be32_to_cpu(beres));
   101			goto out_fh_put;
   102		}
   103		localio->nn = nn;
   104	
   105	out_fh_put:
   106		fh_put(&fh);
   107		if (rq_cred.cr_group_info)
   108			put_group_info(rq_cred.cr_group_info);
   109	
   110		if (status) {
   111			nfs_localio_ctx_free(localio);
   112			localio = ERR_PTR(status);
   113		}
   114	out_localio:
   115		rcu_read_lock();
   116		return localio;
   117	}
   118	EXPORT_SYMBOL_GPL(nfsd_open_local_fh);
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
