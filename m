Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0670327C18
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 15:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758767; cv=none; b=WvVfjWsrD0ifmvvyJb2GooicLDYdD3D/dbzfF4mzn0a20v9eahrOT4GSqSositjyPIbOYljG8pNNqtoVvP0Ct/fUiwmIPf2RKrJixaSH6WzyQhbV+g5waX4nEh/Rqoz5LfGBaxgy6tOYMSSAwwQBH3ATw36j4Rlkmv6WBnpOWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758767; c=relaxed/simple;
	bh=Uf8frH1j4CCPWZze7+W2vvg5LGSJ9sQdRfH5wj5dNts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z2T5UniLSvxjwuAvCJWjXVIS0gtoI4pxb9hLYYdJ8oEA6pM5bmyhXBbqI828ilLeohDg2RIHss68DknJ9bwbGz4TgeIX/SStAxGVi7g+F2sjWEVF5+5nxY0ihTn/K82c9UfTYhGrPh7JggxL1MHFfzxfTRHjCCpMzSkADKNYlA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8ny+pzX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8ny+pzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787758762; x=1819294762;
  h=date:from:to:cc:subject:message-id;
  bh=Uf8frH1j4CCPWZze7+W2vvg5LGSJ9sQdRfH5wj5dNts=;
  b=c8ny+pzXhi9h0aTWlny7hI470Z5mU2WWLU6r8Aj9SC8QxEBoX8/tRBq5
   Hjj+/UOfIf3gDCTtL2ahWLoeEiEV56l5XlIxrXLkUcEPbiX6SsEuKpJJa
   zn9Cps2JBYuKwr4054AZp5AwPiq/icPu3qjhdHqAGvtc/GyTzkZw2/dUf
   MJ3q/2Ob4IFGd1eBysoEch9zupZb+fj6uDXDWqgB5a74S/59NK/MFl+jS
   qFephD2ibYXk+Lg5TJcDS40z65jGlU/JCCgwPMF61j1qWW6EoQ5fKrpvk
   bRhaDQkeHqpjf1oNbfhS+QQT+GuzqOR7QsZLWZBzcjBXGdMraQl6sJxQq
   A==;
X-CSE-ConnectionGUID: L4aw2QsnT2KYAtuG+aoaVw==
X-CSE-MsgGUID: Utr6xiSaT5uik25I+ljONg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98836243"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="98836243"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 08:39:20 -0700
X-CSE-ConnectionGUID: VGdox3qsRVqGien4MYhRjQ==
X-CSE-MsgGUID: JkQSpdGmTliOmA2C+5BOAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="261462462"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2026 08:39:18 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzFie-000000000Mz-2aAI;
	Wed, 26 Aug 2026 15:39:16 +0000
Date: Wed, 26 Aug 2026 17:39:03 +0200
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Brian Masney <bmasney@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 8151/17167] kismet: WARNING: unmet direct
 dependencies detected for PM_GENERIC_DOMAINS_OF when selected by
 COMMON_CLK_MT8173_MFGTOP
Message-ID: <202608261704.yBTAhfhq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8406e6c0b793ce0788019683837c40855b55995
commit: ebd0b73d2137c2277440da04124a0ce7011b2d1a [8151/17167] clk: mediatek: Add mt8173-mfgtop driver
config: x86_64-kismet-CONFIG_PM_GENERIC_DOMAINS_OF-CONFIG_COMMON_CLK_MT8173_MFGTOP-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261704.yBTAhfhq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261704.yBTAhfhq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261704.yBTAhfhq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF when selected by COMMON_CLK_MT8173_MFGTOP
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
     Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
     Selected by [y]:
     - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
