Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF12628
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 00:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694133403; x=1725669403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KzClNPvy/BZjZU54tjF6dhMKROtgetx9sqG4AuijDUo=;
  b=OrJte4aBKyzxlmqUfLhc0Yd2NudhX1oULt4pODKqgquYnzPUq97DK5+E
   S8d3GPK4ax0LGoa7+GQp+scRWAE4uMbZWbr4O3EqfqrnwS5hI8Q+3hMMU
   ZWlxvocD1emTA/iofjEroyD6Jrr5IJjp9dywhD4TLM8/IKQNDFTwuhsdy
   49Y0EyqV4GTRCsjrbVW6FMzeMA5kZDWt1FsmTVmRXMT1xt2EdTAqTADR3
   Z2ODW/fg4Ms78TC0eJnBetVYcQ4dxazUOK7SxtO4R9Nme10yGLa9DfC8d
   G9oEvTzWZ8nOCm2L+FZc0QX3KOUIl3D25aPdTB0gdlWcG6pbEKxRphvlF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="356982047"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="356982047"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 17:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771501860"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="771501860"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 17:36:41 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qePUF-0001kp-00;
	Fri, 08 Sep 2023 00:36:39 +0000
Date: Fri, 8 Sep 2023 08:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:isp/heap-alloc 132/132] Error:
 arch/arm64/boot/dts/apple/t8112.dtsi:578.23-24 syntax error
Message-ID: <202309080800.E4SRliBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/heap-alloc
head:   d5548fd857a3ca9087e974c8e73d6f487b11c94b
commit: d5548fd857a3ca9087e974c8e73d6f487b11c94b [132/132] WIP: arm64: dts: apple: t8112: Add ISP nodes
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230908/202309080800.E4SRliBP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080800.E4SRliBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080800.E4SRliBP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/apple/t8112.dtsi:578.23-24 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
