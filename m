Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF53AF669
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324019; cv=none; b=YNOblYmWZOKl2RqAlYA1N6MIBARKfP3miDt3yg4T1ksLH+lkvitulumpgIwgFCSu7kwCuB8pqLp2S879DlhFuw2PR5jsZ1PUBd1u/D60o3EUxyPguDbF0hiEPQLrUJI5iaT0/2pKvVQKnyvuAaZA3tXENFIGvSkgPS7ygQTNqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324019; c=relaxed/simple;
	bh=5cVlLksXOVk/God32CmggFkCMaEIYIcB+8vr99Pkn+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eNdsysNte+HYSZ7yZtfRMCCWGkdy/1CD6J6RNx+64gWl0hJejaDVk032yFZK/EzmmZkRJL+eGt09xMj6s/xFQeaLGIIKP+iQ51jdSzisd9ac2KKSXd7CulaqI23yurD6wxWdghCrfuy1fDfu1JweaUU1pl+uvr3Vbhr8PRXOo4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ios035wp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ios035wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780324018; x=1811860018;
  h=date:from:to:cc:subject:message-id;
  bh=5cVlLksXOVk/God32CmggFkCMaEIYIcB+8vr99Pkn+4=;
  b=Ios035wp4Uo5OzExcFF6tmoACYbOgJ8kgSechNBGEMKR8l0DrgWULXtW
   k1tHb/HsxO7+QEupIU2DmJwLmWmHd4smdIAcfOf4DvD6Nkzz9M2kU0dY7
   JoG/NBePJkxSejs1lCDzyE1ywNcmWKIbTOoHBvhxlkD/mxGznUTP5tUkp
   XuUs9Y6v3dRIN3d2EQlLrSFzY+vNkud9nmygCMgIZgM6akHQAVxW0iIZL
   lL47QgaVrYlbz4M+r+mU0NY2z05zzMSU4phScDVWN0c4hJsNhWVBQ9nAl
   WjOl0fagKnfGS91089fUW7KQE7g2slwLMUMsf2ziSxG4fwJe80o/nWIMP
   A==;
X-CSE-ConnectionGUID: xX7G8ggzQ/msAI3ZU7aOtA==
X-CSE-MsgGUID: 8AEAyrQHSgKGj3qEtV+95A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106529588"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="106529588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:26:57 -0700
X-CSE-ConnectionGUID: PHJQIhysSV6CCF6IfkVWHQ==
X-CSE-MsgGUID: iVuOaGkdQfOiwpFIUlSNvg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jun 2026 07:26:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU3bR-00000000Aeu-14pU;
	Mon, 01 Jun 2026 14:26:53 +0000
Date: Mon, 01 Jun 2026 22:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@oracle.com>
Subject: fs/nfsd/localio.c:100:23: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202606012239.O6oyOQvs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: c25a89770d1f216dcedfc2d25d56b604f62ce0bd nfs_localio: change nfsd_file_put_local() to take a pointer to __rcu pointer
date:   1 year ago
config: riscv-randconfig-r134-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012239.O6oyOQvs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012239.O6oyOQvs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c25a89770d1f ("nfs_localio: change nfsd_file_put_local() to take a pointer to __rcu pointer")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012239.O6oyOQvs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/localio.c:100:23: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfsd/localio.c:100:23: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfsd/localio.c:100:23: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfsd/localio.c:100:23: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfsd/localio.c:100:23: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfsd/localio.c:100:23: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfsd/localio.c:100:23: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +100 fs/nfsd/localio.c

