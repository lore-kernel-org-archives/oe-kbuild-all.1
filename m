Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8136A21481B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320870; cv=none; b=Bf0D7zKvLP3ZlrlmX4jyxrVlF+7DthyDjHb0pP+IYZWkThQbefEST+NHxLPZ0+gkHlkh4iJ2cSwg1gbCfd0/suT41+cf91/ktdwipERR6f649kkFpgDnBtBVaz1EuqdmjuD6mqt0e17WG/8mwbhPeHOroFboc/rz4sqX+yP0p+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320870; c=relaxed/simple;
	bh=LGyOSSVK8cdHCZaJ6l+b1RBCyaPgi3DEHdJOxxvIeCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YArP6BUek2Hz7HdPRE0H6BEW5mWIH83bPVewQh+R1QBeQ0azMbCP4cyIyPJO2Ul1gibWZH+Zd4J34y8jOSoME7SOr0IjfFqCOmYZFvzq5uQT/8smuq/qVcXM5oOXYqqVbKi6H+dsTC3o9qq2ViuTBHvRJj2XCYfzi7bM5OWOCHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVsmhV1e; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVsmhV1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747320869; x=1778856869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGyOSSVK8cdHCZaJ6l+b1RBCyaPgi3DEHdJOxxvIeCM=;
  b=XVsmhV1elZFBq4IBcpR2HZ4H5igAuHHFIl/qBNQMzBrENf32wDPbtKMg
   636Gdz4U4hoKxwa5tQce0SsK9CZ4AD04kk7F7dW9520jElTSnREUjl8Q5
   RLruBMg5tIZqusrtU4LneIq7IwBrgt1gx/OOpy1+6tOwzmmTm0zAhdGWr
   Mu+xd5bVwOo97ihst16uFdLYb66dCG4khOjNYMDGLEA4cLQ5szMvZxUDw
   AnAnitESFnE4pKh2+90wIrQQpwWGpQl9tjKaxbGsfAbKrQYpUdxXv0vsM
   WuHK2ZOYnznKarK/XbdR1moVO0HwiYMx6xCOzhciluNVQ9iXuE+7/DVQS
   g==;
X-CSE-ConnectionGUID: Q4/LfApXRdCh4A7qDHz1BQ==
X-CSE-MsgGUID: Kkj3KaPaQXe56n1RNwG6ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60662275"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60662275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:53:52 -0700
X-CSE-ConnectionGUID: XvT+diCpT+Sdj7WlENSN2Q==
X-CSE-MsgGUID: cdK2wF42QP+jkj6eWHqOGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143508743"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 07:53:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZy0-000IT9-05;
	Thu, 15 May 2025 14:53:48 +0000
Date: Thu, 15 May 2025 22:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 17/42] fs/nfs/./nfs4trace.h:975:1: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202505152229.8Hsvxzua-lkp@intel.com>
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
commit: d78279b1dc484dc872d5f9edda513441ea1f0523 [17/42] nfs: new tracepoint in nfs_delegation_need_return
config: i386-randconfig-061-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152229.8Hsvxzua-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152229.8Hsvxzua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505152229.8Hsvxzua-lkp@intel.com/

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
