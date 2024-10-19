Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A161CCB38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 05:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729316906; cv=none; b=txdvU+6FtIXmk4UlDi+CRSdGdaOzTCkacKH6F23q8L5N1q4S6ex26G2HbjkqPp4BXJNX2zz3gMJyVq9nmeiKfvnVbEnPDaxAVBWgPya995eniI04WoJvVEW8ljRyyuOc6y3QsZW1H5M+sZq2ualoYvzbEzFYXj0UqhQJ5EezBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729316906; c=relaxed/simple;
	bh=htzpeArzYsNZyEvp3MiWPVXn++9X+jXmM76gHNcDF8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjDelJTBpQiTOhitzr222IVcFgMl0mEyuTjVZhr4gZDpdjrr+CtQFCQr59daXTgK4vJYZ96t6fEPGVGHv8hS5oHGIgX2qaOEc7k0dFy/JcdrX96Z5N3+rvRzc9di9FgReV0al4FOPOveEnDS9K03uLmidthcjyfPrlFAJnMpnFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6I3wSai; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6I3wSai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729316904; x=1760852904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htzpeArzYsNZyEvp3MiWPVXn++9X+jXmM76gHNcDF8Q=;
  b=O6I3wSaiFxwDSPnezGb8AS9RVHkyuM4rljXz08Iqr+aB6m9Bu7egLI9N
   JRlFGlTwT4zVYrGLu5q25dsgt6tDHEIR0KJawbgvnRRe8no8LHJmy67kw
   NyWotQwwAc/MrF35SYkqp/dlgbOW8c3W8fUOzeUsbTMDsgNZZbuWGQNne
   O004sE2GvV8jwO03op44dvY/Oho+PyTs5i2TcwShRWJq2bictOLDfRUH/
   IpeMMcf+CkyaWh0HlzxlI1etqG2VlggFK38q7nNwcliOdXYDWdX8Fdk4O
   viDAEAQDYbxuXzGhbyzHf9CJetYVrZjauAIQJYkTOVJs5j9DDDIWUR878
   w==;
X-CSE-ConnectionGUID: t/nK+LUcSx69DM4dQCnUVQ==
X-CSE-MsgGUID: vM2ttjOvRAq+vMz1ds0KUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46318911"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46318911"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 22:48:24 -0700
X-CSE-ConnectionGUID: +it9GM/VSFqeuNjjoSZSGQ==
X-CSE-MsgGUID: 7ZhdqcW5QoSbsZzcpCDRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="83681786"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2024 22:48:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t22K4-000OjJ-1y;
	Sat, 19 Oct 2024 05:48:20 +0000
Date: Sat, 19 Oct 2024 13:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>
Subject: [linux-next:master 5486/5686] drivers/clk/clk-npcm8xx.c:245:1-7:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_ul
 instead.
Message-ID: <202410191310.tTSEqoIZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: e0b255df027e9745ec4c21dd08e333e46c03556c [5486/5686] clk: npcm8xx: add clock controller
config: arc-randconfig-r053-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191310.tTSEqoIZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191310.tTSEqoIZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-npcm8xx.c:245:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +245 drivers/clk/clk-npcm8xx.c

   223	
   224	static unsigned long npcm8xx_clk_pll_recalc_rate(struct clk_hw *hw,
   225							 unsigned long parent_rate)
   226	{
   227		struct npcm8xx_clk_pll *pll = to_npcm8xx_clk_pll(hw);
   228		unsigned long fbdv, indv, otdv1, otdv2;
   229		unsigned int val;
   230		u64 ret;
   231	
   232		if (parent_rate == 0) {
   233			pr_debug("%s: parent rate is zero\n", __func__);
   234			return 0;
   235		}
   236	
   237		val = readl_relaxed(pll->pllcon);
   238	
   239		indv = FIELD_GET(PLLCON_INDV, val);
   240		fbdv = FIELD_GET(PLLCON_FBDV, val);
   241		otdv1 = FIELD_GET(PLLCON_OTDV1, val);
   242		otdv2 = FIELD_GET(PLLCON_OTDV2, val);
   243	
   244		ret = (u64)parent_rate * fbdv;
 > 245		do_div(ret, indv * otdv1 * otdv2);
   246	
   247		return ret;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
