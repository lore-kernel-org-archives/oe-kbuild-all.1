Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A718622
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736605462; cv=none; b=dR3W1rxLTYteNp2NTvnvwRg4rQ49YfyKpwAzWUFaTisKWftKovuxtE1SKbqBKtAHAHgvJ3wE1T8ectSbuUm54ChfHcKug1/KCGeMFEA2iDF8QPJ13yX/jGxm2rY7BYhGN05/iLNsgw2GTPv/hzDJOaPVaaFrQBf4vZ16z8WndIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736605462; c=relaxed/simple;
	bh=/eYlhSXuG2chYQ+mPZq5RTRkXx0oZPwMp/NLTmmXpmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BrCgihbaW/kuM9hzhl9p50n6pbC8tgEBeqMzX/+3zXp0oSnoXFaZm65/RKJdoMlB7rKF1QCfY08Y/7mra1zIUutBsjcT5oXHs96NJD3pHoSRK535J7fOoTrY448jtquS4FB4xL3xOtdhXUCh/U8XIhOp4rWcIELduMvTQXIx0fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg4tOKA5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg4tOKA5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736605460; x=1768141460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eYlhSXuG2chYQ+mPZq5RTRkXx0oZPwMp/NLTmmXpmI=;
  b=Dg4tOKA5HLPHxNeA9d9RLa0akWp/3OXzY9R0TlQ/o75/DjLMyINW89PW
   VOO1HCAO9pcr+TVYK8k0cTUNEuYeBO1s7qUM0pUUpTAKPAzcXE8stktjc
   MxhiWQSG/6glQmmnhkxpef/OmxiAOhE5LTQQlyLd+prhoNNYbynbxyFEm
   5m+R6irOBeWJUt891JKPfRR60EtVrnnxoDkreTdcLD8GcGBYkpu+LfsMJ
   iRdFnSwW0bsS8+4G8g4fM6D2+cGOIbkWkaDHxVu+h6AOkxdajH9EfN7Ub
   4tYu1mqL/Ncjg7nnkDIj9dtDdJoyc3TppUFtlwNkcLhABOhDSmcZaD6uu
   w==;
X-CSE-ConnectionGUID: MLPiDDdfSTOdI5pucbyadw==
X-CSE-MsgGUID: p6q9CWf3QzKD8a0iZySZpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40828434"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="40828434"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 06:24:17 -0800
X-CSE-ConnectionGUID: Ac0nG7/qSoqMNaYnSc0f2Q==
X-CSE-MsgGUID: gXyMeYmKT56EfR6CyehHUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103881244"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jan 2025 06:24:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWcPN-000Kjj-0C;
	Sat, 11 Jan 2025 14:24:13 +0000
Date: Sat, 11 Jan 2025 22:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Qing <wangqing@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: arch/arm/mach-omap2/clockdomain.c:1303: warning: Function parameter
 or struct member 'unused' not described in '_clkdm_save_context'
