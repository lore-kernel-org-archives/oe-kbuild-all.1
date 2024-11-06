Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E0126C10
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854800; cv=none; b=n6+MnO6xgt/Xs4IDVN0ZF2bPzcwUyRDHhKv0/l4TaQ5AvxN0G3cmuc/wVgGK/TRqcmPYs7ZjmNToTtgVpmuk3fbjwr20q1EKEYAK8+43jidNfW9c7+blK1lR1DeuS1LwqVtnxYEBWlVpyIx1lp8uaueXauNG1uGWZU0wzScJdEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854800; c=relaxed/simple;
	bh=mLRJmQ9b8SAm8RUuWwpkLJWqk0ICOkauYYldqrUPlS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5oQVIfnzDWHJf5yUzxqUsk3wAoz1tVLUPGr5osmQFSG8J2st0qJAv8QIva7qU5317ujNhytybg13AAssswtTu2hf0+XynpRDmg0hcuedYSRS2cUYzP6dxdX2JLGvO/t3Lq/cgRnXbx/CrzWN9Ya1LQpjlfR+W9yz06sQaxTf/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZmwuOWQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZmwuOWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730854799; x=1762390799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mLRJmQ9b8SAm8RUuWwpkLJWqk0ICOkauYYldqrUPlS0=;
  b=ZZmwuOWQ0lW4j84aM0OD21hWPbMceHrEvesvpFYCus98epOuPa9OOZPN
   SKIT9FC5jM0O9DXRH+UhMweIx6KMDkkCI/rNodYlEHh8BxDfwsWXE23DG
   s/Viwtq5U/lkRBYAUOJlKEXxYYoDqF9Ydh+1gWNPJQiInWOdszDnREB9P
   B65TyjWtyJjgf2+5NxZuNiBaPp1LVY34HWzzROWPf0ebh/NX1/CPVJnLU
   QQHJhXuYJ9P6YOGZ9u+bkp5SkAQzutFlHTi/uBz6VJ7Y3edlXPySlBgoo
   QIeJXG4fD3ZCxRjaXrsvYx5NnDRSsti/BH0U1f5sBbvuPJcwgJvd0kw/4
   w==;
X-CSE-ConnectionGUID: 4yIfH1owT4KWx3sUE6IC0w==
X-CSE-MsgGUID: lsXv8DHiSKujDXdJeJRK/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30061063"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30061063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 16:59:58 -0800
X-CSE-ConnectionGUID: bMEyHr93RoSB8iopOCzG3g==
X-CSE-MsgGUID: EPkapaIpS52FmX+14mPo9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88803328"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2024 16:59:55 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8UOm-000mfl-24;
	Wed, 06 Nov 2024 00:59:52 +0000
Date: Wed, 6 Nov 2024 08:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 22/39] fs/nfs/./nfs4trace.h:1511:1: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202411060813.1fRAKN9Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   fcdfaef0f912fdab052bdc87ed835684f2427070
commit: b333aaae2e0b1480b42908f0f472de3d6c89576d [22/39] nfs: new tracepoint in match_stateid operation
config: x86_64-randconfig-122-20241105 (https://download.01.org/0day-ci/archive/20241106/202411060813.1fRAKN9Y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060813.1fRAKN9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060813.1fRAKN9Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
   fs/nfs/./nfs4trace.h:975:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:975:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:975:1: sparse:     got restricted fmode_t const [usertype] type
>> fs/nfs/./nfs4trace.h:1511:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s1_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1511:1: sparse:     expected int s1_seq
   fs/nfs/./nfs4trace.h:1511:1: sparse:     got restricted __be32 const [usertype] seqid
>> fs/nfs/./nfs4trace.h:1511:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s2_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1511:1: sparse:     expected int s2_seq
   fs/nfs/./nfs4trace.h:1511:1: sparse:     got restricted __be32 const [usertype] seqid
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
   fs/nfs/./nfs4trace.h:975:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:975:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:975:1: sparse:     got restricted fmode_t const [usertype] type
>> fs/nfs/./nfs4trace.h:1511:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s1_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1511:1: sparse:     expected int s1_seq
   fs/nfs/./nfs4trace.h:1511:1: sparse:     got restricted __be32 const [usertype] seqid
>> fs/nfs/./nfs4trace.h:1511:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected int s2_seq @@     got restricted __be32 const [usertype] seqid @@
   fs/nfs/./nfs4trace.h:1511:1: sparse:     expected int s2_seq
   fs/nfs/./nfs4trace.h:1511:1: sparse:     got restricted __be32 const [usertype] seqid

vim +1511 fs/nfs/./nfs4trace.h

  1499	
  1500	#define show_stateid_type(type) \
  1501		__print_symbolic(type, \
  1502			{ NFS4_INVALID_STATEID_TYPE, "INVALID" }, \
  1503			{ NFS4_SPECIAL_STATEID_TYPE, "SPECIAL" }, \
  1504			{ NFS4_OPEN_STATEID_TYPE, "OPEN" }, \
  1505			{ NFS4_LOCK_STATEID_TYPE, "LOCK" }, \
  1506			{ NFS4_DELEGATION_STATEID_TYPE, "DELEGATION" }, \
  1507			{ NFS4_LAYOUT_STATEID_TYPE, "LAYOUT" },	\
  1508			{ NFS4_PNFS_DS_STATEID_TYPE, "PNFS_DS" }, \
  1509			{ NFS4_REVOKED_STATEID_TYPE, "REVOKED" })
  1510	
> 1511	DECLARE_EVENT_CLASS(nfs4_match_stateid_event,
  1512			TP_PROTO(
  1513				const nfs4_stateid *s1,
  1514				const nfs4_stateid *s2
  1515			),
  1516	
  1517			TP_ARGS(s1, s2),
  1518	
  1519			TP_STRUCT__entry(
  1520				__field(int, s1_seq)
  1521				__field(int, s2_seq)
  1522				__field(u32, s1_hash)
  1523				__field(u32, s2_hash)
  1524				__field(int, s1_type)
  1525				__field(int, s2_type)
  1526			),
  1527	
  1528			TP_fast_assign(
  1529				__entry->s1_seq = s1->seqid;
  1530				__entry->s1_hash = nfs_stateid_hash(s1);
  1531				__entry->s1_type = s1->type;
  1532				__entry->s2_seq = s2->seqid;
  1533				__entry->s2_hash = nfs_stateid_hash(s2);
  1534				__entry->s2_type = s2->type;
  1535			),
  1536	
  1537			TP_printk(
  1538				"s1=%s:%x:%u s2=%s:%x:%u",
  1539				show_stateid_type(__entry->s1_type),
  1540				__entry->s1_hash, __entry->s1_seq,
  1541				show_stateid_type(__entry->s2_type),
  1542				__entry->s2_hash, __entry->s2_seq
  1543			)
  1544	);
  1545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
