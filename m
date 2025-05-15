Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392422063FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326423; cv=none; b=BlUor+7Gm1AlpezgiJ8/mjiDSOC3bhYy4cZ0ypZ2S2rVZmateMMg/6W41ZkB5pbxAOweGthd3UTRIKKMxqwKZuCd45fgyi0zHpQ2OfGtlgRHPaeYem+2qLXGoLPJx2vPQJGxheLJcnrdr6+4GMlKeWw063MRqzFxxQIsXss+XvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326423; c=relaxed/simple;
	bh=1GObaDi0A8u0lALbpswZ0++LXvRQ9FrHU1PJRAFBNYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oRdEZg+5Z/vcVZ6F59upcDu3sludttIecVs5UBMH1bszbnHvkP7ane2syc4X5qggboizkx/TuhuiapEDF+XUW76KihSdPS07gPZTAypqN+4HKHwjBFiFruNzlb3J9mKkUqqLoacxla1T9oUzX7eJD5syQJP2KVGR18HX7D/tGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wi9qls6J; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wi9qls6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747326422; x=1778862422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GObaDi0A8u0lALbpswZ0++LXvRQ9FrHU1PJRAFBNYw=;
  b=Wi9qls6J0+Qs9RkRnhFsVqaNWabzlk/FADb99JjmgiaMHC8/BuTMCCPO
   iqjfjue0e5paw7tZ+Q6LueUEeX4+YSpHl9XdRtVy+cVxSk9uKPKuxD4r/
   p4TrxNClrEKU0kObwwD0uS/HOwGaJELMJ8Ow8zTt2rE48MHTHzEzNuiuT
   vf3K1ZWWxwS4MKTuLYLhuvW7L3txx1rqkuJKPeqRAx7cM76/N/fsLkp69
   kV1laXlXphGVrPqn39ruqL4Wvn+btezYbuzxhh2q1HTHaSQc8w2cDSpG/
   n+2E93gGyxnymZialT1YSpoCwS3itTykrZOT+0J+ZHdd2c67EA2Tw1fEU
   Q==;
X-CSE-ConnectionGUID: 5GzcYro2TpODA/vXh/xHyA==
X-CSE-MsgGUID: P5/Tjt/oSxeilySXOXC8eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48394977"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48394977"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 09:27:01 -0700
X-CSE-ConnectionGUID: j8QvPbYoQgq0eNgQuvwrdQ==
X-CSE-MsgGUID: 5i0pLYtxQbul1pQxZrodhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="175545306"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2025 09:27:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFbQA-000IYj-0c;
	Thu, 15 May 2025 16:26:58 +0000
Date: Fri, 16 May 2025 00:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 18/42] fs/nfs/./nfs4trace.h:1511:1: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202505160049.kFUWCtT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   1b39838959f608a975e3fe010d224b9ad39ed37c
commit: 88ade2213618a063c90df7947bf9f8eb8dd08c35 [18/42] nfs: new tracepoint in match_stateid operation
config: i386-randconfig-061-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160049.kFUWCtT3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160049.kFUWCtT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160049.kFUWCtT3-lkp@intel.com/

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
