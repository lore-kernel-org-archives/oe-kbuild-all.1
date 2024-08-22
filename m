Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DAA1531D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724313303; cv=none; b=b2dTWloo5MbhrWRTFBz4p6dIrFwIBkIuH+CUfvqm8LTwUirSY/bCN1GJyZsfkCG0pyEGJsor0lYB+QZv7Nn0yQPXH78Twf6gVFz8HW9NJGYLzSLujrgRtNl040JSOHXalMg9SY+nIegNAtZXPoaR8wNycAHnWXFvWFSlQ8XDGHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724313303; c=relaxed/simple;
	bh=ViUfJqkCgiSdclTAphoY6s/d6BvM+78Ag9hyB9sZj7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXbpxNmpe5YJUG9yhvBbj4oz7XN56ow2e+7xyHRzp6yHnF5X2J/fv7SN7oy6vYxDDIk7pgmX+byNrR3luum6bpkAisy51/lvphDb74x6KlEW+u9DgHpY8Sw0+L6j9JAUCMx4MZ4pISMj4/4UNHEKimWEp0gj3/JjD+LUuQvOXBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9bVoryG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9bVoryG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724313301; x=1755849301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ViUfJqkCgiSdclTAphoY6s/d6BvM+78Ag9hyB9sZj7w=;
  b=f9bVoryGRLWFZ5cRQYMc9fg5t1UwDp14yYldvzXCvMsVfKvupJTmUUgN
   JQXB6DDa0PcYJBx8e3S5UVJoDVbSZmszUYtjR/zS1jeEJeQHbzVFvwsWC
   nx0btmH3us7EuZAHWQtaUKbGUI/3EIV9F2DJT1Du4+VXgwDmzDByLwXaj
   4Sl5UI5bTqNHXKwhDKNitgR1ehF2CXiooomrYd5d4xw9+GuzO4H/6qnmo
   OL1PO4UrNkivABb8zy+FI5e242QGHYFNHBaBr8ILbrusV137x3nb5Gt1R
   ewmV6e2vAjCFf0eA1zhq8+KnhVWPkxkfXB3W1BNHFbKZnqeULtVslYVRx
   g==;
X-CSE-ConnectionGUID: CEewiswnQOWBosB7cKqrqg==
X-CSE-MsgGUID: OPU3G6qNR7C/IX/1ypXMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26578721"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="26578721"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 00:55:00 -0700
X-CSE-ConnectionGUID: doF4OM9ERTyaDprtUtBxJg==
X-CSE-MsgGUID: 44kQgOCfRYOHC3KNUiZtiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="61028250"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2024 00:54:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh2ek-000CYS-2L;
	Thu, 22 Aug 2024 07:54:54 +0000
Date: Thu, 22 Aug 2024 15:54:05 +0800
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
Message-ID: <202408221537.gmrL3l3n-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408221537.gmrL3l3n-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221537.gmrL3l3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221537.gmrL3l3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/aquantia/aquantia_main.c:483:5: warning: no previous prototype for 'aqr107_config_mdi' [-Wmissing-prototypes]
     483 | int aqr107_config_mdi(struct phy_device *phydev)
         |     ^~~~~~~~~~~~~~~~~


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
