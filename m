Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5FC346E51
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209278; cv=none; b=IvKIZG0C4RCgJ6MinGDbS7OHrMpsWM7ZuRY2zi3ruORt0CA5ic/GPpZUE+zvq8DZ41CuW5eLMxVe0Bav8u+XiNhYE2re9hkUUCmmslDF0DwkCaK2CSrbJlMpoH4OGLdRWlGLLq8GQcELJoiZB9+AEqkbUczCqKMZJq8D9wj2lAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209278; c=relaxed/simple;
	bh=YEtCwVkwtbmMpF+wzDoWTZ1r38XPnNr2HQBa6hvxvHs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cFu1fYYKvOhq0+jnKnD8XAJQaECgobTOncoHJAr67LzUjzZ8f8NiG8gGfGSiLb79d32Knsxw37DAfPDeqPR/95Wn7tP8krDkkJWGkClKdiGflbz4uIrZnCeQTCuaG9TGynMK6UgWcF2AHbOFIIzm89gRXaUo/2CwQqnupXc14As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkYsa6na; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkYsa6na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768209277; x=1799745277;
  h=date:from:to:cc:subject:message-id;
  bh=YEtCwVkwtbmMpF+wzDoWTZ1r38XPnNr2HQBa6hvxvHs=;
  b=SkYsa6nayHCYinfgJo3K8WHo9A7c8yeTgZMROdT8KAYiSc4VDo9RlMVm
   5T3AUGdXjFvAVAt7rTj6fB1lH/rP7+irB3itavXOdZfo1SGiXtINe1LaF
   LLJtn91wcIwt5eA2+fQAzqT9bydCrkDuQaUNUgreT7VAr3HhmTC8MXznv
   FjbXstWFQ5jLjhz7uAkz46peAggRsUC1zmHpwLjU3ytFwxJiKs/0mkdDd
   OIOA5v+5xZyvjbgyxFG1gW6t9hqakGeLbDTeE1sp76xhI72FXn7+l+sGd
   GlbmRhCDZBrBQsdsQ32lCvGti2JP7da75mGaSF5EvV+eyfbDhuwV+yrnW
   Q==;
X-CSE-ConnectionGUID: M5Yj7CwYRk+YrnYGqy7fIg==
X-CSE-MsgGUID: qdNdwx2FR3Cw3WFCsd421w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80845463"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80845463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:14:36 -0800
X-CSE-ConnectionGUID: MEUV1n0FTg6A3ihaH6DxIQ==
X-CSE-MsgGUID: sIzLnYqtTPKkJz+mErfk9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203843889"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Jan 2026 01:14:35 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfE0O-000000000rX-0BcX;
	Mon, 12 Jan 2026 09:14:32 +0000
Date: Mon, 12 Jan 2026 10:14:31 +0100
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_WM9712 when selected by SND_MPC52xx_SOC_PCM030
Message-ID: <202601121014.o5fiUpPT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f61b1860cc3f52aef9036d7235ed1f017632193
commit: 5a309875787db47d69610e45f00a727ef9e62aa0 ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout
date:   6 years ago
config: powerpc-kismet-CONFIG_SND_SOC_WM9712-CONFIG_SND_MPC52xx_SOC_PCM030-0-0 (https://download.01.org/0day-ci/archive/20260112/202601121014.o5fiUpPT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601121014.o5fiUpPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121014.o5fiUpPT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM9712 when selected by SND_MPC52xx_SOC_PCM030
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_WM9712
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]
   
   WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
     Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
     Selected by [y]:
     - TOUCHSCREEN_ADC [=y] && !UML && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && IIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
