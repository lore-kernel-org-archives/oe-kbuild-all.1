Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF910148841
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724309520; cv=none; b=ji7Rk8YS2ng5G5TJLsuz1V+4Mb4ONwEp1EzXOcHoB276HGRjyQLe2ChjogMZB4icpnAtSnieJ8tLBxwIm6D3nZxVloKzBKCXO9K/E4uwYm24vbMBMZW2Ifk/BjUF9jayTvBSCw5XYIFEkUAhdIJRPurxIWflwJRtLdwJ1B0MO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724309520; c=relaxed/simple;
	bh=e501kEiNqiZZzJQ3GqU/FHgxQXDWv6I7kR2Zf+I0Iuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyjBNbMQ1pilwnspg55Ekk4Dzb7XBYAd77uvOAPf+kWl2nOG5PhXG0HLXX+AfPBH7LQLYIbRZCIVx8+NkoNn/a7OJF0ir/sZWAo9el8xP4GmhWkFCT/7kFN9RbBA+gyexeB0gaDnTg4Xu5QbhRFIHtN5RADmUR3jBZK02pAOSwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dt9hNf7B; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dt9hNf7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724309519; x=1755845519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e501kEiNqiZZzJQ3GqU/FHgxQXDWv6I7kR2Zf+I0Iuo=;
  b=Dt9hNf7BabVcGXMfiYf5gbH6TYjS1bbpSEXulLvNf98SmiQYQAYP+9ZJ
   8KXMbDDkSjMc951BGzbCXNZaIVpW7WSpf8EIcN5H4ohjmSgXskO2ZMAgK
   DLcj5cHcpKZKTV+sI9gYCHx3JozqVkojEQgzCCxK7uRylwtoQ1nPHh+tq
   idQzVfiE0i0J8O/7BVPYoAC0kBlwgl3OwEOmqeeusXMaRZ3nJmPY+bNVG
   kHyFhbUlEKKo2Y8a/sus4aydGiexDDEmqKMEKP36qxZlrI6JFGGy6cmZX
   8TrF6RJFFHCNlZ3DlC3Ac13TBSwwlq9fcP2vzpzx8nSnybmAGZGwPRnsL
   w==;
X-CSE-ConnectionGUID: DHUgGaZgTpK4HlFMXP8oOg==
X-CSE-MsgGUID: 7pa54r6BTbWpzFkYY8jZ2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="34087992"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="34087992"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 23:51:58 -0700
X-CSE-ConnectionGUID: ZDUJXdY4R/6A2T/GAN1RVg==
X-CSE-MsgGUID: KNPutsCyS5KvnBYqRnqL7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66227345"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2024 23:51:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh1fj-000CUG-1W;
	Thu, 22 Aug 2024 06:51:51 +0000
Date: Thu, 22 Aug 2024 14:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Chad Monroe <chad.monroe@adtran.com>,
	John Crispin <john@phrozen.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: phy: aquantia: allow forcing order of
 MDI pairs
Message-ID: <202408221406.WtGcNGxX-lkp@intel.com>
References: <ed46220cc4c52d630fc481c8148fc749242c368d.1724244281.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed46220cc4c52d630fc481c8148fc749242c368d.1724244281.git.daniel@makrotopia.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-phy-aquantia-allow-forcing-order-of-MDI-pairs/20240821-210717
base:   net-next/main
patch link:    https://lore.kernel.org/r/ed46220cc4c52d630fc481c8148fc749242c368d.1724244281.git.daniel%40makrotopia.org
patch subject: [PATCH net-next 2/2] net: phy: aquantia: allow forcing order of MDI pairs
config: x86_64-randconfig-123-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221406.WtGcNGxX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221406.WtGcNGxX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221406.WtGcNGxX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/phy/aquantia/aquantia_main.c:483:5: sparse: sparse: symbol 'aqr107_config_mdi' was not declared. Should it be static?
   drivers/net/phy/aquantia/aquantia_main.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/aqr107_config_mdi +483 drivers/net/phy/aquantia/aquantia_main.c

   482	
 > 483	int aqr107_config_mdi(struct phy_device *phydev)
   484	{
   485		struct device_node *np = phydev->mdio.dev.of_node;
   486		bool force_normal, force_reverse;
   487	
   488		force_normal = of_property_read_bool(np, "marvell,force-mdi-order-normal");
   489		force_reverse = of_property_read_bool(np, "marvell,force-mdi-order-reverse");
   490	
   491		if (force_normal && force_reverse)
   492			return -EINVAL;
   493	
   494		if (force_normal)
   495			return phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, PMAPMD_RSVD_VEND_PROV,
   496					      PMAPMD_RSVD_VEND_PROV_MDI_CONF,
   497					      PMAPMD_RSVD_VEND_PROV_MDI_FORCE);
   498	
   499		if (force_reverse)
   500			return phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, PMAPMD_RSVD_VEND_PROV,
   501					      PMAPMD_RSVD_VEND_PROV_MDI_CONF,
   502					      PMAPMD_RSVD_VEND_PROV_MDI_REVERSE |
   503					      PMAPMD_RSVD_VEND_PROV_MDI_FORCE);
   504	
   505		return 0;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
