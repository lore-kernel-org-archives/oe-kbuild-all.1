Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F33DDAE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333397; cv=none; b=USkeGWxZl7j9UvmfNVdcra/tLE8DgxyT2iz1map9hcXUY+/wWRWEtudw9vZZZNqTB+Tovbg7DnVBxMMcGa8lLPPs+oFdUBXHmxIwyI1Kol4Whuy5C4wsqSbDdDJPPEXLwl4j8Zh5tOpmKt+mRLHuG8kE/tx4S6yBiSikthf4lVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333397; c=relaxed/simple;
	bh=XjKMReCn5Z0w8T3rxI8Y3mBwknUk4B2zLarUUP67Kfo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pLp3AvPrWDl9pthf0Rw6luayyM8VZb8Hu1RgrfDIX7ieKTrGA0e/+RR202hqqydcDBXFUXC6q0euigyXkEmvDuXk2uzV5JTFiFAAVO294YKbb1y9aXPZ6fgZgjAYyX0xCHSgEBjUhQr5jzoP6Tw+v3QBQkhU0Fn1rvILnp+fLUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsWtW2ny; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsWtW2ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790333392; x=1821869392;
  h=date:from:to:cc:subject:message-id;
  bh=XjKMReCn5Z0w8T3rxI8Y3mBwknUk4B2zLarUUP67Kfo=;
  b=IsWtW2nym09WkXA8vrUQ+IXRL9lSiyH5sGCOEUyzqle41p0xLy/og8zt
   hnVuSWVrX1/zIkxlK3I6XCZtRkiO09YpUw1t+6QwoYbQ6zmLtw9B4F5YP
   hKpRPd2PVUU/9HWtprNBb3pLBLm1oeg78tHVR4HsRPLixxILO1+JM23CS
   CImIuX09iN8ZwmE6yIz0jOf5SO/QHjgK7phJ+Mu1+Spi+Xh0znDHy7iXM
   RgzxoX6acFLSO6g8coYaXnhu5Qx/gSEiiE74MNmHpP+/oXvzIEk1PKLl8
   3T/Ivm6MPweiQGaWnHV5YgCrncqBRTnbj/sJ6c70UkNmeJn2jeR58+i2b
   g==;
X-CSE-ConnectionGUID: DRtrMfmJTfu9NqjqLS0dSg==
X-CSE-MsgGUID: e/lIDRYnQtKBliYdkXKcXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="107498244"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="107498244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:49:51 -0700
X-CSE-ConnectionGUID: zxACkw10SsKEQUHh6Xex9A==
X-CSE-MsgGUID: 0S9kStPGRhOZRKLoUHPumg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272119126"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 03:49:49 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3Ux-000000000gU-1dwH;
	Fri, 25 Sep 2026 10:49:47 +0000
Date: Fri, 25 Sep 2026 12:49:30 +0200
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6488/10113] ld.lld: error: undefined
 symbol: efi
Message-ID: <202609251207.pxRxjvj1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 28114992dd2f03724eb3d024839b3f9f299656d3 [6488/10113] ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine
config: i386-randconfig-2101-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251207.pxRxjvj1-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251207.pxRxjvj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251207.pxRxjvj1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: efi
   >>> referenced by tas2783-sdw.c:722 (sound/soc/codecs/tas2783-sdw.c:722)
   >>>               sound/soc/codecs/tas2783-sdw.o:(tas2783_fw_ready) in archive vmlinux.a
   >>> referenced by tas2783-sdw.c:731 (sound/soc/codecs/tas2783-sdw.c:731)
   >>>               sound/soc/codecs/tas2783-sdw.o:(tas2783_fw_ready) in archive vmlinux.a
   >>> referenced by tas2783-sdw.c:722 (sound/soc/codecs/tas2783-sdw.c:722)
   >>>               sound/soc/codecs/tas2783-sdw.o:(tas2783_fw_ready) in archive vmlinux.a
   >>> referenced 1 more times

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2783_SDW
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=y] && SND_SOC_SDCA [=y] && EFI [=n]
   Selected by [y]:
   - SND_SOC_AMD_LEGACY_SDW_MACH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP_COMMON [=y] && X86 [=y] && PCI [=y] && ACPI [=y] && SOUNDWIRE [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
