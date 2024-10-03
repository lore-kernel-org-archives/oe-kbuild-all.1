Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A241474C5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727955330; cv=none; b=QJoFh9MnQuNFNWildL/GQ7FryzWg2x0nS+QjJY57epjG5Kg2V2Dry3Y/U+cJD2hOwDAXqueBumjNlwaAtKzkIpUslX6RZO4tzz0J7VCx0RqqqG5PVcIpZiYUQGeB/giHfubhlNlKKBZwApK7erYmkDBHTEGMztBlvM/G+Cl1mdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727955330; c=relaxed/simple;
	bh=gPl0fcKr/HqZCsFQj0iZmDMCUSva7Q5IylPCBbppRsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gbh/NLJmMxUi0ca5EtudGP1LyiEcCzVtnL/PzK99bsn3xPCeK6JsajwmLDmP5IPmMqGXhJFbOjxyDE/Df+KB0a2lvLfcx2YC/AzHROVF1MP0XRtIhj9tQWmxbQjF+NPt/4vrndYeiyx0C19homEmfCeUT0stCpCe69KmpT43T5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uv+eZl+1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uv+eZl+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727955329; x=1759491329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPl0fcKr/HqZCsFQj0iZmDMCUSva7Q5IylPCBbppRsw=;
  b=Uv+eZl+1HHjAPCNoWO28EfHdRKIMDYGzqrwH+OZioRLNwdnoDE/mJ9u3
   lIUQyETaHp5cLl+Ak35+hCJvAzdKx/GipM36YZomMgOcFJbgRLpy3AE5Z
   t4WCJO/mvXcqGg7HahHUM4o8GQqg1fTpmm3P4wcdtz1+Tb7Q1AzK/zr6E
   K4QIcL1n1YdUJOJo2DCR6EbdnatL03g9PW0Tyv0Gj6wHT28BW9l7KxxN9
   PEhocQkGm9AU4h7nXxe4IIBFi9ZJ3VY+wm8inf8EETDyEZ5bybKHmv/Xr
   4iYKkjz6FsXbAnjf5dt70ea1rpwtffmshG6pQrOxY8aDDSLhzCcbEvlvF
   Q==;
X-CSE-ConnectionGUID: K7QBrah6Qo+S0hfBuISF/A==
X-CSE-MsgGUID: pp9v/g0uSYC59nTFwfX3GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30937233"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="30937233"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:35:28 -0700
X-CSE-ConnectionGUID: OUzSYsGkTzSYHFERqfO8DQ==
X-CSE-MsgGUID: m/iQkWIyRh6/55D9URedSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="75119462"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Oct 2024 04:35:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swK7B-0000Le-0k;
	Thu, 03 Oct 2024 11:35:25 +0000
Date: Thu, 3 Oct 2024 19:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 4/9] include/linux/nfslocalio.h:76:
 undefined reference to `nfs_to'
Message-ID: <202410031944.hMCFY9BO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   5262b13197d631495e9a581d56b781d8f684f70f
commit: a1e7c508e48a2e4d269fb94f89e0282add3a6cdf [4/9] nfs_common: fix race in NFS calls to nfsd_file_put_local() and nfsd_serv_put()
config: x86_64-randconfig-002-20241002 (https://download.01.org/0day-ci/archive/20241003/202410031944.hMCFY9BO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031944.hMCFY9BO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031944.hMCFY9BO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/nfs/localio.o: in function `nfs_local_iocb_alloc':
   fs/nfs/localio.c:290: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:290: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:290: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o: in function `nfs_to_nfsd_file_put_local':
>> include/linux/nfslocalio.h:76: undefined reference to `nfs_to'
>> ld: include/linux/nfslocalio.h:76: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o:include/linux/nfslocalio.h:76: more undefined references to `nfs_to' follow
   ld: fs/nfs/localio.o: in function `nfs_local_disable':
   fs/nfs/localio.c:140: undefined reference to `nfs_uuid_invalidate_one_client'
   ld: fs/nfs/localio.o: in function `nfs_local_probe':
   fs/nfs/localio.c:209: undefined reference to `nfs_uuid_begin'
   ld: fs/nfs/localio.c:212: undefined reference to `nfs_uuid_end'
   ld: fs/nfs/localio.o: in function `nfs_local_open_fh':
   fs/nfs/localio.c:233: undefined reference to `nfs_open_local_fh'
   ld: fs/nfs/localio.o: in function `nfs_local_doio':
   fs/nfs/localio.c:600: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:600: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o: in function `nfs_to_nfsd_file_put_local':
>> include/linux/nfslocalio.h:76: undefined reference to `nfs_to'
>> ld: include/linux/nfslocalio.h:76: undefined reference to `nfs_to'
>> ld: include/linux/nfslocalio.h:76: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o:include/linux/nfslocalio.h:76: more undefined references to `nfs_to' follow


vim +76 include/linux/nfslocalio.h

    63	
    64	struct nfsd_file *nfs_open_local_fh(nfs_uuid_t *,
    65			   struct rpc_clnt *, const struct cred *,
    66			   const struct nfs_fh *, const fmode_t);
    67	
    68	static inline void nfs_to_nfsd_file_put_local(struct nfsd_file *localio)
    69	{
    70		/*
    71		 * Once reference to nfsd_serv is dropped, NFSD could be
    72		 * unloaded, so ensure safe return from nfsd_file_put_local()
    73		 * by always taking RCU.
    74		 */
    75		rcu_read_lock();
  > 76		nfs_to->nfsd_file_put_local(localio);
    77		rcu_read_unlock();
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
