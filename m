Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10662C0260
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766232219; cv=none; b=OhkY/4ZyChkP2fQzHifG5rlaor1iYw7vYwg919xcT0hZtz1ZS85rUY0gUPnnwR8HvtgGNOah0tLuw40k48M1xvXbzMYeP5ocF/583TOTpBV1qlVV4bwSDs/Q6hQJPGpG+HgaoaUBR85jomxqy58WD+kFmiwJGMXB6e9tryEcOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766232219; c=relaxed/simple;
	bh=npG7Y8zx8JLfQoGgKgBIEwTVa8WHt73rOrRMxOjtS9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ApVuw4bffwVy1ggz/DGrXqc0MnZ9LYuOVymfspsvRPeA6R/JQU5H6jq4QxW0pPKRmpgaTJkI6F7iHCi4mqKvOx1zdscGunT5WbSMOWdAB1xESUYUQdLgcNcxXijup+9ajCoe/hpuIVvEYUh8UqkeBixU7dBe3C234aHQeYwlsEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGmfYA3d; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGmfYA3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766232218; x=1797768218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=npG7Y8zx8JLfQoGgKgBIEwTVa8WHt73rOrRMxOjtS9Q=;
  b=mGmfYA3d8qGpyOr3MwzSHkYKMRNoF0PRNM5V6/xwi9RAOyN9P15rBg7Q
   TFRAEBVu44nV2W4BgsJ4zEA5Cqj6fwoVLrepP1CFeQ0GwFnrIt0CuCdnV
   82siDFtEpQFN2mf/9TGrC3tRa1zCCrMx3hw3TIX0S8pn3WKouekzn09bB
   3E3HA9lY89W/P8EXwQKexX5Yv0I2hgoMrm4A5oYGO6RckEjXpOmZ9z8s4
   sXWV4ButyM+xF8e4LT5jEoqxZQN31pfYJ1eoZGsldO9T9M25udyFwvgob
   I0HWdwa8XuAEG8KM63OWHhgxVkdyjuR47Qr6GaqHZjjuTy44t9Uezz/sj
   g==;
X-CSE-ConnectionGUID: 2reRJpN9T5CdjiTaPJPPpQ==
X-CSE-MsgGUID: ljQTdd7DROOD+Px7aQFk8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68217849"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68217849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 04:03:37 -0800
X-CSE-ConnectionGUID: w5/A2l3TT5a0Cyz0Vgnv+w==
X-CSE-MsgGUID: weZKj4uTQuSM4Fu2JeOBDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="222539531"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2025 04:03:36 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWvgM-000000004YY-2UVi;
	Sat, 20 Dec 2025 12:03:34 +0000
Date: Sat, 20 Dec 2025 13:02:36 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] kismet: WARNING: unmet direct
 dependencies detected for IOMMU_SVA when selected by
 GKI_HIDDEN_IOMMU_CONFIGS
Message-ID: <202512201308.HAdf9noh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1e58b72fd00d77b67dbf91aa4840bfba4314f9f9
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [2/2] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: x86_64-kismet-CONFIG_IOMMU_SVA-CONFIG_GKI_HIDDEN_IOMMU_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201308.HAdf9noh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201308.HAdf9noh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201308.HAdf9noh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_SVA when selected by GKI_HIDDEN_IOMMU_CONFIGS
   WARNING: unmet direct dependencies detected for IOMMU_SVA
     Depends on [n]: IOMMU_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_IOMMU_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
