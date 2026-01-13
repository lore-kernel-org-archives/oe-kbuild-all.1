Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDB83803FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293883; cv=none; b=RBrc44jwUQwdC1JZXPvUBLCUMuPUVWXCLjnjgt9U5wggL45c0r0maDEYJNYh7xBpk5YUWgG98onR6wpMUCWYsLT2IfCFS0Gxi731gRDqI+pSdIPE7us2BjmhSzn18T8saCzEuLY7oEcu4KeCfefGi+TqscND0IH/aSZlY0s4sD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293883; c=relaxed/simple;
	bh=+iHUlf/Yuzda3etCOYnZL4BqwDPvbv/BauDf5Rs98SM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qowfas7mictLkXxEpgoSrjgN3P+v2S2NuPStd3VdN3LGI3k8b3kLjv9iz5Xkg8YamxH5aYMlzm4xCb1CJIflTA8EbvU6AyM89gIwq7OCVRgX19swWkgKCqG6kUnlS3LaAyio8fwvmfOylRYVtFjJBx/thD5hXh828N3AhLowcGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwMvy+ZS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwMvy+ZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768293882; x=1799829882;
  h=date:from:to:cc:subject:message-id;
  bh=+iHUlf/Yuzda3etCOYnZL4BqwDPvbv/BauDf5Rs98SM=;
  b=mwMvy+ZSIC36TwRtahpvL63kTvRuWf2mbQEv2aGbWNoFvp1gbc1AONnr
   82VkFICIx7OIBOKM/Dae0a/zs6WfHfaFeUwnWYVTc8IzemBDBVxWNaKFM
   cfptizH1HVtAyn6j4g+wxRBIwNli4ytW0gVrpLOsfEfoiEQ1hGhqOAj7A
   Ls+mo6imhgCD2KwdWRfcoAeGwJmr8ffJOuJf2szzamH1DX7uXA46DDYo+
   GQXd/7Kk4uIhRUffbUMlBmWzkvdY9cCrfd9prUFnCS60P5QCZpiqbSCga
   /lXxNKLwRgw5mFqz6vrwlj9QvIFkuD/Z61F2HX7hHfOWbexPWNLP8kAc1
   Q==;
X-CSE-ConnectionGUID: yLSY8x4kRWKlD0CcdzmBZw==
X-CSE-MsgGUID: qXYeZa89RqWBhpeRAtSkZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69631637"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69631637"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:44:41 -0800
X-CSE-ConnectionGUID: bK+T+7ikTUetJuUFDI/Qmg==
X-CSE-MsgGUID: Ox9UXvJGQZmnAK0jqpwP3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204945114"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 00:44:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfa0y-00000000EU8-3Fau;
	Tue, 13 Jan 2026 08:44:36 +0000
Date: Tue, 13 Jan 2026 16:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Benjamin Coddington <bcodding@redhat.com>
Subject: fs/nfs/./nfs4trace.h:1002:1: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202601131618.0aUHfobK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 5dd03d14b3a9595ea320a55c499ebf85b422392f nfs: new tracepoint in nfs_delegation_need_return
date:   6 months ago
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131618.0aUHfobK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131618.0aUHfobK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131618.0aUHfobK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
>> fs/nfs/./nfs4trace.h:1002:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:1002:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:1002:1: sparse:     got restricted fmode_t const [usertype] type
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
>> fs/nfs/./nfs4trace.h:1002:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:1002:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:1002:1: sparse:     got restricted fmode_t const [usertype] type

vim +1002 fs/nfs/./nfs4trace.h

   989	
   990	#define show_delegation_flags(flags) \
   991		__print_flags(flags, "|", \
   992			{ BIT(NFS_DELEGATION_NEED_RECLAIM), "NEED_RECLAIM" }, \
   993			{ BIT(NFS_DELEGATION_RETURN), "RETURN" }, \
   994			{ BIT(NFS_DELEGATION_RETURN_IF_CLOSED), "RETURN_IF_CLOSED" }, \
   995			{ BIT(NFS_DELEGATION_REFERENCED), "REFERENCED" }, \
   996			{ BIT(NFS_DELEGATION_RETURNING), "RETURNING" }, \
   997			{ BIT(NFS_DELEGATION_REVOKED), "REVOKED" }, \
   998			{ BIT(NFS_DELEGATION_TEST_EXPIRED), "TEST_EXPIRED" }, \
   999			{ BIT(NFS_DELEGATION_INODE_FREEING), "INODE_FREEING" }, \
  1000			{ BIT(NFS_DELEGATION_RETURN_DELAYED), "RETURN_DELAYED" })
  1001	
> 1002	DECLARE_EVENT_CLASS(nfs4_delegation_event,
  1003			TP_PROTO(
  1004				const struct nfs_delegation *delegation
  1005			),
  1006	
  1007			TP_ARGS(delegation),
  1008	
  1009			TP_STRUCT__entry(
  1010				__field(u32, fhandle)
  1011				__field(unsigned int, fmode)
  1012				__field(unsigned long, flags)
  1013			),
  1014	
  1015			TP_fast_assign(
  1016				__entry->fhandle = nfs_fhandle_hash(NFS_FH(delegation->inode));
  1017				__entry->fmode = delegation->type;
  1018				__entry->flags = delegation->flags;
  1019			),
  1020	
  1021			TP_printk(
  1022				"fhandle=0x%08x fmode=%s flags=%s",
  1023				__entry->fhandle, show_fs_fmode_flags(__entry->fmode),
  1024				show_delegation_flags(__entry->flags)
  1025			)
  1026	);
  1027	#define DEFINE_NFS4_DELEGATION_EVENT(name) \
  1028		DEFINE_EVENT(nfs4_delegation_event, name, \
  1029				TP_PROTO( \
  1030					const struct nfs_delegation *delegation \
  1031				), \
  1032				TP_ARGS(delegation))
  1033	DEFINE_NFS4_DELEGATION_EVENT(nfs_delegation_need_return);
  1034	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
