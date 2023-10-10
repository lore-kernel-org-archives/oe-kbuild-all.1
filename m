Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267732C60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 22:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4R8F/as"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696975577; x=1728511577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tUAI/OKUW+RwqUf5zcVVMc6c0/m3TAGXCGn+XJctzDM=;
  b=n4R8F/asgLFCl4IpY6BLhTib74aZwBHg+amZr7wVzbw+70MAxqWbYPe4
   de03BYT1+gYUmFy3rXRWS7dNob6X9vMgJ5FNjYz1AxdRWEpafPNuDmboO
   vFQ6np3vcWqUMHNahAPW4XwwNzbIXnql7+me65Rk9ZBmMu7w9WacMzyfm
   DEoS1hBNZgt9pXvFimH8d2ofHGnpmfICHopATN0MAyRdi88zrOmc6eTQ0
   IbZs5r1Z5pQu+LcH1ipR5jnX+2vBQbA457+5C0h+JZYbtgtHvaY1WGvkQ
   /sY7IxEQlhA0j863VVUpG0TTb58WuP1z0/L72TbGSc0Ocw8a+A9jICNZ6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470780083"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="470780083"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 15:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="783026333"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="783026333"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Oct 2023 15:06:15 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqKrj-0001Gy-0i;
	Tue, 10 Oct 2023 22:06:12 +0000
Date: Wed, 11 Oct 2023 06:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [RFC PATCH 08/10] drm/i915: Define GuC Based TLB
 invalidation routines
Message-ID: <202310110557.mXDnI7aY-lkp@intel.com>
References: <20231010184641.2119129-9-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010184641.2119129-9-jonathan.cavitt@intel.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-i915-Add-GuC-TLB-Invalidation-device-info-flags/20231011-030038
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231010184641.2119129-9-jonathan.cavitt%40intel.com
patch subject: [Intel-gfx] [RFC PATCH 08/10] drm/i915: Define GuC Based TLB invalidation routines
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110557.mXDnI7aY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110557.mXDnI7aY-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#95: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4825:
+	u32 size = ARRAY_SIZE(action);
+	return guc_send_invalidate_tlb(guc, action, size);

ERROR:CODE_INDENT: code indent should use tabs where possible
#139: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4869:
+                                                enum intel_guc_tlb_inval_mode mode,$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#139: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4869:
+                                                enum intel_guc_tlb_inval_mode mode,$

ERROR:CODE_INDENT: code indent should use tabs where possible
#140: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4870:
+                                                u64 start, u64 length, u32 ctxid)$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#140: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4870:
+                                                u64 start, u64 length, u32 ctxid)$

ERROR:CODE_INDENT: code indent should use tabs where possible
#142: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4872:
+        u64 vm_total = BIT_ULL(RUNTIME_INFO(guc_to_gt(guc)->i915)->ppgtt_size);$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#142: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4872:
+        u64 vm_total = BIT_ULL(RUNTIME_INFO(guc_to_gt(guc)->i915)->ppgtt_size);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#143: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4873:
+        u32 address_mask = (ilog2(length) - ilog2(I915_GTT_PAGE_SIZE_4K));$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#143: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4873:
+        u32 address_mask = (ilog2(length) - ilog2(I915_GTT_PAGE_SIZE_4K));$

ERROR:CODE_INDENT: code indent should use tabs where possible
#144: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4874:
+        u32 full_range = vm_total == length;$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#144: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4874:
+        u32 full_range = vm_total == length;$

ERROR:CODE_INDENT: code indent should use tabs where possible
#145: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4875:
+        u32 action[] = {$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#145: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4875:
+        u32 action[] = {$

ERROR:CODE_INDENT: code indent should use tabs where possible
#146: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4876:
+                INTEL_GUC_ACTION_TLB_INVALIDATION,$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#146: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4876:
+                INTEL_GUC_ACTION_TLB_INVALIDATION,$

ERROR:CODE_INDENT: code indent should use tabs where possible
#147: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4877:
+                0,$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#147: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4877:
+                0,$

ERROR:CODE_INDENT: code indent should use tabs where possible
#148: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4878:
+                REG_FIELD_PREP(INTEL_GUC_TLB_INVAL_TYPE_MASK,$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#148: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4878:
+                REG_FIELD_PREP(INTEL_GUC_TLB_INVAL_TYPE_MASK,$

ERROR:CODE_INDENT: code indent should use tabs where possible
#150: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4880:
+                        REG_FIELD_PREP(INTEL_GUC_TLB_INVAL_MODE_MASK, mode) |$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#150: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4880:
+                        REG_FIELD_PREP(INTEL_GUC_TLB_INVAL_MODE_MASK, mode) |$

ERROR:CODE_INDENT: code indent should use tabs where possible
#151: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4881:
+                        INTEL_GUC_TLB_INVAL_FLUSH_CACHE,$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#151: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4881:
+                        INTEL_GUC_TLB_INVAL_FLUSH_CACHE,$

ERROR:CODE_INDENT: code indent should use tabs where possible
#152: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4882:
+                ctxid,$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#152: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4882:
+                ctxid,$

ERROR:CODE_INDENT: code indent should use tabs where possible
#153: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4883:
+                full_range ? full_range : lower_32_bits(start),$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#153: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4883:
+                full_range ? full_range : lower_32_bits(start),$

ERROR:CODE_INDENT: code indent should use tabs where possible
#154: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4884:
+                full_range ? 0 : upper_32_bits(start),$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#154: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4884:
+                full_range ? 0 : upper_32_bits(start),$

ERROR:CODE_INDENT: code indent should use tabs where possible
#155: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4885:
+                full_range ? 0 : address_mask,$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#155: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4885:
+                full_range ? 0 : address_mask,$

ERROR:CODE_INDENT: code indent should use tabs where possible
#156: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4886:
+        };$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#156: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4886:
+        };$

ERROR:CODE_INDENT: code indent should use tabs where possible
#158: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4888:
+        GEM_BUG_ON(length < SZ_4K);$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#158: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4888:
+        GEM_BUG_ON(length < SZ_4K);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#159: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4889:
+        GEM_BUG_ON(!is_power_of_2(length));$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#159: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4889:
+        GEM_BUG_ON(!is_power_of_2(length));$

ERROR:CODE_INDENT: code indent should use tabs where possible
#160: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4890:
+        GEM_BUG_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#160: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4890:
+        GEM_BUG_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));$

ERROR:CODE_INDENT: code indent should use tabs where possible
#161: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4891:
+        GEM_BUG_ON(!IS_ALIGNED(start, length));$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#161: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4891:
+        GEM_BUG_ON(!IS_ALIGNED(start, length));$

ERROR:CODE_INDENT: code indent should use tabs where possible
#162: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4892:
+        GEM_BUG_ON(range_overflows(start, length, vm_total));$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#162: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4892:
+        GEM_BUG_ON(range_overflows(start, length, vm_total));$

ERROR:CODE_INDENT: code indent should use tabs where possible
#164: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4894:
+        return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#164: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4894:
+        return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));$

WARNING:LINE_SPACING: Missing a blank line after declarations
#181: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4910:
+	u32 size = ARRAY_SIZE(action);
+	return guc_send_invalidate_tlb(guc, action, size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
