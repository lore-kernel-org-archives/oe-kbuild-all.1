Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536215FD13
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730042114; cv=none; b=e20IZ2hKHLM4HjvBLWhePioqN/68+Yz8m/5VBu0cuww9i0iUMNKr2b3kNucGgVxSa7z4f81ErYbd1xqJMbDQYt8rH7XKplXV6PbfiOXHNfna1pqY25Qhw8e90YCpU+WZSDQbYD433IpBjpiSyxw+dSWvHWlcb3qktwCSGOIw7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730042114; c=relaxed/simple;
	bh=idX1DMhTPG2G9mXXbY35Q61K66W2bk2tORBHdEbswJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPf8QexoAPNw/bg4TzpFG3QsuwRsJwwBBuamzFghMcvAInvTP+Jp0M4yIyFuxEFsJ5pvRU11mdEhmxieDBU+D+HDkdiFW0xR8882+SHDtc2upnUKBmZDxpM20DSk0v9kHIdV3N5Cehl2icGpCweuo0x1H2SYJ+2HIL/kAr77b74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNWW4My2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNWW4My2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730042111; x=1761578111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idX1DMhTPG2G9mXXbY35Q61K66W2bk2tORBHdEbswJE=;
  b=QNWW4My2yfQgiaGM5wfR9AGZXztSfzzveCj1CR0YsdCOaeN1NqiG5Lce
   OQgT/2YioLD8+4G510+P0fOUySnS0sNFleQL/1pdH8aJ4eg+pvKVCL2KA
   lClYWOhvhYdHgkx3nU35yFHt39cJ9NjC9CkBQEX/6RoAyRDGLhpwBuRlX
   oC74NSrxtF48YXZFVw5H1WOsJcK8qDuYVp7v1A8Z/3l5cPp0Sv/sA0cPt
   MaYRpVUGv7mvKsDz+jDFJ1dsfPFyWW2U0eb2zjF12lWscczAsDIizz3VH
   4Id08xWupFRRBd7CAhtBYfndCkjbKLuGSKB3N3qb16SMMGcP6jTr6DhfJ
   A==;
X-CSE-ConnectionGUID: pC83ooT7QFC/6j/WhpG6cw==
X-CSE-MsgGUID: nboOKQfTQfWIDWy/l+55Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29756369"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="29756369"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 08:15:11 -0700
X-CSE-ConnectionGUID: jD7YfgHtTPa1n99fX0M4Iw==
X-CSE-MsgGUID: ecrEviWkRIS57sVULLG1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81537051"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2024 08:15:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t54yx-000amY-1l;
	Sun, 27 Oct 2024 15:15:07 +0000
Date: Sun, 27 Oct 2024 23:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiajingze <xiajingze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10656/15331]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:121:6:
 warning: stack frame size (2568) exceeds limit (2048) in
 'mode_support_and_system_configuration'
Message-ID: <202410272347.buJeCUbv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 241ad43fe7e9c24d5ba4cdd1ec22e731cdd22d14 [10656/15331] Compiler: Add clang's PGO support for kernel.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241027/202410272347.buJeCUbv-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410272347.buJeCUbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410272347.buJeCUbv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:26:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:31:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:121:6: warning: stack frame size (2568) exceeds limit (2048) in 'mode_support_and_system_configuration' [-Wframe-larger-than]
     121 | void mode_support_and_system_configuration(struct dcn_bw_internal_vars *v)
         |      ^
   6 warnings generated.


vim +/mode_support_and_system_configuration +121 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c

5634fb6078dd9b9 drivers/gpu/drm/amd/display/dc/calcs/dcn_calc_auto.c Dmytro Laktyushkin 2017-06-15  120  
74c49c7ac14f3a7 drivers/gpu/drm/amd/display/dc/calcs/dcn_calc_auto.c Harry Wentland     2017-05-08 @121  void mode_support_and_system_configuration(struct dcn_bw_internal_vars *v)

:::::: The code at line 121 was first introduced by commit
:::::: 74c49c7ac14f3a7cc500be959709f3473a6a49e7 drm/amdgpu/display: Add calcs code for DCN

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
