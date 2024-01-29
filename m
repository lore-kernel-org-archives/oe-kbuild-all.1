Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9B60253
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706531621; cv=none; b=JcqHeIVkD3pikKzwjPD4zvRKHBfb6kgzK2yOh9BQLjl82ylqt1pp6jiZiIdL5oVCBOopiRlRH3CjW23yNy/Jnto+pO8aGhx4VJcP5+wZ63JgUOvV9IrTgOCrETP4w1SErTzZVvsYZcTmSG/QCPlfSOK6DPvNpEu6zKVz8tw+PkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706531621; c=relaxed/simple;
	bh=onL6rOG236Gik4/zW6niqGaTg3koORMA8K1l2/cy7N0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oOYam0/hAUkQ7/E4Epk9AmiZZeRsXBUczZzMNANSIWSQDqZmxcAwtncHuUWZX/NxBXvh0p9y+MgAgmH9i4XfSyVngLuTp+YDACbe2pokj4OYVULXgV2kHoox6XftFJG3ftwnUa8WOMT7T/xww707poqUdKTOt/yIgevns2WWlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ii/g1k0M; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ii/g1k0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706531620; x=1738067620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=onL6rOG236Gik4/zW6niqGaTg3koORMA8K1l2/cy7N0=;
  b=ii/g1k0MQxMpXPaqBlR09ztcCS92/utumvbYH+VT3OJLGEfUR1ea/Oyz
   24Dq13CPDACzJfkNIQ40ydNxFHzQ8ldx2CKxumcJXEf7jHJs0E/t8flBS
   BkDcHIMo/lbiTvBsgX6cKXdXVyb8M+NCtRDX2eFfkUVlV84vuF2tKPm+f
   K6+ivNWck4SaMm+DAu0uLBJTj1226Qvrc52uoPon4M6ttzOFabjQ8BPKO
   /gE7tQwrL+hc4+WFM07TWk/ZEOrOMK9L+0VpmLjkvwCR4+z6c2wV7zQRa
   jyPWTyY6VM5ie/DC21B0xCZnpeN0O5+BwKqA/A0pBBnYZqGu04OpcDQmy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="400083551"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="400083551"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 04:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3356766"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jan 2024 04:33:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUQpS-0004I4-1n;
	Mon, 29 Jan 2024 12:33:34 +0000
Date: Mon, 29 Jan 2024 20:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1546/26476]
 drivers/net/dsa/mt7530.c:2151:6: warning: no previous prototype for
 'mt7531_sgmii_restart_an'
Message-ID: <202401292001.faK9m6P5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: a5f7cc192993935d0bc3edcca566684364e66785 [1546/26476] net: dsa: mt7530: Add the support of MT7531 switch
config: i386-randconfig-141-20240129 (https://download.01.org/0day-ci/archive/20240129/202401292001.faK9m6P5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401292001.faK9m6P5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292001.faK9m6P5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/mt7530.c:2151:6: warning: no previous prototype for 'mt7531_sgmii_restart_an' [-Wmissing-prototypes]
    2151 | void mt7531_sgmii_restart_an(struct dsa_switch *ds, int port)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/mt7531_sgmii_restart_an +2151 drivers/net/dsa/mt7530.c

  2150	
> 2151	void mt7531_sgmii_restart_an(struct dsa_switch *ds, int port)
  2152	{
  2153		struct mt7530_priv *priv = ds->priv;
  2154		u32 val;
  2155	
  2156		val = mt7530_read(priv, MT7531_PCS_CONTROL_1(port));
  2157		val |= MT7531_SGMII_AN_RESTART;
  2158		mt7530_write(priv, MT7531_PCS_CONTROL_1(port), val);
  2159	}
  2160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
