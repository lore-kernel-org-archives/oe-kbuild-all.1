Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C878F18C2C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247472; cv=none; b=AqPbqeNaVP+4yHzTH7YOhu+rVq2hokRTZTxIirPttduf7exel9pH8XWqRwFVpnQyHBG52wd6hgb5QyyvgH7uFccdtuMg7XXBiqUMC+ZALHxTc+bDOrQ1yVYvtJhZI8ya7DsZJEWajJ+Q6YOrCrQcizdSvjJ11EFvErT0bq4dZ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247472; c=relaxed/simple;
	bh=C9wrhY3m30Vm2h3Go4r2LShenlEQdXUwRWepS7C69B0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mZYgn8lSVAYnWh3q1SasSOQp1J/Lld0j3ir+ZuKjos2j5qOFbYx0bM4bFx08IsxrGhwsMomRs7IBgtZ0l8wnorgj+yN5Wzl2IAyk3hWLp5n1ylaKCaYZcen29/eRv1lAMYGNfBe3/pF4rFue0jiymE8Dww5pN4POh2ZpgJc0S2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qrkn75c1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qrkn75c1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771247470; x=1802783470;
  h=date:from:to:cc:subject:message-id;
  bh=C9wrhY3m30Vm2h3Go4r2LShenlEQdXUwRWepS7C69B0=;
  b=Qrkn75c113JyoYafFiPK+pHRskifR2asJ6r+iVyqgP6ZCbAUFmKC2pi4
   1yy9E4ViVHF7G5NdSvFYD0koseuBQs5y1JAiuFZ4USI1sLqNcSXrvedxN
   BzeC2rKxMsyvGSE0ZX4s3e9hUsomeGpbMGtd25sb2Gls+JdRJQo+CrHyf
   D1OZRP9nedHw51pv+3LB+msEim5s/Dphi6PZSTU1J2kn+QL+dRmGaVap1
   jywUhJgse1utEMdmMtyBIc5Mg4VfYNWplAkty9ipznznYVxc0PMTRb1Yj
   zn3AG2G3sabLfGBp98PL4qTbN/GEsu3JSs2xP23hDcHk61ad55fBFKWEB
   Q==;
X-CSE-ConnectionGUID: TpK8fJAqQISsvdgXPij/0A==
X-CSE-MsgGUID: hlkyCDNvT0qlSK+aC3JkwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="89911037"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="89911037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 05:11:09 -0800
X-CSE-ConnectionGUID: TUOjVAsoTJOArZlSrZIxWg==
X-CSE-MsgGUID: 0nBh5hEyTqS+dFFmagFB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="218145657"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Feb 2026 05:11:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vryNV-00000000zus-132L;
	Mon, 16 Feb 2026 13:11:05 +0000
Date: Mon, 16 Feb 2026 21:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: drivers/regulator/mt6363-regulator.c:366:2-3: Unneeded
 semicolon
Message-ID: <202602162128.oEWL6gzQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: 3c36965df80801344850388592e95033eceea05b regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
date:   3 months ago
config: powerpc-randconfig-r053-20260216 (https://download.01.org/0day-ci/archive/20260216/202602162128.oEWL6gzQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project afd4df07ab0262482829d4410a6bae9f2809d37b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602162128.oEWL6gzQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/mt6363-regulator.c:366:2-3: Unneeded semicolon
   drivers/regulator/mt6363-regulator.c:843:2-3: Unneeded semicolon

vim +366 drivers/regulator/mt6363-regulator.c

   348	
   349	static unsigned int mt6363_regulator_get_mode(struct regulator_dev *rdev)
   350	{
   351		struct mt6363_regulator_info *info = rdev_get_drvdata(rdev);
   352		unsigned int val;
   353		int ret;
   354	
   355		if (info->modeset_reg) {
   356			ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
   357			if (ret) {
   358				dev_err(&rdev->dev, "Failed to get mt6363 mode: %d\n", ret);
   359				return ret;
   360			}
   361	
   362			if (val & info->modeset_mask)
   363				return REGULATOR_MODE_FAST;
   364		} else {
   365			val = 0;
 > 366		};
   367	
   368		ret = regmap_read(rdev->regmap, info->hw_lp_mode_reg, &val);
   369		val &= info->hw_lp_mode_mask;
   370	
   371		if (ret) {
   372			dev_err(&rdev->dev, "Failed to get lp mode: %d\n", ret);
   373			return ret;
   374		}
   375	
   376		if (val)
   377			return REGULATOR_MODE_IDLE;
   378		else
   379			return REGULATOR_MODE_NORMAL;
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
