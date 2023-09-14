Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0733D3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694724430; x=1726260430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fP4WDtReDNMIXfk4X3PpM72oZLtMeIfZA1RUjQWQFB0=;
  b=HoVrjgRRq752YvI0LIht/ZbW9oqH1Cy+geZgzcFqn6owTh5K7xmmpWGl
   MI9ah3XY1DU1nd4cwdqFFt1yhmSLo4pO42Km/1lYaSofgQs0dkMqd8TNQ
   o0sqGrH8WXox7/Vz6GbjUNEzj9xNM6nWjVJC1Hv61MlH9nyah2MUes8R+
   Z9LHfhKLPtpVbS0agaS9CNZ5UHeFT9q+LEAdt8fWZ0GTA14reBO8x5MUN
   TEPYjVc3a+RulYn351F13FtHIoNq9/xwdu64lZhU6hwW7tT8sAOr4RcVF
   WXN8RR03jEtpZLuJZCV684WsXdH1iGlD3cHN0WiCajsnuvdzWcWfWcSzK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376405731"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="376405731"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 13:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868395826"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="868395826"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Sep 2023 13:42:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgtAk-00022j-1Q;
	Thu, 14 Sep 2023 20:42:46 +0000
Date: Fri, 15 Sep 2023 04:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 58/63]
 drivers/gpu/drm/i915/display/intel_bios.o: warning: objtool:
 intel_bios_init_panel()+0x292: unreachable instruction
Message-ID: <202309150439.jiWnbkZD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   d77922f2c5a8670e703d82f7e9b1fe680d528bf0
commit: af4813882f90477626ca010a1f6fbce9ec9963cf [58/63] UPSTREAM: drm/i915: Do panel VBT init early if the VBT declares an explicit panel type
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230915/202309150439.jiWnbkZD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150439.jiWnbkZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150439.jiWnbkZD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_bios.o: warning: objtool: intel_bios_init_panel()+0x292: unreachable instruction


objdump-func vmlinux.o intel_bios_init_panel:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
