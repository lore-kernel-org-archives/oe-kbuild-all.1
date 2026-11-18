Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970636;
	b=aQcw8gbH9amIc800GkgOdR5X8nA6ADB2MsPCV1SAJDHcYM3GMQAMI6OqX9MihgVYp9Uz
	 asGjW1wZVjrKdFFDaQbZPCpU3g6bJwrI4K+4ErJz3XHq0ICR2YZFMdC3kgwL/dhPB1fwI
	 3gS5ZJcUmbyL2QkCNSq10b2DeQrEKTLu2XIGCCHfYDIOOR0r81AKKedmu3QC9JvFAHV0L
	 AdLGY59X2D6V7tHz5eMXs9wsaqWUd9Fa1J7d5UnXbLTAYtZt/ntixoZB59/2qYjzjKt9W
	 y981kWlVKs4g0JD5reyR/iFR3pOt8B5ZxGdxBGH/dFxhzbVfpBS6IhOtFprnlX2p8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970636;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZGBm5T/q7/joNe1mUQ7O+cDLsklQzfDmFcY+94EhKjE=;
	b=jYDSan2mL2qbEVH9eqLeWZLh6PCNaZ+OrIRYLdvetwZCOfKk9/+ISkE6jm8oQut6DzIl
	 16R++EQX2hvJORXMp8zx6Lu+W+CUEXxpUd1d1Go7uVW0W+Jcyu0f+25yUQsTOLdbUB4wb
	 q6OIUMzv52C5GCY2iezHEODCAiPEbc0lLYtwBfgN/lyLWqULp67F815d2m3DIUxfb7PCO
	 u3MvJ/QCipv2D3Mb8wmIz8GUZbkAbhHGgGCLB57+zwg/OXQpOVPuykYzlITIw6eypbGhX
	 5Cun14Dr+tjqChg5ojD4lMsmLFss7dSe+oNv1Tdyn3+aUOFmmy6WhCJZGKIYD6xvgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fgh0qfJG;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521FC606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 02:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 521FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fgh0qfJG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794970636; x=1826506636;
  h=date:from:to:cc:subject:message-id;
  bh=b32hZ8vcRdHOCvMM1YO1znOYJTpSWa0o3SlcqVfR1hM=;
  b=Fgh0qfJG0nOkcPLINnPqya9WafUlHspFXKtgWoIvdRYtfHy6o4p6RVhb
   z1MU+oRd4tZ4aZM2FmEwg0wmRk8XOEKkY1v7Hui5pHQDrc46jjOjFhvoy
   c96+yS7N792T/3pB35bA/101IPK6Jc5fCva3XmWzS3AfY62d478svfxkA
   qG+LyxlV81jJX+uNw8cZoBbBT0GBozBqx7ysEenPWeQO/gUyt7ImHogPH
   E5z8pqKQZQf7nV/90qN4k/bnAQa9jyF01ZR/3lVfubKRKA/31qQHY+RUp
   UIEoNC3UJYUuTCntvs3GYlftCkX4Sin4KyouJFlwfVC3iB/GO1jTk5Nqa
   g==;
X-CSE-ConnectionGUID: kCnjg0S/Qd6ckXojWRKO5Q==
X-CSE-MsgGUID: 0JaSI7vBTFCkt8228n1NaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3655184"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3655184"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 18:57:16 -0800
X-CSE-ConnectionGUID: H4z/B+mYSKGOi/OVQTzs0g==
X-CSE-MsgGUID: WBkzbGOeSl2DrY0Nf8FBMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10523360"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2026 18:57:14 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTVrD-000000003JE-3wVg;
	Wed, 18 Nov 2026 02:57:11 +0000
Date: Wed, 18 Nov 2026 03:56:58 +0100
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [avpatel:riscv_iommu_irqbypass_v3 18/43] ld.lld: error:
 undefined symbol: resctrl_arch_preconvert_bw
Message-ID: <20261118035455.moSKytAE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v3
head:   8fd19d27f3e2aa4eea0b2e4b4615f575affcf3ff
commit: a51896fa0a5fd957681699fb8d57a005931412ed [18/43] riscv_cbqri: Make RESCTRL_FS available on RISC-V
config: riscv-randconfig-2200-20261117 (https://download.01.org/0day-ci/archive/20261118/20261118035455.moSKytAE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118035455.moSKytAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118035455.moSKytAE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: resctrl_arch_preconvert_bw
   >>> referenced by ctrlmondata.c:51 (fs/resctrl/ctrlmondata.c:51)
   >>>               vmlinux.o:(parse_bw)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
