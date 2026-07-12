Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46233A708
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 01:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783821091; cv=none; b=R0FXp8mOYQiG8NxMdnrg3C0IL5yQhqbmXKK+l8ER1q0IZIaw5uvHGmt2sWohQ3iUPjCUTKTuC93nqMxXh84hD3VEqMX6I8n+3fsreQkGJrJF0mxY15GroQ3V5X0tHuAdjPL4UzgIu0H4GuLLXMjaE8lzdSOuvyr+9QAKmDqaDcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783821091; c=relaxed/simple;
	bh=9aNzRU9ca+gNWteCba82EMTeV5NcPdqs6Jtoz2bM9go=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SquBck0ZXHuAqFCAKxgke9l5gQTCuV8CPD/+Q3LICQn64GWEIWbuK+1qKnz6r1pyNFmwo4WWUoU6vl8wRdOYlpMXf9qzjkQh8c9+fZFvyKk4zzrzBm98PCr745CFQ43OtiHKYjLOd4//BE73ieVmNpu65a6iwfDp0k2p9VRyzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkmUaDme; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkmUaDme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783821088; x=1815357088;
  h=date:from:to:cc:subject:message-id;
  bh=9aNzRU9ca+gNWteCba82EMTeV5NcPdqs6Jtoz2bM9go=;
  b=CkmUaDmeoM4/NM2cQaa6+/BUWknHHSB9gtSy4EHgR0yTuzPpT9bS1j2j
   4+i/fZkDN2/x8HoNLO1vBcoOceZEprUWDiP1BeKPcQHlvnBjcF6De/6m+
   OeDEMxnvcQJM10im0Ri+TiiLBF3SPpox6B9BDLL+19dgKJ3mwLrLopUH+
   rGONtztTrZh9R1oUcaI9JMcdP2AlPIfOChdSR9/btoCnFSNaRR+zRdVLu
   YZ3Ok36Bp60LvAx919Gn3o7Z/VAas2yAsbKr1fWxbbn0eMpu+tA70CFWv
   5bH4g6GfiEQJZL+jlg8Hn/4wEPpwJAtBG7kemflsh8OKYZMJVFcL85PKq
   w==;
X-CSE-ConnectionGUID: YcFK6aVBQEulPidiWqfyiQ==
X-CSE-MsgGUID: QKHTv7vMTbC9QWiTwBgurA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84256709"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84256709"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 18:51:27 -0700
X-CSE-ConnectionGUID: kr9WBoW0QsagzKnxc7HqrQ==
X-CSE-MsgGUID: oCH2iZ7DQd6Q/qLmzuGkrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251244441"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2026 18:51:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wijLg-00000000KaI-2ofB;
	Sun, 12 Jul 2026 01:51:16 +0000
Date: Sun, 12 Jul 2026 09:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [gourryinverse:scratch/gourry/cxl/compression/file_cleancache 85/98]
 mm/cram.c:165:14: sparse: sparse: incompatible types in comparison expression
 (different address spaces):
Message-ID: <202607120911.twqPgjfB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/compression/file_cleancache
head:   917ae95f0c6e29eaa695ff88d91f1ee1d8bc626d
commit: 9fb117618cd8a8687bae14185d28b33360452bd9 [85/98] mm/cram: core compressed-RAM tier API
config: x86_64-randconfig-r112-20260712 (https://download.01.org/0day-ci/archive/20260712/202607120911.twqPgjfB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120911.twqPgjfB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120911.twqPgjfB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/cram.c:165:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:165:14: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:165:14: sparse:    struct cram_node *
   mm/cram.c:217:41: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:217:41: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:217:41: sparse:    struct cram_node *
   mm/cram.c:803:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:803:9: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:803:9: sparse:    struct cram_node *
   mm/cram.c:893:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:893:9: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:893:9: sparse:    struct cram_node *
   mm/cram.c:146:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:146:14: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:146:14: sparse:    struct cram_node *
   mm/cram.c:146:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:146:14: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:146:14: sparse:    struct cram_node *
   mm/cram.c:146:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:146:14: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:146:14: sparse:    struct cram_node *
   mm/cram.c:146:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:146:14: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:146:14: sparse:    struct cram_node *
   mm/cram.c:146:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:146:14: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:146:14: sparse:    struct cram_node *
   mm/cram.c:146:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/cram.c:146:14: sparse:    struct cram_node [noderef] __rcu *
   mm/cram.c:146:14: sparse:    struct cram_node *

vim +165 mm/cram.c

   159	
   160	static void cram_set_migration_blocked(int nid, bool blocked)
   161	{
   162		struct cram_node *cn;
   163	
   164		rcu_read_lock();
 > 165		cn = rcu_dereference(cram_nodes[nid]);
   166		if (cn)
   167			WRITE_ONCE(cn->migration_blocked, blocked);
   168		rcu_read_unlock();
   169	}
   170	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
