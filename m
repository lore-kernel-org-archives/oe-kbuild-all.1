Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721020;
	b=yTgaWiMBDoD7926cjFgu65Mnq1atua44oHearISR1gkjiURpgsh6rPxc6OEKj9BGpaSV
	 C/cjTcXZBV1unPVa13z3f0l2x2meV1ClSAjRAkSoHGLEEYMOE5lkbDt4rTelsE0wXyaGg
	 i4kLqCRuMLlRLOQYkj9Tp8AFnn+zL/VcWc/fa6YmQzTLP/aBxGsyxAtsXU/zTXEeDHTVg
	 E0whWrJIl0rzx8Wb3HRfvKwo43griObMCU2K+QByBWmZyBt52NdmWTed9tlI3xXUUNwqj
	 VtSdCAJoPCuvHpan66+XY8TcRAA4TC4kn02oJRlPq6wibRANhUNC2Zgs33MXRhiaiqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721020;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tzaDk/20wjHfejxt3JQM39EoHnF0YRccCzqthA9FHDQ=;
	b=B1FZS4EtBZl0qa5URYQ5FFXeFEe8v+syyyPgny2vzoiG9v0+b9fjDMXiSFUUpjki5ldL
	 HTyMZRRwgMqLYbfKa4spnfBLSXBITnxOpo9lxywAIAXT5xj6jmNW04YkNdqn6m0DXu2Dc
	 11KNfQjrHPD/l/m91b0RgKeDxUUG74j8bE4OuWgkmi+K6cTol47mC0ERf1G3v2jCD/nRc
	 wIvM3ROrf64lNs3/srtCKzGXJ5gLIUTjPI4PDq+TDQRE3o0pEWEaaBP21vDYOYdHiKKH+
	 ipbRRGn8fOX7UHVFY1S78LEbapka+9iGwTq7W8s3IxLk1FyrT0nNdrpuISH+jBr7JgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=epi5JwP5;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72502606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72502606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=epi5JwP5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795721020; x=1827257020;
  h=date:from:to:cc:subject:message-id;
  bh=xzVZxjANWTDOP/n0zXENIp8REpjg6t838ykwe7FLd2E=;
  b=epi5JwP5M0q/106GugLiMbfq349IKD6a/Sep9J8LwgrvV5YyAR0hWxqw
   Ku5YdxNxwWjWYqLI3ZpsNq7otlHhsiS4eAj8DjvXAN1qvIWKH4oTmriRE
   KMxwZKWlIXoiW5ACTGenBu8HOA9PI+LWAZDVO9UcVGwdyRQW8bo0PVnD9
   jH/ywwZPq6ugzSQzEHlcdYpYDVoOjropez7vvqoZHVbEPjY2nbWiyGcOO
   UwLSfTBFuuvMz2hogcat4Q5msU9HOc2dWefIs+PONylh0yb83kmvLq+cJ
   0121enrILvG948wxZUTGUSFdwiMVSOwqK9TR8+HAbzRZBo0FfxQCqKzzh
   Q==;
X-CSE-ConnectionGUID: FoJuxTM5Rb6vxrsCmPrefQ==
X-CSE-MsgGUID: VIwTgH0PTi+KOL/XX7WZcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4480568"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4480568"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 11:23:39 -0800
X-CSE-ConnectionGUID: w2+vUYqhT9Skux0R8nxeRA==
X-CSE-MsgGUID: JXWaqOfURy+6p6H3Q/ptEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12091393"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2026 11:23:38 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWf4B-000000000AI-1hR6;
	Thu, 26 Nov 2026 19:23:35 +0000
Date: Thu, 26 Nov 2026 20:22:48 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 1/1] kismet: WARNING: unmet
 direct dependencies detected for PM_GENERIC_DOMAINS_OF when selected by
 COMMON_CLK_MT8173_MFGTOP
Message-ID: <20261126201921.Rj7uU5HI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   bf136280696b06966b7c6b2cfb7cf583431ba43d
commit: ebd0b73d2137c2277440da04124a0ce7011b2d1a [1/1] clk: mediatek: Add mt8173-mfgtop driver
config: x86_64-kismet-CONFIG_PM_GENERIC_DOMAINS_OF-CONFIG_COMMON_CLK_MT8173_MFGTOP-0-0 (https://download.01.org/0day-ci/archive/20261126/20261126201921.Rj7uU5HI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261126/20261126201921.Rj7uU5HI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126201921.Rj7uU5HI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF when selected by COMMON_CLK_MT8173_MFGTOP
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
     Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
     Selected by [y]:
     - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
