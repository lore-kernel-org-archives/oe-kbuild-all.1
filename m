Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D73A2E92B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765376737; cv=none; b=K2qlkUj7RUKDnttk1yL5123o3JsF6vEW7Rf98EU9/a8Ona8l6f0JPvJ/e3oeasWRNwL+ZL64L1yiR4BlGgavwXC0kSncJAL23Xs6YLeuCHWFQGzvnwyBaTFNI9nVSy3QI9+DlZzcoRidCdC6GSaJVgLtBDapqmn32DmO8Kr30Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765376737; c=relaxed/simple;
	bh=ohIQ/6FvPTTVI3rEndjKFtQ5330W/LFemyW5eHSW1Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDsZHSQKaFON9Iejixn5AexaFe5Onv3TKJCjpwhE1ISGQptAEOgDzEqEaqCackMaLbCTrcM82efBj38YHwBB+SXNdPfnNV99S2txy4eobWXvq9aECu4iZhORzPb0xiSeptRfuPJTAsIOpXSKaQ6jst4eihZNJnXEDjqn4ZoLUSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbY7MkWu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbY7MkWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765376736; x=1796912736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ohIQ/6FvPTTVI3rEndjKFtQ5330W/LFemyW5eHSW1Rk=;
  b=MbY7MkWuJ5Xrn7KItzwTnihqowguzIaz2ToEsfwOZOeLaC6x8N4DrwWM
   SjPsprj44T4SpxhuvHWGbMBvPyNQLvgs6ZhvOnlm3W7NAfTkgvXXH3Beg
   vlFboAd3hVAIjHYWR/LabcBRX3lU4PosZVl7lgUdTPT/WlriR1dqMCivE
   5MgK6sByz6JPgOgdjxjXW/LnMZP1coFnfV4o2x1LmuvRpw6enwXJz74vF
   tQ8+BgTHoWMjN1CUAkeIFlN+g6LEAu91NhJi+LEpuY76wyYGXuQIXmYmY
   rpDnVuMZmNVe8Ck9tHTMnRzL+mdWqRZnesQE0gduQIJOfuB76TGU63vm7
   A==;
X-CSE-ConnectionGUID: AmB5S5QYRLy1+8Py1DwKZg==
X-CSE-MsgGUID: bO30bXpsS5qpLQMMA9jGnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67076776"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67076776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 06:25:22 -0800
X-CSE-ConnectionGUID: J5eYDH/VTB2jsm0dfuL0Rg==
X-CSE-MsgGUID: oEF8PqubQauRkBWhzWmyzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196810724"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Dec 2025 06:25:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTL82-000000003Gf-1Krv;
	Wed, 10 Dec 2025 14:25:18 +0000
Date: Wed, 10 Dec 2025 22:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Benjamin Coddington <bcodding@redhat.com>
Subject: fs/nfs/./nfs4trace.h:1539:1: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202512102249.0H1AhKrr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: b0b7cdc99431655aec3f3afcf05e3eeca0f8dd79 nfs: new tracepoint in match_stateid operation
date:   5 months ago
config: x86_64-randconfig-r134-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102249.0H1AhKrr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102249.0H1AhKrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102249.0H1AhKrr-lkp@intel.com/

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
