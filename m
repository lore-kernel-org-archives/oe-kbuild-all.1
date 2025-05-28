Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4931448E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 01:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748395016; cv=none; b=QHkyRiJ0tqXrtbTCPmphE1ltneJX6AMjedqQxWKRgYQYcob2GnnJRwt7X3SLGeXitMBWagESwVwBOKAFJItTj2yM/LjmlaV5k6xETfZsc1/+sBrq3O6CkFrdODLzudpTVao+Twwi2IFrrHW6Bu/SO83Oc4VXhYUaggnf1S6OTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748395016; c=relaxed/simple;
	bh=6niXiyYC0+B9D9CLZRVhnk4uN0z+Lthe2wJjASjAPeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RyWGC7Cnz9BrHG8V5eJWn5rq5kXhp8vcreuZkwwcDewT7qbJn0o9Te+KwcIAAlKddlOKoS9I8tImjKaYgc9pqwioe0DWCGEhPUyqyd+SBlr4FFOshXNt5/UUxWiqdVHPr46mUn3WnBBgBFU+1ZrBxRfKeOygSIcagAVe/KpG09o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTpoT5cv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTpoT5cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748395014; x=1779931014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6niXiyYC0+B9D9CLZRVhnk4uN0z+Lthe2wJjASjAPeA=;
  b=mTpoT5cvY7Pg5cKOYerZ4rUxvHyy2xvZBlWm9heUQWzxInaNsuIeRg97
   PE3bVoj6pCtC/9qXgD047gZCgMLhg7V8q3wrsSvDteqMFMGVmNhoptzNy
   UIm1a/HhKn7SLl6y+MKeESWiXJWrhHKuA3qrdstapcBYxIdjov/EA2/7b
   E3LJ/iPSqdtLRtmE/PeZ4/HoBgScIc0tQpxxILuVQMdvnbw9cfnIBzsEH
   jj9prH0hwl8TYng29hhThxj4x9PBZVWFDxeSdQg2RuhDQbm8xBmg9ejEt
   PsWFcFsJUUz0zslzW8+FvVtAYcpMiiBZ6rRGbl5GvNhsU12drYirxcwPM
   Q==;
X-CSE-ConnectionGUID: Jrd5Dt6xRNWn1gXvXzhgPw==
X-CSE-MsgGUID: UZBxa2WHQYuw/KpXLvaMrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50279354"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50279354"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 18:16:54 -0700
X-CSE-ConnectionGUID: /ioErUaATSqltf7Q+DagOg==
X-CSE-MsgGUID: 7rc7ncUXQyyTaXsievWZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142975270"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 May 2025 18:16:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK5PV-000V8r-02;
	Wed, 28 May 2025 01:16:49 +0000
Date: Wed, 28 May 2025 09:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/1] mm/workingset.c:198:6: warning:
 no previous prototype for 'unpack_shadow'
Message-ID: <202505280938.qhvS9NV3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   db710ea87c32d5f806ffaaccbf98ecd3108314e4
commit: 1a3bbc191000a8382db034c86dd4eef905327197 [0/1] ANDROID: mm: export unpack_shadow
config: i386-buildonly-randconfig-001-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280938.qhvS9NV3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280938.qhvS9NV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280938.qhvS9NV3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:198:6: warning: no previous prototype for 'unpack_shadow' [-Wmissing-prototypes]
     198 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         |      ^~~~~~~~~~~~~


vim +/unpack_shadow +198 mm/workingset.c

   197	
 > 198	void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
   199				  unsigned long *evictionp, bool *workingsetp)
   200	{
   201		unsigned long entry = xa_to_value(shadow);
   202		int memcgid, nid;
   203		bool workingset;
   204	
   205		workingset = entry & ((1UL << WORKINGSET_SHIFT) - 1);
   206		entry >>= WORKINGSET_SHIFT;
   207		nid = entry & ((1UL << NODES_SHIFT) - 1);
   208		entry >>= NODES_SHIFT;
   209		memcgid = entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
   210		entry >>= MEM_CGROUP_ID_SHIFT;
   211	
   212		*memcgidp = memcgid;
   213		*pgdat = NODE_DATA(nid);
   214		*evictionp = entry;
   215		*workingsetp = workingset;
   216	}
   217	EXPORT_SYMBOL_GPL(unpack_shadow);
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
