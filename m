Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285762D63F8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 23:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171384; cv=none; b=nTfkspHJsVkFM53B5FBywhwKTQ3yrphh6oudtPgcqWXZ0r8istPNrDLNMovRUEeOo8flGCNOZVR0lCK83QoHYutiTlrBb1m5DAh/+EAwc7qjLnJkDrhute1k3/lqlXHWr3OQcVT0otLB6rOFfJ4ElWXN4uXgPyayewqpsAHbMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171384; c=relaxed/simple;
	bh=NUX1iGy7bET8NxNRX+rdoX12tLyY189OSbedrVWVeCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ucfHNpJgkLjk8Xaxtrz+8uHpw4PtBcdKDby9Ku9J0r24VBW3VbTe4yltvCj86sjiZb6tW0yzG3wjElE787WCINh+fc7Qab7DRBZFRYzvAkqjCTx9kg/+zo5xD7xJO3xHyKQSaoFboAr2Sb6aZfepRLxzTRuX+Fl9IvhxiNoe2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8SJswZl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8SJswZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782171383; x=1813707383;
  h=date:from:to:cc:subject:message-id;
  bh=NUX1iGy7bET8NxNRX+rdoX12tLyY189OSbedrVWVeCA=;
  b=M8SJswZlxyPrS/lJDali9IY/An7Q0RcaJthbe3HxYnwQoxRgUOmOAttT
   aOizjf9UfEKBsPOBvmN65RDJN4eJVcWcSnA4ZCZyKSpcSOg6G02q5m/+o
   6UhZAzjlXVEvklcr+1iXwz5OxJySDYUvfOvdAPl9dxE4lQGDrrh8Xjqw8
   RmccrASJGSqWbRkK474jf87ANiXSUZzhTzVvAUZB5bd2zPKDJhtJzvB85
   iJ2Gva5NYGgKwqrtLdqyc7STJIzPZHTjKjmnLsEb1N2r9momaANadw9jr
   nRT/9CLwyHeqRE/JDJSxgvIMPqgZlwG5/woTbTCPr4bYas9Rf/e3kBJXV
   w==;
X-CSE-ConnectionGUID: 8/EmMAfLSLeB0/ePA39znQ==
X-CSE-MsgGUID: 75eCnmMNSz6g92n3nazQWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83100301"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="83100301"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 16:36:23 -0700
X-CSE-ConnectionGUID: ahw/W6PWRqm2+nU53GZ/ag==
X-CSE-MsgGUID: 1ooaVHvHRueFgaRmAGjjIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273422285"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 16:36:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wboBa-0000000023y-2e9G;
	Mon, 22 Jun 2026 23:36:15 +0000
Date: Tue, 23 Jun 2026 07:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/infiniband/core/ib_core_uverbs.c:430:16: sparse:
 sparse: incorrect type in return expression (different modifiers)
Message-ID: <202606230708.oBFhjnbi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4708cac0e22cfd217f48f7cec3c35e5922efcccd
commit: 01f99f8c4a0adec6875f192702a57c5e88978af5 RDMA/core: Move the _ib_copy_validate_udata* functions to ib_core_uverbs
date:   5 weeks ago
config: x86_64-randconfig-122-20260618 (https://download.01.org/0day-ci/archive/20260623/202606230708.oBFhjnbi-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230708.oBFhjnbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 01f99f8c4a0a ("RDMA/core: Move the _ib_copy_validate_udata* functions to ib_core_uverbs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230708.oBFhjnbi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/ib_core_uverbs.c:430:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected int ( * )( ... ) @@     got int ( [noderef] *__v )( ... ) @@
   drivers/infiniband/core/ib_core_uverbs.c:430:16: sparse:     expected int ( * )( ... )
   drivers/infiniband/core/ib_core_uverbs.c:430:16: sparse:     got int ( [noderef] *__v )( ... )

vim +430 drivers/infiniband/core/ib_core_uverbs.c

   419	
   420	#if IS_ENABLED(CONFIG_INFINIBAND_USER_ACCESS)
   421	uverbs_api_ioctl_handler_fn uverbs_get_handler_fn(struct ib_udata *udata)
   422	{
   423		struct uverbs_attr_bundle *bundle =
   424			rdma_udata_to_uverbs_attr_bundle(udata);
   425		struct bundle_priv *pbundle =
   426			container_of(&bundle->hdr, struct bundle_priv, bundle);
   427	
   428		lockdep_assert_held(&bundle->ufile->device->disassociate_srcu);
   429	
 > 430		return srcu_dereference(pbundle->method_elm->handler,
   431					&bundle->ufile->device->disassociate_srcu);
   432	}
   433	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
