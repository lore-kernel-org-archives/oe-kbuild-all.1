Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22816FF45
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730103706; cv=none; b=m6UgkmQtCUEaybp0LHJtbKNEPPr9tCWr20qdqA635ZAbelBYYKsPG89+lm3egNZMWISrT27zWxhv/YPCvC7UyjYd5LHkD6OWFtfhsfxiyqFv8H99sL74zM0s1WcPhVwRIEe99fKIO9mbvaXDKj5fkUSQf1FyhLXiKgaw3Vs23u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730103706; c=relaxed/simple;
	bh=VLbHOHQCyvhAxYzWOETrWqcj9pOGNyy633L3e3EAoRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1nSWL17sCjH/ITARR2JYLvJs1aftwyl7OPnwWjEeLB6WqlHn4VBuRqgreNgMKbCoQEbBS44UYiQyZ49SoyUCsdFrUurb574rusI44Ikj+VEkdk1UypsotQfdCdfHm3hqjDLC/l8zwBdL2x8C9n4MsQ0Bi9pXAWZlmB9+Uhf88c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eb9AO721; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eb9AO721"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730103704; x=1761639704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLbHOHQCyvhAxYzWOETrWqcj9pOGNyy633L3e3EAoRI=;
  b=Eb9AO721sFcmy3D0xl8vXhWthDUJWEH1A9zpz6Y6ZtUFw+zqqpseTdDP
   y4Noce44mbsODfzg0Blvke3gX3VzVNy7PpGpm19UohpmNHnaQMQe9bVDZ
   RPOPdcPqRcZMtAdSs/klMOrI/ZRCrCMo1x2XATMTBnvCAl5FxjHMYAsPU
   DDvWO3oH2vBAQzzaOtpgOvKiP00bFPwpunq6YKY4Cj1hXN+BZwJ3hta/Q
   ENF6lXpHhY1HtMXXWSUYpeX1dMAmG+gg2VW0npMBr6XbVU3mxPhXe9ojD
   787VlyrrsnhBKg220QyMzvaIong6X953rf8FulTyYP/uBh6W6Mm52Bqrg
   g==;
X-CSE-ConnectionGUID: n9CIs1AjRYC87NrD7bAvlg==
X-CSE-MsgGUID: KPw+/ffSSGe/5FsGxP7vpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="41060861"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="41060861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 01:21:43 -0700
X-CSE-ConnectionGUID: qgn1emTiRXmZ/cNxxQhoHA==
X-CSE-MsgGUID: Ab6d4Bq+QGCcikFanj5JUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="85505941"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2024 01:21:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5L0N-000cC2-1k;
	Mon, 28 Oct 2024 08:21:39 +0000
Date: Mon, 28 Oct 2024 16:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 62/70]
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:606:13: warning: unused
 variable 'err'
Message-ID: <202410281632.W3DzPfsF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   edb2a7a8be4be71a6502d19afd5b069f6d9fbacc
commit: de758cbe68d93ad88b262742e65efc2aa7490ecf [62/70] pinctrl: mediatek: add changes suggested by angelo
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241028/202410281632.W3DzPfsF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281632.W3DzPfsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281632.W3DzPfsF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: In function 'mtk_pinconf_bias_set_pd':
>> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:606:13: warning: unused variable 'err' [-Wunused-variable]
     606 |         int err, pd;
         |             ^~~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: At top level:
>> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:602:12: warning: 'mtk_pinconf_bias_set_pd' defined but not used [-Wunused-function]
     602 | static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/err +606 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c

de758cbe68d93ad Frank Wunderlich 2024-10-24  601  
fc5bcffec8e71e7 Daniel Golle     2023-12-16 @602  static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
fc5bcffec8e71e7 Daniel Golle     2023-12-16  603  				const struct mtk_pin_desc *desc,
fc5bcffec8e71e7 Daniel Golle     2023-12-16  604  				u32 pullup, u32 arg)
fc5bcffec8e71e7 Daniel Golle     2023-12-16  605  {
fc5bcffec8e71e7 Daniel Golle     2023-12-16 @606  	int err, pd;
fc5bcffec8e71e7 Daniel Golle     2023-12-16  607  
de758cbe68d93ad Frank Wunderlich 2024-10-24  608  	if (arg != MTK_DISABLE && arg != MTK_ENABLE)
de758cbe68d93ad Frank Wunderlich 2024-10-24  609  		return -EINVAL;
de758cbe68d93ad Frank Wunderlich 2024-10-24  610  
de758cbe68d93ad Frank Wunderlich 2024-10-24  611  	/* Either this */
de758cbe68d93ad Frank Wunderlich 2024-10-24  612  	if (arg == MTK_DISABLE || pullup)
fc5bcffec8e71e7 Daniel Golle     2023-12-16  613  		pd = 0;
de758cbe68d93ad Frank Wunderlich 2024-10-24  614  	else if (!pullup)
fc5bcffec8e71e7 Daniel Golle     2023-12-16  615  		pd = 1;
fc5bcffec8e71e7 Daniel Golle     2023-12-16  616  
de758cbe68d93ad Frank Wunderlich 2024-10-24  617  	/* Or this (but it's probably a bit too cryptic) */
de758cbe68d93ad Frank Wunderlich 2024-10-24  618  	//pd = !(arg == MTK_DISABLE || pullup);
fc5bcffec8e71e7 Daniel Golle     2023-12-16  619  
de758cbe68d93ad Frank Wunderlich 2024-10-24  620  	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
fc5bcffec8e71e7 Daniel Golle     2023-12-16  621  

:::::: The code at line 606 was first introduced by commit
:::::: fc5bcffec8e71e71994a53c7bb4ad78acabd257a pinctrl: mediatek: add support for MTK_PULL_PD_TYPE

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
