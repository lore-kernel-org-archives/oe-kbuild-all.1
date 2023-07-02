Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CA028EB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688336451; x=1719872451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJ59FrlAPOLMOMVhLRYsH6xUGKIgfUw1Wh/Umv63gdc=;
  b=QytG3iPIg+93vIHlcA3optllccQk7w61IxDdXrkld1+TFtVdJAhNroDk
   HcX7lj1HExtgoBOenoWxPegsWq9mg9A+uiuQXJnJ1UfAOWCmCJ4kbH23S
   x2OnpkAt/RVGiDlp2wzEkt73orlQqKSsUH+ET+vP9g0/uXhHaUjxcb7mk
   OuHHAoFDQFXYiqFJ9hi73k3P21INgY/Ri9VoPGrLe29OuGfDBARqBwgzp
   MvozC5Hcwo8x5q6py90A8AVD+GAtAz53OL+saHXIwny/oFbZv/i39DuT+
   YQ/FdZrSzQ8s2Rjp3Y/RQKhZBPDnOxVM609DFJPBR0l7M5DEI1l3lXtEL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="352567947"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="352567947"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 15:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="842460355"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="842460355"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Jul 2023 15:20:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG5R2-000GuJ-2b;
	Sun, 02 Jul 2023 22:20:48 +0000
Date: Mon, 3 Jul 2023 06:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 3/5] fs/nfsd/vfs.c:1031:20: error:
 implicit declaration of function 'file_access_permission'; did you mean
 'file_permission'?
Message-ID: <202307030634.1L07fI7L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   a5282aa7e38bc78059dd397d3313f16cebc97168
commit: 7c555d357bf6cd0c111b63caf1299d747f9f028b [3/5] splice: move permission hook out of splice_direct_to_actor()
config: arm-integrator_defconfig (https://download.01.org/0day-ci/archive/20230703/202307030634.1L07fI7L-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030634.1L07fI7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030634.1L07fI7L-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/vfs.c: In function 'nfsd_splice_read':
>> fs/nfsd/vfs.c:1031:20: error: implicit declaration of function 'file_access_permission'; did you mean 'file_permission'? [-Werror=implicit-function-declaration]
    1031 |         host_err = file_access_permission(file, MAY_READ);
         |                    ^~~~~~~~~~~~~~~~~~~~~~
         |                    file_permission
   cc1: some warnings being treated as errors


vim +1031 fs/nfsd/vfs.c

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
