Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D1A427A06
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688815; cv=none; b=uENAODaxI7J7mbiWFui6uJ8KJH6+IblDxX8EODqnZMze4d214LkPrCIxs9iubEw+ZdK5+AEJOikykg77V+0qcZbj/+Lg9b0/T0kXvRCe6tJ0AwC/BaNT0HTe7CbTEgqq5vLUeKt/p6Wd26FDxRcmlfvmNWh1yuZcB2IWpMLIDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688815; c=relaxed/simple;
	bh=kyhl3ls934ZNQW7tGXAUr84v4XMJHvfiZdBQAu291b8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TwkPYg9ma3tIeReFNEG0BqGydoeCXVXX85tv8WktloZFzSK/EAbKRBOJ+eW+JuTj3sUYgq3Tv48Y7Opv+22J2Sd0L6uxLvx8lG4lc1z6F7yYDl66y44Lnnd+nO+S0ZeSuPlWzc3KM++Txer1onLjjZw9vQzvNLgEvF4KI6sVBUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQZdb2Sm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQZdb2Sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783688814; x=1815224814;
  h=date:from:to:cc:subject:message-id;
  bh=kyhl3ls934ZNQW7tGXAUr84v4XMJHvfiZdBQAu291b8=;
  b=ZQZdb2SmGCnOEHAcJAeaBJn7vfFyijQV5OenbWGjNBhLYzGdDNai+mq0
   igiMKP2Tn2DbrkUfKeh3Bb4Xxcs4eJ3HFPr0Xt6PymRlkT+ohXtdz5GFt
   S8zr6VpaDAUFK+Ahe4cIZpkkqspVJvWbchuFFS/kDh3sRVSIs2B6tILbB
   ZLHrr/+ZMtSrLEQtQPg3Xg+BFf964zlwpk6nHqxwCxMlDLu2cfdo0Z6kj
   WPgYnyXvNuaHOVh78qapHYBXFxP6sGrnAHQM1XzQAtBiKuGkN3x58YbD5
   ZjyFgRfvI4+DzxC5Cp9RfvGOp89v7ZW48wz2WSUlocjJ0KVgYshB3WvEm
   A==;
X-CSE-ConnectionGUID: W5QAkurkTlK3vu9nX1arow==
X-CSE-MsgGUID: qhnJleIiR/2RzscDdbr4ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88298378"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88298378"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 06:06:53 -0700
X-CSE-ConnectionGUID: x8r93mItQduo9TUBELc49w==
X-CSE-MsgGUID: mMaLlKY7S6ibvZeEt5xz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259193019"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Jul 2026 06:06:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiAwK-00000000IvL-1jND;
	Fri, 10 Jul 2026 13:06:48 +0000
Date: Fri, 10 Jul 2026 21:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [gourryinverse:scratch/gourry/cxl/compression/file_cleancache 87/98]
 mm/internal.h:2091:24: error: 'RMAP_EXCLUSIVE' undeclared
Message-ID: <202607102026.lNxweRp8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/compression/file_cleancache
head:   bcd0bfca5b64d6cbb5aadb07554b9bd218e0df85
commit: 6e2dd58311ea13f03bd4c1f38bd1d4d5818803ce [87/98] mm/migrate: re-install migrated write-fenced folios read-only
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260710/202607102026.lNxweRp8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607102026.lNxweRp8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607102026.lNxweRp8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:54:
   mm/internal.h:2086:15: error: unknown type name 'rmap_t'; did you mean 'max_t'?
    2086 | static inline rmap_t migration_remap_rmap_flags(struct folio *folio,
         |               ^~~~~~
         |               max_t
   mm/internal.h: In function 'migration_remap_rmap_flags':
>> mm/internal.h:2091:24: error: 'RMAP_EXCLUSIVE' undeclared (first use in this function)
    2091 |                 return RMAP_EXCLUSIVE;
         |                        ^~~~~~~~~~~~~~
   mm/internal.h:2091:24: note: each undeclared identifier is reported only once for each function it appears in
>> mm/internal.h:2092:16: error: 'RMAP_NONE' undeclared (first use in this function); did you mean 'DMA_NONE'?
    2092 |         return RMAP_NONE;
         |                ^~~~~~~~~
         |                DMA_NONE
   mm/internal.h: At top level:
   mm/internal.h:2096:45: error: unknown type name 'rmap_t'; did you mean 'max_t'?
    2096 |                                             rmap_t rmap_flags)
         |                                             ^~~~~~
         |                                             max_t
--
   In file included from mm/folio-compat.c:12:
   mm/internal.h:2086:15: error: unknown type name 'rmap_t'; did you mean 'max_t'?
    2086 | static inline rmap_t migration_remap_rmap_flags(struct folio *folio,
         |               ^~~~~~
         |               max_t
   mm/internal.h: In function 'migration_remap_rmap_flags':
>> mm/internal.h:2091:24: error: 'RMAP_EXCLUSIVE' undeclared (first use in this function); did you mean 'WQ_FLAG_EXCLUSIVE'?
    2091 |                 return RMAP_EXCLUSIVE;
         |                        ^~~~~~~~~~~~~~
         |                        WQ_FLAG_EXCLUSIVE
   mm/internal.h:2091:24: note: each undeclared identifier is reported only once for each function it appears in
>> mm/internal.h:2092:16: error: 'RMAP_NONE' undeclared (first use in this function); did you mean 'DMA_NONE'?
    2092 |         return RMAP_NONE;
         |                ^~~~~~~~~
         |                DMA_NONE
   mm/internal.h: At top level:
   mm/internal.h:2096:45: error: unknown type name 'rmap_t'; did you mean 'max_t'?
    2096 |                                             rmap_t rmap_flags)
         |                                             ^~~~~~
         |                                             max_t


vim +/RMAP_EXCLUSIVE +2091 mm/internal.h

  2073	
  2074	/*
  2075	 * Resolve rmap flags and writability for a folio being re-installed present
  2076	 * after migration.  Shared by remove_migration_pte() and remove_migration_pmd().
  2077	 *
  2078	 * Exclusivity is the single lever.  Anon writability requires exclusive
  2079	 * ownership.  A writable migration entry is only ever made for an exclusive anon
  2080	 * page; see make_writable_migration_entry() and the VM_WARN in
  2081	 * try_to_migrate_one().  A folio that must stay read-only, one on a write-fenced
  2082	 * node, is kept non-exclusive here, and writability falls out as false.  The
  2083	 * next write then COW-promotes it off-node.  This also makes the "writable anon
  2084	 * implies exclusive" invariant structural rather than a tripwire.
  2085	 */
> 2086	static inline rmap_t migration_remap_rmap_flags(struct folio *folio,
  2087							bool was_read)
  2088	{
  2089		if (folio_test_anon(folio) && !was_read &&
  2090		    !node_write_fenced(folio_nid(folio)))
> 2091			return RMAP_EXCLUSIVE;
> 2092		return RMAP_NONE;
  2093	}
  2094	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