fa4983862e506d Weston Andros Adamson 2024-09-05   26  
fa4983862e506d Weston Andros Adamson 2024-09-05   27  /**
fa4983862e506d Weston Andros Adamson 2024-09-05   28   * nfsd_open_local_fh - lookup a local filehandle @nfs_fh and map to nfsd_file
fa4983862e506d Weston Andros Adamson 2024-09-05   29   *
fa4983862e506d Weston Andros Adamson 2024-09-05   30   * @net: 'struct net' to get the proper nfsd_net required for LOCALIO access
fa4983862e506d Weston Andros Adamson 2024-09-05   31   * @dom: 'struct auth_domain' required for LOCALIO access
fa4983862e506d Weston Andros Adamson 2024-09-05   32   * @rpc_clnt: rpc_clnt that the client established
fa4983862e506d Weston Andros Adamson 2024-09-05   33   * @cred: cred that the client established
fa4983862e506d Weston Andros Adamson 2024-09-05   34   * @nfs_fh: filehandle to lookup
e6f7e1487ab528 NeilBrown             2025-05-09   35   * @nfp: place to find the nfsd_file, or store it if it was non-NULL
fa4983862e506d Weston Andros Adamson 2024-09-05   36   * @fmode: fmode_t to use for open
fa4983862e506d Weston Andros Adamson 2024-09-05   37   *
fa4983862e506d Weston Andros Adamson 2024-09-05   38   * This function maps a local fh to a path on a local filesystem.
fa4983862e506d Weston Andros Adamson 2024-09-05   39   * This is useful when the nfs client has the local server mounted - it can
fa4983862e506d Weston Andros Adamson 2024-09-05   40   * avoid all the NFS overhead with reads, writes and commits.
fa4983862e506d Weston Andros Adamson 2024-09-05   41   *
fa4983862e506d Weston Andros Adamson 2024-09-05   42   * On successful return, returned nfsd_file will have its nf_net member
e1943f4eb8d531 Mike Snitzer          2024-11-15   43   * set. Caller (NFS client) is responsible for calling nfsd_net_put and
65f2a5c366353d Mike Snitzer          2024-10-03   44   * nfsd_file_put (via nfs_to_nfsd_file_put_local).
fa4983862e506d Weston Andros Adamson 2024-09-05   45   */
e6f7e1487ab528 NeilBrown             2025-05-09   46  static struct nfsd_file *
fa4983862e506d Weston Andros Adamson 2024-09-05   47  nfsd_open_local_fh(struct net *net, struct auth_domain *dom,
fa4983862e506d Weston Andros Adamson 2024-09-05   48  		   struct rpc_clnt *rpc_clnt, const struct cred *cred,
e6f7e1487ab528 NeilBrown             2025-05-09   49  		   const struct nfs_fh *nfs_fh, struct nfsd_file __rcu **pnf,
e6f7e1487ab528 NeilBrown             2025-05-09   50  		   const fmode_t fmode)
fa4983862e506d Weston Andros Adamson 2024-09-05   51  {
fa4983862e506d Weston Andros Adamson 2024-09-05   52  	int mayflags = NFSD_MAY_LOCALIO;
fa4983862e506d Weston Andros Adamson 2024-09-05   53  	struct svc_cred rq_cred;
fa4983862e506d Weston Andros Adamson 2024-09-05   54  	struct svc_fh fh;
fa4983862e506d Weston Andros Adamson 2024-09-05   55  	struct nfsd_file *localio;
fa4983862e506d Weston Andros Adamson 2024-09-05   56  	__be32 beres;
fa4983862e506d Weston Andros Adamson 2024-09-05   57  
fa4983862e506d Weston Andros Adamson 2024-09-05   58  	if (nfs_fh->size > NFS4_FHSIZE)
fa4983862e506d Weston Andros Adamson 2024-09-05   59  		return ERR_PTR(-EINVAL);
fa4983862e506d Weston Andros Adamson 2024-09-05   60  
77e82fb2c6c27c NeilBrown             2025-05-09   61  	if (!nfsd_net_try_get(net))
77e82fb2c6c27c NeilBrown             2025-05-09   62  		return ERR_PTR(-ENXIO);
77e82fb2c6c27c NeilBrown             2025-05-09   63  
e6f7e1487ab528 NeilBrown             2025-05-09   64  	rcu_read_lock();
e6f7e1487ab528 NeilBrown             2025-05-09   65  	localio = nfsd_file_get(rcu_dereference(*pnf));
e6f7e1487ab528 NeilBrown             2025-05-09   66  	rcu_read_unlock();
e6f7e1487ab528 NeilBrown             2025-05-09   67  	if (localio)
e6f7e1487ab528 NeilBrown             2025-05-09   68  		return localio;
e6f7e1487ab528 NeilBrown             2025-05-09   69  
fa4983862e506d Weston Andros Adamson 2024-09-05   70  	/* nfs_fh -> svc_fh */
fa4983862e506d Weston Andros Adamson 2024-09-05   71  	fh_init(&fh, NFS4_FHSIZE);
fa4983862e506d Weston Andros Adamson 2024-09-05   72  	fh.fh_handle.fh_size = nfs_fh->size;
fa4983862e506d Weston Andros Adamson 2024-09-05   73  	memcpy(fh.fh_handle.fh_raw, nfs_fh->data, nfs_fh->size);
fa4983862e506d Weston Andros Adamson 2024-09-05   74  
fa4983862e506d Weston Andros Adamson 2024-09-05   75  	if (fmode & FMODE_READ)
fa4983862e506d Weston Andros Adamson 2024-09-05   76  		mayflags |= NFSD_MAY_READ;
fa4983862e506d Weston Andros Adamson 2024-09-05   77  	if (fmode & FMODE_WRITE)
fa4983862e506d Weston Andros Adamson 2024-09-05   78  		mayflags |= NFSD_MAY_WRITE;
fa4983862e506d Weston Andros Adamson 2024-09-05   79  
fa4983862e506d Weston Andros Adamson 2024-09-05   80  	svcauth_map_clnt_to_svc_cred_local(rpc_clnt, cred, &rq_cred);
fa4983862e506d Weston Andros Adamson 2024-09-05   81  
fa4983862e506d Weston Andros Adamson 2024-09-05   82  	beres = nfsd_file_acquire_local(net, &rq_cred, dom,
fa4983862e506d Weston Andros Adamson 2024-09-05   83  					&fh, mayflags, &localio);
fa4983862e506d Weston Andros Adamson 2024-09-05   84  	if (beres)
fa4983862e506d Weston Andros Adamson 2024-09-05   85  		localio = ERR_PTR(nfs_stat_to_errno(be32_to_cpu(beres)));
fa4983862e506d Weston Andros Adamson 2024-09-05   86  
fa4983862e506d Weston Andros Adamson 2024-09-05   87  	fh_put(&fh);
fa4983862e506d Weston Andros Adamson 2024-09-05   88  	if (rq_cred.cr_group_info)
fa4983862e506d Weston Andros Adamson 2024-09-05   89  		put_group_info(rq_cred.cr_group_info);
fa4983862e506d Weston Andros Adamson 2024-09-05   90  
e6f7e1487ab528 NeilBrown             2025-05-09   91  	if (!IS_ERR(localio)) {
e6f7e1487ab528 NeilBrown             2025-05-09   92  		struct nfsd_file *new;
e6f7e1487ab528 NeilBrown             2025-05-09   93  		if (!nfsd_net_try_get(net)) {
e6f7e1487ab528 NeilBrown             2025-05-09   94  			nfsd_file_put(localio);
e6f7e1487ab528 NeilBrown             2025-05-09   95  			nfsd_net_put(net);
e6f7e1487ab528 NeilBrown             2025-05-09   96  			return ERR_PTR(-ENXIO);
e6f7e1487ab528 NeilBrown             2025-05-09   97  		}
e6f7e1487ab528 NeilBrown             2025-05-09   98  		nfsd_file_get(localio);
e6f7e1487ab528 NeilBrown             2025-05-09   99  	again:
e6f7e1487ab528 NeilBrown             2025-05-09 @100  		new = unrcu_pointer(cmpxchg(pnf, NULL, RCU_INITIALIZER(localio)));
e6f7e1487ab528 NeilBrown             2025-05-09  101  		if (new) {
e6f7e1487ab528 NeilBrown             2025-05-09  102  			/* Some other thread installed an nfsd_file */
e6f7e1487ab528 NeilBrown             2025-05-09  103  			if (nfsd_file_get(new) == NULL)
e6f7e1487ab528 NeilBrown             2025-05-09  104  				goto again;
e6f7e1487ab528 NeilBrown             2025-05-09  105  			/*
e6f7e1487ab528 NeilBrown             2025-05-09  106  			 * Drop the ref we were going to install and the
e6f7e1487ab528 NeilBrown             2025-05-09  107  			 * one we were going to return.
e6f7e1487ab528 NeilBrown             2025-05-09  108  			 */
e6f7e1487ab528 NeilBrown             2025-05-09  109  			nfsd_file_put(localio);
e6f7e1487ab528 NeilBrown             2025-05-09  110  			nfsd_file_put(localio);
e6f7e1487ab528 NeilBrown             2025-05-09  111  			localio = new;
e6f7e1487ab528 NeilBrown             2025-05-09  112  		}
e6f7e1487ab528 NeilBrown             2025-05-09  113  	} else
77e82fb2c6c27c NeilBrown             2025-05-09  114  		nfsd_net_put(net);
77e82fb2c6c27c NeilBrown             2025-05-09  115  
fa4983862e506d Weston Andros Adamson 2024-09-05  116  	return localio;
fa4983862e506d Weston Andros Adamson 2024-09-05  117  }
e6f7e1487ab528 NeilBrown             2025-05-09  118  

:::::: The code at line 100 was first introduced by commit
:::::: e6f7e1487ab528a6c653bd0d42812ff2942846cd nfs_localio: simplify interface to nfsd for getting nfsd_file

:::::: TO: NeilBrown <neil@brown.name>
:::::: CC: Anna Schumaker <anna.schumaker@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
