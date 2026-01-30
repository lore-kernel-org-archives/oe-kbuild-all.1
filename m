Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F142AEE4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769767072; cv=none; b=JsKT1eDlONhqUx+XkCblHFCRwNGvayPFjb40f0wWvkdI4o6ZHxojpfi7N1cRvwOVI/VGrB2HsLSuZOg++AL4g6P8TcvfWHwZNDfJOVSHdu3AlbQFJUpC40D4CZawV1Xk4RYBSXv0Kmeha6L+BfpZVEsOWDaHw0vrmK/8+oBjuqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769767072; c=relaxed/simple;
	bh=uB55hSwyVLXXXKUicpaXM5MYHuel6GNS97SP6rUNuIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cvLA82ACo0WW/xbK0O7kNLugENOL7jC46YSvE2e3o6IMxlq8QMqbvud0VDFKnzjxAVsrNUAwC7UjV3btBf2iN5m3zptQj0VhDb/URDT4SjHaJN4ZlfOHHGD2OL2eUd+IKtWIt/4sPLQ838QepIBVXe5FAM23gl1ZPxvObX45j2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9+hXmcN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9+hXmcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769767069; x=1801303069;
  h=date:from:to:cc:subject:message-id;
  bh=uB55hSwyVLXXXKUicpaXM5MYHuel6GNS97SP6rUNuIY=;
  b=i9+hXmcN6qkTUwgsLF0mGzCgvicuPYZaNXO5vwpA3NvzeUqGgHupg/Q3
   KxXgtzWCaQdH3LWPsQpqfRQzq6RmfrkW5JkSO880jIzvu57lwN4b31gCP
   hJ+3vcDkuT/T0wIAX43vWoBxnTNhRHQOmFuC36RMPwp06s4POaKIvgZ5W
   eVIqc5/AP20k0Ik2eVROD3z7Nly26Xl52/LYbTp4Ennv7LxKtfxhJlVNV
   /82QXcT9YjnSTREdK3sYLxcGR1hVZaB9PfjZO0meAb7tNvUUjgYpPXeQW
   PSI+DssmgS917AigqF/XU/000hqlVxWJ4cPFxEd6oEIpuJneimBRBoYUh
   g==;
X-CSE-ConnectionGUID: /4EWGghnTNaguq9Uzr+gBA==
X-CSE-MsgGUID: S/vdns4KQ6CdE4qfMrlyaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="93675703"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="93675703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 01:57:48 -0800
X-CSE-ConnectionGUID: 6jvK+CzMTueQUnVtDXZ6Sg==
X-CSE-MsgGUID: szhtVjYTSOW3+WnTG9pZYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="239541267"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 01:57:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vllG4-00000000cUG-2i8F;
	Fri, 30 Jan 2026 09:57:44 +0000
Date: Fri, 30 Jan 2026 17:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/5] fs/f2fs/checkpoint.c:95:67:
 error: expected ')' before 'return'
Message-ID: <202601301743.d6Nwl4vr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   6c41a3391b747e9a5e8c6fe63003d2a8157d2610
commit: ea581585794290038e10ac4f1343bb1f5013cc60 [1/5] f2fs: fix lock priority inversion issue
config: nios2-randconfig-r071-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301743.d6Nwl4vr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301743.d6Nwl4vr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301743.d6Nwl4vr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/f2fs/checkpoint.c: In function 'need_uplift_priority':
>> fs/f2fs/checkpoint.c:95:67: error: expected ')' before 'return'
      95 |         if (!(sem->sbi->adjust_lock_priority & BIT(sem->name - 1))
         |            ~                                                      ^
         |                                                                   )
      96 |                 return false;
         |                 ~~~~~~                                             
>> fs/f2fs/checkpoint.c:115:1: error: expected expression before '}' token
     115 | }
         | ^
>> fs/f2fs/checkpoint.c:115:1: warning: no return statement in function returning non-void [-Wreturn-type]


vim +95 fs/f2fs/checkpoint.c

    92	
    93	static bool need_uplift_priority(struct f2fs_rwsem *sem, bool is_write)
    94	{
  > 95		if (!(sem->sbi->adjust_lock_priority & BIT(sem->name - 1))
    96			return false;
    97	
    98		switch (sem->name) {
    99		/*
   100		 * writer is checkpoint which has high priority, let's just uplift
   101		 * priority for reader
   102		 */
   103		case LOCK_NAME_CP_RWSEM:
   104		case LOCK_NAME_NODE_CHANGE:
   105		case LOCK_NAME_NODE_WRITE:
   106			return !is_write;
   107		case LOCK_NAME_GC_LOCK:
   108		case LOCK_NAME_CP_GLOBAL:
   109		case LOCK_NAME_IO_RWSEM:
   110			return true;
   111		default:
   112			f2fs_bug_on(sem->sbi, 1);
   113		}
   114		return false;
 > 115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
