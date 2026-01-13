Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154BD3921D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308010; cv=none; b=rONVlG/qDFnGO2V2QM+m0r3PZSWPM1er6nmnlb6NG/Z+RBauZN9sct9D6072lGuLkz6IXdnPPxQXfGsVYiNQeqUSG67C/bzh/VCVWI9Z5kC1pRmjnEJvpJk8cukjZBSu33sAkrMXrBXatfzIjgCJ7WclO0+WRnXvPHhVy/qKWR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308010; c=relaxed/simple;
	bh=WoBtFfHEtZH1CZhRrQE1gfRRHzWSTg0yCDm4xRdhglc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GlZWFMXKXt8Hrq2ranOF06DTIZ4V2GFKLsbP5Fz4j/TKlkSO//AswrV91vpLNpf8U6MexPBBMTwIMYAU8PfLKn47y9G2EeWCJYaAspZIRilFPfQephtNMt36Am3XAXSvMtWr595jLuYTCyBun9bBvZt/bW6MBMZ1UJy9kf3JaKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNo7cSBv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNo7cSBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768308008; x=1799844008;
  h=date:from:to:cc:subject:message-id;
  bh=WoBtFfHEtZH1CZhRrQE1gfRRHzWSTg0yCDm4xRdhglc=;
  b=XNo7cSBvV86gKW8yIw6z1czQWWz4fJNqQnhDCMB7uLA04JkL7xf4hjhJ
   EqNwV3S+k57DcSpBpGrA8EAQk80bp94/VY+8G8iMQkatB29qjLa17BWAy
   EMpdXSB6S76U1zX3WSTKx1llAY22CaF+pAo90WjVn0zkum3XNGL6pVbCY
   GDTVE6wxzs2OVGTJxdvo5XdyQGVgG+5siQuzOSvVBn/OvForIEQodDX4I
   COqSn5SeZW2c9xezr72SCG2uNiVwmUZu5erONJAf34LvAgvWBAy+ULrDj
   cADkaloHL8hYpLdrk+3tAC+5rkgIDYB+8KViePhaoNE/Qm5J9RTzaU0He
   w==;
X-CSE-ConnectionGUID: lO26XKQFQ1GHMF/01wSrhA==
X-CSE-MsgGUID: VEXbFU6eRUCToSQaHe/fjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69748700"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69748700"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:40:05 -0800
X-CSE-ConnectionGUID: idwUakxKRNmdMOJikTv45Q==
X-CSE-MsgGUID: cF2R1/oRTqG6IJ9uIaCfqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203586131"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 04:40:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfdgl-00000000EkA-3F0K;
	Tue, 13 Jan 2026 12:39:59 +0000
Date: Tue, 13 Jan 2026 20:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Benjamin Coddington <bcodding@redhat.com>
Subject: fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202601132009.tngiJZwr-lkp@intel.com>
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
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132009.tngiJZwr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132009.tngiJZwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132009.tngiJZwr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
   fs/nfs/./nfs4trace.h:1002:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:1002:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:1002:1: sparse:     got restricted fmode_t const [usertype] type
   fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s1_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1539:1: sparse:     expected int s1_seq
   fs/nfs/./nfs4trace.h:1539:1: sparse:     got restricted __be32 const [usertype] seqid
>> fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s2_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1539:1: sparse:     expected int s2_seq
   fs/nfs/./nfs4trace.h:1539:1: sparse:     got restricted __be32 const [usertype] seqid
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
   fs/nfs/./nfs4trace.h:1002:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:1002:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:1002:1: sparse:     got restricted fmode_t const [usertype] type
   fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s1_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1539:1: sparse:     expected int s1_seq
   fs/nfs/./nfs4trace.h:1539:1: sparse:     got restricted __be32 const [usertype] seqid
>> fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s2_seq @@     got restricted __be32 const [usertype] seqid @@
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
