Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927078;
	b=zC/n3B/AX1yACSsWwhuUXzp31249VopqZDbT4MhOuJY86l0fCzUx2c1MCJDOag1/1l7y
	 DVfePTU3A9Bi8mh3FObrq/LGVubMqjLcxfv+7uwrbd8I4xnJTkcrckJL/5ueBziY53wk1
	 GfnobRZI0x9hTTKh3A/Z4iFQ9IndzRelf1ZVutvxdINuAL0nAko3N/9gW/Lx+XLtBQIoX
	 reGeTcay005gAbP7VTZOx4gjsW2zD0v//kv5vPoSbLLiWuvAvR8R4JXR8Eu6hmSy98ctY
	 2BMXnwkr6uyYn7Rq4d+rr/6yqbDGrlioaToT2BuUf0gNBsISXbldzWCGoM+juPyI9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927078;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IfDa6xDNEDn/S3kSnR3XKJ514M/Rd+MUqrITylxx/rY=;
	b=UfYqxZayPP2SRzrCDal/QubSsVKtT+kTvpgQt9RlXCx8SnARFvXeDZaqngdXCT9mOVib
	 oSQkhZoI7qV8I1G60crvksKhe7xHFCf78ugJNqeCGMiQsZc+fPGzLWoQMkvZ61cgh1JcU
	 pY7tuoDNylpJzCPG/D/za6nfHhTmXBomvFKOtlJ2gMv7+qDLZqTDWJAwO1ok8J41zU/pO
	 A1SHuidtuOAY9D0hSoKR5Yna6WKDCXp6RmboRUtf6XoOCXTIATdFCsHdrpQ8oKkMwfplJ
	 Aux0epq3itxIcYGsnTSMFxFbAwLEczmQFOVEuEyq2Qfsj/4nfeJ9Pe6Tqge4ssxvvTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EaZeB2Sw;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329DB606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 01:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EaZeB2Sw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793927078; x=1825463078;
  h=date:from:to:cc:subject:message-id;
  bh=9U8mtyE2mZsuxq8iMvGteEQb5fO9aMTrzHn+Phdf0Rk=;
  b=EaZeB2SwOW8qZ1lNDrRilZyR7YEXSMuAhukeHlScrWMeUYxLkam0XJdO
   Twb7c0h/OabeIhYUTfjRzt/GRlVn4yBq8SfjWco+R2oSIHcQOXodKRRJq
   1nV987gTnXEssJJf1Kw/LW4BHsF2/7p2ebng3q4MM0wHUVrh4mbLiT8UF
   n4oArc+OATGKD5f/lI8cDA9H4ElTHMLWzu4bj7oFSwirGbxQixlOOfU/u
   +i0ZiJjA0QB1Ae3mddSu6BCBT+ID2d9C7XYJ9sgmtgWA3ff7Jv+jKGdfE
   aYoFWufdT58vZGmQRCOK4ISQw9Ouo2eYLL6lTiNzH5uRayIxd6axRFcIo
   A==;
X-CSE-ConnectionGUID: vB0fE8HwTHGTxJUEX+h71g==
X-CSE-MsgGUID: mwpPi3FISCWEM/rHM8c89A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2640807"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2640807"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:04:37 -0800
X-CSE-ConnectionGUID: J6/TAJXzRrSCteII0z4n6Q==
X-CSE-MsgGUID: 5vE/XQ+mRL2pze5Rewi44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9030632"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 05 Nov 2026 17:04:35 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP8Nc-000000009wp-3sq5;
	Fri, 06 Nov 2026 01:04:32 +0000
Date: Fri, 06 Nov 2026 02:04:10 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 0/1]
 mm/readahead.c:158:51: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202611060117.noSVuh6k-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   a9580b7485bbf58d7b44b7d51e15c8ebe1cea327
commit: aa2fcdf35fade78eec17bdfae208b652f11ab9a1 [0/1] ANDROID: mm: Create hooks for ZONE_MOVABLE allocs
config: i386-randconfig-2301-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060117.noSVuh6k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060117.noSVuh6k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060117.noSVuh6k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/readahead.c:158:51: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/readahead.c:158:51: sparse:     expected unsigned int *flags
   mm/readahead.c:158:51: sparse:     got restricted gfp_t *
   mm/readahead.c: note: in included file (through include/linux/mm_inline.h):
   include/trace/hooks/mm.h:65:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:65:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:65:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
>> mm/mmzone.c:118:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/mmzone.c:118:47: sparse:     expected unsigned int *flags
   mm/mmzone.c:118:47: sparse:     got restricted gfp_t *
   mm/mmzone.c: note: in included file:
   include/trace/hooks/mm.h:62:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:62:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:62:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +158 mm/readahead.c

   153	
   154	gfp_t readahead_gfp_mask(struct address_space *x)
   155	{
   156		gfp_t mask = __readahead_gfp_mask(x);
   157	
 > 158		trace_android_rvh_set_readahead_gfp_mask(&mask);
   159		return mask;
   160	}
   161	EXPORT_SYMBOL_GPL(readahead_gfp_mask);
   162	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