Message-ID: <202501112255.Mygdotrd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77a903cd8e5a91d120ee014c8f8eae74d6c5d0f6
commit: 320f6f90cbe4818cf0d0f9441772d23aa441c506 ARM: OMAP2+: fix spellint typo
date:   4 years ago
config: arm-randconfig-r024-20230303 (https://download.01.org/0day-ci/archive/20250111/202501112255.Mygdotrd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112255.Mygdotrd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112255.Mygdotrd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/mach-omap2/clockdomain.c:546: warning: Function parameter or struct member 'user' not described in 'clkdm_for_each'
   arch/arm/mach-omap2/clockdomain.c:1003: warning: expecting prototype for clkdm_deny_idle(). Prototype was for clkdm_deny_idle_nolock() instead
   arch/arm/mach-omap2/clockdomain.c:1165: warning: Function parameter or struct member 'unused' not described in 'clkdm_clk_enable'
   arch/arm/mach-omap2/clockdomain.c:1165: warning: Excess function parameter 'clk' description in 'clkdm_clk_enable'
   arch/arm/mach-omap2/clockdomain.c:1303: warning: Function parameter or struct member 'clkdm' not described in '_clkdm_save_context'
>> arch/arm/mach-omap2/clockdomain.c:1303: warning: Function parameter or struct member 'unused' not described in '_clkdm_save_context'
   arch/arm/mach-omap2/clockdomain.c:1316: warning: Function parameter or struct member 'clkdm' not described in '_clkdm_restore_context'
>> arch/arm/mach-omap2/clockdomain.c:1316: warning: Function parameter or struct member 'unused' not described in '_clkdm_restore_context'


vim +1303 arch/arm/mach-omap2/clockdomain.c

d459bfe01f5239 Paul Walmsley 2008-08-19  1295  
1096d1c10bb3d8 Russ Dill     2018-05-16  1296  /**
1096d1c10bb3d8 Russ Dill     2018-05-16  1297   * _clkdm_save_context - save the context for the control of this clkdm
1096d1c10bb3d8 Russ Dill     2018-05-16  1298   *
1096d1c10bb3d8 Russ Dill     2018-05-16  1299   * Due to a suspend or hibernation operation, the state of the registers
1096d1c10bb3d8 Russ Dill     2018-05-16  1300   * controlling this clkdm will be lost, save their context.
1096d1c10bb3d8 Russ Dill     2018-05-16  1301   */
320f6f90cbe481 Wang Qing     2020-09-17  1302  static int _clkdm_save_context(struct clockdomain *clkdm, void *unused)
1096d1c10bb3d8 Russ Dill     2018-05-16 @1303  {
1096d1c10bb3d8 Russ Dill     2018-05-16  1304  	if (!arch_clkdm || !arch_clkdm->clkdm_save_context)
1096d1c10bb3d8 Russ Dill     2018-05-16  1305  		return -EINVAL;
1096d1c10bb3d8 Russ Dill     2018-05-16  1306  
1096d1c10bb3d8 Russ Dill     2018-05-16  1307  	return arch_clkdm->clkdm_save_context(clkdm);
1096d1c10bb3d8 Russ Dill     2018-05-16  1308  }
1096d1c10bb3d8 Russ Dill     2018-05-16  1309  
1096d1c10bb3d8 Russ Dill     2018-05-16  1310  /**
1096d1c10bb3d8 Russ Dill     2018-05-16  1311   * _clkdm_restore_context - restore context for control of this clkdm
1096d1c10bb3d8 Russ Dill     2018-05-16  1312   *
1096d1c10bb3d8 Russ Dill     2018-05-16  1313   * Restore the register values for this clockdomain.
1096d1c10bb3d8 Russ Dill     2018-05-16  1314   */
320f6f90cbe481 Wang Qing     2020-09-17  1315  static int _clkdm_restore_context(struct clockdomain *clkdm, void *unused)
1096d1c10bb3d8 Russ Dill     2018-05-16 @1316  {
1096d1c10bb3d8 Russ Dill     2018-05-16  1317  	if (!arch_clkdm || !arch_clkdm->clkdm_restore_context)
1096d1c10bb3d8 Russ Dill     2018-05-16  1318  		return -EINVAL;
1096d1c10bb3d8 Russ Dill     2018-05-16  1319  
1096d1c10bb3d8 Russ Dill     2018-05-16  1320  	return arch_clkdm->clkdm_restore_context(clkdm);
1096d1c10bb3d8 Russ Dill     2018-05-16  1321  }
1096d1c10bb3d8 Russ Dill     2018-05-16  1322  

:::::: The code at line 1303 was first introduced by commit
:::::: 1096d1c10bb3d869b5630dfa88f4c18f3d579752 ARM: OMAP2+: Add functions to save and restore clockdomain context en-masse.

:::::: TO: Russ Dill <Russ.Dill@ti.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
