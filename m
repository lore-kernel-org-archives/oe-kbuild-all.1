Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03833B27F3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364238; cv=none; b=rg1A6VgxVyxKkVY25jP/zUu93mABCt3CCpCKMKHV97P/ukxIfO2ROoglqoCbdHJA+iue/9o9m73Xyq/3XEZCh9t/xsJV79lWXXDnPnZbDOck8aHdo5OAGm1LlHVtDbAJVNL7Zhk+gr385yMFCfkGFmYTmQVhOzDeDfS4UQyZyks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364238; c=relaxed/simple;
	bh=7OjTTXCS7SQaq0qC4gxVtvy4RUCnL6nQqI8S/yoTzZc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i2EBLNAKgBd4Kng6jlRYiJVJepflqb0WgiFVnH3AjCgnesBw5JCdYUlYM70q6MqlrduyNQyMsBEDr9DMieSeTRjJLJNkGSAruvBMQftNhh6b1yt76FhfNZpzlAf5tKuedeCW4BEMLR6JdxCgvefnTPmZjffFWfXzzwI84oHhMxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZayeEzgQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZayeEzgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790364236; x=1821900236;
  h=date:from:to:cc:subject:message-id;
  bh=7OjTTXCS7SQaq0qC4gxVtvy4RUCnL6nQqI8S/yoTzZc=;
  b=ZayeEzgQLZ0+sQNMeC3PpigXChIqoJ0AfvVBe1JsCtVAy7RYd3ARB/m7
   YFlD2eS4VutJqedLWSiQl+E4xtCuhD812sFFYI7nREan5TrfepI/d1U/u
   0OEs3dryIiLhI0xOvU3f/RhwqekhH58VNbCyu/qOnYy7zA8hT16sZuu0/
   iCdtW1CaPwDma6TrvAoG3lsz01KITQ/zeXblQBH715kcxJBLmjswEtE7Z
   R3YGp2Eo6y0W9e+Gq3UktykHlosNbHNBbfOj/YbsHhDN1B2QwxgmlbqKJ
   USHnXsCLwvrcy1Eipz4Nh65tXow1Ol1lQxkJ57d0XzgGaSLlTHkBwEd2Q
   A==;
X-CSE-ConnectionGUID: bRe9IQOgRxemKN7CTj8viQ==
X-CSE-MsgGUID: oFyiybuZQjqKXcttcYJdNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116686423"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="116686423"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 12:23:55 -0700
X-CSE-ConnectionGUID: ksHLbv4xS0iskvfK/AiOUw==
X-CSE-MsgGUID: k2CojUOGQIOZ+k7BBYxM0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303921917"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 12:23:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xABWR-00000000L5g-2qzk;
	Fri, 25 Sep 2026 19:23:51 +0000
Date: Sat, 26 Sep 2026 03:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6508/9480] ERROR: modpost:
 sound/soc/codecs/snd-soc-tas2783-sdw.ko: symbol 'sdca_parse_function'
 undefined!
Message-ID: <202609260303.0f08SoDa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: 28114992dd2f03724eb3d024839b3f9f299656d3 [6508/9480] ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine
config: x86_64-randconfig-102-20250415 (https://download.01.org/0day-ci/archive/20260926/202609260303.0f08SoDa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260303.0f08SoDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260303.0f08SoDa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: sound/soc/codecs/snd-soc-tas2783-sdw.ko: symbol 'sdca_parse_function' undefined!
>> ERROR: modpost: sound/soc/codecs/snd-soc-tas2783-sdw.ko: symbol 'sdca_regmap_write_init' undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2783_SDW
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=m] && SND_SOC_SDCA [=n] && EFI [=y]
   Selected by [m]:
   - SND_SOC_AMD_LEGACY_SDW_MACH [=m] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP_COMMON [=y] && X86 [=y] && PCI [=y] && ACPI [=y] && SOUNDWIRE [=m]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
