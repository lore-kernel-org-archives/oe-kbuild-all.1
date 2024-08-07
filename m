Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277435BAF0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723047628; cv=none; b=MWzF+rR5Gjqt+o9PvbCoMxk8GsvZ85ZVujX8fr67FZoYqVBYOyuNAs66vzwIcmca+ch8+VMDhTI396+lwl3PT49ZplgsHov1Fd7W3HzN/Krb6DqgoG7vvwbMcuQq+pdgDMqasLVJGWx/DImhgsH/L06R/8T8jVxw+xYPn6jkXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723047628; c=relaxed/simple;
	bh=reoFmnBYI4AlKRBOAtZKdHCzpS8ytQAL4ar/m19Bfug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KykxP89uL0uhmzFil89J1fAKFM8NRpdC7pAgoPtofZwK8jmwIeh34j8l2FfUVknomQf0BsJMjf2ktI/+ZIypMGn0NZUUWJxVqjRKX5eMdTLiqJIlhD5t48akfEpDTFUqeXTY/g4LsK7s83N1A6D6sFcuiIWLXR/G8BOx5khriI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leV4xEDe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leV4xEDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723047627; x=1754583627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=reoFmnBYI4AlKRBOAtZKdHCzpS8ytQAL4ar/m19Bfug=;
  b=leV4xEDeidSe3SY8T2hem+XPdFliCGXQoxbobXjsaHdeDzs7AKokYzXT
   h19Oe05RHMfLhcuWyumWt4Q7rEeJGHvhfqyuPEbUWmMPd9wn3aRjwIchT
   tHHvUkiiApxrAnKv3RMuijezCbY9VJzszwwRHLPKVoqr3MGMF7fCelVPR
   Nbz57eqx/HawbjwHNbmWj9Od9YJBuXM6sJZflP0XtQkvLyyBeQD4dBILj
   PY2CYCBCFNwHoM/1MgOlAt5emcPqxEHnac1ITBt4FlbSwyYdust/yzOV5
   1lbNEhG9ldSMVq33lU3j0adUYOyFfkRVDbsNd/EwwkNd9fbSIOpYmZ78U
   g==;
X-CSE-ConnectionGUID: d+JxFI8eTpaokncS8q/nVQ==
X-CSE-MsgGUID: /oVpwmnjT2SP+kA2570hEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20793288"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="20793288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 09:20:26 -0700
X-CSE-ConnectionGUID: c709y8U4Q6yUr18lSeDy0Q==
X-CSE-MsgGUID: x4bm8TB0T2++E7opXCQWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61789381"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2024 09:20:26 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbjOh-0005XM-1Q;
	Wed, 07 Aug 2024 16:20:23 +0000
Date: Thu, 8 Aug 2024 00:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 53/53]
 sound/soc/codecs/wsa884x.c:1539:13: warning: variable 'sts0_bck' set but not
 used
Message-ID: <202408080025.NZnhQWS4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: 77aa965762ad9c8711d005628b5c471007e0df82 [53/53] DEBUG: interrupts on wsa884x
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408080025.NZnhQWS4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080025.NZnhQWS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080025.NZnhQWS4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/wsa884x.c: In function 'wsa884x_interrupt_callback':
>> sound/soc/codecs/wsa884x.c:1539:13: warning: variable 'sts0_bck' set but not used [-Wunused-but-set-variable]
    1539 |         u32 sts0_bck;
         |             ^~~~~~~~


vim +/sts0_bck +1539 sound/soc/codecs/wsa884x.c

  1531	
  1532	static int wsa884x_interrupt_callback(struct sdw_slave *slave,
  1533					      struct sdw_slave_intr_status *status)
  1534	{
  1535		struct wsa884x_priv *wsa884x = dev_get_drvdata(&slave->dev);
  1536	
  1537		dev_err(&slave->dev, "AAA %s:%d\n", __func__, __LINE__);
  1538		u32 sts0 = 0, sts1 = 0;
> 1539		u32 sts0_bck;
  1540	
  1541		regmap_read(wsa884x->regmap, WSA884X_INTR_STATUS0, &sts0);
  1542		regmap_read(wsa884x->regmap, WSA884X_INTR_STATUS1, &sts1);
  1543		dev_err(&slave->dev, "AAA1 %s:%d sts0=0x%x sts1=0x%x\n",
  1544			__func__, __LINE__, sts0, sts1);
  1545		sts0_bck = sts0;
  1546	#if 0
  1547		regmap_read(wsa884x->regmap, WSA884X_INTR_STATUS0, &sts0);
  1548		regmap_read(wsa884x->regmap, WSA884X_INTR_STATUS1, &sts1);
  1549		dev_err(&slave->dev, "AAA2 %s:%d sts0=0x%x sts1=0x%x\n",
  1550			__func__, __LINE__, sts0, sts1);
  1551	#endif
  1552		regmap_write(wsa884x->regmap, WSA884X_INTR_CLEAR0, sts0);
  1553		regmap_write(wsa884x->regmap, WSA884X_INTR_CLEAR1, sts1);
  1554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
