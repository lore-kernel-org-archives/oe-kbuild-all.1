Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E4374172
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886123; cv=none; b=uFnacuLvU9r5qS8EHSvGLWBvhqo4Tn8DOOiuv/4PhltDaSgj/Jn1D37c1n72mezc8QN2fzTZfudgCPGm5s2wkKKdpnTTQQYLvzQi9TFcGrXhoUIO7f8SeOlO8YSQcYYQyoZnqWgCM4LiDigMAR0y8gSSbxcB05lirsQtQ5tGQy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886123; c=relaxed/simple;
	bh=dfTFzUt0bz+B7xz9LtDQsJYLSKEJ4+AbB962SPifpN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P6/5IBCcN3euNwnYmiyNhUuFKTgvZ8nRfF9lSrCwFHMxXldXhhgrgKrJ666YJoAB8JHrXakGBHHohj6qCaxpJ1/cs7JVVRL7eZ7mZwaPxW0DsR4BvIO7TDTijF/7Pw/wv0JOOwWFdrVMs+hABFLfiOCoEuhpKN2wk9h+91G/Xgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xc31F+jL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xc31F+jL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774886122; x=1806422122;
  h=date:from:to:cc:subject:message-id;
  bh=dfTFzUt0bz+B7xz9LtDQsJYLSKEJ4+AbB962SPifpN8=;
  b=Xc31F+jLUmW1gp+gGneYmgoUFH3YPR8IuZyDJbBfiIvQn64XcXg26VcB
   wUqubmvI434UBC9yXpGUa/12y0IdmcfcKt22JveTuHoPJgZ2aL3+3upqv
   Qt3aPmnmPZ3YPzMW+i3H0hDftA4Kd5QbOb42DUvQL1BPL+pVZnYEEFLdk
   f8z2HdsGnllU5f8mD5keOAtKvoAS/EHaH8zTkO/7PulYI7ldpW2zNP8QA
   7MbqHQOfOnQ+ZPaz9Lbv0ICHvpUDbnAr6m7R6z71EsAqrgwqN2WiKSndm
   RAfpOzdNTruNWqZhzFnww7iDbVu3iccQHG225HZx58dlb8Dl476bDhE+J
   A==;
X-CSE-ConnectionGUID: P8mpMFErQjyzhgMf55CHPw==
X-CSE-MsgGUID: t3KilbF1RXK8X26w8Y+36A==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86575864"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86575864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:55:21 -0700
X-CSE-ConnectionGUID: qvkIlOTURs22iDz+EnspvA==
X-CSE-MsgGUID: 7pnBv8CtRima4U+gGpdRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="219445862"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 08:55:20 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ExR-000000001Hv-3nxf;
	Mon, 30 Mar 2026 15:55:17 +0000
Date: Mon, 30 Mar 2026 23:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 5/5]
 arch/arm64/kvm/mmu.c:305:1: warning: no previous prototype for function
 'kvm_pinned_pages_insert'
Message-ID: <202603302322.Z60xRM1C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 6cf1f36e41a79cd8275eab61d29ad30219b60047 [5/5] ANDROID: KVM: Use interval-tree for kvm_pinned_page
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603302322.Z60xRM1C-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302322.Z60xRM1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302322.Z60xRM1C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:305:1: warning: no previous prototype for function 'kvm_pinned_pages_insert' [-Wmissing-prototypes]
     305 | INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
         | ^
   include/linux/interval_tree_generic.h:38:15: note: expanded from macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |               ^
   <scratch space>:68:1: note: expanded from here
      68 | kvm_pinned_pages_insert
         | ^
   arch/arm64/kvm/mmu.c:305:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   include/linux/interval_tree_generic.h:38:10: note: expanded from macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |          ^
   arch/arm64/kvm/mmu.c:1842:14: warning: variable 'ipa' set but not used [-Wunused-but-set-variable]
    1842 |         phys_addr_t ipa = fault_ipa;
         |                     ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/kvm_pinned_pages_insert +305 arch/arm64/kvm/mmu.c

   304	
 > 305	INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
   306			     __pinned_page_start, __pinned_page_end, /* emtpy */,
   307			     kvm_pinned_pages);
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
