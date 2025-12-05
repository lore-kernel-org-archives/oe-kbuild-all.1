Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9949233D9E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947760; cv=none; b=Sp//I8bhjRhCIG6DhmcYhyKB1hmkXmYUUX3hrls4YmkXBQ9HvW0DMkewMTw/fTYbPmPvclm2Xx8H5OjOYgmiyOS9CipJl0hzf1c94aY2fYT3TlL6GdwCHc0yQakfnLXBn91DjHFx/PV02x6liu5Z/7HwFJ9GGf/p68EjPAFxngs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947760; c=relaxed/simple;
	bh=mHLXG7+ArsoJOUmmxYzJyJFgby6N8Ny3BjsUa6UQhdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyjYm7xMyqK8UgaegAAXsdfDq4drFOU6AtLwSedouLEVQqElEFIfOLJKf7mNQoj7jflogDw93G8f1i40QBW5LrvZLhqMWl8ReYH2Sz43XNW3AX8b4AmjRpMzlHsyerLWNwkIl79lJVxQzMhrBjpaCooZX3YopYxMJaHlXNSallU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxC7DLTo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxC7DLTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764947757; x=1796483757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mHLXG7+ArsoJOUmmxYzJyJFgby6N8Ny3BjsUa6UQhdg=;
  b=RxC7DLToDMlvGQXYtWMio3xACv5FlM4MjOJLaqZPhQTyx9nA3k9L4w8u
   Gc+yrQ9KYz3g/0UjnqgaEPGa+di4u4OVcOAautUalUyLPssn+TCaa7Cpc
   8/YDZ/Wx3kh8N4d1YSSV20pF/wazeRtt3wd+JNxv+euRPIejFN0oQjyi7
   dSOT9ELRUSI0mJNv26Da/8FYdFDiOmEpgydBgaDCI29+eMbU42mTR107g
   vrq9Nudp+3LziRzMt2CeiQp5O2W925F4UqAaK7brSIhXjCfg2gxO3NTlX
   aCZpZHsHzpplfpuywYxGhLtyzz7XDbc5ZL6D7RkdrERLJPgJmC2SC4gOa
   A==;
X-CSE-ConnectionGUID: 6JJ3gly0TLK4Y4fuZSO+Tg==
X-CSE-MsgGUID: bP6adFBMS/ePI6TI3VUC6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84388712"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="84388712"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 07:15:53 -0800
X-CSE-ConnectionGUID: 8lkwmZGkRd6MORU3kwv8mQ==
X-CSE-MsgGUID: DRWbdqdySvCX68wD6Crv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="199746868"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Dec 2025 07:15:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRXXC-00000000F7i-0uUp;
	Fri, 05 Dec 2025 15:15:50 +0000
Date: Fri, 5 Dec 2025 23:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 23/25] drivers/pinctrl/pinctrl-generic.c:111:5:
 error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
Message-ID: <202512052354.PovDnBVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   e11fef5b36b10c68e2c153802a3750bd2fba8468
commit: 7d9d9c209c495466776a212b70b5bb4c9fc58188 [23/25] pinctrl: add polarfire soc mssio pinctrl driver
config: x86_64-buildonly-randconfig-002-20251205 (https://download.01.org/0day-ci/archive/20251205/202512052354.PovDnBVS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052354.PovDnBVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052354.PovDnBVS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-generic.c:111:5: error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
     111 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/pinctrl-generic.c:16:
   drivers/pinctrl/pinconf.h:171:1: note: previous definition of 'pinctrl_generic_pins_function_dt_node_to_map' with type 'int(struct pinctrl_dev *, struct device_node *, struct pinctrl_map **, unsigned int *)'
     171 | pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pinctrl_generic_pins_function_dt_node_to_map +111 drivers/pinctrl/pinctrl-generic.c

cfaf4498889f9e Conor Dooley 2025-11-26  103  
cfaf4498889f9e Conor Dooley 2025-11-26  104  /*
cfaf4498889f9e Conor Dooley 2025-11-26  105   * For platforms that do not define groups or functions in the driver, but
cfaf4498889f9e Conor Dooley 2025-11-26  106   * instead use the devicetree to describe them. This function will, unlike
cfaf4498889f9e Conor Dooley 2025-11-26  107   * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
cfaf4498889f9e Conor Dooley 2025-11-26  108   * and functions, create them in addition to parsing pinconf properties and
cfaf4498889f9e Conor Dooley 2025-11-26  109   * adding mappings.
cfaf4498889f9e Conor Dooley 2025-11-26  110   */
cfaf4498889f9e Conor Dooley 2025-11-26 @111  int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,

:::::: The code at line 111 was first introduced by commit
:::::: cfaf4498889f9e3b633f9126deb0042f0076418b pinctrl: add generic functions + pins mapper

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
