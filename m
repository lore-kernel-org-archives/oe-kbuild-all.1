Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D54204583
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 18:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879958; cv=none; b=TwAQx1mzqym6RZmuVM6TPqsBD+QXrZNEvmssnqy8eyIr1w1zlX8UWZ4jkhGCw5RTPxL6oJ2r1nFpOMymTAMzJHgachUbSymUKBZ0pcVQklNAxHYVjzSHwHqETMv6GAVNCphCgPhFkcjdxfWqD2AaHFVnZYIhF+doLojHG1yG154=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879958; c=relaxed/simple;
	bh=ebjhKORfidptn+R4o8l2wKMfgri13jwYFshVAaCDWw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cO9Bd2jQgXuib5tyQfSPFN79/mQjmVuQqk30pf91yNb59HnbDO3J0HF/zvpcLB3P7F9MKWUX77odHoOdvEl4uXwKyzzAPbhEoH+TTGZWKatUrVERPI3+A4OjGZrNIuD1X4vDPVPSDGTEVqw47IhKZkzC/RP4eTSh0dlFdxqZOhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKvEFxaE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKvEFxaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736879956; x=1768415956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ebjhKORfidptn+R4o8l2wKMfgri13jwYFshVAaCDWw4=;
  b=UKvEFxaEpdxYSuAH4UHxhSCjIeE0dPvg+dKrKMDouQFpy1uPmF1VbSO6
   EqmL7O+TjlY+3yDF9i+2qzKvdJHy6xiXFq6AUk0UmICcZndlcxs9TGwWp
   A4rSD79XovMWH/6W0Efi34jJQdy8bJ1iMRdFI8qkNB4kUz92mOJWTcsjL
   qOsbW/l2hDVwFNPyJ9UR2jSZqM/SqnVvvYAgdsGO+Lzu9zkZvhB+kXJAR
   QDDIEnb1JhTCTcIUKBEhTXPVvnxmhLzZUm0cmgMBzjlZ+QU1O8t44EENq
   J/CYa+2U3YjTiYj3Fq+xeXXf18BlC0oq1X1sC2SuJaMq3h1uUokOdX42b
   A==;
X-CSE-ConnectionGUID: +eXY+6LLQrWkn9w/Ctjfvw==
X-CSE-MsgGUID: KDtymD4nTiydKlZhtMpqLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37420292"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="37420292"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 10:39:15 -0800
X-CSE-ConnectionGUID: q9fDWhW0R1SXT6vq8xW5Kw==
X-CSE-MsgGUID: eqPStlzHRcyR3cSDak8MRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="135717318"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jan 2025 10:39:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXlok-000OtL-2A;
	Tue, 14 Jan 2025 18:39:10 +0000
Date: Wed, 15 Jan 2025 02:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 921/8513] phy-mtk-hdmi.c:(.text.unlikely+0x64):
 relocation truncated to fit: R_NIOS2_CALL26 against
 `devm_regulator_register'
Message-ID: <202501150252.VrJHoSEm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dab2734f8e9ecba609d66d1dd087a392a7774c04
commit: 49393b2da1cd5b0a6859693369b4fb27df59d3e2 [921/8513] phy: mediatek: phy-mtk-hdmi: Register PHY provided regulator
config: nios2-randconfig-001-20250114 (https://download.01.org/0day-ci/archive/20250115/202501150252.VrJHoSEm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150252.VrJHoSEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150252.VrJHoSEm-lkp@intel.com/

Note: the linux-next/master HEAD dab2734f8e9ecba609d66d1dd087a392a7774c04 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi.o: in function `mtk_hdmi_phy_register_regulators':
   phy-mtk-hdmi.c:(.text.unlikely+0x64): undefined reference to `devm_regulator_register'
>> phy-mtk-hdmi.c:(.text.unlikely+0x64): relocation truncated to fit: R_NIOS2_CALL26 against `devm_regulator_register'
   nios2-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_is_enabled':
   phy-mtk-hdmi-mt8195.c:(.text+0x230): undefined reference to `rdev_get_drvdata'
>> phy-mtk-hdmi-mt8195.c:(.text+0x230): relocation truncated to fit: R_NIOS2_CALL26 against `rdev_get_drvdata'
   nios2-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_disable':
   phy-mtk-hdmi-mt8195.c:(.text+0x25c): undefined reference to `rdev_get_drvdata'
   phy-mtk-hdmi-mt8195.c:(.text+0x25c): relocation truncated to fit: R_NIOS2_CALL26 against `rdev_get_drvdata'
   nios2-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_enable':
   phy-mtk-hdmi-mt8195.c:(.text+0x290): undefined reference to `rdev_get_drvdata'
   phy-mtk-hdmi-mt8195.c:(.text+0x290): relocation truncated to fit: R_NIOS2_CALL26 against `rdev_get_drvdata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
