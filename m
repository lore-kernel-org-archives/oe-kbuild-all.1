Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22BA2D8376
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 02:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690255; cv=none; b=sw9aHO7fdTzZzv9ddeuTMxsnR46DyqRZhxye9n78p5qQG60sZaSzmy+IyOcmwRwGaZOND3u0j9K5IYcxG26FjmCfPekLYPlDf5M2BgYaaIAZMzo4u6xmP1ljLNL0Dxq6DTY7hVWom50zDjY/llmcrOwDlx55cH1z2fWE+1cHmwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690255; c=relaxed/simple;
	bh=um845GpEI9u77utnbAtsE/wfW6PRqbgmUCVY7lEVikI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M0UbHM9pTcDcmu2BsGrKTygXMDGy/KpgbOzffBDSELgLZMFm9M+0FtC6veOGLfjh/wbBy8408mlLKtP6eeZKEppKxZqzplzf/i4fB6PA7p/Ya7UQ9l1npKix2HRgl3yLDeLi8wLBrvUcAi1/yNCdz8arn7PEmCObkXG6/WKvOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+EiwjAZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+EiwjAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770690254; x=1802226254;
  h=date:from:to:cc:subject:message-id;
  bh=um845GpEI9u77utnbAtsE/wfW6PRqbgmUCVY7lEVikI=;
  b=F+EiwjAZMc1+jB/umgPCIsxE2EML8zb06bpZ96+QMhh0I4Iv1WB1rOtv
   ocqEKbVD2lp9S7xxN4GtMAt3HlNXHnbPAGk1jHNjXVC1e6JZJap4JJzBT
   863IgIs5xkOF51dYYgvHDKzMehzC322+xbtyOe8DqSjsUv70Bjfg4BbsF
   FZNCf+pWLL8pcc41sY5fnLZ64FIl3t5rL4ZZxFzF3/xFSXxhP9kz0h14x
   OZqoJmXcpGVhRgJyD0/l8dFyYSZ3fmBA0naJGKFzShOmgdrhq0LTlYqx6
   dKDzrWuyjylwZLzvoN29MS6Lp9nkz9BI7GfA/yt60dnQEMI/Ki7z/Q/kT
   g==;
X-CSE-ConnectionGUID: fp9BIRxzSmqSsg8eE5TWaQ==
X-CSE-MsgGUID: i8wLhaGYRg6BPtdhGdTaVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71710647"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71710647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:24:13 -0800
X-CSE-ConnectionGUID: 8GNFyxjRSRGstwFXowGXVQ==
X-CSE-MsgGUID: JC6jt6z1QtePzawUvi8eQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210881424"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2026 18:24:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpdQ9-00000000oWy-29uw;
	Tue, 10 Feb 2026 02:24:09 +0000
Date: Tue, 10 Feb 2026 10:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 9883/12313]
 drivers/clk/microchip/clk-core.c:13:10: fatal error: asm/traps.h: No such
 file or directory
Message-ID: <202602101035.Z9FjjXBZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   132737e360b4c0daa7f473faf0f55cb04ee3e15c
commit: 026d70dcfe5de1543bb8edb8e50d22dc16863e6b [9883/12313] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: arc-randconfig-002-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101035.Z9FjjXBZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101035.Z9FjjXBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101035.Z9FjjXBZ-lkp@intel.com/

Note: the linux-next/master HEAD 132737e360b4c0daa7f473faf0f55cb04ee3e15c builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/clk/microchip/clk-core.c:13:10: fatal error: asm/traps.h: No such file or directory
    #include <asm/traps.h>
             ^~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/clk/microchip/clk-core.c

ce6e11884659988 Purna Chandra Mandal 2016-05-13 @13  #include <asm/traps.h>
ce6e11884659988 Purna Chandra Mandal 2016-05-13  14  

:::::: The code at line 13 was first introduced by commit
:::::: ce6e1188465998820e7182455261b1f5d508ca17 CLK: microchip: Add Microchip PIC32 clock driver.

:::::: TO: Purna Chandra Mandal <purna.mandal@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
