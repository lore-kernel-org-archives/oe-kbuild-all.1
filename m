Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CF223A9AA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 03:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752033340; cv=none; b=UButZVAcYz3tOemiOyBW6BgtYJupSNAjtD33Ch8CwQ5a3Bsj6kC1GTzvozLYKbd/9VrIvvpy0qaNRc/ubZNt5jpfGGaLnKYgAx6zrj0rkLRaD9LYEbMIRfTyPLt8hFI2PeKa5TAy0Quo4PqtCAuUeI2bntG3KLhrLCVb2Fs8rmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752033340; c=relaxed/simple;
	bh=j8w+z6oCQaEEiHGL5eRirRmEH4ckLB1qER3OL/vaOv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2zgTLsrZ7gWNVDjXV4Lsjp9EknAT4QePvIYAAVwnIAOzh7jh7GHpM36QS0YSb0tYhdhoJBwN1C/eFvf+xvQItbbvIu22gahpVVdaYGihEbZ9mdHBKLIMc1/dVoI2Un9PSWxTkhFOxrJfem+diwSyF2uRxN6Wd0FqxYdNMPkL/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M91mCn6U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M91mCn6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752033337; x=1783569337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j8w+z6oCQaEEiHGL5eRirRmEH4ckLB1qER3OL/vaOv4=;
  b=M91mCn6UW+EpYxBke6jW9GwQJcAEP6NtFvmhrI/7QM9SYVI3KFnl+50y
   Q6XZ345uNCQjXhdFySGRs5JhErKFTYFg7ZiiprPmdgPOGFcVHqu3DzGIl
   /RcSik+mCN39/r+ATI4rW3hcwg3MwnBQgpMuzuB5Pq1oYcFHt0O6mfMHI
   hP2XGqfWgy+4MM9HZDbYN5vXI1etPRVmpWied28q4Qr1cZLCq7kjTy1lG
   iF/G9YIo/ALMOnmb79Zgq6O9zKtTAeRDOuMpFTAn6JDsv0m6XfaT7Gz4m
   p7LLDneMbaAELbHMgj4uMzohIFbXKucDq51uTY3/MCbln4YMdV/CV71KD
   w==;
X-CSE-ConnectionGUID: K2/9keVPQX64psem4KQjhQ==
X-CSE-MsgGUID: SHOwQMdpSGKD4T8BLxsvaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54256668"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54256668"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 20:55:36 -0700
X-CSE-ConnectionGUID: JbKodQ4lTG6hmleBaXICuw==
X-CSE-MsgGUID: 7E2KnLeRRYavRYbN2yNTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155077469"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jul 2025 20:55:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZLu8-00033r-2z;
	Wed, 09 Jul 2025 03:55:32 +0000
Date: Wed, 9 Jul 2025 11:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2464/2464]
 arch/arm64/kernel/virtcca_cvm_host.c:15:1: sparse: sparse: symbol
 'virtcca_cvm_is_enable' was not declared. Should it be static?
Message-ID: <202507091159.CD5vabJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f9b28d122e285b68843817839d9c5448a057add5
commit: ed007ade0cef81fb47328683b8a7eec5edfa8494 [2464/2464] virtcca feature: secure smmu init
config: arm64-randconfig-r111-20250705 (https://download.01.org/0day-ci/archive/20250709/202507091159.CD5vabJ1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce: (https://download.01.org/0day-ci/archive/20250709/202507091159.CD5vabJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091159.CD5vabJ1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/virtcca_cvm_host.c:15:1: sparse: sparse: symbol 'virtcca_cvm_is_enable' was not declared. Should it be static?
   arch/arm64/kernel/virtcca_cvm_host.c:37:6: sparse: sparse: symbol 'is_virtcca_cvm_enable' was not declared. Should it be static?

vim +/virtcca_cvm_is_enable +15 arch/arm64/kernel/virtcca_cvm_host.c

    14	
  > 15	DEFINE_STATIC_KEY_FALSE(virtcca_cvm_is_enable);
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
