Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDD74A5C58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054897; cv=none; b=a90EqOidRx9gmEIRQrJYFxJk9Nj49OusfQxHJ8XDMwRIzN2MJWJJGQZNPBPM0otGH+wSn7exfyx7mfKjdJ3yVih0j2jpq6NKH/AF0EhTExvq4lXrCMmceC15ylLIHkT4q7e9NdcM3a75maUhcAYEW1MIKGWNX11nDA/HEbBr4Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054897; c=relaxed/simple;
	bh=wAH4YynYb/u7pODfX/919oy/mmKRjBFNXvdUAi+SIN0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c4flHw/AUKU3vl4tQ9A69ibnX7vUeBB6tgpITTKzWUVUQ3k/G+bqeXRKvyy+oYpaV0pOhV2P8t6yf699SUN39PPLLVUzfXoRKibO0JYejSPt8IiHpCYX98Rr5mcZzp0h7Yf6SGc/u7q5v6oB17XEWkcTTecTWbIgIRNDb5Ehk2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7TsQmUQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7TsQmUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054896; x=1820590896;
  h=date:from:to:cc:subject:message-id;
  bh=wAH4YynYb/u7pODfX/919oy/mmKRjBFNXvdUAi+SIN0=;
  b=L7TsQmUQbbZgJ4bclojSbAXIpf0l5v6ZMKP2uEDgerhjNUxIOi56nLS5
   D+G1CAbDogxJt70d6sVHarHVMoJtl8jKZzi4iKA+LmlT2lU+jN73cmFj9
   GAMxR4HA8sXvnyV6uTUzPCiRxgmag8QeMT135oFWBsMr/wQDXlSZakmpe
   6G3wvUAIoLUTqPD0iWQtiSPC3xYxslm8dgugmxfSWfXJPOxKolSqRSbtf
   lUA2NLHwTOeI9Af7er9/M/QRS/iwAKhnT0TdYVhEh1JTi/PB+a0m3mWPn
   8bAzVLXw9uQjXLLYByOAn6WGqnqXWvNe6jmXtCyqFoFcUzKTRNmOb6Cp+
   g==;
X-CSE-ConnectionGUID: rOdEpNieQeO8OKSaY8fEfw==
X-CSE-MsgGUID: I7/gw71JScWfu9Cvc2kL1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066953"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066953"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:33 -0700
X-CSE-ConnectionGUID: 5zdW+OM7Siy8VOTq5xn0BQ==
X-CSE-MsgGUID: bEY0HfOwSae3XYG7HAvhoQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qd-1Fjg;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:40:57 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 128/294] Warning:
 drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in
 'si5351_clkout_config' (did you mean one of: 'clkout_src')
Message-ID: <202609100456.ZiTH0pix-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 0ee82eed70149eda4e0d07f4f7d02b59d0728b32 [128/294] clk: si5351: remove pdata based probing
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100456.ZiTH0pix-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100456.ZiTH0pix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100456.ZiTH0pix-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config' (did you mean one of: 'clkout_src')
   Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_xtal' description in 'si5351_platform_data'
   Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_clkin' description in 'si5351_platform_data'
   Warning: drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config' (did you mean one of: 'clkout_src')
   Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_xtal' description in 'si5351_platform_data'
   Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_clkin' description in 'si5351_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
