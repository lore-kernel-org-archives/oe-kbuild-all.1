Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362F21840
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689058069; x=1720594069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6QsH4NVp6vdJIpap7C04EVPcVDJr4H286IS+n/bLiM=;
  b=R1SLdDd0e/ID5KeiUjPdKY/TK4nVON3qroFluVmB+10nC+JqvayCSueI
   txhPhDLuqpQCDSb1KcAcJklkqN1uljYNZOBACAJ1vJWeLQtnzncc18FTO
   0MqM9xB2CQdJv0UIfd44GyxmXhFOzuNDyycJImO7KC9naWH+o4jL8989k
   XWK24ezWCEMEtwLKhCc2N9ylZ10zu5vqrzAFY54QY6QLBZu2pC/NxCLXP
   /SQuosBkEuSR7GKVJD6ML53ydb+v/yMWAE6IUkHKZGKn8A7GcvRKf2sf8
   AJq8HlDSvEoHHpmFpgWc5Qz9Mo5I1Qwa34gstrMnvHfLqCUZ1R8fTSS5F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428235126"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="428235126"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="756237834"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="756237834"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 23:47:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ7A1-0004Pv-1g;
	Tue, 11 Jul 2023 06:47:45 +0000
Date: Tue, 11 Jul 2023 14:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 4/6] fs/nfsd/vfs.c:1031:13: error: call
 to undeclared function 'file_access_permission'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307111413.ILAEIXd9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   dee92d97ca4a2052cddcf1875441bdbe30e50b13
commit: 28373848f0ca3bbfb2c00e4b210d8b498d145d98 [4/6] splice: move permission hook out of splice_direct_to_actor()
config: arm-versatile_defconfig (https://download.01.org/0day-ci/archive/20230711/202307111413.ILAEIXd9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111413.ILAEIXd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111413.ILAEIXd9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/vfs.c:1031:13: error: call to undeclared function 'file_access_permission'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1031 |         host_err = file_access_permission(file, MAY_READ);
         |                    ^
   fs/nfsd/vfs.c:1031:13: note: did you mean 'file_permission'?
   include/linux/fs.h:2519:19: note: 'file_permission' declared here
    2519 | static inline int file_permission(struct file *file, int mask)
         |                   ^
   1 error generated.


vim +/file_access_permission +1031 fs/nfsd/vfs.c

  1005	
  1006	/**
  1007	 * nfsd_splice_read - Perform a VFS read using a splice pipe
  1008	 * @rqstp: RPC transaction context
  1009	 * @fhp: file handle of file to be read
  1010	 * @file: opened struct file of file to be read
  1011	 * @offset: starting byte offset
  1012	 * @count: IN: requested number of bytes; OUT: number of bytes read
  1013	 * @eof: OUT: set non-zero if operation reached the end of the file
  1014	 *
  1015	 * Returns nfs_ok on success, otherwise an nfserr stat value is
  1016	 * returned.
  1017	 */
  1018	__be32 nfsd_splice_read(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1019				struct file *file, loff_t offset, unsigned long *count,
  1020				u32 *eof)
  1021	{
  1022		struct splice_desc sd = {
  1023			.len		= 0,
  1024			.total_len	= *count,
  1025			.pos		= offset,
  1026			.u.data		= rqstp,
  1027		};
  1028		ssize_t host_err;
  1029	
  1030		trace_nfsd_read_splice(rqstp, fhp, offset, *count);
> 1031		host_err = file_access_permission(file, MAY_READ);
  1032		if (!host_err)
  1033			host_err = splice_direct_to_actor(file, &sd,
  1034							  nfsd_direct_splice_actor);
  1035		return nfsd_finish_read(rqstp, fhp, file, offset, count, eof, host_err);
  1036	}
  1037	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
