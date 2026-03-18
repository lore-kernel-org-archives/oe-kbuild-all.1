Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617CF3DCD84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846367; cv=none; b=CCWodiIRVnq075bwNtxM5d3NDh/ySp5+igOEIdR20IRwA9Zm7DNBj8WFrZ/DGtzGfmTBSCqnI0fUFSyCJ+T8w0bP9zx9J/P4BxE19i7LurLwHz6Y+6HOpx0lGuxSVkdA8+f2B4jqpjiAPbLwb22ktM2BzE6iH3YpHZdawC9pwdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846367; c=relaxed/simple;
	bh=cyJ81XdR7E/wApzhzQlXFX1wIwSIdVHpNzsOIT5qFqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qvt9ozfu2ryrjkU8UgVnMtOZHd0cDu9hzu9GolYew2EH/Clo4joTkasUvlI1roN1VaKsELYTFD/s3vmvuTHWLiQrNgbp4Kcfml/n/CynUl3BCMvTUs/KQ8fsXRb58VFifEGWv6517nEnzHQ/IaJOoq9fOvT+bLt1LZ9xYwFTK3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFKBmDx5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFKBmDx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773846366; x=1805382366;
  h=date:from:to:cc:subject:message-id;
  bh=cyJ81XdR7E/wApzhzQlXFX1wIwSIdVHpNzsOIT5qFqs=;
  b=JFKBmDx59ZagOBab9dyI6TJfhO4OrTCLz/OIAicmLvXFgo/PnPHrlCCd
   i/N0fjjZxrJmBLaMuD8RvWqRjLX9H5FTgSd+tkHdOTEVO1Blc8LRMeEb8
   fCrCHK9Z9jTudwPnGAG4ePRNaVpUSQQVsGzq2H0kEqrWhLGpTFO25HcLt
   qvmkmljkinqaURPaO+M1ub7GOSqh+PCh9ljZ8H7yiniPVPyQgpA+a9wHA
   EU0oB0iFpSIasHKFdCOi0egUwObPJYLQb3NWynM45DxfC161H/QAaqi8N
   ra0D67t9Bs/JZAuUIK15qjZAarb1+wiF9UKLVA/p3WRu5Z6AxBiopnEKf
   w==;
X-CSE-ConnectionGUID: Laz9T3qFS06wjS84jZL+0g==
X-CSE-MsgGUID: BXRcbb0tS8y5uzSZNdHk+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="100361385"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="100361385"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 08:06:06 -0700
X-CSE-ConnectionGUID: jjiGhwBzQKmhSONB0mV+jg==
X-CSE-MsgGUID: mfHulCsNR76DgvvUaz3c4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="219684341"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2026 08:06:05 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2sTC-0000000031v-0mzS;
	Wed, 18 Mar 2026 15:06:02 +0000
Date: Wed, 18 Mar 2026 23:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] aarch64-linux-ld:
 arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o:(.debug_addr+0x1b3e8): undefined reference
 to `__kvm_nvhe__printk'
Message-ID: <202603182317.Hdfufhnt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b0e662fb17ec139a265b282999e920fe1f021414
commit: 8d527eb781f02752d10090b058e00627f8aded7a [2/2] ANDROID: KVM: arm64: Drop unused sections from hypervisor
config: arm64-randconfig-001-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182317.Hdfufhnt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182317.Hdfufhnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182317.Hdfufhnt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o:(.debug_addr+0x1b3e8): undefined reference to `__kvm_nvhe__printk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
