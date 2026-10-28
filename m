Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213978;
	b=pyfimyXFORnpWjbkOOKtMdOBlYKD7d2QhASdSW/iwRzzXIkWvrOypOgkOsxqRDrifErh
	 I7ZZSSUENxm4jIz0biAvXGMC3QzKYedxk+Z86oUKifeHHEucTtWmLe3kSTskwyrh2jKOV
	 5sj8ThLKUVeZO2PHguSczeyjrxzswWbLHR6q2vMnYQz2wdJxnCxXFspWMdPg6HYafeN/5
	 +lcz5D3F6QQef0/kahMNksyEldmzq9uNXox1C7T5bENQuh87AVnHzYtU+wBWPC6zKKfyP
	 nGaUnpxP2rt2ALiU2OJX/xHo76LyiamLETziYQpsWJ2fNlvKYaeIeTwOXgIKfpZSS0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213978;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nA4T7iwc73hHKlpMzFBjevlOR0TqL0MhxRVsl+Et6SI=;
	b=V1weyVBKKeZTv/FcAtVKlSBOm8mf8i0bVFR30Kc6V6fMCNCzozJcqQfgqTogVjaC5ygo
	 4m2goqps5pdU9M7ODlFTchh3tIYvbK8lgUSkCnjKOzTrf1hv3kuWZZusTaOA70ZotfKZc
	 uX0Ba5cQLroZIE0kMQmtBOMaWhZtwLct6fyLbI3NITCY32bjdreXIiYFj0glBFlWYpilu
	 gkuzDLATKqs+sGRyFWOgJGstRqub6Ybz3cJ8WG5/sdt2SETk6CULzJJ644ZCPMcNOvCf/
	 nB7teGJr3+oC/D+S1NsmlZEqZIkH7tcy+bK+UE6+Z6M/TXh2OJtFza83/nFNycE+V8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AlvozsCr;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C2A606A31D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 18:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C2A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AlvozsCr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793213976; x=1824749976;
  h=date:from:to:cc:subject:message-id;
  bh=reInauKew1OSD4DzACKNVnDpIZ26YRhF6IT1lpA/qNM=;
  b=AlvozsCrm8H3p0XtcxDFb8BBYUU36LYGaauSUeEwtB9cINBM4U3VGT39
   AtSIalteh4Gl9QHPG3YG7KVz0aiODRd2gDGf34mWdZsoeDn9ztUczjcq6
   LPwOxJcR7U3fQ1grr6ngbs+rTpLYsoHWKFOSWtdieNGM081a9oID6KpkU
   Za2KrSf2GzXn83SOTkF6VPtVB0Phm0DompGLSwP4YlcFOhzOsWR7fXyLw
   sOvQVCWGFbOUPQiysTj/2xrmRFoVrEGITTt5c1sN1wy2P6XUgQ2+AiRr1
   aTKBoD4C1u3ucp1mvS1c3jGgW7ANEnVV3jwNx1w4EfIqpSz7MUTMOM6CR
   A==;
X-CSE-ConnectionGUID: TE4sOhVoTOmUTtVXaj7EcQ==
X-CSE-MsgGUID: //biS2B2TrKECoSDNONP8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1937099"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1937099"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:59:36 -0700
X-CSE-ConnectionGUID: YM/pKNlBRjaJRrdv48jjmg==
X-CSE-MsgGUID: 4/mkaKTZSYiPdAtJ/2G0aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6752985"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 28 Oct 2026 11:59:34 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM8rx-000000004xD-3Vp6;
	Wed, 28 Oct 2026 18:59:29 +0000
Date: Wed, 28 Oct 2026 19:59:08 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 mm/workingset.c:198:6: warning: no previous prototype for function
 'unpack_shadow'
Message-ID: <202610281941.gBwMRomY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ffdb1830342c4c7db15068ca5cdcebb04dd14db6
commit: 1a3bbc191000a8382db034c86dd4eef905327197 [353/353] ANDROID: mm: export unpack_shadow
config: arm-randconfig-r2303-20261026 (https://download.01.org/0day-ci/archive/20261028/202610281941.gBwMRomY-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281941.gBwMRomY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281941.gBwMRomY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:198:6: warning: no previous prototype for function 'unpack_shadow' [-Wmissing-prototypes]
   void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
        ^
   mm/workingset.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
   ^
   static 
   1 warning generated.


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
