Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1683019DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768283973; cv=none; b=aB0LXgyAQxpPTrVf9GMxTxWX8twGYTEf9rRp9QKpKbt4r5NsGio0NWzMvdozE5x3pZnimzbuG22hQKv1oYRd1Kqnot6zIbipC2En1s6gY1QoqTm6SS/0RAJaUOvm2YQ20yk9hkEfA7kU5mOv5yiunE9qNhFf7c6VhogH9Td8dTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768283973; c=relaxed/simple;
	bh=Tj+QShmIJajzliMz1ATrmDLmsM2685rSsFtz/9shhtY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XHSkZEm8SbnHFr9t54+wGxNkIFYTAMl3mLjsF04Tzuf5K9wI5yyQTF9ZsLk6ErlbCUiLkNF1epuKqp9z7rQXP3e4stqUUdUkZqbYMvafMXC1NejL//UfCFOoas3gcPZDObO6Ni2TudLKpDVU5X20/dHYd7FVdDZMio1NLjuAlXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmwbNYmg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmwbNYmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768283971; x=1799819971;
  h=date:from:to:cc:subject:message-id;
  bh=Tj+QShmIJajzliMz1ATrmDLmsM2685rSsFtz/9shhtY=;
  b=UmwbNYmgOsDuEQrTY2wCCjM7WF3AJ3gqo23e2WW8Y/QhsxpftKn8fXax
   ApMXGv/G82E48wBrIiAJyT/7RZxua1l6D8lwR4WGBBojer2ALcYE50bXx
   9xRv2DVI+UdE8v7Uphg+0imdQk4FvEBqXhl25olH+KTdbWKIX+SifQ1GT
   +KQRtZYe468VTaz+hUT09njza2mAkIh0ZJMUu8x+dT+PXIzmhfmGCBe3h
   jamDC2pfJwKQGw4XXPiN1UfRXFr+26MC+SIB9rp26eRK1beLizbcRabX1
   8yp4Gi0KgEAQCPl2JVACSvCyTsFvDaUfgYRFQnIjoGSr4cYZbZpm/gCsv
   g==;
X-CSE-ConnectionGUID: F0NdZQrfR3yPtScHRb4sQA==
X-CSE-MsgGUID: mUsB4cUySXaXg24mQIZYow==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80207526"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80207526"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:59:30 -0800
X-CSE-ConnectionGUID: YxAEy7q2Tpa57u9o+PITcw==
X-CSE-MsgGUID: uCOosI2jTCCBTUTBaudDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235001145"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2026 21:59:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfXR7-00000000EIs-1dEF;
	Tue, 13 Jan 2026 05:59:25 +0000
Date: Tue, 13 Jan 2026 13:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Benjamin Coddington <bcodding@redhat.com>
Subject: fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202601131308.QGmmnBXg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: b0b7cdc99431655aec3f3afcf05e3eeca0f8dd79 nfs: new tracepoint in match_stateid operation
date:   6 months ago
config: x86_64-randconfig-r121-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131308.QGmmnBXg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131308.QGmmnBXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131308.QGmmnBXg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
   fs/nfs/./nfs4trace.h:1002:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:1002:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:1002:1: sparse:     got restricted fmode_t const [usertype] type
>> fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s1_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1539:1: sparse:     expected int s1_seq
   fs/nfs/./nfs4trace.h:1539:1: sparse:     got restricted __be32 const [usertype] seqid
   fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s2_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1539:1: sparse:     expected int s2_seq
   fs/nfs/./nfs4trace.h:1539:1: sparse:     got restricted __be32 const [usertype] seqid
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
   fs/nfs/./nfs4trace.h:1002:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:1002:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:1002:1: sparse:     got restricted fmode_t const [usertype] type
>> fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s1_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1539:1: sparse:     expected int s1_seq
   fs/nfs/./nfs4trace.h:1539:1: sparse:     got restricted __be32 const [usertype] seqid
   fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s2_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1539:1: sparse:     expected int s2_seq
   fs/nfs/./nfs4trace.h:1539:1: sparse:     got restricted __be32 const [usertype] seqid

vim +1539 fs/nfs/./nfs4trace.h

  1526	
  1527	#define show_stateid_type(type) \
  1528		__print_symbolic(type, \
  1529			{ NFS4_INVALID_STATEID_TYPE,	"INVALID" }, \
  1530			{ NFS4_SPECIAL_STATEID_TYPE,	"SPECIAL" }, \
  1531			{ NFS4_OPEN_STATEID_TYPE,	"OPEN" }, \
  1532			{ NFS4_LOCK_STATEID_TYPE,	"LOCK" }, \
  1533			{ NFS4_DELEGATION_STATEID_TYPE,	"DELEGATION" }, \
  1534			{ NFS4_LAYOUT_STATEID_TYPE,	"LAYOUT" },	\
  1535			{ NFS4_PNFS_DS_STATEID_TYPE,	"PNFS_DS" }, \
  1536			{ NFS4_REVOKED_STATEID_TYPE,	"REVOKED" }, \
  1537			{ NFS4_FREED_STATEID_TYPE,	"FREED" })
  1538	
> 1539	DECLARE_EVENT_CLASS(nfs4_match_stateid_event,
  1540			TP_PROTO(
  1541				const nfs4_stateid *s1,
  1542				const nfs4_stateid *s2
  1543			),
  1544	
  1545			TP_ARGS(s1, s2),
  1546	
  1547			TP_STRUCT__entry(
  1548				__field(int, s1_seq)
  1549				__field(int, s2_seq)
  1550				__field(u32, s1_hash)
  1551				__field(u32, s2_hash)
  1552				__field(int, s1_type)
  1553				__field(int, s2_type)
  1554			),
  1555	
  1556			TP_fast_assign(
  1557				__entry->s1_seq = s1->seqid;
  1558				__entry->s1_hash = nfs_stateid_hash(s1);
  1559				__entry->s1_type = s1->type;
  1560				__entry->s2_seq = s2->seqid;
  1561				__entry->s2_hash = nfs_stateid_hash(s2);
  1562				__entry->s2_type = s2->type;
  1563			),
  1564	
  1565			TP_printk(
  1566				"s1=%s:%x:%u s2=%s:%x:%u",
  1567				show_stateid_type(__entry->s1_type),
  1568				__entry->s1_hash, __entry->s1_seq,
  1569				show_stateid_type(__entry->s2_type),
  1570				__entry->s2_hash, __entry->s2_seq
  1571			)
  1572	);
  1573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
