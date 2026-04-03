Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C93446C4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205660; cv=none; b=nrXcx7NdEzblDSyub0y4uHTsPSMeNdS1SUlXn2niAHwnuH6NWl0KPRELJzo0CPK08wKJRk0ijRqWsCsm54JuADZWJI8miJ5+pB3JJPI+uQY0yoHGL02m/YXhinFxCIqjGoy1Gtwhx4mTUkq0VNooLGpnSwLIoJOhtyrVAH84Kjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205660; c=relaxed/simple;
	bh=kO6YMJGM5e/Qn79V+SfTu25hBgLNEop9SpDq5eG2qao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EOsZ+C/qc3hgrWCFXX6l7qZ1A3g1tWGdoY0KAEGmN/5h+MOLTfdYMAX3i6zzAG4RJBZvdr7aH4ahD16zNCmIHUnowKMEK7IzMyGjE9t0rpFIMtxNwLRpCUIWL52XZ4Pe6RfVCL2Ir3B5VighAoGMXJwHfygUPjLF0W6oDlgZF3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2pdcbZ8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2pdcbZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205660; x=1806741660;
  h=date:from:to:cc:subject:message-id;
  bh=kO6YMJGM5e/Qn79V+SfTu25hBgLNEop9SpDq5eG2qao=;
  b=Q2pdcbZ8MDHg1aD5yXkuVN3PpQxJUMxg9/mNIPXgi0Biq/8+4xebJWX8
   E7/qp3hyWrGpZYew8bH5PFno4vbKcyfgC+1b93+rb1rwwHvDu/myUVghh
   KDvKLXV8RxGeR8R94lrvWJqzoVuZgC0595yN99JDwR5M9ExJ0GFe1e3QW
   1eqHh3sNLftTQeZrjVpSojeJ7XmQ83zFbUeoMthvEdFzXTuEs5OGEM6Y6
   qvYTybZM5DAHuxfQyF8w6jrlhiLtL9ZguzomXZJEWagjFutWycn5Sv9rR
   /DY8gw5/3GKIPeLb14TELoGjAt1IJ9GuLYSRim1nMpB4WVvekGgtaZkHL
   A==;
X-CSE-ConnectionGUID: lXJb3fZwRrufi/QGE6hN+Q==
X-CSE-MsgGUID: 38KaYvX9TWC3eNX4oM7zGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156624"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:40:58 -0700
X-CSE-ConnectionGUID: yFHvQIoJTZO7LRVIPEdFbw==
X-CSE-MsgGUID: fjwxxj2zRSGa/rt/k4Lq3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250425269"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Apr 2026 01:40:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a5G-0000000012H-0nty;
	Fri, 03 Apr 2026 08:40:54 +0000
Date: Fri, 03 Apr 2026 16:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 1/1]
 mm/workingset.c:210:6: warning: no previous prototype for function
 'unpack_shadow'
Message-ID: <202604022138.GTTQ762s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   1a029ed73e0c73261faa5c9cfc848e08ce285151
commit: 4a1bc937ccaba9f3623e72baf8b33c3b63bf2a22 [1/1] ANDROID: mm: export unpack_shadow
config: arm64-randconfig-003-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022138.GTTQ762s-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022138.GTTQ762s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022138.GTTQ762s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:210:6: warning: no previous prototype for function 'unpack_shadow' [-Wmissing-prototypes]
   void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
        ^
   mm/workingset.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
   ^
   static 
   1 warning generated.


vim +/unpack_shadow +210 mm/workingset.c

   209	
 > 210	void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
   211				  unsigned long *evictionp, bool *workingsetp)
   212	{
   213		unsigned long entry = xa_to_value(shadow);
   214		int memcgid, nid;
   215		bool workingset;
   216	
   217		workingset = entry & ((1UL << WORKINGSET_SHIFT) - 1);
   218		entry >>= WORKINGSET_SHIFT;
   219		nid = entry & ((1UL << NODES_SHIFT) - 1);
   220		entry >>= NODES_SHIFT;
   221		memcgid = entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
   222		entry >>= MEM_CGROUP_ID_SHIFT;
   223	
   224		*memcgidp = memcgid;
   225		*pgdat = NODE_DATA(nid);
   226		*evictionp = entry;
   227		*workingsetp = workingset;
   228	}
   229	EXPORT_SYMBOL_GPL(unpack_shadow);
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
