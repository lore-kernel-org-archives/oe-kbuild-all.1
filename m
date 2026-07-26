Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFB437FF43
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785064568; cv=none; b=JTwk9fYe+/mox9VgIGaxwm7I6ddVBWr4lqYh6NMoYwtqPfS/XVXMpQFiOTNUOCDRUY/lTZmvsFkmfi6e8GymIj0puMYhEDjMCDTYT//QpdvBdMWyqVfSh4Na0xnYKvgbYHTWLtYHXmYc6MvRmixROnJOG6rLFUmnh+TlyLmaUU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785064568; c=relaxed/simple;
	bh=2DgdTk5/8QCZu/Twf5U9Umbtjfbv0js3EcPQ4Lj7Iec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jssf38/4hvUllVnTM010zsy9PzRlhQ/2iqtrm4e5DHqB8QKJR+Mcuh8bglEQRueBrx3kAx67yWBpTZbEWEux6CGlt3gXzQ8oKwaG/bDV/74UWrrjNFFzLDNF9AJCTS8tFPRRe1Nr21uH4h7kWP2ASZhRd9lUCy5UcCgRsKOT2Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sbur6d0l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sbur6d0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785064565; x=1816600565;
  h=date:from:to:cc:subject:message-id;
  bh=2DgdTk5/8QCZu/Twf5U9Umbtjfbv0js3EcPQ4Lj7Iec=;
  b=Sbur6d0lnT8bgp91Vvnx/iF5aSzEjR28QeIE7f5Rlu1Jj2ce7sJ4Ws8E
   mdbF2OUSdN/NDkeEOFV9F6+kleXkZHYFkb3i8O2TghIQbjeDk3jQbUEPS
   d+GlhjFikbQySTqB8W3CDcth28A+WNU9uVJEkEC/r9q6MC5EFoI1u0VG7
   MZ8htNA/fQz9KjV5e3N8MaGoNPfbCJyFMSp/VHAjFzDxWbgbWBeBQfw+P
   rgh1YyidXrG3FyZCpnZX8BEzmj6L5e0TXC9LKgrFazOlInpTyYD/tOMMU
   3LtnZnZJp6jBaFXuljcloi0KXWgj3A7hrdNrNsTMPm9QuYVoZO5sP5U9u
   w==;
X-CSE-ConnectionGUID: uv1F9pp+SS+JZHqmxf6p/w==
X-CSE-MsgGUID: R9ulPU59TNW7ZHI8UW9I1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="97172879"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="97172879"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 04:16:04 -0700
X-CSE-ConnectionGUID: 6rJv32zkSnmnwwS4Udl7vQ==
X-CSE-MsgGUID: 2lbJgFx8Ssic1JMG3vCGYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="282484412"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jul 2026 04:16:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnwpl-00000000cUe-2SWn;
	Sun, 26 Jul 2026 11:15:54 +0000
Date: Sun, 26 Jul 2026 19:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Rob Herring <robh@kernel.org>
Subject: drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use
 ARRAY_SIZE
Message-ID: <202607261949.XhxCx28Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrea,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: ce26f588c8310e0fdd1bc7524a86fdf0ef6b1c85 misc: rp1: drop overlay support
date:   7 months ago
config: powerpc-randconfig-r051-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261949.XhxCx28Z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ce26f588c831 ("misc: rp1: drop overlay support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261949.XhxCx28Z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use ARRAY_SIZE
   drivers/pinctrl/pinctrl-rp1.c:444:33-34: WARNING: Use ARRAY_SIZE

vim +343 drivers/pinctrl/pinctrl-rp1.c

e3ce7b897388339 Andrea della Porta 2025-06-24  339  
e3ce7b897388339 Andrea della Porta 2025-06-24  340  #define PIN_ARRAY(...) \
e3ce7b897388339 Andrea della Porta 2025-06-24  341  	(const unsigned int []) {__VA_ARGS__}
e3ce7b897388339 Andrea della Porta 2025-06-24  342  #define PIN_ARRAY_SIZE(...) \
e3ce7b897388339 Andrea della Porta 2025-06-24 @343  	(sizeof((unsigned int[]) {__VA_ARGS__}) / sizeof(unsigned int))
e3ce7b897388339 Andrea della Porta 2025-06-24  344  #define RP1_GROUP(name, ...) \
e3ce7b897388339 Andrea della Porta 2025-06-24  345  	PINCTRL_PINGROUP(#name, PIN_ARRAY(__VA_ARGS__), \
e3ce7b897388339 Andrea della Porta 2025-06-24  346  			 PIN_ARRAY_SIZE(__VA_ARGS__))
e3ce7b897388339 Andrea della Porta 2025-06-24  347  

:::::: The code at line 343 was first introduced by commit
:::::: e3ce7b897388339b407d57969acaa26063e38209 pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support

:::::: TO: Andrea della Porta <andrea.porta@suse.com>
:::::: CC: Florian Fainelli <florian.fainelli@broadcom.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
