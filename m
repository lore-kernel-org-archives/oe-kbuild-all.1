Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F941EF0B9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764745824; cv=none; b=nwgUaSC4ohyAJr6YA35SsuX1ztWJR5Gr7Mavg3I85/AF9LB8NscjmlYtAd+7/6TjXl7HpMG9zNHCj82HghvbJG8Bz6eSrfuDAGsIh9yNtlxMhT5X3EaBTqoPkQnl4HLE+wjFMw4o2pocYhY8GgV4leEsauCNoGuQEEptvpT/pmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764745824; c=relaxed/simple;
	bh=nWw2bqpV/EqacDOzDiBi/BU7h6kVx7S6ai0BeFF8tF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BtxKqNbkxiESWovyDGTe6fyCKlOvRTlOSGNlfZ6thAuJcq/LPXMOOutaXztKSjr6Rj5YuxN7NYcD4w99tw8sJbla8rpCpuoDu7i9P3vSVKCBpH5cRAi+/q6GobiWeKYCJANlXj5KQtx/kIvz1cQYbiBP4lQFXB6qvg02FFW3UgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+av5Wbh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+av5Wbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764745822; x=1796281822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWw2bqpV/EqacDOzDiBi/BU7h6kVx7S6ai0BeFF8tF8=;
  b=c+av5WbhzpTKLAo5dulFKZEYiTxpuwOirheniDAnUuAxgcB8e99ou0Bl
   OOztBUZ74mwrJpgsrpvQqTJHrG6EsIl8bUpfiz8JMOH3p3V2k9vSkd/dh
   AH99eeS4PFYaKGCIK8K+xq8VMiDVXYoJOopbClnwo4GldKGUIQOlZKxSd
   F5EUSFYLjdRKyHewNd9hwRzJ3kqG9ORT6JZj+AIT+d7Biqlzmik1awHaX
   rMx7NGL0FWv29VLZYyOElQM9TiXwYkrVs87Z67IRmZy2IMy2il8JMNIRC
   3wSTYjBFWPKSO/8em9gXo3xFtM/qZjClaVxVkrq2/JELkEH7Hcds9cxe1
   g==;
X-CSE-ConnectionGUID: xz28/SUaSAWL5OgU+iU7GA==
X-CSE-MsgGUID: xDBEQwVtR0myve4bK9f3Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66620510"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66620510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 23:10:21 -0800
X-CSE-ConnectionGUID: NY6sArjkQLKkhlEYy40pfA==
X-CSE-MsgGUID: 7RTTiuXORuqJWGxZ1ImCEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199005780"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2025 23:10:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQh0E-00000000Agv-0qi3;
	Wed, 03 Dec 2025 07:10:18 +0000
Date: Wed, 3 Dec 2025 15:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 23/25] drivers/pinctrl/pinctrl-generic.c:111:5:
 error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
Message-ID: <202512031536.gPpYmRae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   adc6515a5eb0c69fae2b21414dfa290e4d215a5d
commit: df511e8c63328a0a519565d271d57cf0fa0b3e09 [23/25] pinctrl: add polarfire soc mssio pinctrl driver
config: x86_64-buildonly-randconfig-003-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031536.gPpYmRae-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031536.gPpYmRae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031536.gPpYmRae-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/pinctrl-generic.c:16:
   drivers/pinctrl/pinconf.h:175:18: error: expected ';' after return statement
     175 |         return -ENOTSUPP
         |                         ^
         |                         ;
   drivers/pinctrl/pinconf.h:170:5: warning: no previous prototype for function 'pinctrl_generic_pins_function_dt_node_to_map' [-Wmissing-prototypes]
     170 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^
   drivers/pinctrl/pinconf.h:170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     170 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         | ^
         | static 
>> drivers/pinctrl/pinctrl-generic.c:111:5: error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
     111 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^
   drivers/pinctrl/pinconf.h:170:5: note: previous definition is here
     170 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^
   1 warning and 2 errors generated.


vim +/pinctrl_generic_pins_function_dt_node_to_map +111 drivers/pinctrl/pinctrl-generic.c

e300bffd74b605 Conor Dooley 2025-11-26  103  
e300bffd74b605 Conor Dooley 2025-11-26  104  /*
e300bffd74b605 Conor Dooley 2025-11-26  105   * For platforms that do not define groups or functions in the driver, but
e300bffd74b605 Conor Dooley 2025-11-26  106   * instead use the devicetree to describe them. This function will, unlike
e300bffd74b605 Conor Dooley 2025-11-26  107   * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
e300bffd74b605 Conor Dooley 2025-11-26  108   * and functions, create them in addition to parsing pinconf properties and
e300bffd74b605 Conor Dooley 2025-11-26  109   * adding mappings.
e300bffd74b605 Conor Dooley 2025-11-26  110   */
e300bffd74b605 Conor Dooley 2025-11-26 @111  int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,

:::::: The code at line 111 was first introduced by commit
:::::: e300bffd74b605b291ebc590e8f019ffe057950d pinctrl: add generic functions + pins mapper

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
