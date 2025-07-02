Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6141531C1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 04:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751429959; cv=none; b=fUhfSJD3Hao+fwuetNDGw0RZaFmmocmBMDegT/SgV6BxCzayycjYsqruRH8x2gsMG0gKtpaf7fVs45vBI+vt/CVuhi5ge+UVqkdvzCy8bbNO+mf5M0ABTJvC5UPvFAE9MJK9f1+6sjjCGeG/66xUDObx3AKCHrYyKS5XR9Xy7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751429959; c=relaxed/simple;
	bh=N+i1iQhZMvmCXf2jv7WL6ufiouDeZNcr2vJlLFWwOo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ICp7DfsGuxEZOQ6U7DyqRuT0FPQ8V4RTj7z3s1+CgsAlBnMnY+o8ckkA5N8ZHlnqAhNtMJrgSLv8X6G0PAe+9A+sRNaulKKUCNg/rTkCVfR0vEc2dDF1Ixkr7g6T1qmX2alOnThpMePsgPt8xgg4mcq5kMs8OSkC9NzaXPs1eFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrkkKUPt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrkkKUPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751429957; x=1782965957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+i1iQhZMvmCXf2jv7WL6ufiouDeZNcr2vJlLFWwOo8=;
  b=KrkkKUPt+156j00oLXwKdVRQku7QpCQL2u49YG/hCMIOGkUvKa8IfWyt
   42uPEtimvJR6EuOKFQo0hkN2wA4tArE7AHmOMSojUopg+9M+kcz74XadW
   DZZNfTmTzSOgcEhObJ/eF1CcfMhAiWO05BUquj7UDRnMq6jeiLnbNUQA5
   S1D8WOQpg1TQlaXAfkxglxZoq2oyWKQhs43bcLFrpdpr7GQ1qxpI+lovX
   YKhehsQ8kiBzXTxCB2PnakKku5DpLKkjZKIvuNIYw7CoYj0yg0QA2DGXC
   sqxqZf5RBtSX634jBsSVGUKKV7+LZenNXWG1yelvR6zDp1r+iFAnLsLVG
   A==;
X-CSE-ConnectionGUID: VLHusY1zQ2CvuCz6nDiaHA==
X-CSE-MsgGUID: F2cePdncR8uDOAQnft5FVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52827036"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="52827036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 21:19:15 -0700
X-CSE-ConnectionGUID: PDAyiFOZQcW+csbeVeSvDA==
X-CSE-MsgGUID: sUAiBgNtSCaIEIzOJ7JwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="177636715"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2025 21:19:14 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWowB-0000AB-2r;
	Wed, 02 Jul 2025 04:19:11 +0000
Date: Wed, 2 Jul 2025 12:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishusen <lishusen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2439/2439] kismet: WARNING: unmet direct
 dependencies detected for HALTPOLL_CPUIDLE when selected by ARM64
Message-ID: <202507021253.zjMMyzmu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5cdbc324acd417828860d3425c4f769518485c7c
commit: 6df2e969a6de3481167ace4fe42f69812a6c7fc8 [2439/2439] arm64: add config for cpuidle-haltpoll
config: arm64-kismet-CONFIG_HALTPOLL_CPUIDLE-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20250702/202507021253.zjMMyzmu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250702/202507021253.zjMMyzmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021253.zjMMyzmu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE when selected by ARM64
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
     Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
     Selected by [y]:
     - ARM64 [=y]
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
