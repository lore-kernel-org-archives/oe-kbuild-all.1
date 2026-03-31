Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAFD3D4114
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948297; cv=none; b=hR4TXa0PXaYAGw9uaoyN5bSPAVzVes/HWoR1Yz/kGytPznnl2j8LtF+5fnzR6R2j3KnnSrbIbxPxeebB/lDjbAwoLwY4x7Sdi6jf1AZUKfzoaMAdPlvm0SSNbDM1i6c4VriEWuZzxMA8e3IN38TjZI7lv5JWct29Q2rF+pqLi5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948297; c=relaxed/simple;
	bh=RSRQIFWssdNCW0I4GWID8lkN8FPUS9pQxNa9An6Xkeg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SUEL5kjVgpdPwOvI4ATN4py30WwOKxSQ51aabu+f0+VnmRSTjo17WfW5pj8zkUVmdipLsudi2J5qgdLE3gXDBxhOVCV3EdwHCu3SPMdZiCiMT60u+FMLmlBTfkY6CFI/mSOJiL6/UnVYM9/Acuu4APawobQ0rNS7m1OngYP8K/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tqj4VfAD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tqj4VfAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774948296; x=1806484296;
  h=date:from:to:cc:subject:message-id;
  bh=RSRQIFWssdNCW0I4GWID8lkN8FPUS9pQxNa9An6Xkeg=;
  b=Tqj4VfAD0xiWyHBz8fTU4fGDrXzeA7/QEA5ACxy91Yna1a4mUUc9hhPY
   UwvrWxCyBspvVrAGRhVSTSDVso58tNNhWzjxoINprubggYNxhtu2it06g
   dgwDZB2yO7w1+tAKcZJgDO9FU9XJTLISXOOB+wiNeRZ6u20yG2e/+Oa/k
   Y775xt01wR6YuOA4rjJo+0zLJBoTL8fVRqy7bBaj4j3tn8wF66f+Py/Rw
   yRcJnBoW+Z6PxOQ+HHV/Ra/gpdWdvmlRnYylxg9RhKEqEzck9Eku0ghXc
   LwwM3lyElbLWw4tRNGyE8K4VSpSo27KaKnqxVZx11TqKE8llkOUi2ZuVo
   w==;
X-CSE-ConnectionGUID: gm/De0PMTuKJXuvB6qpYIg==
X-CSE-MsgGUID: 2mJsn4u3TnmPGxY2azRX/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76068453"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="76068453"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:11:35 -0700
X-CSE-ConnectionGUID: 7/jRwETcQvGa4X1eDG7z9Q==
X-CSE-MsgGUID: g3ddCow0T62mMN0DAaFz9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="219666181"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Mar 2026 02:11:34 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7V8G-000000002ST-14d5;
	Tue, 31 Mar 2026 09:11:32 +0000
Date: Tue, 31 Mar 2026 17:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-04 2/2]
 net/core/scm.c:95:24: error: no member named 'vertices' in 'struct
 scm_fp_list'
Message-ID: <202603311752.sZffzSwV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-04
head:   a01f4f3e3d4d93656a40a6739b171e98bd608766
commit: 9b0889c42a173c7b6a1891893f3d619166d37efa [2/2] UPSTREAM: af_unix: Allocate struct unix_vertex for each inflight AF_UNIX fd.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603311752.sZffzSwV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311752.sZffzSwV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311752.sZffzSwV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/scm.c:95:24: error: no member named 'vertices' in 'struct scm_fp_list'
      95 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                 ~~~  ^
   net/core/scm.c:384:28: error: no member named 'vertices' in 'struct scm_fp_list'
     384 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                 ~~~~~~~  ^
   2 errors generated.


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
  > 95			INIT_LIST_HEAD(&fpl->vertices);
    96	#endif
    97		}
    98		fpp = &fpl->fp[fpl->count];
    99	
   100		if (fpl->count + num > fpl->max)
   101			return -EINVAL;
   102	
   103		/*
   104		 *	Verify the descriptors and increment the usage count.
   105		 */
   106	
   107		for (i=0; i< num; i++)
   108		{
   109			int fd = fdp[i];
   110			struct file *file;
   111	
   112			if (fd < 0 || !(file = fget_raw(fd)))
   113				return -EBADF;
   114			/* don't allow io_uring files */
   115			if (io_is_uring_fops(file)) {
   116				fput(file);
   117				return -EINVAL;
   118			}
   119			if (unix_get_socket(file))
   120				fpl->count_unix++;
   121	
   122			*fpp++ = file;
   123			fpl->count++;
   124		}
   125	
   126		if (!fpl->user)
   127			fpl->user = get_uid(current_user());
   128	
   129		return num;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
