Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50B4185B6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728577245; cv=none; b=DqGi/qmQvYRGKMJfrfurM3HRfGbE58D1k6Vq1foiMo9pS7jSghUjYzCKQlRWj2k16j7fBnZnZehiiN9x5f0XYrPYqd53dmyujo30jkMG9rI3Bvbiao4TOGGbusZejetjdNTg0p5iwR5Vo0PBrA1VoW98+jW403YNArLHQjJMfQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728577245; c=relaxed/simple;
	bh=4CTbgeH3P2URkRkiOcJ/AUPpQwMcbySn3HLFKBRGxa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ef+iwvqVfYlp257S4I/OFKv334RKL4oXnC2ccTpWWy78zSiKFnI83Wj93vSwFm8UpV+VWSSCh7sMyU+UyJmeMs0s4jTbSFPup600Pc1OUntGA6CS2og9PPDHMDOMECVUVV2MhuTcGkYOXYA5f7RqfCNQRz6F18IqSJ9HtIkKgIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTJEqsi7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTJEqsi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728577243; x=1760113243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CTbgeH3P2URkRkiOcJ/AUPpQwMcbySn3HLFKBRGxa4=;
  b=gTJEqsi7fP48HKEuUkswRknCQ1rTG012Vj3sFPbw5sULh9l0yax5goTX
   EwUQsReYZTMI0/ZSZ84GruQJbHYLt3xM5G7Nwz5ZLsMdc1cSDyqrV/Vzo
   k/4Ye/BuOLhhWaPHRkgCuPRkgI6Tv2fOovm8V2TwxaEILRyuPV2g0Wzrs
   CE5H7KXh4zRiltRdXp0I/X4mDkcebRTJcM3cXbIlWsNf8/Qn+l3Y0sD4n
   4TeHXBVTY+3hUEVTbmsTbwEqA2Oeg+do7LrrL+jMcBQoz1hmjdcOFpKCB
   jfOhDnDPhLWZ7etezEyDL6l5lp7At2fq8YnxKYDFVEUANO0dOhMrV0UcY
   A==;
X-CSE-ConnectionGUID: rdRX13LkTfKUbTaNSMtTlg==
X-CSE-MsgGUID: zv1fmPFTTt+qTA2J91bN7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28039067"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="28039067"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 09:20:42 -0700
X-CSE-ConnectionGUID: cFHfhiuGQCCdvOWbH2lCWA==
X-CSE-MsgGUID: xQ2mC+MSQLeYD1HfM6UhvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="81653814"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Oct 2024 09:20:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syvti-000Ayb-1j;
	Thu, 10 Oct 2024 16:20:18 +0000
Date: Fri, 11 Oct 2024 00:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [cel:nfsd-5.10.y 104/173] drivers/i2c/i2c-core-base.c:101:39:
 sparse: sparse: incorrect type in argument 1 (different modifiers)
Message-ID: <202410110013.3iDiOd38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.10.y
head:   9b096cf0ea8d57a1837165a328e29476ae508325
commit: 485dd5c359970c7a431596bcd8c4469362915eba [104/173] i2c: Add i2c_get_match_data()
config: x86_64-randconfig-121-20241010 (https://download.01.org/0day-ci/archive/20241011/202410110013.3iDiOd38-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110013.3iDiOd38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110013.3iDiOd38-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/i2c-core-base.c:101:39: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct device *dev @@     got struct device const * @@
   drivers/i2c/i2c-core-base.c:101:39: sparse:     expected struct device *dev
   drivers/i2c/i2c-core-base.c:101:39: sparse:     got struct device const *

vim +101 drivers/i2c/i2c-core-base.c

    94	
    95	const void *i2c_get_match_data(const struct i2c_client *client)
    96	{
    97		struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
    98		const struct i2c_device_id *match;
    99		const void *data;
   100	
 > 101		data = device_get_match_data(&client->dev);
   102		if (!data) {
   103			match = i2c_match_id(driver->id_table, client);
   104			if (!match)
   105				return NULL;
   106	
   107			data = (const void *)match->driver_data;
   108		}
   109	
   110		return data;
   111	}
   112	EXPORT_SYMBOL(i2c_get_match_data);
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
