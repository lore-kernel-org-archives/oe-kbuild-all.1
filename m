Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63914A0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 06:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764224631; cv=none; b=U1oddJa0eHjZdprCwJ+Bk+Nu7K+pkSDMBU4ZVCLhWyfizmeIE1iZsj9bB8tdR1HtpoGngd2SooHH2qaC9f91nDccVlxXciHy9iBfS1Fzt8HIt5piFpprRMoVfCoMLfuQ5OA7QY8pwUgWtQ5i/wwJxVwJniv6UzH7WWLU39b3jmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764224631; c=relaxed/simple;
	bh=9UJXobC047uLgx/CWk9N+HexLMOQhEGA34DTfVN7KZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSLBxdA2eeilyVf8FhleuH+rtdROe8tLY/KlkYYckeuMQm8LFaF8xOXN6fwp5bqJLUFLue+rIgWz55Tivad1bKBJKbvcyb5otxINCH7411FMN2x1VeRjigtNj1m12VYBKhSEoTvP9DTnnovMwT9CDmyWs0a2YHKDeyHq6a81ptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C19YHB2j; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C19YHB2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764224628; x=1795760628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9UJXobC047uLgx/CWk9N+HexLMOQhEGA34DTfVN7KZ4=;
  b=C19YHB2jY7KH54GNpVNkxargueL/zWGr7St1ArhSxdG6idOv5Hsxa/kd
   xPnTylmqKv5ZJs56UEXjxaCKSQ7TWqHufvjhQw50av0BSiP6nJGegIe0H
   tqh6c8dy8i64ho8cDA+/wlftdDE0htjzF10RZ7qQzF9PSi8BTTVvVF/4b
   pss+K0aeBbxzTqUWFYYGbd92wgyVXfDf8Gji3O1buhh2o6ODPKAhXzA/V
   zW3sbbL4g3q+h18Vv6vObmOWmmbe9qs7bVRq0cyaoBSld+JGV6BOcUQtO
   jaDx/LFRU30m3yASz4dvVKHiSrl2MbaFFKXEQ3H9ZVvmmWvJTWHEoiW41
   Q==;
X-CSE-ConnectionGUID: 5H38uHhJS8a8oNqTwlcTzg==
X-CSE-MsgGUID: BS03t/+tQDGduBxWQv3Ddg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66153567"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66153567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 22:23:48 -0800
X-CSE-ConnectionGUID: fZk8ec8ORLy9II/fipnHUQ==
X-CSE-MsgGUID: 00sByt1YT3SW7KrKJuFv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193959944"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2025 22:23:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOVPu-000000003nZ-0Oji;
	Thu, 27 Nov 2025 06:23:46 +0000
Date: Thu, 27 Nov 2025 14:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 21/23] drivers/pinctrl/pinctrl-mpfs-mssio.c:302:27:
 error: 'pinctrl_generic_pins_function_dt_node_to_map' undeclared here (not
 in a function)
Message-ID: <202511271452.mhmoK6Tr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a88950bbbc80fe53e2c773353674604d3130c443
commit: c5d18e566a49f4f9a50575259bbdda2118b000e4 [21/23] pinctrl: add polarfire soc mssio pinctrl driver
config: sh-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271452.mhmoK6Tr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271452.mhmoK6Tr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271452.mhmoK6Tr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-mpfs-mssio.c:302:27: error: 'pinctrl_generic_pins_function_dt_node_to_map' undeclared here (not in a function)
     302 |         .dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/pinctrl/pinctrl-generic.c:111:5: warning: no previous prototype for 'pinctrl_generic_pins_function_dt_node_to_map' [-Wmissing-prototypes]
     111 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pinctrl_generic_pins_function_dt_node_to_map +302 drivers/pinctrl/pinctrl-mpfs-mssio.c

   296	
   297	static const struct pinctrl_ops mpfs_pinctrl_ops = {
   298		.get_groups_count = pinctrl_generic_get_group_count,
   299		.get_group_name	= pinctrl_generic_get_group_name,
   300		.get_group_pins	= pinctrl_generic_get_group_pins,
   301		.pin_dbg_show = mpfs_pinctrl_dbg_show,
 > 302		.dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map,
   303		.dt_free_map = pinctrl_utils_free_map,
   304	};
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
