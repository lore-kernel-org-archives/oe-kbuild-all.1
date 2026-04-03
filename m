Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A87B37FF76
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206082; cv=none; b=kpucaOATjXL+HSMU1JJ1GlcflMzmv/ec8srjnKw4wQQQ4FfK/zI4GIz06IYjgALCnhE9+R0pw4EzZXon9luVqJaXFifnAobzzu6A+KbcG6J8x/NLfVatnFgCqCmus4wnx31ZgsELAj66SNjuclVgJrYKFidlDOykguK8fTPcE6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206082; c=relaxed/simple;
	bh=FypCi4NEvNX4+W8mVcLLxvcNjuVzPf7nqVDqlQk2Qh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kpwS5RPr990CqCIOwRuuRid9bOGPedoxGfKskCYcDBksIjRXch+xjNTqNqW9gjcnmoTM/49omg0TN8vHLM6lf+0jE6qYGeIwjd22W9xkc+3kp2WKXRet20S1GSZCc4j5EqDC8qjStft7U2BTZUhCQzQRemi7DSOakO/gM8LJCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSnYZnap; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSnYZnap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206082; x=1806742082;
  h=date:from:to:cc:subject:message-id;
  bh=FypCi4NEvNX4+W8mVcLLxvcNjuVzPf7nqVDqlQk2Qh0=;
  b=TSnYZnapUMxS/Tu3vEV0M2Ezbu8GecITtAKsDbcab2Kkiy93e26Nm2dE
   nQMRJxWrzLXJL6kIkZ0f7+WpoxlrBgMKEeAQflB3jBgjGrNCrpPEzbZ3/
   35xscVlfeGsKYhpIIl7XZMLuStNpkSRG0DqMpnI0z0NVVMPNGdKKZz1gS
   +iHsVMXG62FyeVzSjN3t/ojVsoKsj6OPOALKoftKEx5ORIgvQqd4dkq7w
   F04GengkicCqYgCWx06HMXqyOq2/56zPXyP6h/XUzzOf/icOgFQnbsrn2
   iHz5tpgdR7DqrQrhw+yGL1Sgxf9tGJmRVZs09nh8yveUca+EcxXcv8/Vo
   g==;
X-CSE-ConnectionGUID: mkLZyxHmQX2asqqQ5pBoRg==
X-CSE-MsgGUID: EWICOsDUQ/m0uu2reeBCKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87658605"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="87658605"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:48:01 -0700
X-CSE-ConnectionGUID: pkQFkq0MT+WnQ46Rz5e0ww==
X-CSE-MsgGUID: Bt4z7IuIR0azi4Xb61G3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232014703"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2026 01:47:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aC5-0000000017V-0kvy;
	Fri, 03 Apr 2026 08:47:57 +0000
Date: Fri, 03 Apr 2026 16:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Jian Zhang via Openipmi-developer" <openipmi-developer@lists.sourceforge.net>
Cc: oe-kbuild-all@lists.linux.dev, Corey Minyard <corey@minyard.net>
Subject: [cminyard-ipmi:for-next 2/6]
 drivers/char/ipmi/ssif_bmc.c:846:2: error: call to undeclared function
 'del_timer_sync'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604031535.K2NUrFkf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cminyard/linux-ipmi for-next
head:   90478a78b71fffa35ecaca82d229036fcd9a4a58
commit: e1748349a14d39db4569316a01eb1ff2511f1765 [2/6] ipmi: ssif_bmc: cancel response timer on remove
config: i386-randconfig-141-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031535.K2NUrFkf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031535.K2NUrFkf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031535.K2NUrFkf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/ipmi/ssif_bmc.c:846:2: error: call to undeclared function 'del_timer_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     846 |         del_timer_sync(&ssif_bmc->response_timer);
         |         ^
   1 error generated.


vim +/del_timer_sync +846 drivers/char/ipmi/ssif_bmc.c

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
