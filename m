Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286E03D1CC0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 22:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769119953; cv=none; b=gUVrvv7fMhFPfTc/0gIeGIjlOPZwfxWRjvfPyYf2LRQuie1j+uzxJkX9e+TRIHBJn8ky62k7Rk+BZv7eNk+9tnWCi8UyGdTEyyrFh09LrLlk5l5Ne0hWSD9eKZqUz4lMdgss+Vt3zEETznRilN6gNyJJXbtrVcBBEvH0ARki/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769119953; c=relaxed/simple;
	bh=fbAxZ8+4E0E6YP5OYQFpZpSY13OcTcToB8nH0fiQdIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQvbI0EQPiOyz0OD5Bweocv4ew9QtdJa3qiSVjT+u8BDtN5Ke49HVDF46ZjpEURcSDfpMA9hQbFNap4yr3JtDmAlKb5XODMUbVD8E8xir9Nxwc801M8yegRTq2+UEAs5b7YCLpk3Qdqfb0f4mHtVZ7ONZq1w/VB5a5ADu1H32As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LN3uXHsp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LN3uXHsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769119949; x=1800655949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fbAxZ8+4E0E6YP5OYQFpZpSY13OcTcToB8nH0fiQdIE=;
  b=LN3uXHsp8VSA+iHh+67sSbHU31TEYapMMx0g0sp6x4YARe507E385daY
   SjDz7W9qT0iSgKQGoy+eikgG/lISVsNsKLqdaUBEpc7l/2z68vGUcFRIv
   yOdVDTqa4p9Y0uwxz9IKnkTjERf2mPZx/AE0paxKnncAVX6PTDYWrr+1x
   GbzTX5HYE2u3WSOw0ij7U5P6b5RSA6J6n7zQBANXQa26JZp80TTxQOq86
   OFvVfxpXzUtGyoy3K9qbduY0g+2R17bM8eBfzNRc8QhwCsKjiLxXioMgn
   FNQPY9j2sWLxO4EzeGAAYEh1eAan75LjcrpmuYWavawNu2JJlB5hJ5InJ
   A==;
X-CSE-ConnectionGUID: cMNf5gDwTTq1RCYxhIrBYA==
X-CSE-MsgGUID: CQnAM46xR62/BMvVKXxduw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="93037576"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="93037576"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 14:12:25 -0800
X-CSE-ConnectionGUID: Rz737VhmTIG3jaDZk0URgA==
X-CSE-MsgGUID: lQbcgB2oSc+fw2btgDSC4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206900739"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jan 2026 14:12:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj2uZ-00000000THW-2Cx9;
	Thu, 22 Jan 2026 22:12:19 +0000
Date: Fri, 23 Jan 2026 06:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Dejean <dam.dejean@gmail.com>, andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, hkallweit1@gmail.com,
	Damien Dejean <dam.dejean@gmail.com>
Subject: Re: [PATCH v2 4/4] net: phy: realtek: add RTL8224 polarity support
Message-ID: <202601230608.52Hf4Qza-lkp@intel.com>
References: <20260121151506.813783-4-dam.dejean@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121151506.813783-4-dam.dejean@gmail.com>

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 983d014aafb14ee5e4915465bf8948e8f3a723b5]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Dejean/net-phy-realtek-add-RTL8224-pair-order-support/20260122-000009
base:   983d014aafb14ee5e4915465bf8948e8f3a723b5
patch link:    https://lore.kernel.org/r/20260121151506.813783-4-dam.dejean%40gmail.com
patch subject: [PATCH v2 4/4] net: phy: realtek: add RTL8224 polarity support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260123/202601230608.52Hf4Qza-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230608.52Hf4Qza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230608.52Hf4Qza-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'rtl8224_mdi_config_polarity',
       inlined from 'rtl8224_config_init' at drivers/net/phy/realtek/realtek_main.c:1761:9:
>> drivers/net/phy/realtek/realtek_main.c:1739:12: warning: 'polarity' is used uninitialized [-Wuninitialized]
    1739 |         if (polarity & ~0xf)
         |            ^
   drivers/net/phy/realtek/realtek_main.c:1727:13: note: 'polarity' was declared here
    1727 |         u32 polarity, val;
         |             ^~~~~~~~


vim +/polarity +1739 drivers/net/phy/realtek/realtek_main.c

  1722	
  1723	static int rtl8224_mdi_config_polarity(struct phy_device *phydev)
  1724	{
  1725		struct device_node *np = phydev->mdio.dev.of_node;
  1726		u8 port_offset = phydev->mdio.addr & 3;
  1727		u32 polarity, val;
  1728		int ret;
  1729	
  1730		ret = of_property_read_u32(np, "realtek,mdi-cfg-polarity", &polarity);
  1731	
  1732		/* Do nothing if the property is not present */
  1733		if (ret == -EINVAL)
  1734			return 0;
  1735	
  1736		if (!ret)
  1737			return ret;
  1738	
> 1739		if (polarity & ~0xf)
  1740			return -EINVAL;
  1741	
  1742		val = __phy_package_read_mmd(phydev, 0, MDIO_MMD_VEND1,
  1743					     RTL8224_VND1_MDI_POLARITY_SWAP);
  1744		if (val < 0)
  1745			return val;
  1746	
  1747		val &= ~(0xf << port_offset);
  1748		val |= polarity << port_offset;
  1749		return __phy_package_write_mmd(phydev, 0, MDIO_MMD_VEND1,
  1750					       RTL8224_VND1_MDI_POLARITY_SWAP, val);
  1751	}
  1752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
