Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DE92BD580
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762212205; cv=none; b=Aj3W4AZZvMloOoZuLx5MJPJmSEdVv1WVcgkYq1yt4UDAP2zkxFhcwgFEae6irn6BNU5K8eCXlQPZ+ofTLAsWbtFqDg+kxbkVFZhgWijQvjj+EIfWk/+HQiz6CnZcEJOF/09D3Jr3/x4eVzJkxI2mgcFsD2dN2CrPQAhj7uamL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762212205; c=relaxed/simple;
	bh=xNLK1wdIfZOsScfbVupV47XlEa/Umal8aUOvHphFR0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epGJCSfjE2zRABa5oKF2TDrQs9GAnQmtuSQfqZlLrd9GoCrs9Py42GRoPTjZuU9F31a3YjLEy+xtTTzASYjgntrGv9it4kI5dLphG/YIyeIY3x/30UlCtQwpgYn1+jIdKhcygskzapqplRzl/X8yetm4oenWDj0yidWvwJty+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaCj/gGA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaCj/gGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762212203; x=1793748203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xNLK1wdIfZOsScfbVupV47XlEa/Umal8aUOvHphFR0g=;
  b=BaCj/gGAHYAfbeHvwUHzqJQPrjMAa/Srne+pZ1CZQmUeyvW+EQOMHJuC
   /oJYhV8EEyszwFMXlLQW6Q92A2CkzQCbhvL1agjqdHuYkgnPedfo4dFY4
   3Gq66tSs1YARvUzoRC3B0QeQ2ZF3U3Ig9w44pQ359DFFp5ac6JJ8D3ynV
   onXigqznzlQJqeHJPRMnnMoE9jnidcAC5663GTfNKDvMO0fVQlva/vFbz
   KDjW+Qq0Xwg5xPD1a4Ii3bGpU9BTbZzZGlqnmvnrnblJwRN2wB9YKdSbP
   0gRQgsXoTcvqSY32gbNoBFXuu5++t20hDcIqWHcdP/isHBVpm9QaWWWDZ
   A==;
X-CSE-ConnectionGUID: +8LO9CH1Q6GT4cqa/SlqTA==
X-CSE-MsgGUID: ki3zLtIQRVKmrOtbTojmeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="67953309"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="67953309"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 15:23:23 -0800
X-CSE-ConnectionGUID: IK8WnlgLSJ+gTmB3TWjKvQ==
X-CSE-MsgGUID: Wov/dQgQS5W6BgPZEKblMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="192159002"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Nov 2025 15:23:22 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG3tQ-000QcG-07;
	Mon, 03 Nov 2025 23:23:20 +0000
Date: Tue, 4 Nov 2025 07:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/modules.c:276:5: warning: no previous prototype for
 'module_map_module_page'
Message-ID: <202511040738.WSjRnRR6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   26e1a088be7385576cdb9d4d3f749c0b485a5e2e
commit: db8bad4a59d2609e1ec4c6da947554ab51901f4a [1/1] ANDROID: KVM: arm64: Expose unmap_module_page to modules
config: arm64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040738.WSjRnRR6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040738.WSjRnRR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040738.WSjRnRR6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/modules.c:276:5: warning: no previous prototype for 'module_map_module_page' [-Wmissing-prototypes]
     276 | int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/modules.c:282:5: warning: no previous prototype for 'module_map_module_pages' [-Wmissing-prototypes]
     282 | int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/modules.c:288:5: warning: no previous prototype for 'module_unmap_module_pages' [-Wmissing-prototypes]
     288 | int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


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
