Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166724A7D5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736965029; cv=none; b=kDuA4X5p50g1EBpjCtHlMi3Hrol2JZVRdqtB1+SjhHfJg2BGyhySIP3DIEQ9r74uVvTRICAUEUDZ6XcUDSavmZN9/i90yR8WKY1NxLWZSznAxGDOgzBg2Tpc4pkuLHrMvsVkt3O2knqJO4JnePCJ0hhzGWyXbnt2lX5Uk+OlQoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736965029; c=relaxed/simple;
	bh=P/bZgd5vSjwBAkzpTMdEHM916XP+pXvIuXMySidlapU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=at7gonwTdTuknTsOVtz5/Lw6mFpoUpDKfBsqq40pPsOOTWGnhYk3VkPm519k6U9BogT7DYz/AO0fiDZpWBabBhtjLRtacxsTA9yWXuNeSdPsNKqAgJcvhfGkOQbaXJ15UZ7uRuo1LyO16F1aRcFssZX6nR+tILFglmN2xJn1rfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJeolNCh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJeolNCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736965028; x=1768501028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/bZgd5vSjwBAkzpTMdEHM916XP+pXvIuXMySidlapU=;
  b=XJeolNChd71F38EEZjBmQVOf03HGX5heAjQShvo1SduLt++CeGJ6x8gX
   UkQ6C0WaH4tBFbQ8FQOP3/Grz3RuMH+3pyFqw6B+IRQoHDsDvI9Lx0sKC
   tGgARJpNWBvAV1gIlYCj0Uw6NBlywxjUzkV9s0sDUTK5KBjsCWsD41R5e
   uytGZuzmUbny25FS7vwl7671RDQr/7lJQxhKMSVPtn/7uBmXHRLjhwBM1
   CQZQ9aQmIazAO4frPrKh9fvvAQ5Bv7M9YncF7Nrqn+tGzgaFo5XitUimd
   tHSH54xA0HemiU9BjzRETUAlFVCt3Ix4LopAUoAlIkPmAeGyfP6uEeJhV
   g==;
X-CSE-ConnectionGUID: NkNO50vfSlWCxaVx7Un9SQ==
X-CSE-MsgGUID: FmDmFHxAQCaB0hm+sDsL7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37198741"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="37198741"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 10:17:07 -0800
X-CSE-ConnectionGUID: M+ORxPuoSqqlGR7HY3pDpA==
X-CSE-MsgGUID: a65DiAZPS/aimvQMej3MOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="105051322"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jan 2025 10:17:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY7wt-000Qgj-1a;
	Wed, 15 Jan 2025 18:17:03 +0000
Date: Thu, 16 Jan 2025 02:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 arch/arm64/kvm/mmu.c:307:22: warning: no previous prototype for
 'kvm_pinned_pages_insert'
Message-ID: <202501160250.76HONpgr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d6664d166001c60a00b3a80f79278b2a30099f89
commit: 6cf1f36e41a79cd8275eab61d29ad30219b60047 [0/1] ANDROID: KVM: Use interval-tree for kvm_pinned_page
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250116/202501160250.76HONpgr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160250.76HONpgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160250.76HONpgr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/mmu.c:11:
>> arch/arm64/kvm/mmu.c:307:22: warning: no previous prototype for 'kvm_pinned_pages_insert' [-Wmissing-prototypes]
     307 |                      kvm_pinned_pages);
         |                      ^~~~~~~~~~~~~~~~
   include/linux/interval_tree_generic.h:38:15: note: in definition of macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |               ^~~~~~~~


vim +/kvm_pinned_pages_insert +307 arch/arm64/kvm/mmu.c

   304	
   305	INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
   306			     __pinned_page_start, __pinned_page_end, /* emtpy */,
 > 307			     kvm_pinned_pages);
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
