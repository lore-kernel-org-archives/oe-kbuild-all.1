Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7894A30C602
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765576656; cv=none; b=rMrH6V64Cv+rHu1XKvr8D4YILMTVQZ12kisLky3wqJBi9nhx8yybsZFekFyCmEq166IOHIpwUh5ROvIHcv5xpAf44K2Nz6w7KpU6jRtOUbazeCP5kPTAzqnShwaLcJiyv1wk1t3+hxzEz49xtqTDQHTDLjNZ1Ps9q7AfxxilmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765576656; c=relaxed/simple;
	bh=hEs1OKxj+EEeDyYbEsRolyw4Z0Sp7iOJdSxVam0CMo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ue4aCDXzGr2QgepEiGvaBDWz+bRqq/ku4+/Us5ZKptrbHy+FFIJU06R6hU7UsecnJV9LXQN/zFVRLDAnFj799LQxyg4XIKrOCG8peyr1u4wxBhd4PIpbvPlVxnv/9oooOA3ID9sP4QheLSO+WukuiOjW40xgzqPfuz/N6/ANSNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KW+3YnLD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW+3YnLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765576654; x=1797112654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEs1OKxj+EEeDyYbEsRolyw4Z0Sp7iOJdSxVam0CMo0=;
  b=KW+3YnLD9owCHGIkQ/GOLi6JXuyfrkPFXNK0RcFNDOwi/yKu0+rwa1lq
   OGoUFx+IXh1dlPb7O+Ee5GD4fzJG2zWCN0Bx8+O7yPIbZjq4KI5gcjf5D
   GoysNnek24wl+Eqaiirp+dbk2al4QfYioBucU961SWAd4VHGAVpgfkOW2
   cPgbYrPEbDpbdtiAySBCViZxVa5WvY+tGlhBZsF4pOiRxrHwvH0egu9c0
   fqGpJagGc2VBJ5IcE3D7BKeW0axVDJu5zxRRhr1jw+ROQ60p9jOWLLLKV
   RvHmqa8cSzm7Ys5FE8ZSkft4que5xIIW1ngIWq7J8MwGvT6I107bnh7Wv
   Q==;
X-CSE-ConnectionGUID: FEtBhWXmQsOga0vrS5Bxow==
X-CSE-MsgGUID: PnuFxTd7ScWxQN8kTDQI/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="84992734"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="84992734"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:57:34 -0800
X-CSE-ConnectionGUID: kZwDPuyRQEWYT+gBpQGxWQ==
X-CSE-MsgGUID: vtvdSCR1SAid81Jawm7Lkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196263040"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 13:57:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUB8k-000000006g5-3MhU;
	Fri, 12 Dec 2025 21:57:30 +0000
Date: Sat, 13 Dec 2025 05:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has
 incomplete type
Message-ID: <202512130507.T0QDMaph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: f8ecd866e541b10a412882b8e0b0d02c1a17df8d [18/18] ANDROID: pkvm: x86: Hypercalls for scalable mode context update.
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130507.T0QDMaph-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130507.T0QDMaph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130507.T0QDMaph-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~


vim +/sm_context_param +268 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
   266		struct pkvm_lm_context_param lm_context_param;
   267		struct pkvm_clear_translation_param clear_translation_param;
 > 268		struct pkvm_sm_context_param sm_context_param;
   269	} __aligned(PAGE_SIZE);
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
