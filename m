Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEED31F0E55
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751212485; cv=none; b=dlBF6HkBIn7ZyjXfRUqNc/Y+yU9nIKaQQV+DMXf3MJudjoJdLndYR7YMuIeuEVx9NYIR3vCodh58HaaxIONb5boSFhdGoDLkrzq4xTVq4oG48g8buv7PcCyN9Aj6p7fFCtORmWDnPQTpE9E6TiVUFyUtTnqScfbL32FtVZzQJ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751212485; c=relaxed/simple;
	bh=of9s9NoFQl+a8TYiu1g2YDf9LfjdhUIF7u+FvTFWE3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyBg8zjt61m4ewYZ1yu29tpkl2DFOM4ksktVZJofgYxSKvfraoAzd/CsgtkBsYZT12xHUNrs2voxJpf5xm7OL3Ph09h9NIdX2YM3BmHOxdXf9R9KZCLBdBAbtoTC6xUXwRzrGCgx1mErPw1BkcN3RfCLLQUmFE/fBNBfhG5BxiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ln8PHlhg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ln8PHlhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751212483; x=1782748483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=of9s9NoFQl+a8TYiu1g2YDf9LfjdhUIF7u+FvTFWE3k=;
  b=Ln8PHlhg+rQFnXL399hBfKgQGVISCmLCSEvGNFYZ8XlcWdz1cJr5osBW
   LsPWBK6CLcb82A/qi+h52NXwpYNYFctXmaH7yFEHq7Xi27qpTVWM+wMYZ
   yavKS2Pu4lSfsPXG36WA1SQ2K9yiWeaiwEaKbXVPM5r0Zf/pgU+gCNJSp
   yCYnCrCWfv+JvN8Q4uAtx9+T2zrgltzxDrWD/5LtrqHyoTm68/bF107VW
   kXTzx+aDlTj8rjSGjHwuHjrbIk0GdYDlP6sgxBEApzLD3I8dcjb6mdpJc
   vxGQSyK36mTzhQlHpGumJLKcKxGXpmcAVqPcIkia975DYrJT9NReRVQs8
   Q==;
X-CSE-ConnectionGUID: TihgcOIoRf6h5VeUHY3qvw==
X-CSE-MsgGUID: ZUQw8+lSTtetIq6S5Vm4Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64046402"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="64046402"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 08:54:42 -0700
X-CSE-ConnectionGUID: OK1tMlEVQfWQwzKzc+F5zg==
X-CSE-MsgGUID: ZhNwwjIdQ9CHVFAdvrp6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="152865233"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jun 2025 08:54:41 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVuMY-0000wD-0c;
	Sun, 29 Jun 2025 15:54:38 +0000
Date: Sun, 29 Jun 2025 17:53:57 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2411/2411] mm/mempolicy.c:1115:32: warning:
 variable 'vma' set but not used
Message-ID: <202506291741.f76J7DJD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: dba69db9a5fc7c2c9c0cda0f32bb3b5f3d73ef93 [2411/2411] mm/damon/vaddr: Add demotion interface for migrating cold pages to target nodemask
config: x86_64-buildonly-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250629/202506291741.f76J7DJD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291741.f76J7DJD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506291741.f76J7DJD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'migrate_area_to_node':
>> mm/mempolicy.c:1115:32: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
    1115 |         struct vm_area_struct *vma;
         |                                ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


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
