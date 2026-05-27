Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43926390223
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 20:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913007; cv=none; b=Umnc8rUrXIFftfCk7W9G22lauegU3HXwwIS4WUUV/tojlllDabr0LiEVK7hYJIMyzKMmaxW6+BvZa9ADF3FTig+dZ5DGr69WsfMi24agMv9ZKQ7Tuw4hew8D9tuypPbw72aaGP95XCuOcEed1vekUSsVgNmOSh3TV/cYxYHQFbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913007; c=relaxed/simple;
	bh=W3kWoI4nGLAfAcg199xkteiLpgULif+FjrjTVaB0myw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WpU9qm/Yo+BjMM56+zPtwVZE0GgpTos0FZV9ylS2qUbxh/QphRh1OW0qvVIlMZnTF0p47C6EKGS/WLFMd1EKbX9YFmsGRBf+hPpvhGP879MZ7/BnObMRHeiNZp/AUY5Wrp+8V+TYz2DLuvjoHmwJcIzgICp4f1uDkFi2tRqe28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9xMwm+n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9xMwm+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779913006; x=1811449006;
  h=date:from:to:cc:subject:message-id;
  bh=W3kWoI4nGLAfAcg199xkteiLpgULif+FjrjTVaB0myw=;
  b=U9xMwm+nwAPOAmwcxxyiWlXubJna+7t30tGBN9KRMhMtdSmzj6P2s4sq
   OI8Es7bJ6s+bm3xQEsuD8Ux6yFea0nLCCUhArS/D4gdh6vXfMblfbcGQg
   sAtnA+aMalDU8dtqKp5PftrSFV8exzCLKvSdp+kunOxXde9qvvc+wEaXA
   Y8p5PMqYW3cjRJPef55h9n0AGPnabXlxKO1lADTNOBLnqhAQ3qsgBM5M1
   EFwMJGP74undShlu/eWyb2tlVrCUvrIfCWaMyp9Msp4lrWoZHRSjcNNC2
   kkkSKa4uPXvQfcJ55unI078lIBXWDuJKl5lJusL7Ba4eyrjeOKMgp6VIA
   g==;
X-CSE-ConnectionGUID: dQ+tVH+RQ6OK1Uors6R+9w==
X-CSE-MsgGUID: lNHtZRsvRSCc0OVi3qWU+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92141809"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="92141809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 13:16:46 -0700
X-CSE-ConnectionGUID: Yel+iHT4TuGtW65Ag0Felg==
X-CSE-MsgGUID: Y3tFyx8mTjKEiEHiW0MINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="265946295"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 May 2026 13:16:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSKgD-000000004Q4-3L9Z;
	Wed, 27 May 2026 20:16:41 +0000
Date: Thu, 28 May 2026 04:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: tc358746.c:(.text.tc358746_probe+0x4aa): undefined reference
 to `devm_clk_hw_register'
Message-ID: <202605280422.S2WDpmPf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
commit: 4fbdd56edf1f0b3e338c90a011bbae1a677ac884 m68k: Enable dead code elimination
date:   11 months ago
config: m68k-randconfig-r061-20260527 (https://download.01.org/0day-ci/archive/20260528/202605280422.S2WDpmPf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280422.S2WDpmPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4fbdd56edf1f ("m68k: Enable dead code elimination")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280422.S2WDpmPf-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
>> tc358746.c:(.text.tc358746_probe+0x4aa): undefined reference to `devm_clk_hw_register'
>> m68k-linux-ld: tc358746.c:(.text.tc358746_probe+0x4fe): undefined reference to `of_clk_hw_simple_get'
>> m68k-linux-ld: tc358746.c:(.text.tc358746_probe+0x506): undefined reference to `devm_of_clk_add_hw_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
