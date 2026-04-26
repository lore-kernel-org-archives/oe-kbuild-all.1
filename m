Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F71DE894
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777203754; cv=none; b=T6Tt9Y63AxMgnmJ3k0SewoRGiHDaLRE2h7FFoN77c4H+iS1JH1GJ8VmtVWxFIs5m3Oph2Hrmym8NwmgAeU0gYBn2I9IXDCGb93VR33BG8iz6LUKqui+vOaE2ViVCMR7JP81QkzXTDdkpPTwG8kATRSKYcyj7Z8V3qZJRsj4RMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777203754; c=relaxed/simple;
	bh=nnXewkwBz0Rrn5nfi1fTZYThGOUmKtRXE5h1X3qYBBw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UiMNyHU7H5IGDt9jEi7IJe+ueVScIO3QcUiXjyrP0SG1wohhZGt+k9r4sr4Mi7c9A6K5zPyHgQmOxjs53ZSpp4GAiILHivnBfD68IgW2wvUlGDjCIam8XQbuOmYHQY1osxAFDEy98nlq6DUvQyWhIxq7wQvAl8S0Dbfa/j9Ey44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCfF+c71; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCfF+c71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777203752; x=1808739752;
  h=date:from:to:cc:subject:message-id;
  bh=nnXewkwBz0Rrn5nfi1fTZYThGOUmKtRXE5h1X3qYBBw=;
  b=GCfF+c71DT/U0FVajGm/EcDBGPPaZ+wJLkC5yo8Xw/RrVNEEiNDfpWiY
   +jmrOCC32QfHNkMdM7nReN5DKaApunOLFluMq3oJPzCDOsIm862UMy5JJ
   5a5e1OwGbXVtgc53UIiThm0UCO+GIIb/FsdUzzO0ido7q3NF2dJZOaw/l
   6PJj7wWRaK2xDmxd5p6AXBXF7oe2eCZhfZE+XMK8Yk/4v2YmOJ+asDR4B
   XgkLWSsKPCfMVlu91WCIDCIeta3yggx4qOr3ZhzToGx1EpIhtUmI7T7xq
   3k6eSDIbEb62uexqeumRvAGBF/BuvWkm9GB6Q+quQMcU+WOph2CfoVql7
   Q==;
X-CSE-ConnectionGUID: lXDJ/2gqQgOHAGfejjQEuw==
X-CSE-MsgGUID: xb65omWoRQuCo5SZ1ZvTBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="77821962"
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="77821962"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 04:42:31 -0700
X-CSE-ConnectionGUID: nEYIRX0wSZyJvYRJ/kIsEA==
X-CSE-MsgGUID: ncP5NCzRQE+ykJEEwg5Esg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="232510004"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Apr 2026 04:42:30 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGxsZ-000000007qT-48KO;
	Sun, 26 Apr 2026 11:42:28 +0000
Date: Sun, 26 Apr 2026 19:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [arnd-playground:config-gpio-legacy-7.1 10/22]
 drivers/nfc/nfcmrvl/main.c:246:28: error: implicit declaration of function
 'of_property_read_bool'
Message-ID: <202604261924.zcdkycf9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.1
head:   bbb302c86fdfa7705d8511a74c4b6db205cd2683
commit: e11421cee13b5d2560a2dc660ccb7ab8137bfba1 [10/22] [v2] nfc: marvell: convert to gpio descriptors
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260426/202604261924.zcdkycf9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604261924.zcdkycf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604261924.zcdkycf9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nfc/nfcmrvl/main.c: In function 'nfcmrvl_parse_dt':
>> drivers/nfc/nfcmrvl/main.c:246:28: error: implicit declaration of function 'of_property_read_bool' [-Wimplicit-function-declaration]
     246 |         pdata->hci_muxed = of_property_read_bool(node, "hci-muxed");
         |                            ^~~~~~~~~~~~~~~~~~~~~


vim +/of_property_read_bool +246 drivers/nfc/nfcmrvl/main.c

3194c6870158e3 Vincent Cuissard 2015-10-26  242  
dc14bdef8762a8 Vincent Cuissard 2015-06-11  243  int nfcmrvl_parse_dt(struct device_node *node,
dc14bdef8762a8 Vincent Cuissard 2015-06-11  244  		     struct nfcmrvl_platform_data *pdata)
dc14bdef8762a8 Vincent Cuissard 2015-06-11  245  {
cc6d85c1cb5ccc Rob Herring      2023-03-14 @246  	pdata->hci_muxed = of_property_read_bool(node, "hci-muxed");
dc14bdef8762a8 Vincent Cuissard 2015-06-11  247  
dc14bdef8762a8 Vincent Cuissard 2015-06-11  248  	return 0;
dc14bdef8762a8 Vincent Cuissard 2015-06-11  249  }
dc14bdef8762a8 Vincent Cuissard 2015-06-11  250  EXPORT_SYMBOL_GPL(nfcmrvl_parse_dt);
dc14bdef8762a8 Vincent Cuissard 2015-06-11  251  

:::::: The code at line 246 was first introduced by commit
:::::: cc6d85c1cb5ccc04c594392339c81227abd1667d nfc: mrvl: Use of_property_read_bool() for boolean properties

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
