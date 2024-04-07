Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0093BBE7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712512700; cv=none; b=UWniAy+IItUhLVOTD23XHtcyZs0NsvZzhYzRp9DSSmZhqb9W/3mAkByEMM8goJH/0BsjAgvXscBaAi8h2Bo7xPVXK5Wi91GrXcM4Ci/wrxvII5ZH0JdFrI/42+np2cgMcn3UogzoPh1sG+XnsfiCdIBlf2z8LkIssS/+dOwwk88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712512700; c=relaxed/simple;
	bh=n+lh1k8fG+4LhwRBRdbrNhj0zJvo5kY+nbC5Vg7/wzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSaSP4vdlLW4VYdhbRLQlN4tDxHdIouEN45pyGgagWjXMcK+AcCstJk9Kdj07cz+sCnS4t9pzhIy7e86ycVe0MC6MiFsEu/zxr4O7t36gQUtbFSohKZAQmDFmFUsry1WO1mce0964GRnV/tAhhvqgo3ZouWgENE2kRVhJaBO7DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/r+DVbb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/r+DVbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712512698; x=1744048698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n+lh1k8fG+4LhwRBRdbrNhj0zJvo5kY+nbC5Vg7/wzw=;
  b=Y/r+DVbbzKPuyvxPxFolF7dYOY4o1WLnQ5c1GOCfIJc5Qd1+CmW1akFN
   FZsRk+or32cwszyWWHzaqt/2Si6KqT1R03fDhK+M2W3rEsZ07Xiuv1Ee1
   UlmHwl69ja1DizJM8xzw8p+uWqozh2kwniVAg/65EeZLSTAtDL4CSutl0
   uYR08ltLkijaEXjJotD+3c291XgXd87ouVG/9u+9WWMlWsZA/cKXrZ4eq
   Tnjf+1WqBsud6TtX/vEn40+anKN8AdBA9V+DlRB96jS37pGkqhHFYrG87
   EzZa4+wgQhq2vD58cyEx/AWMZ/k9bmagb2Gp4ehmLdFo44i8eeYzu0bhc
   w==;
X-CSE-ConnectionGUID: qQweKKryQL2ZRCMz5nSG2A==
X-CSE-MsgGUID: Pap9EZ1mQ4SaZN168mXO3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="33183141"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="33183141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 10:58:17 -0700
X-CSE-ConnectionGUID: boKxP10vTxqddMQD2pgEZw==
X-CSE-MsgGUID: fsbVVvtbTSaJmhXO7OSx+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="24403869"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2024 10:58:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtWmT-0004Wu-1p;
	Sun, 07 Apr 2024 17:58:13 +0000
Date: Mon, 8 Apr 2024 01:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v5 5/9] kismet: WARNING: unmet
 direct dependencies detected for LEDS_TRIGGERS when selected by
 CHASSIS_LCD_LED
Message-ID: <202404080137.E7RCf66g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v5
head:   db5976dcfcee45b460fc59b10fc29abcfd9adb3d
commit: 9d7e7e8493bc0393f85b88e2b3b49d4b7cd02407 [5/9] net: Add helpers for netdev LEDs
config: parisc-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_CHASSIS_LCD_LED-0-0 (https://download.01.org/0day-ci/archive/20240408/202404080137.E7RCf66g-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240408/202404080137.E7RCf66g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404080137.E7RCf66g-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGERS when selected by CHASSIS_LCD_LED
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - CHASSIS_LCD_LED [=y] && LEDS_CLASS [=y]=y
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
     Depends on [n]: NEW_LEDS [=n] && LEDS_TRIGGERS [=y] && NET [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
