Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2063D0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 03:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707448095; cv=none; b=gXKFD33BN43NuUVUy2u0a9D62ppPFK1IGPxa0iSdsYOBc1rp1OGq/SkYJWdVjfUNTJOJgCcE4cquGKSzU7kg9/+wBWLwv4KKTInuEuLi7DaK5TuV4UDk/Y4lPWw+OKOHeP8A1fypJ89qwlMh9aB6uk4t5KkXBBtTlxXVM+fosO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707448095; c=relaxed/simple;
	bh=TSOeS7OMGkFVYToCF3lPV/nvGA6iu5Ih1SOeBK56rAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0DGM5n3Zx76Ijz7cwmUcT7IV3D5/+YxpQpw0MTff4750N+AVMvZOxh+jk3nnC2odGmDZce3a9s1VgDgCpEgQuOUubAcEuDb0EugFZkbHWMPcRVvUuiwm3V6MSeU0/tXr0OVn/SeJanxwvu2qzs6gOj0EjKe11++MBGsa2FDFhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjUOJQjX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjUOJQjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707448094; x=1738984094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSOeS7OMGkFVYToCF3lPV/nvGA6iu5Ih1SOeBK56rAY=;
  b=EjUOJQjXmDu/hJdBkn1zJnPgjolksF5tLTBqNqeKJxLzN3Vnl5mHjwwr
   HmL4T5Jz/rWf3uoruMBr6QI8mVXNfg2nUhn0j9zAFUjUOx9PhXKmGz4W+
   OdaNNH5a5Yw3YBzdYQCZAHZi+56o82EQk2QV86OUbSRgnMq8ZcqiPy3NU
   4uWsJgdLwMccYbgRWcL9EteCQpalNPbK0pWg4olE4wNeb6XlalJoQRuwr
   20BnWUA6DkXCDM8sEGLFDiX5lVkT+8OSM4p4OS9WOAM3L+WLt/S0tqff7
   2dl1oJ5tRmQKsrCghPvi/cg5sGaH1t6404ewaCjn/Ybv47w9pKXFeiZUH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5157887"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="5157887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 19:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="2135876"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2024 19:08:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYHFJ-0004LK-0m;
	Fri, 09 Feb 2024 03:08:09 +0000
Date: Fri, 9 Feb 2024 11:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:dir-deleg 4/4] fs/nfs/nfs4proc.c:10709:undefined reference
 to `nfs4_proc_get_dir_delegation'
Message-ID: <202402091155.LJe4xHHQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   7b60285292bdd8a4c76775a8eabde93e9dd5b8a2
commit: 861bf90064b2f2eaf6c0263f6bd5cbbbdc653169 [4/4] nfs: add an ioctl to fetch a directory delegation
config: arm-tegra_defconfig (https://download.01.org/0day-ci/archive/20240209/202402091155.LJe4xHHQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402091155.LJe4xHHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091155.LJe4xHHQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/nfs/nfs4proc.o: in function `nfs4_cachectl':
>> fs/nfs/nfs4proc.c:10709:(.text+0xe00): undefined reference to `nfs4_proc_get_dir_delegation'


vim +10709 fs/nfs/nfs4proc.c

 10700	
 10701	static long nfs4_cachectl(struct file *filp, unsigned int cmd)
 10702	{
 10703		struct inode *inode = file_inode(filp);
 10704	
 10705		switch (cmd) {
 10706		case NFS_CACHECTL_GET_DIR_DELEGATION:
 10707			if (!S_ISDIR(inode->i_mode))
 10708				return -ENOTDIR;
 10709			return nfs4_proc_get_dir_delegation(inode, filp->f_cred);
 10710		}
 10711		return -EINVAL;
 10712	}
 10713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
