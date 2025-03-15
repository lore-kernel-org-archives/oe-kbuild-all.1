Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB32E3387
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742025772; cv=none; b=GZ7muPD2TaZ/e9FQKFpifh7u3GKfQNla9NXdVKCGhKHPSGyCzU/N2/ezDa5oTN1jnMNqj/jEe3uzft3zVzoM8V4itLNw/imE8+TegCJM85dsgZKylNfa2l0rX4fANaLjD5Xq9hFtnMXVRgai3IOIhvq0uTWZ5U7fsMz4kEp4PfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742025772; c=relaxed/simple;
	bh=wwHLR/LtCEHX887zIgcvM9ieYFCXQmyfoHM3OdPk+r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUt+RmoJtp4LeLRQwHtHplFozGTN0swvDG+0Uk1JY69yx7BN24Xu4ckdUaXQouo74dbVMmVC5QsNm+llaa6ssUK/oTx0UBwdcjHN9umn7BVRytQ4tKZAFSEaQ60+0r9N0RwgbEBZ6ZoPJk/zSbsrMR7gG98Q1RqWG7U8ybm1eOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRUs6oMn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRUs6oMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742025771; x=1773561771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wwHLR/LtCEHX887zIgcvM9ieYFCXQmyfoHM3OdPk+r4=;
  b=SRUs6oMn45namSN919ik4Kzb0Lh1hUbcROnFdseagKSLVahIcok8TbST
   vTEG4yq8bHmBEB77r4mIQGc9g3KWNzuZQsdJ/ht+Lm56mg4AHnzrbxq8K
   MzABfIY/fePr7trt1s4JOukWA23Kxddzft/q432NwimvNIAlVeEi5AGmp
   fdwBbZOFmCUb9MzYViumnvUyYROeDFDfY4EKpGQwav1RLZpsEkGKRW7iu
   XjS4A/Jt35MUZSitgdQpMFYh2DhKPJSb3RSLahSA92ZePxGJI7jUckSnL
   ixrrgF7L3BsF+4Oa4UA4pd2vHqNl5w/0tnSNMQqPGk6QvxkeAD+pKvbOt
   g==;
X-CSE-ConnectionGUID: tqwgT8wyRMC/GM4fnKNgjg==
X-CSE-MsgGUID: 7cr5NH7rT/C3Jpv2s+AwLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43285290"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43285290"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 01:02:50 -0700
X-CSE-ConnectionGUID: xDt7Db4DSjKvnoT6ut6niQ==
X-CSE-MsgGUID: wxBYnqWhROaN6mCqJKMZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="122002534"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Mar 2025 01:02:48 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttMTm-000B9d-1L;
	Sat, 15 Mar 2025 08:02:46 +0000
Date: Sat, 15 Mar 2025 16:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:rpc-shutdown 6/6] fs/nfs/client.c:253:42: error: 'struct
 nfs_client' has no member named 'cl_ns_track'; did you mean 'cl_ns_tracker'?
Message-ID: <202503151818.UFLI21Fz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git rpc-shutdown
head:   90f3e7c66179087ea6f82f20f4e4220007bd9628
commit: 90f3e7c66179087ea6f82f20f4e4220007bd9628 [6/6] nfs: add a refcount tracker for struct net as held by the nfs_client
config: x86_64-randconfig-003-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151818.UFLI21Fz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151818.UFLI21Fz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151818.UFLI21Fz-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/client.c: In function 'nfs_free_client':
>> fs/nfs/client.c:253:42: error: 'struct nfs_client' has no member named 'cl_ns_track'; did you mean 'cl_ns_tracker'?
     253 |         put_net_track(clp->cl_net, &clp->cl_ns_track);
         |                                          ^~~~~~~~~~~
         |                                          cl_ns_tracker


vim +253 fs/nfs/client.c

   241	
   242	/*
   243	 * Destroy a shared client record
   244	 */
   245	void nfs_free_client(struct nfs_client *clp)
   246	{
   247		nfs_localio_disable_client(clp);
   248	
   249		/* -EIO all pending I/O */
   250		if (!IS_ERR(clp->cl_rpcclient))
   251			rpc_shutdown_client(clp->cl_rpcclient);
   252	
 > 253		put_net_track(clp->cl_net, &clp->cl_ns_track);
   254		put_nfs_version(clp->cl_nfs_mod);
   255		kfree(clp->cl_hostname);
   256		kfree(clp->cl_acceptor);
   257		kfree_rcu(clp, rcu);
   258	}
   259	EXPORT_SYMBOL_GPL(nfs_free_client);
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
