Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011544C9D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065090; cv=none; b=qhw9kIV3F6OrghGFPQDyzihLR+diMmBN3WioBYcr5Inq4g+A/LuC2DRPQ9we59Kd3E1l+jco/5VdMCB3bfR+tlJ96jGf6begc78550XF5ozW2mtgGaya+R/5FXGxlaC5vsSDAXqMf/2Pu2mGGqYmC3J5YHOpoQ0iW4SzzDfP+GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065090; c=relaxed/simple;
	bh=HK5WgrebN3P/p1LkqbB8qRHuBy/HS8aBgwt4NcmtN9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+nIzjywbn6HqywUNflJf3CLOfK08XCgovBC0dbiz0Z+jC7dvJSFhe3zfmXeyaAHiDXuCBbHlt9231nPMBX2ft8/hlUxz/pFR9amnoD1pBW7cjKOUDWQtCBWrlMC/qIry+pIMKeJ3rgmm51Y8LZjOxiLJYMBSPfh0XRgleZAc7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0v22nT2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0v22nT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065089; x=1763601089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HK5WgrebN3P/p1LkqbB8qRHuBy/HS8aBgwt4NcmtN9c=;
  b=G0v22nT2IBg9PRJPF9XH3mTaUHepjPaBzeLmhMIPZzbNzi1n+73gzAzD
   I4EiFkERvyAacPF/cIwgHKo+CmA9TjcAgk+78yhcwW4qMvQXfoHof8YG2
   sIGqVG9IaIE0Bb8qYmOpRKZfeUd5rmgvCTTJJmI7JcUAsVhENZfIe57iq
   f6ERkiJe7KAU3ssKzvSXobfejn7oe2QlzdkA3DM10F0MjJSv0YI2nYuT3
   sx1yD1rypD+TsrCYKEiN1+egQCR/tlPPKkPPxLW+oIPf0PMaEpnqHCaep
   sI9Co6JFg1bXPhUfiplAhvG/5oxxi43VcbsBT1OS0f94S+zlNsLke8j4p
   Q==;
X-CSE-ConnectionGUID: Gj/fyJTLQ6ac59jA0iRkwA==
X-CSE-MsgGUID: rmFfAcCRT4CnUIrC5EzrPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31851267"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31851267"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:11:29 -0800
X-CSE-ConnectionGUID: Ljps5w+8Swi7fWHkuwl41A==
X-CSE-MsgGUID: O/ewju/GTfa/hf08ISIS+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90572459"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 17:11:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZFd-0000Nt-1Q;
	Wed, 20 Nov 2024 01:11:25 +0000
Date: Wed, 20 Nov 2024 09:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] drivers/mfd/rohm-bd718x7.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202411191808.VeBluHiB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1a2048c794842eea41d3b91eda4b74e1e9386ae9
commit: 30107fa6908b6c2747ee9100b40af813f99483c3 [1297/1297] mfd: bd71837: Core driver for ROHM BD71837 PMIC
config: x86_64-buildonly-randconfig-005-20241117 (https://download.01.org/0day-ci/archive/20241119/202411191808.VeBluHiB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191808.VeBluHiB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191808.VeBluHiB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mfd/rohm-bd718x7.c:15:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'bd71837_i2c_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/mfd/rohm-bd718x7.c:207:1: note: in expansion of macro 'module_exit'
     207 | module_exit(bd71837_i2c_exit);
         | ^~~~~~~~~~~
   drivers/mfd/rohm-bd718x7.c:203:20: note: 'cleanup_module' target declared here
     203 | static void __exit bd71837_i2c_exit(void)
         |                    ^~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'bd71837_i2c_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/module.h:115:41: note: in expansion of macro 'module_init'
     115 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/mfd/rohm-bd718x7.c:201:1: note: in expansion of macro 'subsys_initcall'
     201 | subsys_initcall(bd71837_i2c_init);
         | ^~~~~~~~~~~~~~~
   drivers/mfd/rohm-bd718x7.c:195:19: note: 'init_module' target declared here
     195 | static int __init bd71837_i2c_init(void)
         |                   ^~~~~~~~~~~~~~~~
>> drivers/mfd/rohm-bd718x7.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
