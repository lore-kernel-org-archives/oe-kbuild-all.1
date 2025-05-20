Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92D927A447
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737988; cv=none; b=Vu87JON3MlvZmiz5YymQ/OzZH9dMWomNQXz0Z0/L5QCQ8dKKAqbwX50iStanYF59ccKRgz2oI6pPeA/JxGwhF41VmJqXQ9+hpT2aNBNRFR7Wv8+Sv9D9VRHTonwzeBfLtxku1mNQmIsp7h71kJ9GDyaxc7ESsakKI2v/njC8qJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737988; c=relaxed/simple;
	bh=GBnKVGMFJ2MjceBuTEPiAMFyd6VpRE997ddkj+7+XXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUIeQSKZPmGwJ0ggAErmOb1nlf43rOTmUR7FRVD9qVMgYgwoyWRVkKRdFTCMJzhOiBHL0YEc9Ar5lonASvbsFcwfZKeBReQ9G4aihYZQseZCQvJ4xZykGKZIi6btQai5Yv1uuwIYmnKnIGb2WKKsmKn3iN/C3PVkAO5vVodPDbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiuomRhg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiuomRhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737986; x=1779273986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GBnKVGMFJ2MjceBuTEPiAMFyd6VpRE997ddkj+7+XXk=;
  b=fiuomRhg8WLtx99njgZl9/RntKkw0gIn7lqAe1IsOlgArVmpoLsJKuIo
   e7hPSHTVw5RAccQ5BJsjvXM9gMKmGoEDdtASHdXHxKNFjogtDk/Pog01W
   qkTQeRXNOItRc03PQKGoValaAsgrApXnETRR9/6MvtH/qQNAS8EUTS4VP
   XiOYE7ug/pBA8rao6CZVBhfaeLakYSoBflZjUPIoCVaJxnXG5SuzwLQD5
   saxcp8/I1z0hAVJ5PE5TB1pwCLxUOsftkYD/qG/NYgdFaUAh7Y9aojcdC
   YQeWdc8D/mZhoI0HONbFSwPfkiEeegcSo3lihThHyZ2grVoC1FNBY9wCX
   A==;
X-CSE-ConnectionGUID: VEkliqDuQY+4eXec6EI8ww==
X-CSE-MsgGUID: Jwt5fXhaSnq9SLR1GCtwOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49820609"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49820609"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:46:25 -0700
X-CSE-ConnectionGUID: ykkt1JcdTiiT4E8Aq5bL6w==
X-CSE-MsgGUID: Npk4PzFFQTOMUIDqghrEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139377906"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 May 2025 03:46:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHKUH-000MT0-2Y;
	Tue, 20 May 2025 10:46:21 +0000
Date: Tue, 20 May 2025 18:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2257/2257] mm/mempolicy.c:1115:32: warning:
 variable 'vma' set but not used
Message-ID: <202505201856.VGaOEUgd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e69c6375f883badcc9ec4c9e9ed85660ac3fb1bf
commit: dba69db9a5fc7c2c9c0cda0f32bb3b5f3d73ef93 [2257/2257] mm/damon/vaddr: Add demotion interface for migrating cold pages to target nodemask
config: x86_64-buildonly-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201856.VGaOEUgd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201856.VGaOEUgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201856.VGaOEUgd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'migrate_area_to_node':
>> mm/mempolicy.c:1115:32: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
    1115 |         struct vm_area_struct *vma;
         |                                ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [y]:
   - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/vma +1115 mm/mempolicy.c

  1106	
  1107	/*
  1108	 * Migrate area pages from one node to a target node.
  1109	 * Returns error or the number of pages not migrated.
  1110	 */
  1111	static int migrate_area_to_node(struct mm_struct *mm, int source, int dest,
  1112				   unsigned long start, unsigned long end, int flags)
  1113	{
  1114		nodemask_t nmask;
> 1115		struct vm_area_struct *vma;
  1116		LIST_HEAD(pagelist);
  1117		int err = 0;
  1118		struct migration_target_control mtc = {
  1119			.nid = dest,
  1120			.gfp_mask = GFP_HIGHUSER_MOVABLE | __GFP_THISNODE,
  1121		};
  1122	
  1123		nodes_clear(nmask);
  1124		node_set(source, nmask);
  1125	
  1126		/*
  1127		 * This does not "check" the range but isolates all pages that
  1128		 * need migration.  Between passing in the full user address
  1129		 * space range and MPOL_MF_DISCONTIG_OK, this call can not fail.
  1130		 */
  1131		vma = find_vma(mm, 0);
  1132		VM_BUG_ON(!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)));
  1133		queue_pages_range(mm, start, end, &nmask,
  1134				flags | MPOL_MF_DISCONTIG_OK, &pagelist, false);
  1135	
  1136		if (!list_empty(&pagelist)) {
  1137			err = migrate_pages(&pagelist, alloc_migration_target, NULL,
  1138					(unsigned long)&mtc, MIGRATE_SYNC, MR_DAMON_DEMOTION, NULL);
  1139			if (err)
  1140				putback_movable_pages(&pagelist);
  1141		}
  1142	
  1143		return err;
  1144	}
  1145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
