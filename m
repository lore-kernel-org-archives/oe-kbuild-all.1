Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A79430F548
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 20:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788120788; cv=none; b=BGfXKts3PYhb551MZZINdqnpUnvj9pHGTli9H45s0fQ2ATwgGZvRWxsTO90E1hFcrh9FS90sY9gbW2s8rsG8NP6kd6CoGm5L+CgCLdqnFTLsp6nvyqa5R7tjkJ5Z5ikMHtyWu2RT4VKj6EfG2l2zprcxaUCzZhU0sFrIE77U5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788120788; c=relaxed/simple;
	bh=9+VSo3/3voGPIzTFge9wcQ3GSD4806jLjhtUDkN3pL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EOb7oF596ti2AVgLvjzhZGR7Rfvbi9T9XRfZ2TZDctfK0Fn75CHjE945hhW1yq/PgpVYsCulb0It0qhxgpwBfnd66xlHjhrjtWAuBGkT58WPXZLMNhGeQci2EAQnUSigObxbWPlX2hD+xqQargnZ4GuG5d4mFqS0IPs/MEJckAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHIpyXVp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHIpyXVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788120787; x=1819656787;
  h=date:from:to:cc:subject:message-id;
  bh=9+VSo3/3voGPIzTFge9wcQ3GSD4806jLjhtUDkN3pL8=;
  b=PHIpyXVpc2PFjv1lReNj4tqBcUJ/0fFsX6KOyKsibYkEh6YNvSya3N9E
   93Eorert6hPzCZjMvdHDXv5HykaYNcQRqDjiBjDFRrYCUATxGyHlIpi5M
   UYlS9D4+5tbrEXZ87LipKdjfY5kkw6wtW+wqO51iDZIxP9TQuEom5Lq5u
   3eDOww3wHPePbkS37ZpFiFUAEdiYv93X5WRlH7tGCzICgg7j5EaHTgBTf
   e07g7bhgioQ0afLaPu4KM3NBdOte8JdTjXQB46FHSHb/rzmVAvmYq4hWI
   5bt3rOCht0Yh9jL3RD+L/2b7t9kN1J1UzFqJrsdiFBDpZ7v6ponqWGEpT
   g==;
X-CSE-ConnectionGUID: oE+7Bz81SVGISJcVwT36jg==
X-CSE-MsgGUID: wXHrVZY4Rk6cn1uAfJAW4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88459086"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88459086"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 13:13:03 -0700
X-CSE-ConnectionGUID: ApI+KBnFRpqO1MSZVrNgZQ==
X-CSE-MsgGUID: gnDqeM7IQaa5Pl3pD3Q06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="262496665"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2026 13:13:01 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0ltj-000000000Cp-04JU;
	Sun, 30 Aug 2026 20:12:59 +0000
Date: Sun, 30 Aug 2026 22:12:34 +0200
From: kernel test robot <lkp@intel.com>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/ethtool/pse-pd.c:259:undefined reference to
 `phy_pse_control_unlock'
Message-ID: <202608302204.fr1FGYBF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Carlo-Szelinsky/net-pse-pd-add-notifier-chain-for-controller-lifecycle-events/20260827-000340
head:   16e3924b8f46ad1002a2937228ba031223e3b7ec
commit: bd47f5cd512aaf1ab36475e5bfa5c5102d0a4c5d net: phy: use a dedicated mutex instead of rtnl for PSE control attach
date:   4 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260830/202608302204.fr1FGYBF-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302204.fr1FGYBF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302204.fr1FGYBF-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-gnu-ld: net/ethtool/pse-pd.o: in function `pse_reply_size':
   net/ethtool/pse-pd.c:105:(.text+0x19a): undefined reference to `phy_pse_control_lock'
   riscv64-linux-gnu-ld: net/ethtool/pse-pd.o: in function `ethnl_set_pse_validate':
>> net/ethtool/pse-pd.c:259:(.text+0x23a): undefined reference to `phy_pse_control_unlock'
   riscv64-linux-gnu-ld: net/ethtool/pse-pd.o: in function `ethnl_pse_send_ntf':
   net/ethtool/pse-pd.c:358:(.text+0xb54): undefined reference to `phy_pse_control_lock'
   riscv64-linux-gnu-ld: net/ethtool/pse-pd.o: in function `ethnl_pse_send_ntf':
>> ./include/net/netlink.h:1474:(.text+0xb90): undefined reference to `phy_pse_control_unlock'


vim +259 net/ethtool/pse-pd.c

18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  243  
04007961bfaf768 Jakub Kicinski               2023-01-25  244  static int
cff69f72d33318f Diogo Jahchan Koike          2024-08-29  245  ethnl_set_pse_validate(struct phy_device *phydev, struct genl_info *info)
04007961bfaf768 Jakub Kicinski               2023-01-25  246  {
04007961bfaf768 Jakub Kicinski               2023-01-25  247  	struct nlattr **tb = info->attrs;
18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  248  
31748765bed3fb7 Maxime Chevallier            2024-08-21  249  	if (IS_ERR_OR_NULL(phydev)) {
04007961bfaf768 Jakub Kicinski               2023-01-25  250  		NL_SET_ERR_MSG(info->extack, "No PHY is attached");
18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  251  		return -EOPNOTSUPP;
18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  252  	}
18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  253  
18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  254  	if (!phydev->psec) {
04007961bfaf768 Jakub Kicinski               2023-01-25  255  		NL_SET_ERR_MSG(info->extack, "No PSE is attached");
18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  256  		return -EOPNOTSUPP;
18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  257  	}
18ff0bcda6d1dd3 Oleksij Rempel               2022-10-03  258  
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17 @259) 	if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL] &&
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  260) 	    !pse_has_podl(phydev->psec)) {
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  261) 		NL_SET_ERR_MSG_ATTR(info->extack,
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  262) 				    tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL],
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  263) 				    "setting PoDL PSE admin control not supported");
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  264) 		return -EOPNOTSUPP;
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  265) 	}
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  266) 	if (tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL] &&
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  267) 	    !pse_has_c33(phydev->psec)) {
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  268) 		NL_SET_ERR_MSG_ATTR(info->extack,
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  269) 				    tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL],
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  270) 				    "setting C33 PSE admin control not supported");
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  271) 		return -EOPNOTSUPP;
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  272) 	}
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  273) 
cff69f72d33318f Diogo Jahchan Koike          2024-08-29  274  	return 0;
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  275) }
4d18e3ddf427d93 Kory Maincent (Dent Project  2024-04-17  276) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
