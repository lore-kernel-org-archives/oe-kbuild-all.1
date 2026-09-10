Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863D038DC73
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054898; cv=none; b=CifOSISQ6l5x1+utY17zBmg/AN4Yd9oPhaWEpRVcyAUGWddbH8oVE3AjlRquiBDNkXQ+xBRv1A/B1yGmA7sLQu4f0nI3uQiCBRPceXB/ZubKUGh6G0HxCjTXS0A4yhGN8fmpTONPnYAijaAKDOtSKczyzQOgfrbjXoDpEy/RMps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054898; c=relaxed/simple;
	bh=Y6d2CO7EnuJIobxY+n8MiZeRUMilrTZ3+MjTaHw6U5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=igMR0yROL7NWxyrYoj00kSytW0fnojiLjM+IUaN/Ui6MZuEU+VgzsXwDbSWhT0Qbr+RrVc5ZFbt4AmfXqao8ofUMtH53PKAnDO0aggMMd2TaQdHj8zseaiV4LFSubMAE3I13KPraArbeiGvaQbuNPpTD8WhKSmYuriz6O90Sm7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lwx+OOCU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lwx+OOCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054897; x=1820590897;
  h=date:from:to:cc:subject:message-id;
  bh=Y6d2CO7EnuJIobxY+n8MiZeRUMilrTZ3+MjTaHw6U5w=;
  b=Lwx+OOCUqtcZBGeJroNm3Am/hZuPRDqTwlCikg0CGOOrHcXwuZ6SmhJW
   EXTzJM56tQIXLYcNUfvWCzhFpDRiKCbjhCcGMSNXX+vNKedQz6lTPNkFK
   6SBugxEYhBIusZ7x6qS5MD6MAMkK92Uuc6pwGSyC2U3CLxEgt3Z2harsM
   iNytQFkDCAIQ5WXhv6V3Qv70kzGZtCdpJ6vEPPIxaIu8Q3sEu6p2WpNLm
   +igdCeHdVpTP3ieVCI6lRh/aD/bKwOcahFmaiPCcFMfejnZpREwWfxWjb
   DYGFDAdbjkKv0BPV3I7EWer86pkT2sBlBjtIf44WTMMSzuU2LIhkcDWKy
   w==;
X-CSE-ConnectionGUID: 5ofeglOuQTWvfyI6O1rV2Q==
X-CSE-MsgGUID: CBkJCge4SSy2zi2Ys5xblQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066961"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066961"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:33 -0700
X-CSE-ConnectionGUID: Sk6CMoSpRtqjVuz0ISuv6w==
X-CSE-MsgGUID: U4KNIzfSQD2pj1GKf9STHg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qg-1RHh;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:40:54 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 150/294] Warning:
 drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description
 in 'lp8755_platform_data' (did you mean one of: 'mphase')
Message-ID: <202609100447.zZyMwFaw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 905b7c450d5e7fc2b71fcfe266151834717521eb [150/294] regulator: lp8755: remove platform data based probing
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609100447.zZyMwFaw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100447.zZyMwFaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100447.zZyMwFaw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/regulator/lp8755.c:72 struct member 'mphase' not described in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data' (did you mean one of: 'mphase')
   Warning: drivers/regulator/lp8755.c:72 struct member 'mphase' not described in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data' (did you mean one of: 'mphase')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
