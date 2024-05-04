Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B005800
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 03:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714793178; cv=none; b=eDo7ujduH12fiEUjbusSF9oYZgEc6sOMki/D3kNi7kTQbCPq1l9qgE6CwlXia06Y8x4InhGq1SPwyw0KzR5V9kamovmM29zUkKOn5cgmY1lz5EqNAZ+JwLHzmHv8AxEBhgBikZA5Wf2OscOJ7jubP1tLyedH7vLJkjZidViSD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714793178; c=relaxed/simple;
	bh=OA6TyNaMyhwCNb5Y2PglCzY/KyKl4StBct9pyMD6fJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rVj/fm2pctSeqlmigD2O37dPtzkd3sbyZJI4iSk4GcDPvD6MQLs58cYTI6hBpV54/GXf4IXtlCCRASCio/yKorBnvWoeJbJ8zPwgA6SaFkCmdvj9/Jbp9ZjjSDgpPvaWfuoEFL7m0lKjWgclOCBSIeqN/wICEH5mp6ReEJojRII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNjHxcrc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNjHxcrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714793176; x=1746329176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OA6TyNaMyhwCNb5Y2PglCzY/KyKl4StBct9pyMD6fJw=;
  b=CNjHxcrc0n2FJOvw6QhsZuRKntODk5XoXxMKLSFV2+7uxAi+5AtVuyot
   jn0W9+1zOE+DSVzG0WqxmSOUpvlmi0pl2zur8VLVnMysoKPMxx4jq25Ac
   O92lg6xFVCpTqNnT06/2L0afqbi0cvAMaEoJRqhbc9jf8UVgwtNZy3xET
   4a138CIX1MFyQ29d9G9signC3W1FtGabSwnPEspwmoLbgaV9K5o0ait6x
   H5llPknCVOeVENckaEAyaU5qwu89FzFSHmf9pGRf+y9B7hxLJVxz1bi53
   XoeNtEwE+gWbRd5+Xysf3OUiLSk5gYknxot9mjyI5IPa4f232C2s+giSm
   Q==;
X-CSE-ConnectionGUID: cdnHxreHSbeUtRRDf3f2Ow==
X-CSE-MsgGUID: VMoZKEEjTvqoc4k3rb/usg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10461836"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="10461836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 20:26:15 -0700
X-CSE-ConnectionGUID: jo+SjV9nTCm8J8mPIzhxxA==
X-CSE-MsgGUID: R2J+ITJSSi+C5bKyu6AGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="27738373"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 May 2024 20:26:14 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s362O-000CP6-0M;
	Sat, 04 May 2024 03:26:12 +0000
Date: Sat, 4 May 2024 11:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 3/3] mm/internal.h:1542:38: warning:
 'struct cgroup_taskset' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202405041100.RZRTURAx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   c5d0efd9ad4acbcf666aed6e47e15d1feefa4ff0
commit: c5d0efd9ad4acbcf666aed6e47e15d1feefa4ff0 [3/3] mm: memcg: move charge migration code to memcontrol-v1.c
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240504/202405041100.RZRTURAx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041100.RZRTURAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041100.RZRTURAx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:51:
>> mm/internal.h:1542:38: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^~~~~~~~~~~~~~
   mm/internal.h:1543:34: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^~~~~~~~~~~~~~
>> mm/internal.h:1545:40: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
    1545 |                                 struct cftype *cft);
         |                                        ^~~~~~
   mm/internal.h:1547:41: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^~~~~~
--
   In file included from mm/page-writeback.c:43:
>> mm/internal.h:1542:38: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^~~~~~~~~~~~~~
   mm/internal.h:1543:34: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^~~~~~~~~~~~~~
>> mm/internal.h:1545:40: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
    1545 |                                 struct cftype *cft);
         |                                        ^~~~~~
   mm/internal.h:1547:41: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^~~~~~
   mm/page-writeback.c: In function 'cgwb_calc_thresh':
   mm/page-writeback.c:900:39: warning: variable 'gdtc' set but not used [-Wunused-but-set-variable]
     900 |         struct dirty_throttle_control gdtc = { GDTC_INIT_NO_WB };
         |                                       ^~~~
--
   In file included from mm/slub.c:49:
>> mm/internal.h:1542:38: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^~~~~~~~~~~~~~
   mm/internal.h:1543:34: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^~~~~~~~~~~~~~
>> mm/internal.h:1545:40: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
    1545 |                                 struct cftype *cft);
         |                                        ^~~~~~
   mm/internal.h:1547:41: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^~~~~~
   mm/slub.c: In function 'slab_post_alloc_hook':
   mm/slub.c:3831:29: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    3831 |         struct slabobj_ext *obj_exts;
         |                             ^~~~~~~~


vim +1542 mm/internal.h

  1540	
  1541	void mem_cgroup_move_task(void);
> 1542	void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
  1543	int mem_cgroup_can_attach(struct cgroup_taskset *tset);
  1544	u64 mem_cgroup_move_charge_read(struct cgroup_subsys_state *css,
> 1545					struct cftype *cft);
  1546	int mem_cgroup_move_charge_write(struct cgroup_subsys_state *css,
  1547					 struct cftype *cft, u64 val);
  1548	void __folio_memcg_unlock(struct mem_cgroup *memcg);
  1549	bool mem_cgroup_wait_acct_move(struct mem_cgroup *memcg);
  1550	void mem_cgroup_charge_statistics(struct mem_cgroup *memcg, int nr_pages);
  1551	void memcg_check_events(struct mem_cgroup *memcg, int nid);
  1552	void __maybe_unused mem_cgroup_id_get_many(struct mem_cgroup *memcg,
  1553						   unsigned int n);
  1554	void mem_cgroup_id_put_many(struct mem_cgroup *memcg, unsigned int n);
  1555	void memcg_oom_recover(struct mem_cgroup *memcg);
  1556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
