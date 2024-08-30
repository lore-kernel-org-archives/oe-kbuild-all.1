Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044731B4C49
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031579; cv=none; b=VlYqpKyrVdnkggkwztPcd8GXfTiUcQEVqw0Paw6F8ekti3girTTQAbBoUP0tLeeaS22jvmrDi6BSahylpwLCBHEuFwwzTk9EwD5lyHBiGsoPBSpnhtnA0ZVkCBDKexMWHmpRp/7W70FdcLkL7fc/2qvPHm1nrsD4M/yl6alhtTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031579; c=relaxed/simple;
	bh=/9VQxGYcx8JDUjVZIntao1ukbjqmACtVcYWi7C66IC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNw3YQQq85MhVeAvJDBUoY1Bm6s1pSYUZdsmfF2WHE/gckC5uaW0IbNPSHeT2ft4od1GsEHgVZ6TtrXs/w7Gw27Qy1OuluZQWaZvKTSungViEOqXKQyjqsYbB2uArh5GtaRd27JTWnglneHdq6gPJEFkTdcHlZi8pXjp1tHzRGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccrvnIQE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccrvnIQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725031578; x=1756567578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9VQxGYcx8JDUjVZIntao1ukbjqmACtVcYWi7C66IC0=;
  b=ccrvnIQEIK6wNKdoR1XcAaEP2x/Xf1FlHVTThFPuIGFfv3UBWCEOBjK9
   gMSjtkslXxe7A+gm6kGYeTRvynsAK18PFec63XGC/msjAmQHysJZD+P2K
   DbQpvF9mUzQ57obI0l3ykIq83vWYO0lUbkVnq9Exa7Hs9tjh10UbaD7t/
   VUgyj6njAAURoL19x7kaP4W08dbgazCNwHSnT/IA4cgPyQVgM5rruM2Cv
   YGRvIGOKKifehNlYCmAGmeXjcDurKxYmgVe4Icoxb2KJ+eT1HiBHE9EAQ
   GNV/kUzDKP+2JAB8t8W5SL7Zz1NBuSw1dkdw062tb0HDIMtKVwmBdmXGF
   Q==;
X-CSE-ConnectionGUID: hgn5P2BGTvClzR2GCstZwg==
X-CSE-MsgGUID: Enpvh41FTDac37Y+SUWmFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23243503"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23243503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:26:17 -0700
X-CSE-ConnectionGUID: JKAaWtrQS8ifInxg7GtlSA==
X-CSE-MsgGUID: wGwcf4/DSyK32s+YdF/IRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63548776"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Aug 2024 08:26:16 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk3Vt-0001a6-1F;
	Fri, 30 Aug 2024 15:26:13 +0000
Date: Fri, 30 Aug 2024 23:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Weston Andros Adamson <dros@primarydata.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: [snitzer:nfs-localio-for-next.v14-neilb 16/25] fs/nfsd/localio.c:45:
 warning: Function parameter or struct member 'uuid' not described in
 'nfsd_open_local_fh'
Message-ID: <202408310153.AvSB7KeS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v14-neilb
head:   bb6e0696ba08aae13ade6331ef14f91afa9fc4df
commit: b00ce59a8111778930e24b6cf63c9779e744f809 [16/25] nfsd: add localio support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408310153.AvSB7KeS-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310153.AvSB7KeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310153.AvSB7KeS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/localio.c:45: warning: Function parameter or struct member 'uuid' not described in 'nfsd_open_local_fh'
>> fs/nfsd/localio.c:45: warning: Excess function parameter 'cl_nfssvc_net' description in 'nfsd_open_local_fh'
>> fs/nfsd/localio.c:45: warning: Excess function parameter 'cl_nfssvc_dom' description in 'nfsd_open_local_fh'


