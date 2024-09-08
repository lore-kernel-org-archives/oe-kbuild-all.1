Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CD06CDBA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725783821; cv=none; b=GGoeXVtqQ3R4BwPbikuaDr0VqHFI6j79uBTjHVwwZ7c0yEMiEFZB1uSrojXgLu0NETC9f7JNT8hbmI/5MaDPkGAXF+kQSEFZ9nkiP8/ePsUIohrxPxvefMOza4h34pJHpAQA92hqqBfebdpo4/DYVopwB/y9OjToiP/X8MIwQhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725783821; c=relaxed/simple;
	bh=4jVQuNrvrHL4Em2E5EX9KWHyAjwK/tI/w7ZA9+WVT20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tclu28YfrWuoP/3zQx3qm5KT5hzMnsonidvMuRHKKhPts/cJe0FnHfGiYBVLcDxlboFSFwGPNImSXbrmUUqz386kZmc5b8hGbT5jca5ih23iIwHXYJI4j+9rh65xyjyxMFDzel8wKxgvV8eHPHy/R5aYQoJaWWdWMMAX9QStLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AR4u9RyR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AR4u9RyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725783820; x=1757319820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4jVQuNrvrHL4Em2E5EX9KWHyAjwK/tI/w7ZA9+WVT20=;
  b=AR4u9RyRjLAlKUrRvT85jsCteCDTQy5VnqNsKMi4lsiT2feiDsk+aW8r
   CFZ31i1u6GeDT9gstYnQl1EXBD49Nnz85hFjYyPz8Z3LsAUmQame+3ed7
   nYPxA7EBy1yWQcmu8LqaPCjL2nfQYYDzI6JGjhoayz5IDl9IK5jW7ZkL6
   TBiekq2joz29CsUyiGkuCIw3GyBk+6XcS5AU7Rtey7eNuKJBqr3pJ3VAl
   ttxIhBzp/N5OvQxyvGL4LH64/dzL4fJIrqggux+ndCgF+WPe8/KWMWNvw
   MXXnapLQZENhJQD0z0icwogX8d+R2iROana7J/R7yQBf0ZzAeRG+A+pG3
   g==;
X-CSE-ConnectionGUID: 5U2wuDLRS0Wd4BOMclClBw==
X-CSE-MsgGUID: hAb3AYjtT8qz0juBg7i2xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="47014268"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="47014268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 01:23:37 -0700
X-CSE-ConnectionGUID: KEUmPngmRdyqMCxSs7jY/Q==
X-CSE-MsgGUID: 0cY7+KxnR3uDh6K7vVkiTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="103822395"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Sep 2024 01:23:35 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snDCm-000DKZ-3C;
	Sun, 08 Sep 2024 08:23:32 +0000
Date: Sun, 8 Sep 2024 16:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Weston Andros Adamson <dros@primarydata.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	NeilBrown <neilb@suse.de>
Subject: [snitzer:nfs-localio-for-next.v15 16/26] fs/nfsd/localio.c:77:15:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202409081600.TNWiIK6G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v15
head:   494f1a380b0adbc0fd4ba61103b456a1487c73c1
commit: 4af4178cf1b7796fcd5a1a25d6d3453291c294e1 [16/26] nfsd: add LOCALIO support
config: sh-randconfig-r113-20240908 (https://download.01.org/0day-ci/archive/20240908/202409081600.TNWiIK6G-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240908/202409081600.TNWiIK6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081600.TNWiIK6G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/localio.c:77:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/nfsd/localio.c:77:15: sparse:    struct net [noderef] __rcu *
   fs/nfsd/localio.c:77:15: sparse:    struct net *

vim +77 fs/nfsd/localio.c

    34	
    35	/**
    36	 * nfsd_open_local_fh - lookup a local filehandle @nfs_fh and map to nfsd_file
    37	 *
    38	 * @uuid: nfs_uuid_t which provides the 'struct net' to get the proper nfsd_net
    39	 *        and the 'struct auth_domain' required for LOCALIO access
    40	 * @rpc_clnt: rpc_clnt that the client established, used for sockaddr and cred
    41	 * @cred: cred that the client established
    42	 * @nfs_fh: filehandle to lookup
    43	 * @fmode: fmode_t to use for open
    44	 *
    45	 * This function maps a local fh to a path on a local filesystem.
    46	 * This is useful when the nfs client has the local server mounted - it can
    47	 * avoid all the NFS overhead with reads, writes and commits.
    48	 *
    49	 * On successful return, returned nfsd_file will have its nf_net member
    50	 * set. Caller (NFS client) is responsible for calling nfsd_serv_put and
    51	 * nfsd_file_put (via nfs_to.nfsd_file_put_local).
    52	 */
    53	struct nfsd_file *
    54	nfsd_open_local_fh(nfs_uuid_t *uuid,
    55			   struct rpc_clnt *rpc_clnt, const struct cred *cred,
    56			   const struct nfs_fh *nfs_fh, const fmode_t fmode)
    57		__must_hold(rcu)
    58	{
    59		int mayflags = NFSD_MAY_LOCALIO;
    60		struct nfsd_net *nn = NULL;
    61		struct net *net;
    62		struct svc_cred rq_cred;
    63		struct svc_fh fh;
    64		struct nfsd_file *localio;
    65		__be32 beres;
    66	
    67		if (nfs_fh->size > NFS4_FHSIZE)
    68			return ERR_PTR(-EINVAL);
    69	
    70		/*
    71		 * Not running in nfsd context, so must safely get reference on nfsd_serv.
    72		 * But the server may already be shutting down, if so disallow new localio.
    73		 * uuid->net is NOT a counted reference, but caller's rcu_read_lock() ensures
    74		 * that if uuid->net is not NULL, then calling nfsd_serv_try_get() is safe
    75		 * and if it succeeds we will have an implied reference to the net.
    76		 */
  > 77		net = rcu_dereference(uuid->net);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
