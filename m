Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615B5916D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 23:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706311183; cv=none; b=K50xzP7ezN2iTolijSVA1Qi3I94zvvm3cRJVOOl+QhKedMp3rtJdC8hJ/Ru/aJxkCJlB+jAIPAgycqblUIOXHmMraNz7vptoiK+i6L2uWxwhR73SGQ375g2MxUM8iAVHxiFfJPgiNXM9+M7JVRFJtcymLQqpmdhAoAadQyu0LTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706311183; c=relaxed/simple;
	bh=MqCvjR27m9syM6d7msdym1g0nG/lsKGj0DkqCItT2p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NErhneFI74WYBoqusCswCH5PUlH+9/V2sEIibHmDnKG4+GnipiSjdlBh4QzuzjEdTVE9te2adIXH4m6dzSdWUZNbVswfD1mHmqenC57ygsQ6eTGOrzEGTCwAZCeUmlM8YRmGgCY2c4Q/0qnZXleySX61IlmqkpIvLi9lAIu6IoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmY4Rw5f; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmY4Rw5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706311181; x=1737847181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MqCvjR27m9syM6d7msdym1g0nG/lsKGj0DkqCItT2p4=;
  b=AmY4Rw5fz2c9Yi7C4E3LFJ1zjGAklkdAh82+oWnwJqf5urqzwOZGZD2O
   0ga+a0/4/j4inQfqcEzNnRm2fxQYXpMWxoStWbvY53Uzl1fx+E9Dmjic8
   vLniYic31ZCyIehidrNz0DmwcD4S2qMFKmS4IsX4ciaGfxBH25oc6PlLp
   FJj7pMFI7yl8t6tqtbJkf5s/WVs4czCDmfarWhftmYT1LhAn+TcmCxiZU
   u83df595Hw6GaXm8zhHC1cqhYJdvLWqLcDtn1Q0b4Cnh8xqsHuhhhqJXO
   faZGi6ByEVveMGpAiz63ROaANRLg0eeSVaPx0NcYo3BAqE0O/zZ6qLwet
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9285696"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9285696"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 15:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2719630"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Jan 2024 15:19:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTVTy-0001RK-1i;
	Fri, 26 Jan 2024 23:19:34 +0000
Date: Sat, 27 Jan 2024 07:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	alsi@bang-olufsen.dk, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, arinc.unal@arinc9.com,
	ansuelsmth@gmail.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: Re: [PATCH net-next v4 05/11] net: dsa: realtek: common rtl83xx
 module
Message-ID: <202401270719.OZMv8I26-lkp@intel.com>
References: <20240123215606.26716-6-luizluca@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123215606.26716-6-luizluca@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Angelo-Daros-de-Luca/net-dsa-realtek-drop-cleanup-from-realtek_ops/20240124-060710
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240123215606.26716-6-luizluca%40gmail.com
patch subject: [PATCH net-next v4 05/11] net: dsa: realtek: common rtl83xx module
config: i386-randconfig-004-20240127 (https://download.01.org/0day-ci/archive/20240127/202401270719.OZMv8I26-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270719.OZMv8I26-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270719.OZMv8I26-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/realtek/rtl83xx.c:189: warning: Function parameter or struct member 'priv' not described in 'rtl83xx_remove'
>> drivers/net/dsa/realtek/rtl83xx.c:189: warning: Excess function parameter 'ctx' description in 'rtl83xx_remove'


vim +189 drivers/net/dsa/realtek/rtl83xx.c

   177	
   178	/**
   179	 * rtl83xx_remove() - Cleanup a realtek switch driver
   180	 * @ctx: realtek_priv pointer
   181	 *
   182	 * If a method is provided, this function asserts the hard reset of the switch
   183	 * in order to avoid leaking traffic when the driver is gone.
   184	 *
   185	 * Context: Any context.
   186	 * Return: nothing
   187	 */
   188	void rtl83xx_remove(struct realtek_priv *priv)
 > 189	{
   190		if (!priv)
   191			return;
   192	
   193		/* leave the device reset asserted */
   194		if (priv->reset)
   195			gpiod_set_value(priv->reset, 1);
   196	}
   197	EXPORT_SYMBOL_NS_GPL(rtl83xx_remove, REALTEK_DSA);
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
