Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD1E3FFD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 22:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765580018; cv=none; b=YdLdd7RKM9BdDEpjDwt7ucFe52CI11la+GNZvtuySc5IDDACEAoZ3bdO9gv9vF3M1f+5Wim5oyFgWVl4SJSgCB4NKaDLUi0cZkqMDRj07yeeLAZN7PCkunjrkEWlhoAj8MhH+92xrRWVtxWbfUNh3X5m7Pb7fnF8YnzHVbzaooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765580018; c=relaxed/simple;
	bh=nn9VIisgGyDpL86IsFNqHz9UJUzbrVhx0P5Bd7L5vkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cwQEjHxDQPbDiPoCEvAsTrie9dnSyw9PLpq6sM4M/3U+8dmdmEfhlV8g4drkxyoINTR9+EUPH9k+GXICXkBA5p+CBDNqMZBE/VhswkYImyPzG1yyOjG2/FAC8KX7/+PWrakxso4JnDk8xrxeO7iIbzS3dCYGHUKX480YqNwqhaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwzoPZ27; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwzoPZ27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765580017; x=1797116017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nn9VIisgGyDpL86IsFNqHz9UJUzbrVhx0P5Bd7L5vkg=;
  b=hwzoPZ275iUzIh5QHQy7YRYSkNrUcOKPhQKMIodZJ96zBGm6T4tQ66mH
   aVwwOYh5U6+4zZkKAytd6KdjbSvJxmoyxLY9jiNx3WXhbXXsi9pvrQtZd
   nTXP2v5wjIdvkugQRoTbHsPSBJBPuO3fbqD03ywhWFL/73tk+BrKw3b37
   Rh6OARrAqyNKho5cJvMY0cdxE4NQ9dUSNGrlARnrwtCysSmLiGEacnVUo
   B/bZkXUlF3yfTLfqOpRuOApgxHZjQ8l/H27DCJH9jMguyovO3PRnZ3MF2
   HSWF8BMPsZO6eapJd+ihHVdfusJHqDsblLlx45wRZzn1d5uBkLIfLljcX
   A==;
X-CSE-ConnectionGUID: GAyAMj+uQbWxf0vnZybyDg==
X-CSE-MsgGUID: V6ZOrUoPSD+FaVaZnodzPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67464334"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67464334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:53:36 -0800
X-CSE-ConnectionGUID: htmNfRdyTMaUvt7ysKQFxg==
X-CSE-MsgGUID: 4DNv7qqrQBiax/tPj8gdnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197099426"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 14:53:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUC0y-000000006j7-3q03;
	Fri, 12 Dec 2025 22:53:32 +0000
Date: Sat, 13 Dec 2025 06:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 arch/x86/include/asm/kvm_pkvm.h:269:39: error: field 'pasid_table_param' has
 incomplete type
Message-ID: <202512130606.PgiuLcYl-lkp@intel.com>
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
commit: c3227e233875bf000ec6fc62cb11729cc3325c62 [18/18] ANDROID: pkvm: x86: PASID Table update hypercalls
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130606.PgiuLcYl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130606.PgiuLcYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130606.PgiuLcYl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:269:39: error: field 'pasid_table_param' has incomplete type
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^~~~~~~~~~~~~~~~~


vim +/pasid_table_param +269 arch/x86/include/asm/kvm_pkvm.h

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
   268		struct pkvm_sm_context_param sm_context_param;
 > 269		struct pkvm_pasid_table_param pasid_table_param;
   270	} __aligned(PAGE_SIZE);
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
