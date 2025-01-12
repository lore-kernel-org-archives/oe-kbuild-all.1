Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E216FB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 01:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736644358; cv=none; b=Gajy4lgNqy+Vx7EgQlmTeOLsnEkhkF7Ax07dXnqo63rqe/+IlrixJlyJGLudlg6xuOYdyJGQoPG4Y5DB9DCA0oIk22mghlVWfwXY+2UP4WMFGlMGkyE8WdKEDCPS/cabOM340xvVQOXu6YCLSNC9JcvpbeJPoph6xHrmSbpRby0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736644358; c=relaxed/simple;
	bh=TSS9rc1fqQB9IWixu5Z07kq2Tm50XCDd73OBYcLGhws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kl8QBuTBxbuVIYzkqkSvSHyTX58nMwOSX4dto5irrp8AuSXgH1MQMzE49q+ToJk+b/2HWMXg/E0AAF4VsbECXZspWlmu9HEhaTPVFlS9xr01D23tYODhFoM2F0fY/3GUNO/HYXHBzDtO0bs+coOVqQ1c+yGoqukZdTCan652Afc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9E8drFs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9E8drFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736644357; x=1768180357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSS9rc1fqQB9IWixu5Z07kq2Tm50XCDd73OBYcLGhws=;
  b=Y9E8drFsry1Kgv68egjL2w+0UI6WaKB3/aLXGdPrzdaFqRSQpOZmoAgv
   ShtEdzj6gU2e3hmqgytVi1ciLwCVitrF2MNyr3PqQuh0sGhlggAz2OagA
   VyF0N9Qg45DaEKtz1y1EH8xfeK0yUgbO0OA5GXLhw4xbMh0IpyfcSBEXQ
   5k0ffZ4zEc2yTOzCmKiLEfDWSuYFJq3JDh3TDLKiGc9iAudn+D7psG01d
   tr2F4cvMUFMfW+ZAx2lRFTVZtoCphcTMmPUqQhgba2v+ZKxGbniBzy/i5
   t4QAcITjGUSDuYVA/rKOQPCg3L0h9+xrJUpWfEAlCPh/ffGOHwEjyz1qu
   Q==;
X-CSE-ConnectionGUID: mlZ38CWhSG20HYZ8+1ye6w==
X-CSE-MsgGUID: pjZF3D0pSiWW/TE1/RANUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36588427"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36588427"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 17:12:36 -0800
X-CSE-ConnectionGUID: Q4SRHU/ZQoGmBwjwHBJYcw==
X-CSE-MsgGUID: 7OKC6+UbQlGE8aJbowDIjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="134904517"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2025 17:12:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWmWl-000LO7-3A;
	Sun, 12 Jan 2025 01:12:31 +0000
Date: Sun, 12 Jan 2025 09:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:841:52:
 warning: '%s' directive output may be truncated writing up to 431 bytes into
 a region of size 28
Message-ID: <202501120912.Z88mEJSU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62cef9a5c673f1b8083159f5dc03c1c5daced2f
commit: 091810dbded96c2af81f645e386e4262553e3493 net: stmmac: Introduce selftests support
date:   6 years ago
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20250112/202501120912.Z88mEJSU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120912.Z88mEJSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120912.Z88mEJSU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c: In function 'stmmac_selftest_get_strings':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:841:52: warning: '%s' directive output may be truncated writing up to 431 bytes into a region of size 28 [-Wformat-truncation=]
     841 |                 snprintf(p, ETH_GSTRING_LEN, "%2d. %s", i + 1,
         |                                                    ^~
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:841:17: note: 'snprintf' output between 5 and 436 bytes into a destination of size 32
     841 |                 snprintf(p, ETH_GSTRING_LEN, "%2d. %s", i + 1,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     842 |                          stmmac_selftests[i].name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~


vim +841 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c

   834	
   835	void stmmac_selftest_get_strings(struct stmmac_priv *priv, u8 *data)
   836	{
   837		u8 *p = data;
   838		int i;
   839	
   840		for (i = 0; i < stmmac_selftest_get_count(priv); i++) {
 > 841			snprintf(p, ETH_GSTRING_LEN, "%2d. %s", i + 1,
   842				 stmmac_selftests[i].name);
   843			p += ETH_GSTRING_LEN;
   844		}
   845	}
   846	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
