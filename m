Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F4B487BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779929; cv=none; b=i3yk2eFQmqTJPC1mYpVwrqJJTrwRt5W4XDl0530bhmx3QTKZUnK85XpHHCnr1JUN+kSgLLNp7NBE77DyokepX8vRVMZTdPt5zjxhYiRQDZ5kgIPvnLYlca3xBtnPJgnKmlJVi25dYfyAQjUJJLmQLSDxtEDsmhTNL7EEXNRUv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779929; c=relaxed/simple;
	bh=G3RAFlzVZTFlHweuOz6mpeo0uyRZyvZOu1gVa+zYykE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BgD4kYl4KtjFDj5wfeB8HSwDtWzTfLmcaLUGtAiUthkhE8ZyBmpGdqIAsiLEavGw3nPcL2ZZar9ZR+5Ru4uL6j2ToEXyv7m3ilyksxy6Fumw6ugtyUp0uvnaBCIZsT7DQgeY7JoIcchCOOIYsQb2Hd+LDIV7xCzNddVsPhzQ2CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYTI3Pir; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYTI3Pir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782779927; x=1814315927;
  h=date:from:to:cc:subject:message-id;
  bh=G3RAFlzVZTFlHweuOz6mpeo0uyRZyvZOu1gVa+zYykE=;
  b=aYTI3PirFfMdUKVCD8rsDwcb85Lpr1lBVJBPf8Al4+qzCLpxXT8zJ/hW
   mFF5d78hBgVesuqP6LH6ekeGrKBo9maOp2U+SLzKfneT2zF9sdMsRuvgk
   Qjy7TsyGksJm68MxAD55wq9Vg+jQwNK2r97TgXv9cYHYks3ZHSzEXrTmz
   lVWCXMzr2Bog3ZJmvOF+kxKYxtsCUMqCWy5mLShfgpIbPp5dP2fdjk2iR
   z+AyaXB0jn04XsYhWzrCU4Ci+1o/ruDqRm2IbOKCmBjN2jlXk5ui9/ZIu
   qgq1rmCkW0THIdamNbr53V/SB0KFoOqQ5VmbE72aIW+UhInfa/jYl/vQ3
   Q==;
X-CSE-ConnectionGUID: NrZuIKURT6O7XrHX8OdzjA==
X-CSE-MsgGUID: QF9v71BrSMGVZrNhy0DluQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87399080"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87399080"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 17:38:46 -0700
X-CSE-ConnectionGUID: eLYUDhZsSYWqkncnytrAdA==
X-CSE-MsgGUID: I6hiOqB/S7C+FSAlY10Wuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="251704030"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Jun 2026 17:38:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weMUr-000000007t9-2GIB;
	Tue, 30 Jun 2026 00:38:41 +0000
Date: Tue, 30 Jun 2026 08:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/188 1/1]
 drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:109:28: sparse: sparse: incorrect
 type in initializer (different base types)
Message-ID: <202606300856.6w9cp7Aq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/188
head:   616866fe35b03d003aa74b684a16a24a9e119e2a
commit: 16a78531197cf24d14a4e8551a667b49492aaa93 [1/1] DO NOT SUBMIT: net: dsa: mxl862xx: legacy SFP API fallback for old firmware
config: microblaze-randconfig-r123-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300856.6w9cp7Aq-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300856.6w9cp7Aq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300856.6w9cp7Aq-lkp@intel.com/

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
