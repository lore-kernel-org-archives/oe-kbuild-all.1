Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5AC14A4CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 00:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792109849; cv=none; b=UwqTf4gbmOO8K54+cVMXiv+OgYXD66Cqtm84dX7tAgOOTVZQ5HtTKfFvPWe1QCT3X0YnpuGeeRXFT4d9BAymqwxH9kT5GyN7qD7CEqcS26EBsP+Mvbo8oVRCvtc+m90WrcHEUGp2ciUz6cBGFGEKr+DZglY+S4TC2+9z90xOsZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792109849; c=relaxed/simple;
	bh=M+o6FahNxm7mmmNdq/nTmdEnY2jU3jx4I7FGggw/LyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mfparz188YMFAmFgOBYugBhqtpajrIET3vW7wuy5LEIsLA1WH74+vn9Y7ktJvOfy3eXM/4gZaChcLofu8EWzAkldSPxnCyUoYJmamCZUQZGxbOfdxKgM1179gicZdr6gkV5AuXrxJ3EmIj+0iHXcKUktqOF1ih/rSkbjvjL9ryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6Kzqb5e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6Kzqb5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792109849; x=1823645849;
  h=date:from:to:cc:subject:message-id;
  bh=M+o6FahNxm7mmmNdq/nTmdEnY2jU3jx4I7FGggw/LyY=;
  b=n6Kzqb5e1zXwd64AZlHPw4VGe8rPvvRUX6hhE/7byZa1c5uitnPVEr39
   2qaKNT64V7VnQnpd8lIViss1c4t2OR1jBUyJV5wCGHDbVkj7JRjbCEfDU
   eFWpohTIqUxjq76bnO+xsXxAyFj0GhfCNqOhinGtylL2Fu0dr0JoPrrbw
   RbxT0XGA0CQqv2KCjNN8d0JlQZu04699iYaVUuApUVJULQiQdUESTHPqc
   FC3OXjAncJxjaX7L8a4sgx8i1bIP2LKW3iGVYMG7XWlmSY6aSCAqYHz4q
   o+QPdNfsGCJ28j4qDLgK2fFl9YR7xYMcZagzsg4Nfs8IVq6V5IZdd5+mY
   w==;
X-CSE-ConnectionGUID: WKISn9j4R32rLKgJRcDMow==
X-CSE-MsgGUID: I8SrmAFdRMysJ7UVsUpZJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="912733"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="912733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 17:17:29 -0700
X-CSE-ConnectionGUID: rZ9ppdebQza5M1AUlFXzlA==
X-CSE-MsgGUID: HjT65KEVSJSohZVdqr0TmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2178989"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2026 17:17:27 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHVdU-00000000BwZ-3Nzj;
	Fri, 16 Oct 2026 00:17:24 +0000
Date: Fri, 16 Oct 2026 02:16:47 +0200
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:cca/topics/cca-da-gmem-backend 100/157]
 ld.lld: error: undefined symbol: rmi_feat_reg
Message-ID: <202610160235.UnZvjrgz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LuBaolu/intel-iommu.git cca/topics/cca-da-gmem-backend
head:   c390eac65ae31598feebbe91bb9fa76ee4ae8cea
commit: 16cefcbe8263afd0e52cc449cfdea4f6effbb0c3 [100/157] iommu/arm-smmu-v3: Map the Realm event IRQ
config: arm64-randconfig-2000-20261015 (https://download.01.org/0day-ci/archive/20261016/202610160235.UnZvjrgz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160235.UnZvjrgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160235.UnZvjrgz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rmi_feat_reg
   >>> referenced by arm-smmu-v3.c
   >>>               drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.o:(arm_smmu_rmm_device_probe) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
