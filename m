Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878930F9C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694214336; x=1725750336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fPkRwrQxCxZrpUbhfNUqHlttodSolZMxQD6pFPHD/Aw=;
  b=E4q0GTrXEvp0ucyrWAoIJWBiMoPiXyWcDOX5rOdSnfP68S++cQNXv946
   T+iymr0ZJITND4nBwMf0CrlU5Nj2ymwE9N9LBn/l3u3//r5EV/4+mT63l
   vTXwQBGd34Cdua7Qncf3uBbCc9BBGfRBXZE/FHv1BxB0kYdgokxW+IMXE
   L6mDSAaApFu/gM/HZ/CKOwBtnmrk53tjev+dCWFKys0YWfnktkmsz05HV
   jiL1D2OV2X2/sVltPahidmEsIlmuXTkhZk+5SD76RDd3lCGnzTA2yZq1s
   SYKoP9Pp1eIhxNLi/kqEMiw+tejyJIh/jii4/7GBQjz85f2rV5Dpq8Wla
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="368028976"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="368028976"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 16:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857576929"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="857576929"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2023 16:05:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qekXc-0002hj-1i;
	Fri, 08 Sep 2023 23:05:32 +0000
Date: Sat, 9 Sep 2023 07:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:dt-conversion 2/2] Error:
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi:32.27-28 syntax error
Message-ID: <202309090613.BRt63Xcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git dt-conversion
head:   b26b3c5fbaa381e8b2f4d5608603772f84236368
commit: b26b3c5fbaa381e8b2f4d5608603772f84236368 [2/2] riscv: dts: sifive: convert isa detection to new properties
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230909/202309090613.BRt63Xcj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090613.BRt63Xcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090613.BRt63Xcj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/riscv/boot/dts/sifive/fu540-c000.dtsi:32.27-28 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
