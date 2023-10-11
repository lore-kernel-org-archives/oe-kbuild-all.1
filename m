Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1DA1376
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSkGLUOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696982443; x=1728518443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=61CSmAcGuauuSVvMGp/INuw0R70y32pZsGeyJDpQzPw=;
  b=VSkGLUOUGC8vEDEhLcxYqICsdXOIpyqnVCZdaOkuTbJc4Fi8HDsOw1ah
   Ku6yzsgXXLjkXK8aHN8Rc8fodyuolLRo+YwDw18jUIuehkMO0cqiezSfk
   8WoCifaZ6uF+Jn+iTYTwYHod0Toie2gx7wTRYymL4WAeFjNbAlQHnHXfb
   dtxe9qvhk7G91xl6Oehl+LmC58ZopRt3tCkZ3aXgiySsr+JbG7J/RMBv4
   SBSM73goU8svJU+wn2M2FouWdtSm63ozjF19Ry3efsVZja1/rbJvGAY1K
   oJKCVbUAuMGEK32twqSUomcsx2VJaIJTUYZ6wkO2fucn1NhuAaTJ07OC4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="364824675"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="364824675"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 17:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1084996428"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="1084996428"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2023 17:00:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqMeT-0001PY-2s;
	Wed, 11 Oct 2023 00:00:37 +0000
Date: Wed, 11 Oct 2023 08:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [RFC PATCH 10/10] drm/i915: Use selective tlb
 invalidations where supported
Message-ID: <202310110746.Z6L3SNHT-lkp@intel.com>
References: <20231010184641.2119129-11-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010184641.2119129-11-jonathan.cavitt@intel.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-i915-Add-GuC-TLB-Invalidation-device-info-flags/20231011-030038
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231010184641.2119129-11-jonathan.cavitt%40intel.com
patch subject: [Intel-gfx] [RFC PATCH 10/10] drm/i915: Use selective tlb invalidations where supported
config: i386-buildonly-randconfig-002-20231011 (https://download.01.org/0day-ci/archive/20231011/202310110746.Z6L3SNHT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110746.Z6L3SNHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110746.Z6L3SNHT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma.c:1343:25: error: expected ';', ',' or ')' before 'u64'
    1343 |                         u64 start, u64 size)
         |                         ^~~


vim +1343 drivers/gpu/drm/i915/i915_vma.c

  1341	
  1342	void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb
> 1343				u64 start, u64 size)
  1344	{
  1345		struct intel_gt *gt;
  1346		int id;
  1347	
  1348		if (!tlb)
  1349			return;
  1350	
  1351		/*
  1352		 * Before we release the pages that were bound by this vma, we
  1353		 * must invalidate all the TLBs that may still have a reference
  1354		 * back to our physical address. It only needs to be done once,
  1355		 * so after updating the PTE to point away from the pages, record
  1356		 * the most recent TLB invalidation seqno, and if we have not yet
  1357		 * flushed the TLBs upon release, perform a full invalidation.
  1358		 */
  1359		for_each_gt(gt, vm->i915, id) {
  1360			if (!intel_gt_invalidate_tlb_range(gt, start, size))
  1361				WRITE_ONCE(tlb[id],
  1362					   intel_gt_next_invalidate_tlb_full(gt));
  1363		}
  1364	}
  1365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
