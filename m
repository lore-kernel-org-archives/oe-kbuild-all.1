Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E445329A3FE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 03:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746503779; cv=none; b=NynW8cpGp2VKe31RTYkewPNiprYky5LfWsPkEA4qvQDZQmdo1RV0laVMIIHaM/P5ULiCG/5tQrwAK+AChW+hsaj9QszKSozQaQKKuj2uK0VPk2z3j5wACue2inj/yjEBFf54fPT+Ig2dL3bwAon2qxMt0CXHr0adHgeHDT5rBBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746503779; c=relaxed/simple;
	bh=Vn7N+ZtKM25rc6mNXDKOfAes1UYhYWi/0qtbk7bDqEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BgnPvvKpYuoIAZdSN+AuyXNieAsDki2DTCkS8jsXLPeWQvQwfxKSYDNIPEI08zipGyriozAsuB/AjVkz6LwQ3zgJTJT2CZnqW5GYsCuxhpUYpPMaSs1gwFJ0NG+Pg50BXSZ2Hz5MR0haltmHPiD89hrQo4naCJKdE8GNnokZJDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aI8DwYmB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aI8DwYmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746503777; x=1778039777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vn7N+ZtKM25rc6mNXDKOfAes1UYhYWi/0qtbk7bDqEM=;
  b=aI8DwYmBKZy9K4Qq0IkCHSIse2IOEVksFKLqcH2dJsCfnJi8PS4brIDn
   JSmWUPr9onmETSa2/C93v5QlC98/tT32oXnZSI5tisb3AFqW6zsfNYK0F
   MVRs2UpVobSpvP4/GWoZEeTIIT08zotdLIEC+FK8x13Qx77qbGTYs7fWY
   rlTjtcHSFFg+VvSKXit+LEcu5iY508490DJFs5kbe9dNZIRvRvyAU4I9b
   YiNKqq8xP4R3LVSrt6u5lqfDws8c+uF2Q+5xKfNg8zZd3AkD+zyYcmvGr
   eK7ZTJPKrOuFPlizTOtY6EyfgWgkh/HPh+y4iZT0o87EYMQvwc6QnV0k8
   A==;
X-CSE-ConnectionGUID: gUPNlBitQgiFUkdGFB72Bg==
X-CSE-MsgGUID: zE+sSZe5SC+H1fqwBb9vXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48288352"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48288352"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:56:17 -0700
X-CSE-ConnectionGUID: l+Diq6GFTs21g0vnQH8aRA==
X-CSE-MsgGUID: 11RLN0WWSX68GfEQTKfU6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="140665591"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2025 20:56:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC9Ph-0006Eb-0b;
	Tue, 06 May 2025 03:56:13 +0000
Date: Tue, 6 May 2025 11:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for INTERCONNECT_QCOM when selected by
 GKI_HIDDEN_QCOM_CONFIGS
Message-ID: <202505061108.Z2WCE0pQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [2/2] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: arm64-kismet-CONFIG_INTERCONNECT_QCOM-CONFIG_GKI_HIDDEN_QCOM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250506/202505061108.Z2WCE0pQ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250506/202505061108.Z2WCE0pQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061108.Z2WCE0pQ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM when selected by GKI_HIDDEN_QCOM_CONFIGS
   WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM
     Depends on [n]: INTERCONNECT [=n] && ARCH_QCOM [=y]
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
