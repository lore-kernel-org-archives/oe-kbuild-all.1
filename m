Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3A3242936
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746756678; cv=none; b=Lic9D4vAzCDbx/SqyQGPPvsAUMYqyhHQItOVVQHtFpdFw2MxkO8fVq8Ws6v8s5A7pRo5Yqt1vWROMdhWafMiEhnXw2hwcdG7bAKyK5AhfstHi6np2Lv3EPsSxhC0iBPOOoAc1g3pkS8zvmivzZs+vORC8ujwbS5UlkgVMIN/Yfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746756678; c=relaxed/simple;
	bh=7bAJEm1E0DzqLoRlnuyIXGeyGi7ttVcEfRAy2mAC4K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=otZWDDANxm6OV7CaoH/cFT28CUhQLbPKp2PESQFK0RqU95veCbyVd5kZqNnxlPmD3Dx0fxxIt8UW0dwc9Lf4ml/EGCSHXRSi34Gj1pTENNeYjLAp1OJkaImv52k/VgjgjASBxw/6N4u5/VlPRi1OwV3XKxdcmKal9D5kxY4s3jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdWEX9f6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdWEX9f6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746756676; x=1778292676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7bAJEm1E0DzqLoRlnuyIXGeyGi7ttVcEfRAy2mAC4K0=;
  b=cdWEX9f6yE9at9m0d9ZDlOmZ3PPsqPv9TRi5VUwM+XaiFltUtUaq8szH
   JWiql7q9Q0EG36wpKGcsJ2fgGSOuSaSwYEuxgO5+agBEbaXysYOwO3sO+
   XgaxCWLRtAuPgYh52XiIJ5scJHQUwy5t6wv4zBwHRvm0KQO7oUNTg0f9q
   FhmIJOU6eD24pX6jRjrqI+bgU51e4JDGSSbFonwJ5zpmOtXH8677y+esY
   6f3aS07tLkTK6iARHuSGbSLizzkReOjAX65KPm/1+Hvhfj9hpsFGzxHV7
   jSzbNDC35Mz09O6NQ4YcXgKOAE3Y8KbHJx0fM9X7xTBm26wRAa0wjmn9O
   w==;
X-CSE-ConnectionGUID: nvUEDgFbSdy/g4JIJgjIpA==
X-CSE-MsgGUID: uiDMJO09RrWcO9fb4OtVWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48478484"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48478484"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:11:14 -0700
X-CSE-ConnectionGUID: 0j8fKaBQQRycDerYL462tw==
X-CSE-MsgGUID: +4aTdZJSQnKlLlevAmzD7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136179901"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2025 19:11:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDDCf-000BaB-25;
	Fri, 09 May 2025 02:11:09 +0000
Date: Fri, 9 May 2025 10:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>,
	Kalyan Alle <kalyan.alle@intel.com>,
	"Kooran Paul, Princy" <princy.kooran.paul@intel.com>
Subject: [intel-lts:6.12/linux 4/4]
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c:484: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202505091030.Vqa0IZPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   a9d3931257c927df409a753fabaad47d34915467
commit: a9d3931257c927df409a753fabaad47d34915467 [4/4] drm/i915: SR-IOV Save-Restore Feature support
config: i386-buildonly-randconfig-003-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091030.Vqa0IZPJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091030.Vqa0IZPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091030.Vqa0IZPJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/gen8_engine_cs.c:484: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Retrieve the ring position initial breadcrumb for given request.
   drivers/gpu/drm/i915/gt/gen8_engine_cs.c:700: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Fill an area of a ring with NOOP instructions.
   drivers/gpu/drm/i915/gt/gen8_engine_cs.c:725: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Refreshes commands on the ring associated to init_breadcrumb command packet.
   drivers/gpu/drm/i915/gt/gen8_engine_cs.c:769: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Refreshes commands on the ring associated to bb_start command packet.
--
>> drivers/gpu/drm/i915/gt/intel_ggtt.c:830: warning: Function parameter or struct member 'ggtt' not described in 'i915_ggtt_address_lock_init'
>> drivers/gpu/drm/i915/gt/intel_ggtt.c:830: warning: Excess function parameter 'i915' description in 'i915_ggtt_address_lock_init'
>> drivers/gpu/drm/i915/gt/intel_ggtt.c:840: warning: Function parameter or struct member 'ggtt' not described in 'i915_ggtt_address_lock_fini'
>> drivers/gpu/drm/i915/gt/intel_ggtt.c:840: warning: Excess function parameter 'i915' description in 'i915_ggtt_address_lock_fini'


vim +484 drivers/gpu/drm/i915/gt/gen8_engine_cs.c

   482	
   483	/**
 > 484	 * Retrieve the ring position initial breadcrumb for given request.
   485	 * @rq: the request instance
   486	 *
   487	 * Return: Ring position of commands emited by emit_init_breadcrumb().
   488	 */
   489	u32 get_init_breadcrumb_pos(struct i915_request *rq)
   490	{
   491		if (!rq->engine->emit_init_breadcrumb)
   492			return rq->infix;
   493	
   494		GEM_BUG_ON(rq->engine->emit_init_breadcrumb != gen8_emit_init_breadcrumb);
   495	
   496		if (!intel_timeline_has_initial_breadcrumb(rcu_access_pointer(rq->timeline)))
   497			return rq->infix;
   498	
   499		if (__intel_ring_count(rq->head, rq->infix, rq->ring->size) >
   500				GEN8_EMIT_INIT_BREADCRUMB_NUM_DWORDS * sizeof(u32))
   501			return intel_ring_wrap(rq->ring, rq->infix -
   502					       GEN8_EMIT_INIT_BREADCRUMB_NUM_DWORDS * sizeof(u32));
   503	
   504		return rq->head;
   505	}
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