vim +45 fs/nfsd/localio.c

    22	
    23	/**
    24	 * nfsd_open_local_fh - lookup a local filehandle @nfs_fh and map to nfsd_file
    25	 *
    26	 * @cl_nfssvc_net: the 'struct net' to use to get the proper nfsd_net
    27	 * @cl_nfssvc_dom: the 'struct auth_domain' required for localio access
    28	 * @rpc_clnt: rpc_clnt that the client established, used for sockaddr and cred
    29	 * @cred: cred that the client established
    30	 * @nfs_fh: filehandle to lookup
    31	 * @fmode: fmode_t to use for open
    32	 *
    33	 * This function maps a local fh to a path on a local filesystem.
    34	 * This is useful when the nfs client has the local server mounted - it can
    35	 * avoid all the NFS overhead with reads, writes and commits.
    36	 *
    37	 * On successful return, returned nfs_localio_ctx will have its nfsd_file and
    38	 * nfsd_net members set. Caller is responsible for calling nfsd_file_put and
    39	 * nfsd_serv_put (via nfs_localio_ctx_free).
    40	 */
    41	struct nfs_localio_ctx *
    42	nfsd_open_local_fh(nfs_uuid_t *uuid,
    43			   struct rpc_clnt *rpc_clnt, const struct cred *cred,
    44			   const struct nfs_fh *nfs_fh, const fmode_t fmode)
  > 45	{
    46		int mayflags = NFSD_MAY_LOCALIO;
    47		int status = 0;
    48		struct nfsd_net *nn = NULL;
    49		struct net *net;
    50		struct svc_cred rq_cred;
    51		struct svc_fh fh;
    52		struct nfs_localio_ctx *localio;
    53		__be32 beres;
    54	
    55		if (nfs_fh->size > NFS4_FHSIZE)
    56			return ERR_PTR(-EINVAL);
    57	
    58		localio = nfs_localio_ctx_alloc();
    59		if (!localio)
    60			return ERR_PTR(-ENOMEM);
    61	
    62		/*
    63		 * Not running in nfsd context, so must safely get reference on nfsd_serv.
    64		 * But the server may already be shutting down, if so disallow new localio.
    65		 * uuid->net is NOT a counted reference, but rcu_read_lock() ensures that if
    66		 * uuid->net is not NULL, then nfsd_serv_try_get() is safe and if that succeeds
    67		 * we will have an implied reference to the net.
    68		 */
    69		rcu_read_lock();
    70		net = READ_ONCE(uuid->net);
    71		if (net)
    72			nn = net_generic(net, nfsd_net_id);
    73		if (unlikely(!nn || !nfsd_serv_try_get(nn))) {
    74			rcu_read_unlock();
    75			status = -ENXIO;
    76			goto out_nfsd_serv;
    77		}
    78		rcu_read_unlock();
    79	
    80		/* nfs_fh -> svc_fh */
    81		fh_init(&fh, NFS4_FHSIZE);
    82		fh.fh_handle.fh_size = nfs_fh->size;
    83		memcpy(fh.fh_handle.fh_raw, nfs_fh->data, nfs_fh->size);
    84	
    85		if (fmode & FMODE_READ)
    86			mayflags |= NFSD_MAY_READ;
    87		if (fmode & FMODE_WRITE)
    88			mayflags |= NFSD_MAY_WRITE;
    89	
    90		svcauth_map_clnt_to_svc_cred_local(rpc_clnt, cred, &rq_cred);
    91	
    92		beres = nfsd_file_acquire_local(uuid->net, &rq_cred, uuid->dom,
    93						&fh, mayflags, &localio->nf);
    94		if (beres) {
    95			status = nfs_stat_to_errno(be32_to_cpu(beres));
    96			goto out_fh_put;
    97		}
    98		localio->nn = nn;
    99	
   100	out_fh_put:
   101		fh_put(&fh);
   102		if (rq_cred.cr_group_info)
   103			put_group_info(rq_cred.cr_group_info);
   104	out_nfsd_serv:
   105		if (status) {
   106			nfs_localio_ctx_free(localio);
   107			return ERR_PTR(status);
   108		}
   109		return localio;
   110	}
   111	EXPORT_SYMBOL_GPL(nfsd_open_local_fh);
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
