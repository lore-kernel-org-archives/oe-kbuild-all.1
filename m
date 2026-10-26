Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021584;
	b=omF2dyzAdaUuAUtNZvU0MnP4lQTrmCRS1Pd1thSLwilRss2kEbGtyn+cmoI2LzVrPutR
	 tEebm7723e00IwUVB8AAEYdVs5XOdZiocqnwj5Et8bWVmw1k6sd87a/PSb+UE5GLViytV
	 QAerBYo1Djq1wj8TSSJnTiV0oygh3Le03E2BkT6NyzXr54wzR4VR1oZ6AYIUGV/NMAucS
	 5mCTKh16E2cK05FlKifqa2L28H38jbpv2e97xhFj4BVa5E9Dhpp+QQuk31XTdYLW34WOH
	 Vv8kZnCIc0EGbchfVTzTCCoKKOakR0KlmKnUThsWN7kvMEeJFcQMIPJVgdsAllSzoHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021584;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=X6uNh0G/yQmI7ewJk5+yhKWaCtEDySNn4CTyFZEF3+Y=;
	b=a2+zgW2hLemBCQ2E9Giuobx/k/wt5brt7smmyyebG5dJlidb0fjpuZsdBlwcA1Q89nfy
	 lXVi3KVZElWdlG6zZV1E7ZZeu2AupLBHh3RNiMudfL+Rn6inMojRHF1dpk2+x2wIFhNrC
	 1NcUsiSNCi0ouOtsFN+4Ei6Ip7Csga84pVKZPpb6WwOL8KRVTY0QXlWyohLS0gF54OSKH
	 zrN1GXLcqfzMUgRW6/rcOA4S8zfOOSiQlGSMQfAMH0SzDfD4Pjbjn2MGUT/+H/i+1A5e+
	 jx9/KLORk1fUSvFKBdvfbTBORSklCd1VPxqaxpAZKLJwsTzoMRgFwAUIuoi9GPDvamA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ECz9axqh;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB67C606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 13:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB67C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ECz9axqh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793021583; x=1824557583;
  h=date:from:to:cc:subject:message-id;
  bh=ipIF1+ipnPZv/yMfd46vRVlrbA1+4NTGt/AW2SIDzhQ=;
  b=ECz9axqhD9S6YQpUFu/IjPYPVOf80ElqCuuCAvWGbF2D4donJzRkhFCp
   eh7OJtEdOmD5rR67zPKcLc1FWpoTgONDXtKvCODxC6/E/g8a0cbie0jyq
   nf/+6IQJR8h7G8r34Mo65BTHQasYIon2Ao8t5H5Z05gaLXxmBILNR4quL
   IsmxeHr9lFtz3IKRI8Zb5pMEE0qvve97/dGQt1MtlMrUoZEHC4lQi2Pu7
   lqp/H2vzfHkONZEHXXIHv0GJ6clylB+2Fa25TdmlcFMgtZbQ6T+jvSKuK
   Owv4PnO1DTlN4PSmz+hG216yPpbETMIB8/wAgw/s2IWkAn5nljazMYn2P
   A==;
X-CSE-ConnectionGUID: qrJp9iGPTx2M7+aCVTFQ0g==
X-CSE-MsgGUID: WQRHS7QxS06GMMKCUYQ67Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1719142"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1719142"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 06:33:03 -0700
X-CSE-ConnectionGUID: 2Q+x0k1ZRwGe4r/iFGHhRw==
X-CSE-MsgGUID: igWMhFEcSIeqhldcmz2X+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4654886"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 06:33:01 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLKos-0000000047n-2m3C;
	Mon, 26 Oct 2026 13:32:58 +0000
Date: Mon, 26 Oct 2026 14:32:01 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 85/133]
 drivers/infiniband/core/uverbs_std_types_dmabuf.c:194:1: warning: unused
 label 'unlock'
Message-ID: <202610261401.SEKydNvW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   09aab91c2fcb166bfe35c0f9c2c5b6b960722087
commit: ed41e5171bfb2fbf79e518ef59bfebe2446d37a7 [85/133] RDMA/core: Check the dma_resv_lock() return value
config: x86_64-randconfig-2102-20261026 (https://download.01.org/0day-ci/archive/20261026/202610261401.SEKydNvW-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261401.SEKydNvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261401.SEKydNvW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/uverbs_std_types_dmabuf.c:194:1: warning: unused label 'unlock' [-Wunused-label]
     194 | unlock:
         | ^~~~~~~
   1 warning generated.


vim +/unlock +194 drivers/infiniband/core/uverbs_std_types_dmabuf.c

   172	
   173	DECLARE_UVERBS_NAMED_METHOD(
   174		UVERBS_METHOD_DMABUF_ALLOC,
   175		UVERBS_ATTR_FD(UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
   176			       UVERBS_OBJECT_DMABUF,
   177			       UVERBS_ACCESS_NEW,
   178			       UA_MANDATORY),
   179		UVERBS_ATTR_PTR_IN(UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
   180				   UVERBS_ATTR_TYPE(u64),
   181				   UA_MANDATORY));
   182	
   183	static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uobject *uobj,
   184						  enum rdma_remove_reason why)
   185	{
   186		struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
   187			container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
   188	
   189		mutex_lock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
   190		if (!uverbs_dmabuf->revoked) {
   191			list_del(&uverbs_dmabuf->dmabufs_elm);
   192			ib_uverbs_dmabuf_revoke(uverbs_dmabuf);
   193		}
 > 194	unlock:
   195		mutex_unlock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
   196	
   197		/* Matches the get done as part of pgoff_to_mmap_entry() */
   198		rdma_user_mmap_entry_put(uverbs_dmabuf->mmap_entry);
   199	}
   200	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
