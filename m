Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F9234D3A7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762356821; cv=none; b=nJr4hsE8yleK2Pn9zwbIHBueyWkFfFGt9fQPeQmuVTuVgxdGpzWTg9D3Za2KBYW3yvh5TZOfxACB/4BpvOEWhBNLBpoFOjwa8kg9Qz1K+IUvzcW0B3T6BH5rWT5CmOiOlgDRgnyPi9nt8sbEAUzOeVZp+786lo+oQqk/cYmM3AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762356821; c=relaxed/simple;
	bh=P465Df+Wcw9esl9Mg+n3mlhE4wZRO3IZf6ZZP4EYSmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ivbl2Hcqnh6MPd1iTF9n0hLnPaFsYtv/RvCPtOdGcUC/ArT+Tm4jB+uVGiE+IvhBMuZoEC/ORMdvAGQ+T8UEEvSfMFdLSV5GAMYFv2CovHQwBezUbJ1PmT9aG0IOq9uDpVn3h7IqHwJ6cxpfry2VyoNMpfbY2DeFvjoF4a1c0J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zk74pMBC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk74pMBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762356821; x=1793892821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P465Df+Wcw9esl9Mg+n3mlhE4wZRO3IZf6ZZP4EYSmw=;
  b=Zk74pMBCnKMNCLuXmjSi38SH8psG0h6fYPwo/xUq+XGD40kzuR8V33Di
   ckFxpBLqlFUUz3qFtzA0KLy1aEa5wgLy1T767ZHRxkXjjz4lHQxprOuwd
   b5cP6C4vK18HcatRa8Y2FLZPDWMTFsO4LbEMJJocNA+56Nchqh9YHlYzG
   mTuXfgncxDyC710RktvII9ot67g6MVEEXrH57mgOPNRLYsH9EtyTT8ROj
   KN91f7GXz/G08yvRzF6N/5am7RYW6hvtkxF1uV1hyNrGYUQTe3TapcOz7
   WLb6GZu6NKGCtkrG0HXHQ3VCN8di9dNLOyYgQZ3FyKakhTmjTA2R8RESn
   g==;
X-CSE-ConnectionGUID: DBX0yl5oT1CxYdV36EJPDw==
X-CSE-MsgGUID: 9Pj9Fjg5TfuhETJ5y29iEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81877712"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="81877712"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 07:33:40 -0800
X-CSE-ConnectionGUID: 8IJp9kTjQNmxfwf2WctBAA==
X-CSE-MsgGUID: CWRpFZrlSMiDNmERmgWr0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="186772518"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Nov 2025 07:33:39 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGfV9-000Sm2-1R;
	Wed, 05 Nov 2025 15:33:02 +0000
Date: Wed, 5 Nov 2025 23:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 arch/arm64/kvm/hyp/nvhe/modules.c:276:5: warning: no previous prototype for
 function 'module_map_module_page'
Message-ID: <202511052337.bMji8ryi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d094009d1e30c716d38ece606426186229810aa6
commit: db8bad4a59d2609e1ec4c6da947554ab51901f4a [2/2] ANDROID: KVM: arm64: Expose unmap_module_page to modules
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251105/202511052337.bMji8ryi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052337.bMji8ryi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052337.bMji8ryi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/modules.c:276:5: warning: no previous prototype for function 'module_map_module_page' [-Wmissing-prototypes]
     276 | int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
         |     ^
   arch/arm64/kvm/hyp/nvhe/modules.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/modules.c:282:5: warning: no previous prototype for function 'module_map_module_pages' [-Wmissing-prototypes]
     282 | int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
         |     ^
   arch/arm64/kvm/hyp/nvhe/modules.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     282 | int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/modules.c:288:5: warning: no previous prototype for function 'module_unmap_module_pages' [-Wmissing-prototypes]
     288 | int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
         |     ^
   arch/arm64/kvm/hyp/nvhe/modules.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     288 | int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
         | ^
         | static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/module_map_module_page +276 arch/arm64/kvm/hyp/nvhe/modules.c

   275	
 > 276	int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
   277				   bool is_protected)
   278	{
   279		return __pkvm_map_module_pages(pfn, va, 1, prot, is_protected);
   280	}
   281	
 > 282	int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
   283				   bool is_protected)
   284	{
   285		return __pkvm_map_module_pages(pfn, va, nr_pages, prot, is_protected);
   286	}
   287	
 > 288	int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
   289	{
   290		return __pkvm_unmap_module_pages(pfn, va, nr_pages);
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
