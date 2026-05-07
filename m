Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E978E428833
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168538; cv=none; b=pbJ0ASTVDvNjYXl7DzkYpxZx7Enq3j/OQYOElEBagX0F1CmxDSzuUmiIDV/AcYR0+1kANfgmLpQvJI6jnJejA9qPPmDPqb4iMy5Km22T1YX7wU7MpJrX7+4mBgG8Vmei40ocfFgnBCmsMVpWcns3NtkVzbiw3OWuTQ7KHxY1SBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168538; c=relaxed/simple;
	bh=wON9UM/EHY5lVyadPcMcHyEsZX0o0jHBNX64IUCxhMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IA0UEatEZ/cAWI6+XKubAqOqGIhHoFLvZQNijC56xVDiYw//4wo3RnAGL2TIKMgVj369XFnsnQneli3V4OU8KqN2SJxMMhrEoeS590bZGLLdZNmmimyO+OrCaIBUcNyWfBHjHmVQyBg9qjCKDVZ8BSY3Ova67qvr4eLucPnC27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTS3ifU8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTS3ifU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778168537; x=1809704537;
  h=date:from:to:cc:subject:message-id;
  bh=wON9UM/EHY5lVyadPcMcHyEsZX0o0jHBNX64IUCxhMk=;
  b=fTS3ifU8RzPeHr7STAmVKyFDJ52MM3PDE4cVMDtwchCaRyYkOiFf2sTx
   MwogjfrUHs4ZN+wVYSq1jHsRANXKrga56DZHKH0qBJrcoYMK4L6zIaSwW
   y28UbrgcFyQL+hyfprDmCOlWV5FdUjUR8cag/M64PObrSrOHc2Zmvk3S5
   rCbh4D/JB5PApuNSmuAypLdNM+rJsy7hf8puevLw4UxEppk3rlVZui+9y
   TRxApe+4ZV6QSZCiT/wkH66uMq7oPv7Lxh6ySyUheOIdTtg67Fo5c3Wql
   AIMDiasH4LZfFcvhQpXN+43KDE/eKSFurJ+9K/e52NYaDDwSRGwRXKMRK
   g==;
X-CSE-ConnectionGUID: oCsWKElAQ2S3Z3wYNdaE/g==
X-CSE-MsgGUID: pI9a0VZWRFuPQc4QF8XEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89430892"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="89430892"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 08:42:17 -0700
X-CSE-ConnectionGUID: Sqczkf+3RSa0g2+onq3YGQ==
X-CSE-MsgGUID: wGjUZaezT1iOkf745ptnlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236754098"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 May 2026 08:42:15 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL0rc-000000000EP-3GlJ;
	Thu, 07 May 2026 15:42:12 +0000
Date: Thu, 07 May 2026 23:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 112/157]
 drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:109:28: sparse: sparse: incorrect
 type in initializer (different base types)
Message-ID: <202605072325.qT5jn62A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: 18d91588a08dc23e0df234150c8d7200516c2a3d [112/157] DO NOT SUBMIT: net: dsa: mxl862xx: legacy SFP API fallback for old firmware
config: parisc-randconfig-r112-20260507 (https://download.01.org/0day-ci/archive/20260507/202605072325.qT5jn62A-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072325.qT5jn62A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072325.qT5jn62A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:109:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:109:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:109:28: sparse:     got int port
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:112:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:112:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:112:28: sparse:     got int port
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:128:30: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:128:30: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:128:30: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:128:30: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:128:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:152:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:165:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:165:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:165:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:165:25: sparse: sparse: restricted __le32 degrades to integer

vim +109 drivers/net/dsa/mxl862xx/mxl862xx-phylink.c

   101	
   102	static void mxl862xx_legacy_pcs_get_state(struct phylink_pcs *pcs,
   103						  unsigned int neg_mode,
   104						  struct phylink_link_state *state)
   105	{
   106		struct mxl862xx_priv *priv = pcs_to_mxl862xx_pcs(pcs)->priv;
   107		int port = pcs_to_mxl862xx_pcs(pcs)->port;
   108		struct mxl862xx_port_link_cfg port_link_cfg = {
 > 109			.port_id = port,
   110		};
   111		struct mxl862xx_port_cfg port_cfg = {
   112			.port_id = port,
   113		};
   114		int ret;
   115	
   116		ret = MXL862XX_API_READ(priv, MXL862XX_COMMON_PORTLINKCFGGET,
   117					port_link_cfg);
   118		if (ret)
   119			return;
   120	
   121		ret = MXL862XX_API_READ(priv, MXL862XX_COMMON_PORTCFGGET, port_cfg);
   122		if (ret)
   123			return;
   124	
   125		state->link = (port_link_cfg.link == MXL862XX_PORT_LINK_UP);
   126		state->an_complete = state->link;
   127	
 > 128		switch (port_link_cfg.speed) {
   129		case MXL862XX_PORT_SPEED_10:
   130			state->speed = SPEED_10;
   131			break;
   132		case MXL862XX_PORT_SPEED_100:
   133			state->speed = SPEED_100;
   134			break;
   135		case MXL862XX_PORT_SPEED_1000:
   136			state->speed = SPEED_1000;
   137			break;
   138		case MXL862XX_PORT_SPEED_2500:
   139			state->speed = SPEED_2500;
   140			break;
   141		case MXL862XX_PORT_SPEED_5000:
   142			state->speed = SPEED_5000;
   143			break;
   144		case MXL862XX_PORT_SPEED_10000:
   145			state->speed = SPEED_10000;
   146			break;
   147		default:
   148			state->speed = SPEED_UNKNOWN;
   149			break;
   150		}
   151	
   152		switch (port_link_cfg.duplex) {
   153		case MXL862XX_DUPLEX_HALF:
   154			state->duplex = DUPLEX_HALF;
   155			break;
   156		case MXL862XX_DUPLEX_FULL:
   157			state->duplex = DUPLEX_FULL;
   158			break;
   159		default:
   160			state->duplex = DUPLEX_UNKNOWN;
   161			break;
   162		}
   163	
   164		state->pause &= ~(MLO_PAUSE_RX | MLO_PAUSE_TX);
   165		switch (port_cfg.flow_ctrl) {
   166		case MXL862XX_FLOW_RXTX:
   167			state->pause |= MLO_PAUSE_TXRX_MASK;
   168			break;
   169		case MXL862XX_FLOW_TX:
   170			state->pause |= MLO_PAUSE_TX;
   171			break;
   172		case MXL862XX_FLOW_RX:
   173			state->pause |= MLO_PAUSE_RX;
   174			break;
   175		case MXL862XX_FLOW_OFF:
   176		default:
   177			break;
   178		}
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
