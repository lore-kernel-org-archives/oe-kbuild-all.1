Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4829035E4FA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437216; cv=none; b=pAH7PSr3YxMAq6KVtnc4WZiv+/l/fhKVVdLOhV85YYwdNj94Gbata6k6UtVZxBx3UpvFAK57g0yXYMwpT8fBv9LDQolv2C/J0Tl0HW/jt/fjAZ/WPWgL4oedlS1ehSbz2PQHqRo+wxx9TKGQtLbmJ1/UEOzjR0X4hjuLajbwesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437216; c=relaxed/simple;
	bh=t5Maf46mlnEZcsiL1SjNrkcAcVRp/OmRaP3OQBLoHc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQ0BvOeAt08YEpKjJgAN95XpB132AYH3Jq5zsNSIKpMD0DQS8cbX8eX6XB6WsTSR49D/nB8N11E7vh+Bk+9ZUDEbeQAevetoxpV1PnnuDSmwBMC+Bg6wGeB8MPhnOid7bK66y1q8raZE4b5jyq/UECrQQ/9nlrPWrlsG6GBUU5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkV8KkeB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkV8KkeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757437215; x=1788973215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5Maf46mlnEZcsiL1SjNrkcAcVRp/OmRaP3OQBLoHc8=;
  b=PkV8KkeBeUcrxkFpTtkO9Gdmzfypy5QvSFVobn4SALXvsIW3UGBAjSI/
   M3TjP8IakOsWV/EQ2WdSl7aZ3gZrSMRoM1ytWyChpsWb7fEglN24pOQy9
   vOmBVqi+RGpx3NFvtz1TF9ujpCdug6YfBBW4JGMiiNJ/bE653anMvc5US
   hcl3UCrR8YyCP2as/ESykN0e1V6lmknC1UP8NHy0wTnOiYDB+TaNhhjon
   G8NNU6rr3JlSHra95fW95jDuEaeTf4XmqPRD+jLrii6PKed+EvrgbPdJV
   GNI3HYzY+I5GhjDoByTbXG7PfRpY5R7QRJjNn/kr8DR64x82l6178i902
   g==;
X-CSE-ConnectionGUID: KCm9uqrrSLiCNFhhWkX9MQ==
X-CSE-MsgGUID: 3lJuQZ6hR0uC89iQDOatvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71149027"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="71149027"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 10:00:14 -0700
X-CSE-ConnectionGUID: aM11oCZMSsSWtWrJ5qbzgg==
X-CSE-MsgGUID: x8zM0DUeQ6aR17NV/JH8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173250534"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2025 10:00:13 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw1hS-000579-2e;
	Tue, 09 Sep 2025 17:00:10 +0000
Date: Wed, 10 Sep 2025 00:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/3] mm/workingset.c:198:6: warning:
 no previous prototype for function 'unpack_shadow'
Message-ID: <202509100007.mCvV34EB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c
commit: 1a3bbc191000a8382db034c86dd4eef905327197 [0/3] ANDROID: mm: export unpack_shadow
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250910/202509100007.mCvV34EB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100007.mCvV34EB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100007.mCvV34EB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:198:6: warning: no previous prototype for function 'unpack_shadow' [-Wmissing-prototypes]
     198 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         |      ^
   mm/workingset.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     198 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         | ^
         | static 
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
