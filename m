Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8FA27AC57
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763381036; cv=none; b=T6t176YphzIXXUUU9yrxt2KCGy98QJktO7pvqAvQVNrMK8V8Zbz6yWLA/Pe1xkrBlfLg0MwvUgXEPVYYPnqwIoMYmn5nNM3CE4cVV4x6Xc4ILFTY0v4G0ILC4mHtLIZWF06JY9/VHlxJuKfzwvft8gg8Dai1iW2tNnJ/DOWSszQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763381036; c=relaxed/simple;
	bh=Ln6dnBoqACNE+AZGD6332XE1pzRiMN0H2qR6oGFTfmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OxYtNB4Whf6F+rpQzElp2k5adrfaITsM4BGhVfKThYGRHT53Q4bWNPLiWxZiSx/cI9pVv4N/ixVGeHGZzAJTN45InOsdvUc2fMpSFNIOKgcSd9ptEn/ULjmVzhkwZajS026Y5+qAsOdgdQny6QCg7BXrPs2GUziB2qHLfQorPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ynpfm8U2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ynpfm8U2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763381034; x=1794917034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ln6dnBoqACNE+AZGD6332XE1pzRiMN0H2qR6oGFTfmU=;
  b=Ynpfm8U2B0CjCJnk5m5EmJM2ocMeVb6jQSaK+CNrrDrWDMACMtZi/Q1N
   qcxVSD43GNWk3E3vSWjTEBE4thxCoMj4frIk0jTcMvJCMUcoRVge3TQ69
   lmnBE/HFovceb7b3boGIbqY6OyVTS7B+FMV6eBN9PJJUiUmY8MvO144hq
   hh3rP6zUs+MDvO/ZjubiNtzMPvEpMxZSFfzsdzLYH8wGJHvDW89pGy22W
   OHSMyijTETOi5qO9LIpeZrZ7ler1weD0EGWDTdEZ4HNH/AI9/TSLx5hpv
   eEgDiNP2L6gEv2+vj9BFaFvp2BbX4r8J4sbjImHcXC0vyFlOOfgAYwS5c
   A==;
X-CSE-ConnectionGUID: CaQKD9iaQr+O+wMqKO+Geg==
X-CSE-MsgGUID: vTiDc2j6QF6A/29BVwSsCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="69226851"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="69226851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 04:03:54 -0800
X-CSE-ConnectionGUID: 43lmVrNaQ9i3y1GGquckIg==
X-CSE-MsgGUID: 9POIdsB8SBWtPdyS1n38IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194752355"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2025 04:03:53 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKxxW-0000W3-1u;
	Mon, 17 Nov 2025 12:03:50 +0000
Date: Mon, 17 Nov 2025 20:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3212/3212]
 drivers/pinctrl/zhaoxin/pinctrl-kx7000.c:307:23: warning: overlapping
 comparisons always evaluate to true
Message-ID: <202511171908.GkIEY88E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1814a55bda7a73d33ecfdcf11802a1bc667c2e3e
commit: 5d01c9ec4f3b95b0629a38d936f69bc05e494cc9 [3212/3212] pinctrl: Zhaoxin: Add KH-50000 support
config: x86_64-randconfig-r073-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171908.GkIEY88E-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171908.GkIEY88E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171908.GkIEY88E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/zhaoxin/pinctrl-kx7000.c:307:23: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     307 |         else if (pin >= 0x62 || pin <= 0x70)
         |                  ~~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/pinctrl/zhaoxin/pinctrl-kx7000.c:305:23: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     305 |         else if (pin >= 0x57 || pin <= 0x5F)
         |                  ~~~~~~~~~~~~^~~~~~~~~~~~~~
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +307 drivers/pinctrl/zhaoxin/pinctrl-kx7000.c

   288	
   289	static enum zx_gpio_type kx7000_gpio_type(struct zhaoxin_pinctrl *pctrl, unsigned int pin)
   290	{
   291		if (pin >= 0xE && pin <= 0x13)
   292			return ZX_TYPE_PGPIO;
   293		else if (pin >= 0x16 && pin <= 0x28)
   294			return ZX_TYPE_PGPIO;
   295		else if (pin >= 0x29 && pin <= 0x32)
   296			return ZX_TYPE_GPIO;
   297		else if (pin == 0x35 || pin == 0x3B)
   298			return ZX_TYPE_PGPIO;
   299		else if (pin >= 0x42 && pin <= 0x47)
   300			return ZX_TYPE_PGPIO;
   301		else if (pin == 0x4E || pin == 0x50)
   302			return ZX_TYPE_PGPIO;
   303		else if (pin == 0x52 || pin == 0x55)
   304			return ZX_TYPE_PGPIO;
   305		else if (pin >= 0x57 || pin <= 0x5F)
   306			return ZX_TYPE_PGPIO;
 > 307		else if (pin >= 0x62 || pin <= 0x70)
   308			return ZX_TYPE_PGPIO;
   309		else
   310			return ZX_TYPE_ERROR;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
