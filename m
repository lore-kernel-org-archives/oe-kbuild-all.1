Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723BB15920A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748051; cv=none; b=tixbaXOavCUWbbsBcDBrYE6Vw8wX5bOymbCPDLbrw4eqgyGrad9KKce+Nzmn2m4aTRBj/xvMIZnTGyrmWudQLMhMs8GD3oG+/KGVwNr/oVXo62SJ9iU/i6DNqq4FETxGTzgWk24sOLNElren6w1iqJHmbl0GMoYglc9DLDR6g30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748051; c=relaxed/simple;
	bh=FKn7PgND5rGGwI/4akWjImYaKBgiFus2TZRfQo5e944=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3OrwIzPRwMvDV1Ho1x3bhRxVfidxPi/XYPYRFb0A7jonzh/oqM2AF7UFMavhWyJ7Gv8o07wKspUlI2d+HbAzmOR8rGEtEgFC48QMp1c+krvO8Z0gAh5wIK8pi04THu/eO5BAOss3PM7AzZSghT7pCdhkpe5CsoB1YiW+ZoOa+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMfSCFiD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMfSCFiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712748048; x=1744284048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKn7PgND5rGGwI/4akWjImYaKBgiFus2TZRfQo5e944=;
  b=NMfSCFiDVLb+iwocq03FPWXrFP4jyHjCu9G7yXVoXHzFjqutPVvueUQw
   DUwipHuZivfqwpxM0AYoRVzuLn6Ex/7ip6FFMA+LsYsXC+CEa0rnTSqgD
   f+NK4sc0Ja+ML9Ir9dQfzLUPdAQ8Ps+ZdyFNJvYHV67AMxthrs5jV6FPR
   hmWS0ErYIq9RyilCBnVi7f/KykLKX4ICfCyHY9Hwk7FyRzbaIgJglgpPP
   UDQ/jTmKMYEQlg9vTUiMhjkTkB6JIg9hkER4AkFZy4MxObS517hKNlqLv
   /nhHqXtjf/HJW+HAsyNg2+blG5YcyrYYBZ707OiegIhPvBD4d4sFQ9yuj
   w==;
X-CSE-ConnectionGUID: Yo7rMepmRumxGxnE+1TzZA==
X-CSE-MsgGUID: ydz1gndsR8SNpPiQsL0BBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11875402"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11875402"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 04:20:48 -0700
X-CSE-ConnectionGUID: bH34l1eVT3atwb5qVQMccQ==
X-CSE-MsgGUID: J0AjhpQ8QzKotpmPE7lmrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20557228"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2024 04:20:46 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruW0S-0007Fi-2A;
	Wed, 10 Apr 2024 11:20:44 +0000
Date: Wed, 10 Apr 2024 19:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/5] mm/memcontrol.c:6704:16: warning:
 cast from pointer to integer of different size
Message-ID: <202404101937.YjpBQNgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   3495060dfd68a14db35e29e08714cb4d8fd4035f
commit: d34a387d279e79b7210825fcebe279b2790d36d2 [4/5] mm: memcg: merge multiple page_counters into a single structure
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240410/202404101937.YjpBQNgy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101937.YjpBQNgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101937.YjpBQNgy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c: In function 'memory_peak_read':
>> mm/memcontrol.c:6704:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    6704 |         return (u64)memcg->memory.watermark * PAGE_SIZE;
         |                ^
   mm/memcontrol.c: In function 'swap_peak_read':
   mm/memcontrol.c:8034:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    8034 |         return (u64)memcg->memory.watermark * PAGE_SIZE;
         |                ^
--
   mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_read_u64':
>> mm/hugetlb_cgroup.c:501:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     501 |                 return (u64)&h_cg->res.max[counter_idx(idx, false)] * PAGE_SIZE;
         |                        ^
   mm/hugetlb_cgroup.c:503:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     503 |                 return (u64)&h_cg->res.max[counter_idx(idx, true)] * PAGE_SIZE;
         |                        ^
   mm/hugetlb_cgroup.c:505:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     505 |                 return (u64)&h_cg->res.watermark[counter_idx(idx, false)] * PAGE_SIZE;
         |                        ^
   mm/hugetlb_cgroup.c:507:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     507 |                 return (u64)&h_cg->res.watermark[counter_idx(idx, true)] * PAGE_SIZE;
         |                        ^
   mm/hugetlb_cgroup.c:509:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     509 |                 return (u64)&h_cg->res.failcnt[counter_idx(idx, false)];
         |                        ^
   mm/hugetlb_cgroup.c:511:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     511 |                 return (u64)&h_cg->res.failcnt[counter_idx(idx, true)];
         |                        ^


vim +6704 mm/memcontrol.c

241994ed8649f7 Johannes Weiner   2015-02-11  6698  
8e20d4b332660a Ganesan Rajagopal 2022-05-13  6699  static u64 memory_peak_read(struct cgroup_subsys_state *css,
8e20d4b332660a Ganesan Rajagopal 2022-05-13  6700  			    struct cftype *cft)
8e20d4b332660a Ganesan Rajagopal 2022-05-13  6701  {
8e20d4b332660a Ganesan Rajagopal 2022-05-13  6702  	struct mem_cgroup *memcg = mem_cgroup_from_css(css);
8e20d4b332660a Ganesan Rajagopal 2022-05-13  6703  
8e20d4b332660a Ganesan Rajagopal 2022-05-13 @6704  	return (u64)memcg->memory.watermark * PAGE_SIZE;
8e20d4b332660a Ganesan Rajagopal 2022-05-13  6705  }
8e20d4b332660a Ganesan Rajagopal 2022-05-13  6706  

:::::: The code at line 6704 was first introduced by commit
:::::: 8e20d4b332660a32e842e20c34cfc3b3456bc6dc mm/memcontrol: export memcg->watermark via sysfs for v2 memcg

:::::: TO: Ganesan Rajagopal <rganesan@arista.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
