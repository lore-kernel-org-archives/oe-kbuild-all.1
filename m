Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974DC22A80D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780172490; cv=none; b=CQC2DUq+TTXoPOyr1GAsf8NJJhkWdVzgfi8NItdEckAzcGmCR3X+Pa5aYcC6FroKyrASo91dsaP0YF61nhoj4eV282h/nUrasY08Q4fCXgQWWl8Ixx/VcNAgxGFB5+wxD67L4vMTUDADDLHrT/LGGNBQvS4/awVAejyw1Dsu51E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780172490; c=relaxed/simple;
	bh=8RE0hkjfPVb8yI+twZizYH8hMueBY+Pvz9vrCF5aiOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W0oxeeZ1dcPn7U9PkVAds1+/AK+do8ioppHTA/hkcBlgq2oxUcPEacuJMNRRZlq46EE1m17g4xQrT58GvJWKwH0KJ1hgZlWWACdGxRpuw5Z/HE4hL3RCJWwHmPZePlm2Q2DVyAnmu5k8R1iRvWwEyDKexKWSAsN0iAsg8DTEG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KI0i4Hgn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KI0i4Hgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780172487; x=1811708487;
  h=date:from:to:cc:subject:message-id;
  bh=8RE0hkjfPVb8yI+twZizYH8hMueBY+Pvz9vrCF5aiOY=;
  b=KI0i4Hgn++hkgi8WyxpIYHcZJqUahyltJXxDVLdf0cQy9QTFZJoESZti
   3MkqczNvhU2UkQEg28CLckrx4ux+z8dI+n3nyVhY/T9d8vgG6KQVHj8Rx
   0QBdt9IsMU3sDvgq0TY3hiuqdy1l7t3wepuC8GkGHhWTNmVIXLKX24Vz3
   smlrv8FXcVKuqsTRY73KCeVO7OSz65/CpmpclUwUibJH1+fuqu7PVwtI6
   DXxI3W15oyl9qgj6YCClNJfLJKpe4mmI77A3LND8HTXlAJ1zBZJ4mySn4
   2MLsxtSf+/Fy3nbcGxoeDOUDHT1svEiE3EYzuSb3Y2k5j18zYnHc3bA7z
   A==;
X-CSE-ConnectionGUID: dv6ajfuoR5+PZKjjOKSbHw==
X-CSE-MsgGUID: AhAt78QpRt+CVgvFr9MaYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="84845509"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="84845509"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 13:21:27 -0700
X-CSE-ConnectionGUID: RdMB5bC7ROmIEhtmZqe+Ew==
X-CSE-MsgGUID: WRj+/atAT3uNaRLQAahhEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="238766472"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 May 2026 13:21:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTQBP-000000008ru-0wtT;
	Sat, 30 May 2026 20:21:23 +0000
Date: Sun, 31 May 2026 04:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
 Selvin Xavier <selvin.xavier@broadcom.com>
Subject: [linux-next:master 7118/9870]
 drivers/infiniband/hw/bnxt_re/uapi.c:499:30: sparse: sparse: symbol
 'bnxt_re_create_qp_defs' was not declared. Should it be static?
Message-ID: <202605310411.DYzu0ViR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 7e812673a948395675e9893e75b0fc60d19bbf27 [7118/9870] RDMA/bnxt_re: Support doorbells for app allocated QPs
config: riscv-randconfig-r132-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310411.DYzu0ViR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310411.DYzu0ViR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605310411.DYzu0ViR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/infiniband/hw/bnxt_re/uapi.c:499:30: sparse: sparse: symbol 'bnxt_re_create_qp_defs' was not declared. Should it be static?

vim +/bnxt_re_create_qp_defs +499 drivers/infiniband/hw/bnxt_re/uapi.c

   456	
   457	DECLARE_UVERBS_NAMED_METHOD(BNXT_RE_METHOD_DBR_ALLOC,
   458				    UVERBS_ATTR_IDR(BNXT_RE_ALLOC_DBR_HANDLE,
   459						    BNXT_RE_OBJECT_DBR,
   460						    UVERBS_ACCESS_NEW,
   461						    UA_MANDATORY),
   462				    UVERBS_ATTR_PTR_OUT(BNXT_RE_ALLOC_DBR_ATTR,
   463							UVERBS_ATTR_STRUCT(struct bnxt_re_db_region,
   464									   umdbr),
   465									   UA_MANDATORY),
   466				    UVERBS_ATTR_PTR_OUT(BNXT_RE_ALLOC_DBR_OFFSET,
   467							UVERBS_ATTR_TYPE(u64),
   468							UA_MANDATORY));
   469	
   470	DECLARE_UVERBS_NAMED_METHOD_DESTROY(BNXT_RE_METHOD_DBR_FREE,
   471					    UVERBS_ATTR_IDR(BNXT_RE_FREE_DBR_HANDLE,
   472							    BNXT_RE_OBJECT_DBR,
   473							    UVERBS_ACCESS_DESTROY,
   474							    UA_MANDATORY));
   475	
   476	DECLARE_UVERBS_NAMED_OBJECT(BNXT_RE_OBJECT_DBR,
   477				    UVERBS_TYPE_ALLOC_IDR(bnxt_re_dbr_cleanup),
   478				    &UVERBS_METHOD(BNXT_RE_METHOD_DBR_ALLOC),
   479				    &UVERBS_METHOD(BNXT_RE_METHOD_DBR_FREE));
   480	
   481	DECLARE_UVERBS_NAMED_METHOD(BNXT_RE_METHOD_GET_DEFAULT_DBR,
   482				    UVERBS_ATTR_PTR_OUT(BNXT_RE_DEFAULT_DBR_ATTR,
   483							UVERBS_ATTR_STRUCT(struct bnxt_re_db_region,
   484									   umdbr),
   485							UA_MANDATORY));
   486	
   487	DECLARE_UVERBS_GLOBAL_METHODS(BNXT_RE_OBJECT_DEFAULT_DBR,
   488				      &UVERBS_METHOD(BNXT_RE_METHOD_GET_DEFAULT_DBR));
   489	
   490	ADD_UVERBS_ATTRIBUTES_SIMPLE(
   491		bnxt_re_qp_create,
   492		UVERBS_OBJECT_QP,
   493		UVERBS_METHOD_QP_CREATE,
   494		UVERBS_ATTR_IDR(BNXT_RE_CREATE_QP_ATTR_DBR_HANDLE,
   495				BNXT_RE_OBJECT_DBR,
   496				UVERBS_ACCESS_READ,
   497				UA_OPTIONAL));
   498	
 > 499	const struct uapi_definition bnxt_re_create_qp_defs[] = {
   500		UAPI_DEF_CHAIN_OBJ_TREE(UVERBS_OBJECT_QP, &bnxt_re_qp_create),
   501		{},
   502	};
   503	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
