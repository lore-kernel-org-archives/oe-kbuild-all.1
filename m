Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BE72A1AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756495941; cv=none; b=P3oeB4AFUTybtBCQ/H+O1XPkmJGqLgzNeJLuFG8oraMBR910UVtfpVJRK+zyvjITqIU7HKs2XJmUxBcBsOQrikU6OnW5B0A6+8Vrc9aa1Dkgz0K1CkX12N5MH2ZneKYMKbmBtzDLQmrv+Tz87p9ftXhhPp6OoiO11pZ0H9nsUZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756495941; c=relaxed/simple;
	bh=9rWByLhplQ1js5IuApynXBrRP+B5SnFyLQygpcweQTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KLU8iDZTeTgyXunBkXhrlEkKonpH/K14nnX/TqgYEGp3x1gc+bkc4Anx9eCjVqOjF3cKaYYcZ9aVj0e33d3Go9453s0Y6SkWyyl8uh5WRj+C8k/IN9jU5pQ6wHgE5LT1c17QHzH2C7Edd+KuAx7WqmJM+/g6f9jSDcUmEXwwvnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giZo/pdq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giZo/pdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756495941; x=1788031941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rWByLhplQ1js5IuApynXBrRP+B5SnFyLQygpcweQTM=;
  b=giZo/pdqLgn/PqKKdRiHzRKWdJnrCh9OFv3QTr69nKB6FX9g+50kL/kQ
   TrK8H6SkYnbUKC6kUKXzci79e6damxVPZZ/k35f7h53a11GUoqc53P+/b
   0w5ycouX0ZacIoZ/MJFEomGdnIWPIkm/5Cg5t8Fzp2MWZOHs7W7gFC2rg
   DhxbvhXkMyz6ucdpRR9/7d3TpH6dYc3m3i+jkepNni/iqnzzEUs++6to2
   VGxH+r3uGfWFJ9vBzj7rCiz1upYjP5fOclmdojDTqykqSS5S65xE7FNGC
   UZjS0Z3OqybwLixDVagBp+KgNni2j6hDNnydPB+hIMyKXA+lMHYvswP5I
   w==;
X-CSE-ConnectionGUID: wJ6pPWBfRmSHpG8mS84j7g==
X-CSE-MsgGUID: pxKqqqN2Ri+tHLkvQOaU+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69893167"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="69893167"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 12:32:17 -0700
X-CSE-ConnectionGUID: D/jxxk4eSUyuNxr3KhRwVQ==
X-CSE-MsgGUID: kRr1EY7YQr+aG1JA8Aseug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170624611"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Aug 2025 12:32:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us4pH-000UuX-0B;
	Fri, 29 Aug 2025 19:32:02 +0000
Date: Sat, 30 Aug 2025 03:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2790/2790] mm/mempolicy.c:1115:25: warning:
 variable 'vma' set but not used
Message-ID: <202508300319.Biz2ibcG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   18ca24a6500a925830b6e87fc4279a7456b57a4b
commit: dba69db9a5fc7c2c9c0cda0f32bb3b5f3d73ef93 [2790/2790] mm/damon/vaddr: Add demotion interface for migrating cold pages to target nodemask
config: arm64-randconfig-004-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300319.Biz2ibcG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300319.Biz2ibcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300319.Biz2ibcG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'migrate_area_to_node':
>> mm/mempolicy.c:1115:25: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
    1115 |  struct vm_area_struct *vma;
         |                         ^~~


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
