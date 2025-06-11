Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219A227455
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749684167; cv=none; b=fvcBzSUoEgt0yfUJ78R/EMfallLcNdK4DdyEo+64OSDa0nXjuuTyg6WcPdrS7hrZ9WcC0wFFwrzLt7dzhgWJ1m/Hee40oFMXtN4U5ceJwZ1YEYrfOPks4gyWNB6TU8JypYI6VNsQDZOfE4LY2KvKSFf5gBIxqDvVUrk/io2xb6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749684167; c=relaxed/simple;
	bh=08yvShU8ITsYe+zeJEyL+no4JLx/9VdxLu1XSD49Qew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EuiynLk3juMDr77ae+agp5Cze91J5EDmIqHee8i9J473J+FfQGOllDr7pxB2uZfRC1LM+fpE82NWR0HsvKr9x7egURtEmSa/u3LIFeny7GJp6G8IHwUdhEtwsEkxEV36SE1DbjEoc/39nF4og20HeLIlFg9ZKSiClMD1lpcieBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm78ba07; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm78ba07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749684166; x=1781220166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=08yvShU8ITsYe+zeJEyL+no4JLx/9VdxLu1XSD49Qew=;
  b=Vm78ba07yxqpeRinR12+iMTWNc7c9bTXL1X1V4TKn/K8t9/l4hyZSYWR
   kiJOVJU77ov2gF+z/hVnwPIrp5i0w00ZDRIyYkZbySqiJIVYieaKJVX0p
   bCAY269ViMLrFWAW0hNcATR6tL2eiRnnsTLC3sbyd7+i5Vi7S/+0UAh2W
   hxfxmsOqh5zcUlonVxxf8w3m7PMK8ExmvLJiCsW6d4pkJ31VgAIn2mj3Q
   SHbNVmQmZou327IBwAA/SHITa2ATreoHKWfcphRyQTt0Gv5X51IHVGgzg
   HAOPfQoPuzQABhGsTPgJqB6MAHQ/Nis1HBT75oVq0mtX1Q3CFcXh7xiPl
   A==;
X-CSE-ConnectionGUID: OUDHgoIIQveXWQfjGm8guQ==
X-CSE-MsgGUID: L7z8mJGkQHCSk0SQ4K/fEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="39457682"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="39457682"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 16:22:45 -0700
X-CSE-ConnectionGUID: EaQrY+63SW2o8DckYDxk8w==
X-CSE-MsgGUID: Qwb/Q+gSTkCgmZ+aVnKyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147889661"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2025 16:22:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPUmH-000Avc-1H;
	Wed, 11 Jun 2025 23:22:41 +0000
Date: Thu, 12 Jun 2025 07:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [qcom:clk-for-6.17 13/18] kismet: WARNING: unmet direct dependencies
 detected for SM_GCC_6350 when selected by SM_VIDEOCC_6350
Message-ID: <202506120742.31WDlRHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.17
head:   691f3413baa4bcaedbb40cd64be0f5e676423830
commit: 720b1e8f20047e072b98a0931fc3e9a545fda18f [13/18] clk: qcom: Add video clock controller driver for SM6350
config: arm-kismet-CONFIG_SM_GCC_6350-CONFIG_SM_VIDEOCC_6350-0-0 (https://download.01.org/0day-ci/archive/20250612/202506120742.31WDlRHF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120742.31WDlRHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120742.31WDlRHF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_6350 when selected by SM_VIDEOCC_6350
   WARNING: unmet direct dependencies detected for SM_GCC_6350
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_VIDEOCC_6350 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
