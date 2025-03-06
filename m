Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32720A5D5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741261681; cv=none; b=czjpjSOm2VrlTKSrRE2fCL5onLplB2iVvsTnDiz2OmdIKOkfLsG+FOuUgu6PmuFy8XGXtQyiaGdnZUD6E9eZMotfmhThMmHEj+jzP+aQBTAopnxIIBnfyORYG0wFRkXGk3NbjO4jsKpdJTr5jzJC3Suncoaserk7u/wE9hVu4uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741261681; c=relaxed/simple;
	bh=pCFPKOIMD8jEPgnUOLHv9zpXemm5IySx0WWbbhIu8cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G78VABgzGEzj4vjDS7zYBCO/wnCwEeTj4iPtFc/FR1CER58xckjG2kWZa1AgDnqKwVT/r18C+75c3lA3INNMEUjmkRrMcEViDyxgULF5CNgw6Ivw1wlaVYPG7ZHzKaZG1qscCXyJ6WDjC63aCc/knSOfsZtyuiS02QR3DBtz/fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsJSdoH9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsJSdoH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741261679; x=1772797679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pCFPKOIMD8jEPgnUOLHv9zpXemm5IySx0WWbbhIu8cg=;
  b=SsJSdoH92QtJDqlmozuM3zoWfibHun3lcanDTcz5gh8mdus+tIlU3NbS
   OsRgzHO7R58y6LuAsD9KxfGCgUz4gF/Rksw8VOaeET6+l0rUk6jJlp9VQ
   yW5KiRoOTrQ67impC68t+C9cRui+hL14GzVigvhA3IHzqT3sR72xzUtFi
   qmL1vN7RyPn6Ypc+d4MJPwbCWiAdZTNF9ZXOZP4tic+yULxlV/n1pNx6L
   lbWiz0UHWHH9e3HCbAU2RR62K8JGiYYPqizVM4MZVaUNjUiBuKBt4wX6z
   9F9cANreKCZ3+IZBlpdgfZSxvUOTnMBWTN3p8J0FJogSqoEz4DgqPKqkQ
   A==;
X-CSE-ConnectionGUID: wMW4vokUQqeWPZJPrJXDQg==
X-CSE-MsgGUID: g3/5ptG1SY+tSnArBNoz1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59674416"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="59674416"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 03:47:58 -0800
X-CSE-ConnectionGUID: 8SYXcUr9So2pCiDUNHCzOQ==
X-CSE-MsgGUID: 4Jc0ms/2TNClDK0QkU9UVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="124096516"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Mar 2025 03:47:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq9hi-000N0c-0Y;
	Thu, 06 Mar 2025 11:47:54 +0000
Date: Thu, 6 Mar 2025 19:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] media: i2c: ds90ub960: Enable second i2c interface
Message-ID: <202503061904.IJrDnytx-lkp@intel.com>
References: <20250305121705.2143540-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305121705.2143540-1-y-abhilashchandra@ti.com>

Hi Yemike,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yemike-Abhilash-Chandra/media-i2c-ds90ub960-Enable-second-i2c-interface/20250305-201858
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250305121705.2143540-1-y-abhilashchandra%40ti.com
patch subject: [PATCH RFC] media: i2c: ds90ub960: Enable second i2c interface
config: sparc64-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061904.IJrDnytx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061904.IJrDnytx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061904.IJrDnytx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ds90ub960.c: In function 'ub960_init_rx_ports':
>> drivers/media/i2c/ds90ub960.c:2182:32: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
    2182 |         enabled_rxports_mask = FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv->rx_mask);
         |                                ^~~~~~~~~~


vim +/FIELD_PREP +2182 drivers/media/i2c/ds90ub960.c

  2173	
  2174	static int ub960_init_rx_ports(struct ub960_data *priv)
  2175	{
  2176		unsigned int nport;
  2177		u8 enabled_rxports_mask;
  2178		u8 enabled_rxports;
  2179		int ret;
  2180	
  2181		/* Configure i2c interface for RX ports */
> 2182		enabled_rxports_mask = FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv->rx_mask);
  2183		enabled_rxports = (priv->tx_mask & UB960_CSI_TX0)  ? 0x00 : enabled_rxports_mask;
  2184	
  2185		ret = ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, enabled_rxports_mask, enabled_rxports);
  2186		if (ret)
  2187			return ret;
  2188	
  2189		for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
  2190			struct ub960_rxport *rxport = priv->rxports[nport];
  2191	
  2192			if (!rxport)
  2193				continue;
  2194	
  2195			if (priv->hw_data->is_ub9702)
  2196				ub960_init_rx_port_ub9702(priv, rxport);
  2197			else
  2198				ub960_init_rx_port_ub960(priv, rxport);
  2199		}
  2200	
  2201		return 0;
  2202	}
  2203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
