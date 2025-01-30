Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932DC4A35
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 06:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738219549; cv=none; b=KN9fC9m1iiBQvDq5XI3e+nXk7e08Lp1s/2lGq33F8VgiF0RQ9gGko0Q3RYkk4En2ghRm5sEDeKQaqE8Cg7q4xawZfKr2fZWYufR1IHJgMyT4m9mCkawC52YKzub7kOFbC6biZDrBmd+biDc5kA9WulCIfgCY/eLoKdTB6C5IJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738219549; c=relaxed/simple;
	bh=TnfmVXtyH5vkqJmOca8kSnY0yu3gKLgRdp1UxerYE8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNe+utxAUj1f6pQyyEaSW2QFAcYJV+1OxW1fFPB3AVfP9K89E6E9qiPvwjFfv9IWiGUb1hESnwXTT1Wyi5IICyCVqX8htM/3rJRhZ6h3EBHQJhRrzCYRCCt650c/5mxMJ6mbRThqbKATscK1cnMdWeGDBQQHyu9NRKPW9LDypmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eqhow0et; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eqhow0et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738219547; x=1769755547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TnfmVXtyH5vkqJmOca8kSnY0yu3gKLgRdp1UxerYE8M=;
  b=Eqhow0etg2c0UO+PYk/eJAJLyxgARG55XNd9kBHFpfoiG3/kWlItcHzK
   kXI4hTnPcHJpYoVE9gWxAPGbwdYINNqg9yVc3deQbVgKdPq6WX3bAVAE9
   H3szVVgtS9OZDGohRi0GJHJg0nPUnlaQ29dutxUdPchsBxT/lWJqG4Rcp
   5TsBd3hadiboXMiMAt3WjIXWBNmPFSUK278QAmReHeMJhKXSAEUsuIa/X
   A7mPQfgG9h9Mp/OPNoETStmQdzAsf+J6esYt7I3GbqN8r2DxnLosIUWM9
   o8hZpn2ldPyPF/TQzFUYxFNMZvwpMpGwVTuz3M2CI3yIHjfBt4jm62rve
   A==;
X-CSE-ConnectionGUID: 0RQ/ITDJQ2W+7tNVxTatAg==
X-CSE-MsgGUID: 5N7qeoWwS4+ydchi0kwPZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38784809"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38784809"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 22:45:44 -0800
X-CSE-ConnectionGUID: OfyCml4ARpKXIFRN288qgQ==
X-CSE-MsgGUID: QyGc/73WSvK1uMyrkfxdfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110152950"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jan 2025 22:45:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdOJ2-000jkp-1H;
	Thu, 30 Jan 2025 06:45:40 +0000
Date: Thu, 30 Jan 2025 14:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 9/9] htmldocs:
 drivers/gpu/mediatek/arm/mali/Kbuild:252:
 drivers/gpu/mediatek/arm/mali/platform//mtk_platform_common/Kbuild: No such
 file or directory
Message-ID: <202501301428.K9fXocZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   20c6549501f674937409aba5411ee8c5c0ab133a
commit: 20c6549501f674937409aba5411ee8c5c0ab133a [9/9] CHROMIUM: gpu/mediatek: Enable Kconfig and build target
reproduce: (https://download.01.org/0day-ci/archive/20250130/202501301428.K9fXocZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301428.K9fXocZv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/mediatek/arm/mali/Kbuild:252: drivers/gpu/mediatek/arm/mali/platform//mtk_platform_common/Kbuild: No such file or directory
>> make[7]: *** No rule to make target 'drivers/gpu/mediatek/arm/mali/platform//mtk_platform_common/Kbuild'.
   drivers/gpu/mediatek/arm/mali/Kbuild:252: Failed to remake makefile 'drivers/gpu/mediatek/arm/mali/platform//mtk_platform_common/Kbuild'.
   make[6]: *** [scripts/Makefile.clean:61: drivers/gpu/mediatek/arm/mali] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [scripts/Makefile.clean:61: drivers/gpu/mediatek/arm] Error 2
   make[5]: Target '__clean' not remade because of errors.


vim +252 drivers/gpu/mediatek/arm/mali/Kbuild

2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/Kbuild Alvin Liu 2025-01-15  249  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/Kbuild Alvin Liu 2025-01-15  250  # *** MTK Proprietary ***
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/Kbuild Alvin Liu 2025-01-15  251  export MALI_PLATFORM_DIR
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/Kbuild Alvin Liu 2025-01-15 @252  include $(src)/platform/$(MALI_PLATFORM_DIR)/mtk_platform_common/Kbuild

:::::: The code at line 252 was first introduced by commit
:::::: 2b0918badca3b06a0371cf4cb21785d202033004 CHROMIUM: gpu/mediatek: update gpu kernel driver(r51p0) with mtk modification

:::::: TO: Alvin Liu <alvin.liu@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
