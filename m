Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C9754FB4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 21:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTb8RU/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702331653; x=1733867653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jkXLZZPUNAXyn/UomHJptfFKUuDXT496fp+rpERlQFc=;
  b=MTb8RU/xuwYBCWJwDXM0MlYkonMWqpcoZSCnLpndLf7EqyzXsFCUkvom
   rfIeYz4KKzp2zRjCPobrZb/qiiMr26GOFMwqVdfxVbZXK3ykv9XV5toPa
   ZCB560h4E+U+qsSbHtjAPfoa/b0pHyk+XaIgaf1+ZE/IhMArCIf0avVmA
   4bbVJS2i8FrUzYH1MeMJZGFFGuHTtoj59lAu+HVVs6X3wZt3+r/e4aw9T
   OFYIHjZPgjLjs8ZA6WDUVxhh9JH0TuKw8Eli46572YheVG9qVEygxqHFP
   3B9XaG6gMxcAOX0EwvAqntgTJUnW+9CfxqQ5KPTDtxnZ9JSC9WtgSM4e+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8077200"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="8077200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 13:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="21249714"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2023 13:54:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCoE0-000IVa-3B;
	Mon, 11 Dec 2023 21:54:04 +0000
Date: Tue, 12 Dec 2023 05:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pawel Chmielewski <pawel.chmielewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Paul Greenwalt <paul.greenwalt@intel.com>,
	Simon Horman <horms@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 ice_adv_lnk_speed_maps+0x14 (section: .data) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
Message-ID: <202312120508.TQnoTl9M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 982b0192db455d288fc1deb06632f529c35daa15 ice: Refactor finding advertised link speed
date:   8 weeks ago
config: xtensa-randconfig-r011-20220519 (https://download.01.org/0day-ci/archive/20231212/202312120508.TQnoTl9M-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120508.TQnoTl9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120508.TQnoTl9M-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0x30 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0x4c (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0x68 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0x84 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0xa0 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0xbc (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0xd8 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk_speed_maps+0xf4 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qede_forced_speed_maps+0x30 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qede_forced_speed_maps+0x4c (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qede_forced_speed_maps+0x68 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qede_forced_speed_maps+0x84 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qede_forced_speed_maps+0xa0 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qede_forced_speed_maps+0xbc (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
