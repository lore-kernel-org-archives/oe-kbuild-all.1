Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D561113B5AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676431; cv=none; b=OzWiQPe40KiFGKj0rQ8jFxGJKqGq+DPE0uneFoZuE+LxQag71rA595eEgB60lyoJQ1fa2wc7nfhrxliW0lWXfX8LJTDyN2bzgg5EOCiFlj5TPbqm/Lct34gJSruP0qOez83Qx5r85aRJ2yQWrN4DMKlbnLJEKsjoBl6nMyeVLyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676431; c=relaxed/simple;
	bh=qU1gtqrUvX7LRDGJOuvbbbgr1NiSocf/C+0FqRFvUxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MuOpOgLj9ReVxno2Wl3GtigkiCg5ZaywzzdLVeT8mN+b/iEs7mCWeT75L2TpjpvRs2gDhZb/4K5TWfSuqr1rWUrpuO2wrhVLqNbUS5g/EDPiuXzNTGchZXr6DWqAw7PuVfCZIVvonSzazlONZDSR1F2bl/McWzyzlWARujy/cBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZKd1HLX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZKd1HLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734676430; x=1766212430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qU1gtqrUvX7LRDGJOuvbbbgr1NiSocf/C+0FqRFvUxQ=;
  b=YZKd1HLXkcAyu+FOAOa3UtCM46goXmr+0bqgRaY9ole36F2kpyFZUrPr
   FZrRh8HIV0uq2JGB5bS2tViDnq5zM7ZGZNOgmLNdHiT3qHykjGY8Tk2In
   Ip64gDQrwaJI42GbAmt3CEJAUFs9D++PTQH2zJgcjKnfSl/D1wauw4rBp
   0qAKsnwaZNX0tqpWvNLmYXwWvL4T2fzzpK8Mi4tZzG22OYkFD1l9VxBYw
   WGg1GAl98stPi8TtylJOkYOflrF7WZTxezIueH/2WtI/3gCzByt7PtONS
   IkSyKlAw9vakc1ZkFHuvO7g/cKqMAJTYAxdpO7AyWsW5CoOy8t2PjFsZI
   w==;
X-CSE-ConnectionGUID: mYhVwGBoSeKlx7rbqnzaXA==
X-CSE-MsgGUID: 09L/LzC/TNCWTuwVNPIGOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="39001791"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="39001791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 22:33:49 -0800
X-CSE-ConnectionGUID: rn0vf91IQa2fln43kgCU8g==
X-CSE-MsgGUID: MUOMdAiyS92km9MVwDfdNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="98259403"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Dec 2024 22:33:48 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOWa1-0000ul-2N;
	Fri, 20 Dec 2024 06:33:45 +0000
Date: Fri, 20 Dec 2024 14:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Austin Zheng <Austin.Zheng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Subject: [linux-next:master 4214/5236]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:183:58:
 warning: arithmetic between enumeration type 'enum dentist_divider_range'
 and floating-point type 'double'
Message-ID: <202412201434.Bq1kzteG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8503810115fbff903f626adc0788daa048302bc0
commit: be4e3509314af751f08677f428f93c306aaa2f8e [4214/5236] drm/amd/display: DML21 Reintegration For Various Fixes
config: x86_64-randconfig-161-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201434.Bq1kzteG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201434.Bq1kzteG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201434.Bq1kzteG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:5:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h:8:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h:8:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/inc/dml2_external_lib_deps.h:8:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:31:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:183:58: warning: arithmetic between enumeration type 'enum dentist_divider_range' and floating-point type 'double' [-Wenum-float-conversion]
     183 |         divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +183 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c

   153	
   154	static bool add_margin_and_round_to_dfs_grainularity(double clock_khz, double margin, unsigned long vco_freq_khz, unsigned long *rounded_khz, uint32_t *divider_id)
   155	{
   156		enum dentist_divider_range {
   157			DFS_DIVIDER_RANGE_1_START = 8, /* 2.00 */
   158			DFS_DIVIDER_RANGE_1_STEP = 1, /* 0.25 */
   159			DFS_DIVIDER_RANGE_2_START = 64, /* 16.00 */
   160			DFS_DIVIDER_RANGE_2_STEP = 2, /* 0.50 */
   161			DFS_DIVIDER_RANGE_3_START = 128, /* 32.00 */
   162			DFS_DIVIDER_RANGE_3_STEP = 4, /* 1.00 */
   163			DFS_DIVIDER_RANGE_4_START = 248, /* 62.00 */
   164			DFS_DIVIDER_RANGE_4_STEP = 264, /* 66.00 */
   165			DFS_DIVIDER_RANGE_SCALE_FACTOR = 4
   166		};
   167	
   168		enum DFS_base_divider_id {
   169			DFS_BASE_DID_1 = 0x08,
   170			DFS_BASE_DID_2 = 0x40,
   171			DFS_BASE_DID_3 = 0x60,
   172			DFS_BASE_DID_4 = 0x7e,
   173			DFS_MAX_DID = 0x7f
   174		};
   175	
   176		unsigned int divider;
   177	
   178		if (clock_khz < 1 || vco_freq_khz < 1 || clock_khz > vco_freq_khz)
   179			return false;
   180	
   181		clock_khz *= 1.0 + margin;
   182	
 > 183		divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
   184	
   185		/* we want to floor here to get higher clock than required rather than lower */
   186		if (divider < DFS_DIVIDER_RANGE_2_START) {
   187			if (divider < DFS_DIVIDER_RANGE_1_START)
   188				*divider_id = DFS_BASE_DID_1;
   189			else
   190				*divider_id = DFS_BASE_DID_1 + ((divider - DFS_DIVIDER_RANGE_1_START) / DFS_DIVIDER_RANGE_1_STEP);
   191		} else if (divider < DFS_DIVIDER_RANGE_3_START) {
   192			*divider_id = DFS_BASE_DID_2 + ((divider - DFS_DIVIDER_RANGE_2_START) / DFS_DIVIDER_RANGE_2_STEP);
   193		} else if (divider < DFS_DIVIDER_RANGE_4_START) {
   194			*divider_id = DFS_BASE_DID_3 + ((divider - DFS_DIVIDER_RANGE_3_START) / DFS_DIVIDER_RANGE_3_STEP);
   195		} else {
   196			*divider_id = DFS_BASE_DID_4 + ((divider - DFS_DIVIDER_RANGE_4_START) / DFS_DIVIDER_RANGE_4_STEP);
   197			if (*divider_id > DFS_MAX_DID)
   198				*divider_id = DFS_MAX_DID;
   199		}
   200	
   201		*rounded_khz = vco_freq_khz * DFS_DIVIDER_RANGE_SCALE_FACTOR / divider;
   202	
   203		return true;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
