Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2365531ED83
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 03:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739865; cv=none; b=FjBPtllvj1/rk9Z5PHAPtCmWXcPBUuGs6Uffu2i3IZFUZ0p5omobzNYXtJspd5KVujs8+cQjOzujEAR2AKcLhxeb5ic7lLECEATe+Cxj0NT7FUNdiUMY4IjO1zirmKmngdjzC2URbanlyji15Pe/l6m8hZpgFM1IgDpnqBDIO1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739865; c=relaxed/simple;
	bh=Y0K2zu+uBIRUeClUfvA4WqItW08XCMv5IVIl5HHCLYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LMMsyCPzkCJfPjVExc1d5rMgT5C2A32XmjLJVnuwgyVwRLBOft+I9PVX1zr0ZX/GdzD32yRm3gYOkVbxxEnYjOe9ADKEhYWTZK/10h+Mm3qgQfzvfha1axzxMa2WazaY9PQ9SsItT1+B8f+SyaGclNDiSOvRk5YwVjuGLy2vQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ib3ZMqae; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ib3ZMqae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790739862; x=1822275862;
  h=date:from:to:cc:subject:message-id;
  bh=Y0K2zu+uBIRUeClUfvA4WqItW08XCMv5IVIl5HHCLYA=;
  b=Ib3ZMqae0RJ8sp3NqMLJ3agQSYNdNA/hhqpWLyHi+4GWrCYh5QwGqefl
   7ejCAY7TxInMxO5A9o3QEPyuQn3ss2pg9B53/ghuzGu5X/fCjU8pOKOAA
   x8HKm87X141MhV/jopo/byBDETha7Edk8MyPoSBhTPPMjUSYQB2mzu/n5
   nqJEWDVABu4uVp2DA1teC0X6LKX11KKkjP4KQmNw9rBpUVcKjgovWqivn
   lTkRK23GtJscymYUwbmvcRK29P0cBfkJHZ6zBPgVKbqYApn8w6D/oPNCG
   bknkBkkXZOW/4zcdXcOrD1JFoap0RH5y8RibkZNtaRE+pq2JIJyNUUfaR
   Q==;
X-CSE-ConnectionGUID: tvbsFNvET9C84kOMgCygNA==
X-CSE-MsgGUID: WIbIRzeyTJSc3u07tddygA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="101994843"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101994843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 20:44:22 -0700
X-CSE-ConnectionGUID: vgSK0wyTTAy9uIYGcN9KGw==
X-CSE-MsgGUID: u59zBe4wQd+y5VOOz0pX7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="273655610"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 29 Sep 2026 20:44:20 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBlEt-000000001jB-47Da;
	Wed, 30 Sep 2026 03:44:15 +0000
Date: Wed, 30 Sep 2026 05:44:01 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 9/26] htmldocs:
 Documentation/driver-api/ctlv.rst:652: WARNING: Explicit markup ends without
 a blank line; unexpected unindent. [docutils]
Message-ID: <202609300542.1d5tRFLl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: d4c78d56bb6c57a152d81d5d8442f520863f503e [9/26] Documentation: ctlv: Describe how to write a family
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260930/202609300542.1d5tRFLl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300542.1d5tRFLl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
>> Documentation/driver-api/ctlv.rst:652: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/ctlv.rst:655: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/ctlv.rst:661: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/linux/device.h:117 struct member 'show_const' not described in 'device_attribute'
   WARNING: ./include/linux/device.h:117 struct member 'store_const' not described in 'device_attribute'
   WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
   WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
   WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'


vim +652 Documentation/driver-api/ctlv.rst

   630	
   631	    struct ctlv_blob_dma *dma;
   632	    struct dma_fence *fence;
   633	    struct sg_table *sgt;
   634	    u64 skip;
   635	
   636	    dma = ctlv_blob_dma_map(blob, dev, &sgt, &skip);
   637	    if (IS_ERR(dma)) {
   638	            ret = PTR_ERR(dma);
   639	            goto out_blob;
   640	    }
   641	    fence = prepare_job(sgt, skip, ctlv_blob_len(blob));
   642	    if (IS_ERR(fence)) {
   643	            ret = PTR_ERR(fence);
   644	            goto out_dma;
   645	    }
   646	    ret = ctlv_blob_dma_begin(dma, fence);
   647	    if (!ret) {
   648	            ret = submit_prepared_job(fence);
   649	            ctlv_blob_dma_submit_done(dma, ret);
   650	    }
   651	    /* On success, the completion path signals fence after hardware stops. */
 > 652	out_dma:
   653	    ctlv_blob_dma_unmap(dma, ret);
   654	    if (!IS_ERR(fence))
   655	            dma_fence_put(fence);
   656	out_blob:
   657	    if (!ret)
   658	            ret = ctlv_blob_put(blob);
   659	    else
   660	            ctlv_blob_put(blob);
 > 661	    return ret;
   662	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
