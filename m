Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE6C1854
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 03:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gua7KWiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702782558; x=1734318558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MeuOKWzqV2quUAYyIP2dTGBuapK4gb/vDZPqb32QLfE=;
  b=gua7KWiRcpFlNejtkmWLRnl7dWnrd5tbFtKGOyTfwn1H0yg5MqTpJd+8
   dJgHgMI1ufAv+l21Jq//RlnsUkwx+qEzIMy447t8lfcWv+F6rRBdxa9Nq
   GE8M7c3zfKpkKh8h5wS5llrtcZO75+r6qbTsItx/QFQDbmh4b2aSAAG+U
   wSmYRUsmdoDXvXLNCZq9TfiUeydINBxPuhvb9nz/brDMd8irv1jShUgui
   cYCN7DcHdIwOUS9ooVoKef9EeSgXpCDhlSWFrGl1YAhUdga2LjndXSJvH
   +xBxZyjzNUqi4bGz2L6AkOqs7hRr7VJxrehlmoP4LdG92eGMSJUoyGycn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2250055"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2250055"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 19:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="751367420"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="751367420"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2023 19:09:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEhWj-0002YQ-1E;
	Sun, 17 Dec 2023 03:09:13 +0000
Date: Sun, 17 Dec 2023 11:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3612/16025]
 include/linux/irqchip/arm-gic-v3.h:604:10: fatal error: 'asm/arch_gicv3.h'
 file not found
Message-ID: <202312171051.gykfBRcf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 7202e9d68c0e202221485803b0caf354f5898051 [3612/16025] firmware: imx: scu-pd: Add IRQSTEER wakeup support
config: i386-buildonly-randconfig-004-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171051.gykfBRcf-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171051.gykfBRcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171051.gykfBRcf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/imx/scu-pd.c:60:
>> include/linux/irqchip/arm-gic-v3.h:604:10: fatal error: 'asm/arch_gicv3.h' file not found
   #include <asm/arch_gicv3.h>
            ^~~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +604 include/linux/irqchip/arm-gic-v3.h

7e5802781c3e10 Andre Przywara        2014-11-12  603  
7936e914f7b082 Jean-Philippe Brucker 2015-10-01 @604  #include <asm/arch_gicv3.h>
021f653791ad17 Marc Zyngier          2014-06-30  605  

:::::: The code at line 604 was first introduced by commit
:::::: 7936e914f7b0827c2dcfe63fbefdc21de2d61dcb irqchip/gic-v3: Refactor the arm64 specific parts

:::::: TO: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
