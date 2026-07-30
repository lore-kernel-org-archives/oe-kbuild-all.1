Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E540A92C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 23:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453322; cv=none; b=P3LKt3Z8U+v8Babuhdlk05pve09Glg3iJsW3hC0bgHJ7hXm4ehDVtcTLyz2vRHTEpxBu5zD/a228LjX17k+zeDdk0yWeZ6MIV9AsfQWFsoEPdegnhEny+9bGXQnVOjc9zRqjyavHhXr8c0/UbtSOi7HY9+/pPVip9ZEmxXU1FK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453322; c=relaxed/simple;
	bh=UKJj+lZ0gA5zFESGVLWomiaYlPloYuehX83VBbwIfd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eLP1szhYlQRVOQ9MdzfyxObAow9FBBAYV+DsGVCBKC6W87rAT8ZESvLIALdJVdb/ZgtXqx2E79rFNW1XCxT77kv0pVCUu7uErg1l5IZepyEmCxkYcnf0/xCv39MP3XlHMN6UY34yjsf0w8qx9iYMY7QcSfYlaoHv8Z6RVUYMQkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmM+gJGK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmM+gJGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785453321; x=1816989321;
  h=date:from:to:cc:subject:message-id;
  bh=UKJj+lZ0gA5zFESGVLWomiaYlPloYuehX83VBbwIfd4=;
  b=AmM+gJGKoHMEOo1AwrQij0/j3rjmYRd8knHhMxE/KnO1RH5lNui7tkML
   sspA86LRPVX/plSlm9JkgkOpD2ytUAgoksRHYRq8LdhZVwcwEDy/6iHPG
   EwWldgJI1B4mNF/5xXgmOmnXFLP8vhbkffNoQfDwkYLDur7rNODpOsXEB
   xqXIc/T8tPw0XKAURoc5bsvdeqFome+3PISi0oK7jBtYuvSQALZ1rhUw9
   H6mHtq3p4UHwWSXTz7+4t/oPs+hYT+F9hudz+Doi3N3lxYrhoSJYd2Ac2
   UEp7i3IsjlaQUdvPkuf9DbcvqY2q57UoXQs2gVsBslIpOQJdJqAJgzrUi
   A==;
X-CSE-ConnectionGUID: NHwmOpUdQzuWbx+ogucmdA==
X-CSE-MsgGUID: o+fCyqvJSxCGPIo+EY2LHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86031787"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86031787"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 16:15:20 -0700
X-CSE-ConnectionGUID: bmnCnjjsTlWealmViIAiSw==
X-CSE-MsgGUID: /nLsNRCGTvigTjPgCZJTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="257074680"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2026 16:15:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpZy8-00000000hhB-13UR;
	Thu, 30 Jul 2026 23:15:16 +0000
Date: Fri, 31 Jul 2026 07:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 5/700]
 drivers/clk/mstar/clk-msc313-miupll.c:40:30: warning: unused variable
 'miupll'
Message-ID: <202607310756.cZvYiYmD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: d1f1fc4ffade5014d2301ac799b344cecb0a271a [5/700] clk: mstar: miupll driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607310756.cZvYiYmD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310756.cZvYiYmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310756.cZvYiYmD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/mstar/clk-msc313-miupll.c: In function 'mstar_miupll_is_enabled':
>> drivers/clk/mstar/clk-msc313-miupll.c:40:30: warning: unused variable 'miupll' [-Wunused-variable]
      40 |         struct mstar_miupll *miupll = to_miupll(hw);
         |                              ^~~~~~


vim +/miupll +40 drivers/clk/mstar/clk-msc313-miupll.c

    37	
    38	static int mstar_miupll_is_enabled(struct clk_hw *hw)
    39	{
  > 40		struct mstar_miupll *miupll = to_miupll(hw);
    41	
    42		return 0;
    43	}
    44	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
