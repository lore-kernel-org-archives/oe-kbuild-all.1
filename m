Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922D720011E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355390; cv=none; b=cHoKzq8tMIGj5mg0MxC0gHwNuWZI4BcwSG1QJhEUSodIlMbRtH5HjXtQ7UUhxino9hTvfp+9r3o7HdTewK3VhIbRlDxHVRoHCIBY5x3zKHCnBKHXiZ+e855Rn8oSqqAhm9IVvXJtjIYqMM+Imocwzzjp0d9+QFpwZ024/b05R7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355390; c=relaxed/simple;
	bh=caO2yxlEDOXiSwxTabt06JZ9k/x6k6xExy/BLfHNcIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ajigxFrkH6Uu+AXG7zxXEUFLCm1ozh6o2q1EGyUS3dwjvWTf+yba3MHnlwh17+8jJJagHOwyjs91C1z9Wmngby5Xw7zis10cWjseRTXia8O5mAaCLLqjXL8pnJRopRdel/CwNzu6RZ9WfTQLYgDGIxYjLp9AHRe7b2JYfgzTX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMgk56+E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMgk56+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734355389; x=1765891389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=caO2yxlEDOXiSwxTabt06JZ9k/x6k6xExy/BLfHNcIo=;
  b=cMgk56+EAirSQO1z7pPl21FGoViiWySdgN49x7hfMNySgOko2VSb2Z7t
   GSLzuIZjg+7rS/eyZhmb7XvnEeLEOWHa8gjSDTUtkXy98MF0K9x1CLI+Z
   h/o5rAYUfFvz+JoTTTjiTn5rqNe4JUSZ5cJB2WNgdz6gb9Q+hzEk2y1Je
   +j1X+0GGB1eAo2rl3N6kRhvbkPR3xLt1XxUJvTgR6DBl5wyuDT+PrWaO4
   gtGZDf7JH03OgWV6Jq/kfgVfWYbaXWachqrImG7uIGTSphgnlhXWu6lr0
   CGdHvpJqoIHZ/MW6giUUvCeB4XIYQ7PoZCyXKec+mJ8FXM88heNM9bqbl
   Q==;
X-CSE-ConnectionGUID: UaL82q3+SWOgtqCDzdg3Wg==
X-CSE-MsgGUID: dTKgxyk9SN2Oy1pLvnTyyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22322868"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="22322868"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 05:23:08 -0800
X-CSE-ConnectionGUID: KAjBCAM3S1aPeVugXbL7rQ==
X-CSE-MsgGUID: 1VmuFwH8TViZ9bHK0nztDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97104307"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2024 05:23:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNB3w-000EEE-2M;
	Mon, 16 Dec 2024 13:23:04 +0000
Date: Mon, 16 Dec 2024 21:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bharat Bhushan <bbhushan2@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2010/4379]
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:22:48: error:
 'struct otx2_nic' has no member named 'pfc_en'
Message-ID: <202412162138.rUtLhkni-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e25c8d66f6786300b680866c0e0139981273feba
commit: a7ef63dbd5886c396aa1130d5ce42634ab1db91e [2010/4379] octeontx2-af: Disable backpressure between CPT and NIX
config: arm64-randconfig-r071-20241216 (https://download.01.org/0day-ci/archive/20241216/202412162138.rUtLhkni-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412162138.rUtLhkni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412162138.rUtLhkni-lkp@intel.com/

Note: the linux-next/master HEAD e25c8d66f6786300b680866c0e0139981273feba builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c: In function 'otx2_is_pfc_enabled':
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:22:48: error: 'struct otx2_nic' has no member named 'pfc_en'
      22 |         return IS_ENABLED(CONFIG_DCB) && !!pfvf->pfc_en;
         |                                                ^~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c: In function 'otx2_nix_config_bp':
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:1732:33: error: 'IEEE_8021QAZ_MAX_TCS' undeclared (first use in this function)
    1732 |                 req->chan_cnt = IEEE_8021QAZ_MAX_TCS;
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:1732:33: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c: In function 'otx2_nix_cpt_config_bp':
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:1757:33: error: 'IEEE_8021QAZ_MAX_TCS' undeclared (first use in this function)
    1757 |                 req->chan_cnt = IEEE_8021QAZ_MAX_TCS;
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c: In function 'otx2_is_pfc_enabled':
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:23:1: warning: control reaches end of non-void function [-Wreturn-type]
      23 | }
         | ^


vim +22 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c

    19	
    20	static bool otx2_is_pfc_enabled(struct otx2_nic *pfvf)
    21	{
  > 22		return IS_ENABLED(CONFIG_DCB) && !!pfvf->pfc_en;
  > 23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
