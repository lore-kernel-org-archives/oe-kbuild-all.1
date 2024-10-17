Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43ED5661
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 00:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124573; cv=none; b=dyGXT5WLz/eVS9IWj5RAJfOCJGobS4pFPeug5fxhsW2IXtLBCh9AfgEEP8UBYrTMFohN+EI4ZWxtibZLTTkYBRe8MN+i5aUyV8+c6dVtvMNZmmtMKVt/kElOvmwDOeey8zmN3zvlaI1kThgaHetxgHe2SKFji89QcqEOx87oTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124573; c=relaxed/simple;
	bh=1Vxo1j7W4aFCXHnMgY/XsZ7cSwr9tLHa/GXN26BGhcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0LLVVkUQv1ck9bK2jiNpJ0gUB8mxMuvhrYs0Trsm35tXaLmjyXLLd+Ksnz5rpOyirC07TvuaGt/MadlQxtmywzuu+V/sTOm8LqCBZTfW/iuh5OtfBpJsOWs9qjoz0OOHwmz6yjbnnvFAaTDqgqdv0R2GVJssOmHIT22a0qbZoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmTBhMxz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmTBhMxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729124571; x=1760660571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Vxo1j7W4aFCXHnMgY/XsZ7cSwr9tLHa/GXN26BGhcE=;
  b=XmTBhMxzTrdYYEcx53WaMZ4RdF8zOoXpfLy/2XILpicTmqd1aKCUPg3u
   XNdFhMoQWbeY9/02WhJpn+mps3QWj107vPGjxu/Y5DR9yqY09wMxXnfNA
   UzqzP+zvRZ0K2+eJLdK3wWOXVsdWY/D0udj6QND+NHUiHZQH4TtBTwJad
   aoCEA0WFwogOn2PXkt8n0iTm1Gk+8TfcpXT621w1XGkPXG+Uur9IlkFC9
   UOgkbgSdEOwkzpELo7Ic86ClFHnzg8AR3hfRZqzQoMveH2xoc2lg0duUM
   C4mfdZ6qwb+bGR2zwiLl+IxvcvQFT71AQb3YyXnYjWcUnxN/VR9NXhSoo
   w==;
X-CSE-ConnectionGUID: op7mwI21S2qJgUZGc0A4gQ==
X-CSE-MsgGUID: Qu8c6CLKRMuctR8fql9KUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28692504"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28692504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 17:22:50 -0700
X-CSE-ConnectionGUID: G4fvpxmJQoWEauRzM7dp2g==
X-CSE-MsgGUID: CougSRrMRHawInmtzW3XnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="78000673"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Oct 2024 17:22:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1EHv-000LYl-20;
	Thu, 17 Oct 2024 00:22:47 +0000
Date: Thu, 17 Oct 2024 08:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/3] mm/workingset.c:198:6: warning:
 no previous prototype for 'unpack_shadow'
Message-ID: <202410170849.oHL5BVZt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   27021bed8099dfb7e28770ebc42a34d1bd0e54dc
commit: 1a3bbc191000a8382db034c86dd4eef905327197 [1/3] ANDROID: mm: export unpack_shadow
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241017/202410170849.oHL5BVZt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410170849.oHL5BVZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410170849.oHL5BVZt-lkp@intel.com/

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
