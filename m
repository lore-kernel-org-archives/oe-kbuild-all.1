Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BB82741AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 04:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118593; cv=none; b=lvH8tmqxYBQ47BjwQW+Cgp1ST57gij0MiESiQmBK6oZ7J1wRS0vYmoXokbFnVOun/yeSX0YEMkXSRkql+TZET5Ausjzsuvl1B3+ZzThVVzsum/KYlTSdACoXxHuK93dVHxjBJxb94qe5TQq6JQdqAZ9LGzd8TnW99iKmvlCpMJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118593; c=relaxed/simple;
	bh=llECf9WKOVRZJexROjZ0okO194boZmTBekOvXC+2K/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhNS8fGUbV5OcEmkSq7KEhz7Y71OnDmSGDNJhiHJtafUeLv3fGC3d4D9r/v2/DjkZoyCwZfLpnq7tSPkwjzi8FqRgnGCR9a+d+Xom+duzWspCVuRJs3+6df5yEmxVOWCR5hciB7595cRvjeChG88u1fuCsRVbqQI52CUVdPPCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7dNPoTe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7dNPoTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766118592; x=1797654592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=llECf9WKOVRZJexROjZ0okO194boZmTBekOvXC+2K/A=;
  b=l7dNPoTe1B+CR89tPp9u89H0LgrXE6wJ7HJJjVjjken8Qg26AQrFxnYO
   /vvpQl600Q1rQIJJbz+NFNzniugd3Uz/6zItK2HNjIaoKaSyE9V2Tm25+
   RR1B3fSwhCdhJNZCXXZWSCZJm+0pGLDBd5mG5XMap+Rbk+8tt4Mfmjb2l
   Jp6WGdCCagWiz+NrcKowyO3jUo3XKBoKEXx0PwbyVqw0jLK8oG3z16XdK
   rUPVAMbeeLG3bzy0DwPu2CQx6bQKk1SxDBOY5MtkR8SDV8tX4Pi70kcF6
   EU0ePE4rUS+TwiHB8+UVuJisFU5ob4MuG52N71099q5C9M2AV8LM3QJ/k
   A==;
X-CSE-ConnectionGUID: rJ20aXr0Q1a0ijqGhGMQbw==
X-CSE-MsgGUID: jknoO+IOSbWFjxCChF3QRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78793295"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78793295"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 20:29:49 -0800
X-CSE-ConnectionGUID: HI9Hu3Y+Tx+5qya4SlHgUg==
X-CSE-MsgGUID: jjwgdw7hQ/KEV0b6vnNGBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229802993"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Dec 2025 20:29:48 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWS7e-0000000030N-08hW;
	Fri, 19 Dec 2025 04:29:46 +0000
Date: Fri, 19 Dec 2025 12:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 5/6] net: hibmcge: support get phy device
 from apci
Message-ID: <202512191242.SbxFVIcH-lkp@intel.com>
References: <20251215125705.1567527-6-shaojijie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215125705.1567527-6-shaojijie@huawei.com>

Hi Jijie,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jijie-Shao/net-phy-change-of_phy_leds-to-fwnode_phy_leds/20251215-211344
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251215125705.1567527-6-shaojijie%40huawei.com
patch subject: [PATCH RFC net-next 5/6] net: hibmcge: support get phy device from apci
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512191242.SbxFVIcH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191242.SbxFVIcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191242.SbxFVIcH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hibmcge/hbg_mdio.c:360:37: warning: variable 'phydev' is uninitialized when used here [-Wuninitialized]
     360 |                 return dev_err_probe(dev, PTR_ERR(phydev),
         |                                                   ^~~~~~
   drivers/net/ethernet/hisilicon/hibmcge/hbg_mdio.c:356:27: note: initialize the variable 'phydev' to silence this warning
     356 |         struct phy_device *phydev;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +/phydev +360 drivers/net/ethernet/hisilicon/hibmcge/hbg_mdio.c

   351	
   352	static int hbg_find_phy_device_from_acpi(struct hbg_priv *priv)
   353	{
   354		struct device *dev = &priv->pdev->dev;
   355		struct fwnode_handle *phy_fwnode;
   356		struct phy_device *phydev;
   357	
   358		phy_fwnode = fwnode_get_phy_node(dev_fwnode(dev));
   359		if (IS_ERR(phy_fwnode))
 > 360			return dev_err_probe(dev, PTR_ERR(phydev),
   361					     "failed to get phy fwnode\n");
   362	
   363		phydev = fwnode_phy_find_device(phy_fwnode);
   364		/* We're done with the phy_node handle */
   365		fwnode_handle_put(phy_fwnode);
   366		if (!phydev)
   367			return dev_err_probe(dev, -ENODEV,
   368					     "failed to get phy fwnode device\n");
   369		priv->mac.phydev = phydev;
   370		return 0;
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
