Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A953036E483
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205965; cv=none; b=pfEUxmP4iBQA9w7HRy6NkKY6jjv8Fee0Q6vqqo+PmRM89m3QT77yNS4GbtjGbK4bBaE5Z8MtcZTNUwz+Du73q/eiw/CRA/VsfyS7N08ZMrT3h28y5XwruJh3+jhqzys/PSFqEXPql1yah1FjMy4+u7z5++TYtX9r0PjuGNj9vLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205965; c=relaxed/simple;
	bh=JI9g7tZD4hAkRyswMW3/nAvmEOKyz3Ht8Onyzj06n/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NqPE6EOpON9mirasiwQ25VoBFbJfiRNIDTQLvwBo57E9zcUGQVzuhOR1fhRCnk5bpQXNFDNq4boMvNGhlBXYvg09Do1BAikrSrtpLbpw1niP3yvhvNmLx2atCx2fgtYrXcw48cJdVxiPMdS9k3y8y2YQJnpVjAF1VJZiGl2nodc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaGI64za; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaGI64za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205964; x=1806741964;
  h=date:from:to:cc:subject:message-id;
  bh=JI9g7tZD4hAkRyswMW3/nAvmEOKyz3Ht8Onyzj06n/Q=;
  b=MaGI64zaKle7HI/isUh0IZBZjajJl5g/U1gAgtpl5pwrR0treOZrrEl2
   zMqOIY6x19cbZB0wc8z7qaWDgJxN7dl8UgqqqYiG88+pRoEm7Rul2upn2
   OCwrPCyrJoCVct+SmWKZ79Uu3W6AOd6JQybnIMSSVJLh3o5SV8Xwwsu9K
   iYzgCSjmm/FXS8uOzFqDwNZ0A1zpPZz0wyofSajADyzigPEsxwyL1pITN
   eZcNvfodngNX83OGYY4ZrnLQPxWR+YpEVWcuZeJsyxr8ZGaS7zCLQ2H+c
   IgeENKdAJAWrsvXdNi0xr5zwjNWnqHzpXFl1+yIEGJExMqeNdkBwWtOx0
   w==;
X-CSE-ConnectionGUID: X1C6/J85TqaDtOMTFzyYLA==
X-CSE-MsgGUID: nh1/DBRORaugLztDE06QrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889033"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889033"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:01 -0700
X-CSE-ConnectionGUID: BwZSFKhQRSivRP9PC/1xzQ==
X-CSE-MsgGUID: GVPLyAcoSxK8g63PtKo/uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226369004"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-0000000016E-2W6L;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 03 Apr 2026 16:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Jian Zhang via Openipmi-developer" <openipmi-developer@lists.sourceforge.net>
Cc: oe-kbuild-all@lists.linux.dev, Corey Minyard <corey@minyard.net>
Subject: [cminyard-ipmi:for-next 2/6]
 drivers/char/ipmi/ssif_bmc.c:846:2: error: implicit declaration of function
 'del_timer_sync'; did you mean 'add_timer_on'?
Message-ID: <202604031030.j3LgqrdF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cminyard/linux-ipmi for-next
head:   90478a78b71fffa35ecaca82d229036fcd9a4a58
commit: e1748349a14d39db4569316a01eb1ff2511f1765 [2/6] ipmi: ssif_bmc: cancel response timer on remove
config: parisc-randconfig-002-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031030.j3LgqrdF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031030.j3LgqrdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031030.j3LgqrdF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/ipmi/ssif_bmc.c: In function 'ssif_bmc_remove':
>> drivers/char/ipmi/ssif_bmc.c:846:2: error: implicit declaration of function 'del_timer_sync'; did you mean 'add_timer_on'? [-Werror=implicit-function-declaration]
     del_timer_sync(&ssif_bmc->response_timer);
     ^~~~~~~~~~~~~~
     add_timer_on
   cc1: some warnings being treated as errors


vim +846 drivers/char/ipmi/ssif_bmc.c

   841	
   842	static void ssif_bmc_remove(struct i2c_client *client)
   843	{
   844		struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
   845	
 > 846		del_timer_sync(&ssif_bmc->response_timer);
   847		i2c_slave_unregister(client);
   848		misc_deregister(&ssif_bmc->miscdev);
   849	}
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
