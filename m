Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED981ACA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 01:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020265; cv=none; b=ZRFYxRFEivCevavHhRlFWJr8yUuTlfE9PZDIfL8t8PQFH25GX9fMl+p8tDlWPx4ceikr35vtJOIVsKvZWYnHQq/nvqpdyEjzA3t1CUC7LQGNaHAv33UyjnJnYqnQVFr+GImHLhUDNek82svf17VsdDk3m2bTdTRxFZHWi1u+/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020265; c=relaxed/simple;
	bh=YNsu1114FSOl2QVGpYzauM9dz7fwvs2nI+B6ePj0GmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqp96WCZBQW+lZ45kRkb/uHXnop37okrLult8XmR1YWLdHZB0Mx4c84tnXMG1B5OKWL2p8QvEN2fsUQfknizU0JkEbb3/XZAXpptnRecPUEimM9Xw3YzvxX0SDI8DnpZVldVQpaYYSNSEYbViFbqExLkIdrBydS3OBUY5z7yqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RntPIJE0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RntPIJE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766020264; x=1797556264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNsu1114FSOl2QVGpYzauM9dz7fwvs2nI+B6ePj0GmI=;
  b=RntPIJE0wHMuyeIErzJcuLQdRld2V9hOmDXRDszGL/o4dtEdyEVWW0gE
   7IjCqv5Wr9olzAuaP7YFnXQ5dCJf/xXA4nyT9aoDdycwV+GWXOpmUNcTD
   fyDpMA91Vtdsn86mzcV0BxT/I2lmoC4mXWjr7C+KN5fcTdVT0RajsPKTs
   z0AUPTbskBxIjchu73X/waRSLFu+BWd6mwH676xjU4SI0wj/YNTdDCr+q
   aX1tSDf0t+cZTymONsEuiXHyGPA9kpjbo47azdxpDQhkpNmqnK4pvIXI2
   W4WGrVhsoilH+kiqBtzpX+02WyPphy4jJhnqByxwzJ98PXVmDM9tJASnk
   g==;
X-CSE-ConnectionGUID: KXn9j7TmQE+xLvu79YR6wA==
X-CSE-MsgGUID: 1lpB+8A0RlmLNsoc5QFe1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78283445"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78283445"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 17:11:03 -0800
X-CSE-ConnectionGUID: /sYdzD9ERTKQn6JKpqXcaA==
X-CSE-MsgGUID: MqnRYaF2SZO/FoGjC/e0Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="203526670"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 17 Dec 2025 17:11:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW2Xk-000000003my-0Ope;
	Thu, 18 Dec 2025 01:11:00 +0000
Date: Thu, 18 Dec 2025 02:10:18 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] mm/workingset.c:198:6:
 warning: no previous prototype for 'unpack_shadow'
Message-ID: <202512180250.4tRJ1ILh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   12597ffc824d027b45aa3fda9606a4f0c3835d81
commit: 1a3bbc191000a8382db034c86dd4eef905327197 [40/40] ANDROID: mm: export unpack_shadow
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251218/202512180250.4tRJ1ILh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180250.4tRJ1ILh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180250.4tRJ1ILh-lkp@intel.com/

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
