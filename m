Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5581FA8D7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 22:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376424; cv=none; b=Un4A3BcHvg5NB52TsLCdXx0Ckr+4hTmzelG/HwTJVVk0/3OatMp3idEYSk1VHEiI+jIRuEqxG5ybjwFIU42Z0VJeRFwOyMxWXwSktiOKrlJeTa3tKpHEtMJTVi7AFqGD57RgH4KVkvaaH9uHX5FOY8VKhfNCkGiKLMss+v31Z4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376424; c=relaxed/simple;
	bh=jDtaQQ+UZyLoae1A0dSXrErwtJECRDQMSBrMr5fXATc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E13pHQXQh3uyOvESjnwR/0i8h07gyceLkd/pvKqbfIBKI3hq/5WMAZawsjmal4F71owuKjbHZdLmirKcxC8fjTe8Q//tPBcBReWhF2/8JUc/IuZ9o+h9+LvS8Ds18w2kMh5sKqbrPI2zAMnoPC/n7P7iO3LycnrkYgUur7q7EwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RV0/Joa7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RV0/Joa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736376423; x=1767912423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDtaQQ+UZyLoae1A0dSXrErwtJECRDQMSBrMr5fXATc=;
  b=RV0/Joa7W1jiYxkaRW4C/e9Nodr5nGFACR5UDn3fYfSGuxiXXIeBBjAx
   UQ0sYXvrtcXgQo/0AbjfYPWolvPEe6DwHeRPRvhldakhkQ7yJzSOV04/G
   9/fDb6qa7AYr+FACsdRrVXlKvsqWLrw/9FVZtdYxBLN1dcT9IfPy95e3w
   AnbZSeJ/PO9ajT1Tr65xegKUhKLWc8NFN1apikV5PyTPj6ECRKjc9Ge6S
   Gc8LYGtxGpobUMYZBEbCi9xT7Saf9ujeKauWPZUwY8cgGokkje2kNKMCJ
   LlKmg2KO5ZE4INOsEFyMctmyC7TVx4HFpr+HRrXWfGBefa9RQwC+mNYrI
   g==;
X-CSE-ConnectionGUID: odo/NjaKSY+AjccBI2tgNA==
X-CSE-MsgGUID: YZBwhOZiR0Sv7UCTuOhwKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36783440"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="36783440"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 14:47:03 -0800
X-CSE-ConnectionGUID: Mba4zssUQ8+VmxaZ7fzIug==
X-CSE-MsgGUID: IzipICOFSiCXAZMjLujvoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108344802"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 14:47:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVepH-000GlN-1X;
	Wed, 08 Jan 2025 22:46:59 +0000
Date: Thu, 9 Jan 2025 06:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 6618/7110]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb:
 /soc/pinctrl@1001f000: failed to match any schema with compatible:
 ['mediatek,mt7988-pinctrl']
Message-ID: <202501090603.kcovOhpH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b90165c7d1173e0f65538d25aa718ec7ecdd5d6
commit: 7d887c0c9f89310c43387425ccee9be10bf6c665 [6618/7110] arm64: dts: mediatek: mt7988: Add pinctrl support
config: arm64-randconfig-051-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090603.kcovOhpH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090603.kcovOhpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090603.kcovOhpH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7988-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
