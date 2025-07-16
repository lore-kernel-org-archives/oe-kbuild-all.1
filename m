Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69DE1CAA92
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752674254; cv=none; b=IrpiwWJYxlIXwLHM/bp3uHf7MnUtEJDJcFWoNQhOczNQ/NYs5dZl8J5H5zPBBwaYv/SIlVy1mWXVS5newsIG2SBmVuQ9iM0TcmB2rHxxotCOLbo3+57m2iLcs4dsVLxx6qKiuL+QMAp5SCv8QFbgmqRNmbrFbKgVUnZ0l/P08PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752674254; c=relaxed/simple;
	bh=2ggFBaz3U2EBKmDYdNHKV7G8TUKr8hsyoT4sqwbW3Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOfN0LVBshRZ2c+4YRKemsf0v1Q6IL4ukxkkCK3P2bSNqCtDmqjgOuStg2Z/3X5BvgSuPAZpqA4yFKiyhT+uCRS5XeOKUU/prTfNDSasICT1H5wBtljsesIcyRdMD/peHjf+g1fFu0Ixd9sm0BRGfs8kL99/5WmC+v3j+pK+EdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTsx+HML; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTsx+HML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752674252; x=1784210252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ggFBaz3U2EBKmDYdNHKV7G8TUKr8hsyoT4sqwbW3Go=;
  b=JTsx+HML2BwnWapXfc6wCAnfndJcndIiorxrL4v6l2xpBxXG6CPAwkxJ
   cy26sWQWPQAinI0Jv97X443bdXBY1woDPYBGmFeWIozDbgC0zzU11jojJ
   Jpi+6toRzEpVabBDMWP2zaOHu3IfIqAPandFgkdBI5ST3vKsemuO7MPkH
   weSCjiWBgeYlImAispgIMQO8/IbtAcR7mfB3XaVhJp5/NbL8khWA2ZWVk
   cS0qpUcxPp0DLGBuzzdiQ/t14YV5GCfrdBO62mCtEqlNgstdsJSd2Q117
   vIVUNSGWrK/dWyYUT2u6gWsS02B3hAdFcNiOtMaRMyIvYqIJ16eQ90dox
   g==;
X-CSE-ConnectionGUID: CtJzJ2I+ScaGltQUoFJkIg==
X-CSE-MsgGUID: BjxIj1eWTsCD9fxnvs/nnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54630275"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="54630275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 06:57:28 -0700
X-CSE-ConnectionGUID: 0n91aItdRTm0AC+SaJBHJg==
X-CSE-MsgGUID: IIJYSb5SS0O4XZ3FNZZsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="163144658"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2025 06:57:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc2dR-000CTL-0r;
	Wed, 16 Jul 2025 13:57:25 +0000
Date: Wed, 16 Jul 2025 21:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rc 63/72] kismet: WARNING: unmet direct
 dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
Message-ID: <202507162144.vrcE23hy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rc
head:   def86e4a3f9b5c36f7f433880579fffc95488514
commit: d6e1d526e77e020760387a7c7e79fa5b9a9cbeab [63/72] net: pcs: add driver for MediaTek USXGMII PCS
config: i386-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_MTK_USXGMII-0-0 (https://download.01.org/0day-ci/archive/20250716/202507162144.vrcE23hy-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250716/202507162144.vrcE23hy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507162144.vrcE23hy-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI [=n] || OF [=n]) && PHYLINK [=y]
     Selected by [y]:
     - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
