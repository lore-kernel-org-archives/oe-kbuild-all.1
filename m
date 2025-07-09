Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F426B955
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045901; cv=none; b=nb0NzkzhEB7tm9bkDHGA5sKcpPJ4DJZ5MGiD0/NqqzNvysohW78MzsX1ooVmpG4u2o+/k/wAiCq7vvgQvOCsSDXTljuUqmh9fOOukR9byTx3Ad9v8rpSq6VqWihMChX8+bw99Owk57qf5W1xj8L67qjfgGLytKbYBW4CVhJ7Q0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045901; c=relaxed/simple;
	bh=K5YJvILh/T2/AXiUbXLjAoXtjA1tomWJlegXmI3yHDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ucNodnYfx9feNTaP9lxcK9RoYmiYvMDBi7DKEh1nZmuD/zTlQFsGPfltRyNpkNZxWzV038SgKWca3xrl9cKI3IWYBCYxnA6dhXUv4Uto9d/77TQioFbDCQP7fRJ+p9ZA7fvsOdThiQwIwhYNS2SFl4X3r7CB1B6T/tOybY7RZoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLshIe7C; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLshIe7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752045898; x=1783581898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5YJvILh/T2/AXiUbXLjAoXtjA1tomWJlegXmI3yHDU=;
  b=OLshIe7C72P2/HrhC04V6m2KjsD0pZASK2ahqZMNL+SCOk2m5oR4g3Uz
   KTwjAvktYmvWw0PgME1XjTv4261QuMdGRH7fMioi7kaTRAVfZr11tN8wE
   w98cko1EWU0RiRpcQiPbhLV52473QtoJ29ibWycqBIL0TTu5zh5PZubU8
   w1J0VTVr6DsqOTQUlkChN0Twsn49zVG+tr9i0ZLhOV9TH9FEO5kZDNWBy
   Kq4VRV0m+DNedCNsIdZwYcCewk+hb9lNUU67gFX5oDCgtwvnPAvLocEAJ
   7HX8MsqgjH331iEn/XPZa9mJJ4F//J6ITsGiIWr+Jfn8pMsLisUXaYVkE
   A==;
X-CSE-ConnectionGUID: R+4ZWiiBTy+M57KOvCIUKw==
X-CSE-MsgGUID: DxxrWbyhSVaCe5W5O/DIJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58101372"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="58101372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 00:24:58 -0700
X-CSE-ConnectionGUID: Z6zYpAZIRziKQbwvo/1FPQ==
X-CSE-MsgGUID: 67fFTi5VTEeE0MBqAVHwXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156178599"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2025 00:24:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZPAk-0003Ed-1d;
	Wed, 09 Jul 2025 07:24:54 +0000
Date: Wed, 9 Jul 2025 15:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 27/27] net/core/scm.c:95:20:
 error: 'struct scm_fp_list' has no member named 'edges'
Message-ID: <202507091530.ZlFxk2na-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-05
head:   66e758f7d0c01a696c3a9db8929417e7403a1571
commit: 4b411fc4a343557c43670e69f045dcc77534374b [27/27] UPSTREAM: af_unix: Allocate struct unix_edge for each inflight AF_UNIX fd.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250709/202507091530.ZlFxk2na-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091530.ZlFxk2na-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091530.ZlFxk2na-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/scm.c: In function 'scm_fp_copy':
>> net/core/scm.c:95:20: error: 'struct scm_fp_list' has no member named 'edges'
      95 |                 fpl->edges = NULL;
         |                    ^~
   net/core/scm.c:96:36: error: 'struct scm_fp_list' has no member named 'vertices'
      96 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                    ^~
   net/core/scm.c: In function 'scm_fp_dup':
   net/core/scm.c:385:24: error: 'struct scm_fp_list' has no member named 'edges'
     385 |                 new_fpl->edges = NULL;
         |                        ^~
   net/core/scm.c:386:40: error: 'struct scm_fp_list' has no member named 'vertices'
     386 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                        ^~


vim +95 net/core/scm.c

    68	
    69	static int scm_fp_copy(struct cmsghdr *cmsg, struct scm_fp_list **fplp)
    70	{
    71		int *fdp = (int*)CMSG_DATA(cmsg);
    72		struct scm_fp_list *fpl = *fplp;
    73		struct file **fpp;
    74		int i, num;
    75	
    76		num = (cmsg->cmsg_len - sizeof(struct cmsghdr))/sizeof(int);
    77	
    78		if (num <= 0)
    79			return 0;
    80	
    81		if (num > SCM_MAX_FD)
    82			return -EINVAL;
    83	
    84		if (!fpl)
    85		{
    86			fpl = kmalloc(sizeof(struct scm_fp_list), GFP_KERNEL_ACCOUNT);
    87			if (!fpl)
    88				return -ENOMEM;
    89			*fplp = fpl;
    90			fpl->count = 0;
    91			fpl->count_unix = 0;
    92			fpl->max = SCM_MAX_FD;
    93			fpl->user = NULL;
    94	#if IS_ENABLED(CONFIG_UNIX)
  > 95			fpl->edges = NULL;
    96			INIT_LIST_HEAD(&fpl->vertices);
    97	#endif
    98		}
    99		fpp = &fpl->fp[fpl->count];
   100	
   101		if (fpl->count + num > fpl->max)
   102			return -EINVAL;
   103	
   104		/*
   105		 *	Verify the descriptors and increment the usage count.
   106		 */
   107	
   108		for (i=0; i< num; i++)
   109		{
   110			int fd = fdp[i];
   111			struct file *file;
   112	
   113			if (fd < 0 || !(file = fget_raw(fd)))
   114				return -EBADF;
   115			/* don't allow io_uring files */
   116			if (io_is_uring_fops(file)) {
   117				fput(file);
   118				return -EINVAL;
   119			}
   120			if (unix_get_socket(file))
   121				fpl->count_unix++;
   122	
   123			*fpp++ = file;
   124			fpl->count++;
   125		}
   126	
   127		if (!fpl->user)
   128			fpl->user = get_uid(current_user());
   129	
   130		return num;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
