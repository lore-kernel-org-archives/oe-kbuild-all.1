Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89EE20323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIXmGZfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699636587; x=1731172587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHlPkhGQepRa2b05cK7LcbIRx4+0xg6F6OrAUzIsw7w=;
  b=CIXmGZfnt6ElaxAwJD0WC0qcLfBxAvvzhHSU17EZokTIl43rdRg2A0tV
   un+aAXCaCfnxXl+IqRBtuls5Wh8xdsFUuAzxcbpi1eGyjrTei1IXenTDA
   aALt+4zLgAYPViizGI2LG8Y+1/J7B7T7JjF/r8WKWUOj8cCouXIyMFR/w
   ntqGwtj5W9GRelAzuZXGDmM1WNjypaZHz/yeGAxQOOowIqBKVsOcVhSuy
   0Sx0CB5HfwYDGk4CiBo7l2NVe01BPa5sdvYvnPQdJvZ69nBDYmE3yCe1j
   BYhUXSS3f+6M3lxbcNjpDT8cE3T0l41zwkg26upSqyTipHNcCg2xkJCdi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="3195484"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="3195484"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 09:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="713684026"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="713684026"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Nov 2023 09:15:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1V5z-0009ls-1Q;
	Fri, 10 Nov 2023 17:15:03 +0000
Date: Sat, 11 Nov 2023 01:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Zhipeng Gong <zhipeng.gong@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	"He, Min" <min.he@intel.com>, Zhao Yakui <yakui.zhao@intel.com>
Subject: [intel-lts:4.19/android_t 3688/30000]
 drivers/gpu/drm/i915/i915_gem_gtt.c:1022:39: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202311110130.RA4NPMiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: f1964915364c169131ec07afef206ecaa773843b [3688/30000] drm/i915/gvt: notify ppgtt update through g2v
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20231111/202311110130.RA4NPMiH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110130.RA4NPMiH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110130.RA4NPMiH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_gem_gtt.c:1022:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1022:39: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1022:39: sparse:     got unsigned long long *
   drivers/gpu/drm/i915/i915_gem_gtt.c:1023:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1023:37: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1023:37: sparse:     got unsigned long long *
   drivers/gpu/drm/i915/i915_gem_gtt.c:1024:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1024:38: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1024:38: sparse:     got unsigned long long *
   drivers/gpu/drm/i915/i915_gem_gtt.c:1271:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1271:55: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1271:55: sparse:     got unsigned long long *
   drivers/gpu/drm/i915/i915_gem_gtt.c:1272:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1272:50: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1272:50: sparse:     got unsigned long long *
   drivers/gpu/drm/i915/i915_gem_gtt.c:1273:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1273:49: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1273:49: sparse:     got unsigned long long *
>> drivers/gpu/drm/i915/i915_gem_gtt.c:1274:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned int * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1274:46: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1274:46: sparse:     got unsigned int *
   drivers/gpu/drm/i915/i915_gem_gtt.c:1549:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1549:39: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1549:39: sparse:     got unsigned long long *
   drivers/gpu/drm/i915/i915_gem_gtt.c:1550:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1550:37: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1550:37: sparse:     got unsigned long long *
   drivers/gpu/drm/i915/i915_gem_gtt.c:1551:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long * @@
   drivers/gpu/drm/i915/i915_gem_gtt.c:1551:38: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/i915/i915_gem_gtt.c:1551:38: sparse:     got unsigned long long *
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: cleanup_scratch_page()+0x3e: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: bdw_private_pat_update_hw()+0xb9: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: pot_hole()+0xf9: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: __shrink_hole()+0x8d: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: drunk_hole()+0x15c: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: igt_ggtt_page()+0x690: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: lowlevel_hole()+0x194: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: pd_vma_unbind()+0xa9: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: gen8_ppgtt_insert_huge_entries()+0x773: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: gen8_ppgtt_insert_4lvl()+0x638: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: vm_alloc_page.constprop.0()+0x412: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: gen8_ppgtt_alloc_pdp()+0x301: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: gen8_ppgtt_clear_4lvl()+0x220: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: gen8_ppgtt_alloc_4lvl()+0x289: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: gen8_ppgtt_cleanup()+0x72: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: gen8_ppgtt_create()+0x1ba: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: igt_gtt_reserve()+0x9f6: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: intel_sanitize_enable_ppgtt()+0xf0: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: i915_ppgtt_create()+0xd0: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: i915_ppgtt_release()+0x9f: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: igt_ppgtt_alloc()+0x2ce: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: i915_gem_gtt_finish_pages()+0xa0: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: i915_gem_init_ggtt()+0xcf: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/i915_gem_gtt.o: warning: objtool: igt_gtt_insert()+0x737: sibling call from callable instruction with modified stack frame

vim +1022 drivers/gpu/drm/i915/i915_gem_gtt.c

   989	
   990	/* Removes entries from a single pml4.
   991	 * This is the top-level structure in 4-level page tables used on gen8+.
   992	 * Empty entries are always scratch pml4e.
   993	 */
   994	static void gen8_ppgtt_clear_4lvl(struct i915_address_space *vm,
   995					  u64 start, u64 length)
   996	{
   997		struct i915_hw_ppgtt *ppgtt = i915_vm_to_ppgtt(vm);
   998		struct i915_pml4 *pml4 = &ppgtt->pml4;
   999		struct i915_page_directory_pointer *pdp;
  1000		unsigned int pml4e;
  1001		u64 orig_start = start;
  1002		u64 orig_length = length;
  1003	
  1004		GEM_BUG_ON(!use_4lvl(vm));
  1005	
  1006		gen8_for_each_pml4e(pdp, pml4, start, length, pml4e) {
  1007			GEM_BUG_ON(pdp == vm->scratch_pdp);
  1008	
  1009			if (!gen8_ppgtt_clear_pdp(vm, pdp, start, length))
  1010				continue;
  1011	
  1012			gen8_ppgtt_set_pml4e(pml4, vm->scratch_pdp, pml4e);
  1013	
  1014			free_pdp(vm, pdp);
  1015		}
  1016	
  1017		if (PVMMIO_LEVEL(vm->i915, PVMMIO_PPGTT_UPDATE)) {
  1018			struct drm_i915_private *dev_priv = vm->i915;
  1019			struct pv_ppgtt_update *pv_ppgtt =
  1020						&dev_priv->shared_page->pv_ppgtt;
  1021	
> 1022			writeq(px_dma(pml4), &pv_ppgtt->pdp);
  1023			writeq(orig_start, &pv_ppgtt->start);
  1024			writeq(orig_length, &pv_ppgtt->length);
  1025			I915_WRITE(vgtif_reg(g2v_notify), VGT_G2V_PPGTT_L4_CLEAR);
  1026		}
  1027	}
  1028	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
