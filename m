Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C782264A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765405263; cv=none; b=dfMsKFklkCm+lTXuW7LzyQi1ottxJMrBhJ3zNgCamh4+yvm+vJugExXDoiv/d78tjUBZlkIe3aMvpm65IXlwmqGcCpWaCzum2uhDr7OGZb/xu20z+m2XSoPdswg2yRUtlDXNIqKNiDS+cthB/VcP87nGcl17bqIp6T1Us7syXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765405263; c=relaxed/simple;
	bh=KSB0bJF2DOXHRsBy/amVHXA9ZrJlsBg+mLW39rGHgYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oFq08RIR8dUN2dHgsUgBJwLDF1cFduvTJU4EMW1h8Nj5hr2lkWrI2ZbuEyCR+9LphWwWCyKBdD0K/q5/ICzGWJAZ6eFqpbHGQ/8GtfkNJLiTp5pFDafKOabV4bsf7CXz7YQp/w9z/2QRo7OLukyVDK2otsQzzEKVuXanEGEqTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXPHJKSI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXPHJKSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765405262; x=1796941262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KSB0bJF2DOXHRsBy/amVHXA9ZrJlsBg+mLW39rGHgYo=;
  b=nXPHJKSIGUod77XGMZJ47eB+kyCEOSka+89yLqA+OkNZcBFX68I1A8Jv
   8wdPGod6nxuthr9kyMHK7keNAuucV6QygyreG6P6L9i4iUoLJtCuHe7Q9
   xrJVRC35smUaElPA2ctk9sRof8a/5ALDAqX4Gjr8v9VQbknITBc2YAiif
   m9Ls/wMmx/fm5Wet4WKZA2w6AlL37x8Pn8kGgPuCzjDQlfnvQ79nl+7fC
   3/SoXhV31MPW/aXKPT5OMcgwHjS/YgYcO5BWsSEItpudFU4/JQkw8CRpq
   GMAE8mFRk6MvVZ7BnTQ7aJTyN8IM8ePQmr7sbgvagg8GhYcIGfxcwVYUC
   A==;
X-CSE-ConnectionGUID: wta+EQP2TauoxV9ELtTzlA==
X-CSE-MsgGUID: 0i/CaaVaTpammzexvfzf3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67422936"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67422936"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:21:01 -0800
X-CSE-ConnectionGUID: urXu97roRjCHJTojtbglEg==
X-CSE-MsgGUID: wmkaB4YcTXmM7GDyYPUQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196630556"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 14:20:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTSYK-000000003pX-3xhJ;
	Wed, 10 Dec 2025 22:20:56 +0000
Date: Thu, 11 Dec 2025 06:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Benjamin Coddington <bcodding@redhat.com>
Subject: fs/nfs/./nfs4trace.h:1002:1: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202512110651.MRznYgXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: 5dd03d14b3a9595ea320a55c499ebf85b422392f nfs: new tracepoint in nfs_delegation_need_return
date:   5 months ago
config: x86_64-randconfig-r111-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110651.MRznYgXw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110651.MRznYgXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110651.MRznYgXw-lkp@intel.com/

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
