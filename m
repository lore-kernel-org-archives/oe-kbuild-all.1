Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0E383
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730842253; cv=none; b=sLvBj2u6ZuK9Vj9Dv66/I5f6OzQNvjSu4hHcJFliio/TWu1IbmgV24QJ/KU0FEakVv9fhtxxm19REZYWDwncU6zR/gl6yHiHQtKr+v6PRc23yIRhVVopvZjoAWkCDzv1uPLdpvAq2Qb2JWiSuNKE+LF8sf1Xzd6+biAd1FLHdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730842253; c=relaxed/simple;
	bh=ncS/Qx3r/eAS9xoMARqu53nYprMVbu1bmZSGVstUXBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgghR1nDS/Gtvbopm9/XSagY6ftWYGU5Bq5ap+Oap1wWfnRkFl18KgZqVNh2JRSl2ysS224RkmI3Ql5Xz870LYBXx8hFoOB7fVeYozmGI4yROC2zJoVDKt9CG+zbImQ0OO8XMNhYFOs6CM1gGG6u/KYKiVWWjk1reG/5c6vK8Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO/Oe/9N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO/Oe/9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730842252; x=1762378252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ncS/Qx3r/eAS9xoMARqu53nYprMVbu1bmZSGVstUXBk=;
  b=YO/Oe/9NFNPQOH34VYV7aSD9nsew/h39pA6GVuXbcjAv2G7ntYDFdBU2
   dUxp+AAECOBVKHNH6A6CiYM1twqjTWpUQuihIBfiLabimyQIelgSyiKv0
   VyDmYMD/oikgC3eUQ2NtlWn2xTjY6HCXDMn+lnLUztAvOZuGAg/SMxJQ4
   eDu/SGfgYX9Z+gkwtoyGmx1V/WHizeDYRHFAvM5IK1QgpVctgYngdSP1Y
   X1YjHoPL42WNUxrfSSNg9FGrnVYMNKq9UMpgk0DnzqdlcMu2mXqK8t+Oa
   bI88POrlSliaRaRO/YFL5OQB39GkX+XOMv7JsuIE8ASHm5W6hO/xaqiZ2
   w==;
X-CSE-ConnectionGUID: EnsT3OACTme5CDPOBnRZkQ==
X-CSE-MsgGUID: 4K82HfG9SAqPLePOGQIUvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42015748"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="42015748"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 13:30:52 -0800
X-CSE-ConnectionGUID: kA7INnyWSG2QTzE4dFg50w==
X-CSE-MsgGUID: jKWE/OyLSlKgDl2+Fb8bWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="107494389"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2024 13:30:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8R8R-000mUl-0U;
	Tue, 05 Nov 2024 21:30:47 +0000
Date: Wed, 6 Nov 2024 05:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 21/39] fs/nfs/./nfs4trace.h:975:1: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202411060547.VGf16vVq-lkp@intel.com>
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
commit: d7d079c200a4080868f14be2c429bb8a81f71f44 [21/39] nfs: new tracepoint in nfs_delegation_need_return
config: x86_64-randconfig-122-20241105 (https://download.01.org/0day-ci/archive/20241106/202411060547.VGf16vVq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060547.VGf16vVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060547.VGf16vVq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
>> fs/nfs/./nfs4trace.h:975:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:975:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:975:1: sparse:     got restricted fmode_t const [usertype] type
   fs/nfs/nfs4trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, fs/nfs/nfs4trace.h):
>> fs/nfs/./nfs4trace.h:975:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int fmode @@     got restricted fmode_t const [usertype] type @@
   fs/nfs/./nfs4trace.h:975:1: sparse:     expected unsigned int fmode
   fs/nfs/./nfs4trace.h:975:1: sparse:     got restricted fmode_t const [usertype] type

vim +975 fs/nfs/./nfs4trace.h

   962	
   963	#define show_delegation_flags(flags) \
   964		__print_flags(flags, "|", \
   965			{ BIT(NFS_DELEGATION_NEED_RECLAIM), "NEED_RECLAIM" }, \
   966			{ BIT(NFS_DELEGATION_RETURN), "RETURN" }, \
   967			{ BIT(NFS_DELEGATION_RETURN_IF_CLOSED), "RETURN_IF_CLOSED" }, \
   968			{ BIT(NFS_DELEGATION_REFERENCED), "REFERENCED" }, \
   969			{ BIT(NFS_DELEGATION_RETURNING), "RETURNING" }, \
   970			{ BIT(NFS_DELEGATION_REVOKED), "REVOKED" }, \
   971			{ BIT(NFS_DELEGATION_TEST_EXPIRED), "TEST_EXPIRED" }, \
   972			{ BIT(NFS_DELEGATION_INODE_FREEING), "INODE_FREEING" }, \
   973			{ BIT(NFS_DELEGATION_RETURN_DELAYED), "RETURN_DELAYED" })
   974	
 > 975	DECLARE_EVENT_CLASS(nfs4_delegation_event,
   976			TP_PROTO(
   977				const struct nfs_delegation *delegation
   978			),
   979	
   980			TP_ARGS(delegation),
   981	
   982			TP_STRUCT__entry(
   983				__field(u32, fhandle)
   984				__field(unsigned int, fmode)
   985				__field(unsigned long, flags)
   986			),
   987	
   988			TP_fast_assign(
   989				__entry->fhandle = nfs_fhandle_hash(NFS_FH(delegation->inode));
   990				__entry->fmode = delegation->type;
   991				__entry->flags = delegation->flags;
   992			),
   993	
   994			TP_printk(
   995				"fhandle=0x%08x fmode=%s flags=%s",
   996				__entry->fhandle, show_fs_fmode_flags(__entry->fmode),
   997				show_delegation_flags(__entry->flags)
   998			)
   999	);
  1000	#define DEFINE_NFS4_DELEGATION_EVENT(name) \
  1001		DEFINE_EVENT(nfs4_delegation_event, name, \
  1002				TP_PROTO( \
  1003					const struct nfs_delegation *delegation \
  1004				), \
  1005				TP_ARGS(delegation))
  1006	DEFINE_NFS4_DELEGATION_EVENT(nfs_delegation_need_return);
  1007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
