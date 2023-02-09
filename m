Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C41D2F3A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675976290; x=1707512290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hh9V/oI5iYpUbyBwwTYXDQYxXRW/nFyLiAvRbvgTqtw=;
  b=KLiSeW3mXs6A6gn1MAMpZH3Gt2vQqnR3mRUTDJ8+1gLPSVzBuL85TSvy
   c3c7YEBeBEuDElBevBqTdJ90OpRfbAZ78HVGqIrigULxCL3ngBWek84Tj
   Mciz7xQSLP/6cUGQE028AshdQEAOzP7XYhTrXJO7ciln11ogYXzijr9Qn
   xH6E1kczKMc05jTICpS9qWgATSCE5FsoMSJBRz50uRM/5Ahn11wanrzBP
   GP+527IEm1iFj1C+CniVHAuFWKwqJRGsqhseHaygWLcgRVrGOgNwfNcWv
   5aNOj+nKjDc6WBdV8xp00CGWXyWRj6AOTiGNCTvPrgNYxX33myNzInmHX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="310607212"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="310607212"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 12:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="736481916"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="736481916"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2023 12:58:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQDzb-0005Iy-1K;
	Thu, 09 Feb 2023 20:58:07 +0000
Date: Fri, 10 Feb 2023 04:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Wysochanski <dwysocha@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>
Subject: fs/nfs/fscache.c:58:51: sparse: sparse: incorrect type in argument 3
 (different base types)
Message-ID: <202302100452.I8RJohmF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   35674e787518768626d3a0ffce1c13a7eeed922d
commit: a6b5a28eb56c3f4988f7ff5290b954ba296e309a nfs: Convert to new fscache volume/cookie API
date:   1 year, 1 month ago
config: arm64-randconfig-s043-20230208 (https://download.01.org/0day-ci/archive/20230210/202302100452.I8RJohmF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a6b5a28eb56c3f4988f7ff5290b954ba296e309a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a6b5a28eb56c3f4988f7ff5290b954ba296e309a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/infiniband/hw/hns/ drivers/remoteproc/ fs/nfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100452.I8RJohmF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/fscache.c:58:51: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long x @@     got restricted __be16 const [usertype] sin_port @@
   fs/nfs/fscache.c:58:51: sparse:     expected unsigned long long x
   fs/nfs/fscache.c:58:51: sparse:     got restricted __be16 const [usertype] sin_port
>> fs/nfs/fscache.c:59:61: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long x @@     got restricted __be32 const [usertype] s_addr @@
   fs/nfs/fscache.c:59:61: sparse:     expected unsigned long long x
   fs/nfs/fscache.c:59:61: sparse:     got restricted __be32 const [usertype] s_addr
>> fs/nfs/fscache.c:64:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long x @@     got restricted __be16 const [usertype] sin6_port @@
   fs/nfs/fscache.c:64:52: sparse:     expected unsigned long long x
   fs/nfs/fscache.c:64:52: sparse:     got restricted __be16 const [usertype] sin6_port
>> fs/nfs/fscache.c:65:73: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long x @@     got restricted __be32 const @@
   fs/nfs/fscache.c:65:73: sparse:     expected unsigned long long x
   fs/nfs/fscache.c:65:73: sparse:     got restricted __be32 const
   fs/nfs/fscache.c:66:73: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long x @@     got restricted __be32 const @@
   fs/nfs/fscache.c:66:73: sparse:     expected unsigned long long x
   fs/nfs/fscache.c:66:73: sparse:     got restricted __be32 const
   fs/nfs/fscache.c:67:73: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long x @@     got restricted __be32 const @@
   fs/nfs/fscache.c:67:73: sparse:     expected unsigned long long x
   fs/nfs/fscache.c:67:73: sparse:     got restricted __be32 const
   fs/nfs/fscache.c:68:73: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long x @@     got restricted __be32 const @@
   fs/nfs/fscache.c:68:73: sparse:     expected unsigned long long x
   fs/nfs/fscache.c:68:73: sparse:     got restricted __be32 const

vim +58 fs/nfs/fscache.c

    37	
    38	/*
    39	 * Get the per-client index cookie for an NFS client if the appropriate mount
    40	 * flag was set
    41	 * - We always try and get an index cookie for the client, but get filehandle
    42	 *   cookies on a per-superblock basis, depending on the mount flags
    43	 */
    44	static bool nfs_fscache_get_client_key(struct nfs_client *clp,
    45					       char *key, int *_len)
    46	{
    47		const struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *) &clp->cl_addr;
    48		const struct sockaddr_in *sin = (struct sockaddr_in *) &clp->cl_addr;
    49	
    50		*_len += snprintf(key + *_len, NFS_MAX_KEY_LEN - *_len,
    51				  ",%u.%u,%x",
    52				  clp->rpc_ops->version,
    53				  clp->cl_minorversion,
    54				  clp->cl_addr.ss_family);
    55	
    56		switch (clp->cl_addr.ss_family) {
    57		case AF_INET:
  > 58			if (!nfs_append_int(key, _len, sin->sin_port) ||
  > 59			    !nfs_append_int(key, _len, sin->sin_addr.s_addr))
    60				return false;
    61			return true;
    62	
    63		case AF_INET6:
  > 64			if (!nfs_append_int(key, _len, sin6->sin6_port) ||
  > 65			    !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[0]) ||
    66			    !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[1]) ||
    67			    !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[2]) ||
    68			    !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[3]))
    69				return false;
    70			return true;
    71	
    72		default:
    73			printk(KERN_WARNING "NFS: Unknown network family '%d'\n",
    74			       clp->cl_addr.ss_family);
    75			return false;
    76		}
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
