Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679913AC3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694109791; x=1725645791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rq7ThFkC1T4frIINdj4I4SoDJX3mzNfdrp2veRq/ZBU=;
  b=SnrgReGoFDtsX70FF19c1PN7mbYaUk1B/B+ppR0zwREngx6KrBvkYl73
   gmik6TFgKZ9iECTf4ynFEYiTgpkzDJgGeggafsPYfr25Gm3ns20B8S2EV
   X+Dsmg6op/NOXdx4u+qfY8sCcbAs/D5dNFx9x8766n/Yevm5PSsSCoPqx
   k258F+DaPiOkxBprTUAgO8GSrl8DybqTC5VpKK8UEnUnBoxZl0LFms4qm
   yn9+tItvSi32OFhSlyIEEGS1ek2BhDnEye5V1COzPfntKgpdUE5+tijia
   4pkHtbrKuCws/fIhwb6DXFJ92fOP0Grh/Nrj5DGEpbnR53mJVeevXALzh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367687819"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="367687819"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 10:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="988872671"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="988872671"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Sep 2023 10:59:26 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeJHo-0001Rv-1E;
	Thu, 07 Sep 2023 17:59:24 +0000
Date: Fri, 8 Sep 2023 01:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 109/317] make[2]: *** No rule to make
 target 'arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dtb', needed by
 '__build'.
Message-ID: <202309080144.C4AWwDtB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   6dcc2771beb2a257d0fb613771bc00c4abf76460
commit: a6480f96e182ab593bdead48251e039ef205c6e5 [109/317] ARM: dts: Add .dts files missing from the build
config: arm-randconfig-001-20230907 (https://download.01.org/0day-ci/archive/20230908/202309080144.C4AWwDtB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080144.C4AWwDtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080144.C4AWwDtB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[2]: *** No rule to make target 'arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dtb', needed by '__build'.
   make[2]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
