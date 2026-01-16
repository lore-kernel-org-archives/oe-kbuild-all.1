Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2334D937
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544986; cv=none; b=f19x+Zqg7hIDIlM5kjxGk1iTx1VFjMn6pW7dIiESTiPrHFrY8zywfAOtF8OmF/3EN459KX0dXsfsyz1LA/LKtJeW3VjKyhXobWv42WgB7yEjI5EoeuojtbMDPZDlqjBsMmfUS1O8NQcuvQeuMBXEzD9lxkGclNzF1NWlYnYgvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544986; c=relaxed/simple;
	bh=i5uyaP1Ras7Bff4JSc/Xps1bOUepT9I2pIventfhNfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ANxc4wDtMFLq7+iJU9AKAOkZW1+8lWM/CFr7Pd1TxadHgGPMZmLuW1JyvkdS2r6ySB19Xy0hO/KWqk7pfHIkSw36NQ2QFxZMiwfq3lVLGqvhqKdPR/ep6l1a/ZOhM5jY2WHIKovCTm72Pf44PPqA9igfgiW9Ra4OnRykfF+hrZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LE8n/S3R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LE8n/S3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768544986; x=1800080986;
  h=date:from:to:cc:subject:message-id;
  bh=i5uyaP1Ras7Bff4JSc/Xps1bOUepT9I2pIventfhNfQ=;
  b=LE8n/S3Rnt6HfvAnUfbpyOSpejDY46kKCIWUN6Zsp5EJUoXapOzhBrov
   ONlEAFfBxwfKEOnjsO/i4VczenqUxhsa7pUAReVYTY15apHhUjuS/WJHa
   U2T7lIQokCPYgn1Km5i8AYMh95jRRRU8yz0HcpjMTKe4RTlzwVCw5LMBY
   x7JVeYWg5vNYhXSy7QjxVvEBY9zDhfgnRKndP4Sm7RjlAOrz8/OuIf/2J
   DgjWxtMb0fqgN66r0hH/I3igixDx8lneuQY0jLE4Zbz7UGIx8m+EUZhgv
   s93QDvS97Ma+s4bfZmpMdBkiuC/Hr5ODn3MWSEZcelL7j3m10HEbY7pnJ
   w==;
X-CSE-ConnectionGUID: Qooe+XtuSYWaotPccns8xQ==
X-CSE-MsgGUID: X+VIggcDRiayEvMGUXYMpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="95336418"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="95336418"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:29:44 -0800
X-CSE-ConnectionGUID: pwbqHE/zREe198UKNjs8TA==
X-CSE-MsgGUID: 6poVo42DSES4h0aCJgFgpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205437733"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 22:29:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgdL1-00000000KTs-1cLC;
	Fri, 16 Jan 2026 06:29:39 +0000
Date: Fri, 16 Jan 2026 14:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [geert-renesas-drivers:renesas-clk-for-v6.20 21/21]
 rzg2l-cpg.c:undefined reference to `__udivdi3'
Message-ID: <202601161408.8oFa2eE5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
head:   5ef5f78c6635da0be514ea60c3c1cddd61dbf8dc
commit: 5ef5f78c6635da0be514ea60c3c1cddd61dbf8dc [21/21] clk: renesas: rzg2l: Remove DSI clock rate restrictions
config: xtensa-randconfig-002-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161408.8oFa2eE5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161408.8oFa2eE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161408.8oFa2eE5-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_mod_clock_enable':
>> rzg2l-cpg.c:(.text+0x19cc): undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_cpg_get_foutpostdiv_rate':
   rzg2l-cpg.c:(.text+0x1c1d): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
