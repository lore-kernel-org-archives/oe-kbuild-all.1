Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109C61C84B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 20:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739565375; cv=none; b=rEuKjp95oXV3v2jhHegjvS0dzVyMGqTyIq74oC44P2uL0WEWl5by9X2wlB7R9LfR8dm/zWtzSKJslt7/voN//sinj05SzKTfF6TIC0oG0NQzoP7x9VBj1t7dBhOwkeQMI4Yih2wRQY1gotMAiyYi5yUZ7vI0bfMJPVhtBO2mDyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739565375; c=relaxed/simple;
	bh=Z00Ig+L00Ze4KYMxvhA2lnDGbwq5Z8axU0TQiRqjJnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3YwiBfzZsOtbJKbZTwg0if/QSpUxlQscGn6Ids0R4KOP9IBaKGvAPN3+U4NeviijSQzbIfAKIQO2Cz8rZq69wcpn0ZFgB3O8YAnwzz6sAvuZB4gDt404VrhB1O02kiq7G6rxtATRZaCsZ+8/5XxKLMUxXYmd94eq7L9s3mroC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCN2Eemf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCN2Eemf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739565373; x=1771101373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z00Ig+L00Ze4KYMxvhA2lnDGbwq5Z8axU0TQiRqjJnk=;
  b=KCN2EemfwAT4Lo7rdpN7vj2nshMfOx46aN/MJXwfXw5uWvrfPNbTxa/D
   kgcUaMxmCLK7iiXIYm8rcHEFYEPjpTd8TqF5014ZgfiITeghG3RyCVUrJ
   qeAPzp2L3f5qiOkussE0j6jXx6QSgCKaY0pZPEb+3X/G/ygSI8MzxyDzK
   CGQFZ6W9aNg6F0gBCsQPTBsnZONSDsE0ET8ude2bN8rFCeXEl4esLzZfR
   mpVUuf2oO2RA93FFkv1F5HQtkFq+D5H+X5j3kD5cEFcI8H4nqghMTE+FW
   aqggnJk+SxuWWvBvxhf3G/Apk9++XYA9DOL84c49mekExgLLmUHZ2HwvS
   g==;
X-CSE-ConnectionGUID: b8MRRj+9RHCf758eACLM8Q==
X-CSE-MsgGUID: f4C5Vz8nSJ2xm+8X6m+k0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44255138"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="44255138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 12:36:10 -0800
X-CSE-ConnectionGUID: pOEUVNfxRGy06n2wsBym+g==
X-CSE-MsgGUID: 2MZW2oc4SGerJWQWyL10Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113412571"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2025 12:36:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj2Pv-001A8X-34;
	Fri, 14 Feb 2025 20:36:07 +0000
Date: Sat, 15 Feb 2025 04:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [linux-next:master 3034/4011]
 drivers/gpu/drm/bridge/tda998x_drv.c:1717:50: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202502150425.zyVTQv7S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: 325ba852d148434c5bcb06d513af1933a7f77b70 [3034/4011] drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge
config: microblaze-randconfig-r112-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150425.zyVTQv7S-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250215/202502150425.zyVTQv7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150425.zyVTQv7S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/tda998x_drv.c:1717:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/gpu/drm/bridge/tda998x_drv.c:1717:50: sparse:     expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/bridge/tda998x_drv.c:1717:50: sparse:     got unsigned int const [usertype] *
   drivers/gpu/drm/bridge/tda998x_drv.c:1718:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/gpu/drm/bridge/tda998x_drv.c:1718:52: sparse:     expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/bridge/tda998x_drv.c:1718:52: sparse:     got unsigned int const [usertype] *

vim +1717 drivers/gpu/drm/bridge/tda998x_drv.c

e7792ce2da5ded8 drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark        2013-01-08  1694  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1695  static int tda998x_get_audio_ports(struct tda998x_priv *priv,
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1696  				   struct device_node *np)
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1697  {
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1698  	const u32 *port_data;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1699  	u32 size;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1700  	int i;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1701  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1702  	port_data = of_get_property(np, "audio-ports", &size);
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1703  	if (!port_data)
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1704  		return 0;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1705  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1706  	size /= sizeof(u32);
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1707  	if (size > 2 * ARRAY_SIZE(priv->audio_port_enable) || size % 2 != 0) {
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1708  		dev_err(&priv->hdmi->dev,
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1709  			"Bad number of elements in audio-ports dt-property\n");
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1710  		return -EINVAL;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1711  	}
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1712  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1713  	size /= 2;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1714  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1715  	for (i = 0; i < size; i++) {
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1716  		unsigned int route;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09 @1717  		u8 afmt = be32_to_cpup(&port_data[2*i]);
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1718  		u8 ena_ap = be32_to_cpup(&port_data[2*i+1]);
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1719  
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1720  		switch (afmt) {
b7c5169ab9ddc34 drivers/gpu/drm/i2c/tda998x_drv.c Dmitry Baryshkov 2025-01-13  1721  		case TDA998x_I2S:
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1722  			route = AUDIO_ROUTE_I2S;
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1723  			break;
b7c5169ab9ddc34 drivers/gpu/drm/i2c/tda998x_drv.c Dmitry Baryshkov 2025-01-13  1724  		case TDA998x_SPDIF:
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1725  			route = AUDIO_ROUTE_SPDIF;
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1726  			break;
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1727  		default:
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1728  			dev_err(&priv->hdmi->dev,
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1729  				"Bad audio format %u\n", afmt);
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1730  			return -EINVAL;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1731  		}
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1732  
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1733  		if (!ena_ap) {
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1734  			dev_err(&priv->hdmi->dev, "invalid zero port config\n");
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1735  			continue;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1736  		}
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1737  
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1738  		if (priv->audio_port_enable[route]) {
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1739  			dev_err(&priv->hdmi->dev,
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1740  				"%s format already configured\n",
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1741  				route == AUDIO_ROUTE_SPDIF ? "SPDIF" : "I2S");
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1742  			return -EINVAL;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1743  		}
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1744  
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1745  		priv->audio_port_enable[route] = ena_ap;
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1746  	}
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1747  	return 0;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1748  }
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1749  

:::::: The code at line 1717 was first introduced by commit
:::::: 7e567624dc5a44276d9df253f5ca829d911b4e93 drm/i2c: tda998x: Register ASoC hdmi-codec and add audio DT binding

:::::: TO: Jyri Sarha <jsarha@ti.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
