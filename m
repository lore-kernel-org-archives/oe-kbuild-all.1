Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEB11537CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737657420; cv=none; b=Cp6mZk/eJ1jGJzgu3BvZxe4o6BKvuNUnycnlPZHXYyLqDN11nZvwGl4kIIU3TWjWuPN+aUYlkLwFbXTOxOzNWyHcYGNLcVm/t6JRoG818svB4IpEyI09Gx9t6OzFwqOrRgiJ5tu9mRsnEAisu4FJKFyecwj/jFijmwdZak2M3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737657420; c=relaxed/simple;
	bh=JEw+3MLmNxJWcdM0HKBJ4cmuuqcu9z7xDkegrg2/Z5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBMZyzi1FJpzvLHx9F4Q/QQnf9XyfEQA70GmB4q+eY6RHQFPR7KvwdGAQcjkFBfz5jo2/wkYLJNE3fURlpLN02k7Pl9vfQhQnk4qRLK6SHMvjDjka16gJ+MRGvvKBu9jjIbNvgzsW3iyLzSuSdosyMmAlYwVM7XsJaaRTzFmnxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j817wPGh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j817wPGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737657420; x=1769193420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JEw+3MLmNxJWcdM0HKBJ4cmuuqcu9z7xDkegrg2/Z5w=;
  b=j817wPGh9Cz4Aug8pCR1NRMScjsTUlJS6k9/F4RMKDjR6GZJJbco64nD
   LgEKqta6DVPIPZsAEidmeVGj+NVFoHktpj8eRI13M7HjId1jbI7FWdK5A
   HX5AwmaVl9sC4xLhgrU2H1cI9uT+VfFoL+JCNkUTY2OV8q6NaEOHCefdr
   nGudjIytqrzjVOT+oJd1VTlr8mcdde+/DJwQTh9eCDR4l5ALkB+/bVXJf
   nyNex4dcLO6sI4KkvE4+pvsQYIHcHwQ64R12pGc3iWXVijOKNZ7b9Ifn0
   n4m9JpHkvSUoor4DuzCTAxujzE/8h/oj97D6cB+APecgHKTc5F22Gmt6k
   w==;
X-CSE-ConnectionGUID: ZE2KmKqBT/+1EC6QDqdn7A==
X-CSE-MsgGUID: 6LB6VJ6bSS6XtpuQg8gX4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41933947"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="41933947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 10:36:59 -0800
X-CSE-ConnectionGUID: pGFDC8KPTSi1cMH+6jVeLg==
X-CSE-MsgGUID: C9TrKBJ4T5qeKQZ5ZtOGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130831793"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2025 10:36:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb24V-000bWR-36;
	Thu, 23 Jan 2025 18:36:55 +0000
Date: Fri, 24 Jan 2025 02:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v2 5/6] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <202501240204.0gVs5AgQ-lkp@intel.com>
References: <20250122174252.82730-6-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122174252.82730-6-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-common-Make-BaseT-a-4-lanes-mode/20250123-014546
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250122174252.82730-6-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next RFC v2 5/6] net: phy: dp83822: Add support for phy_port representation
config: loongarch-randconfig-002-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240204.0gVs5AgQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240204.0gVs5AgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240204.0gVs5AgQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/dp83822.c: In function 'dp83822_attach_port':
>> drivers/net/phy/dp83822.c:893:57: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     893 |                                 device_property_present(dev, "ti,link-loss-low");
         |                                                         ^~~
         |                                                         cdev
   drivers/net/phy/dp83822.c:893:57: note: each undeclared identifier is reported only once for each function it appears in


vim +893 drivers/net/phy/dp83822.c

   875	
   876	static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
   877	{
   878		struct dp83822_private *dp83822 = phydev->priv;
   879		int ret;
   880	
   881		if (port->mediums) {
   882			if (phy_port_is_fiber(port) ||
   883			    port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASEX))
   884				dp83822->fx_enabled = true;
   885		} else {
   886			ret = dp83822_read_straps(phydev);
   887			if (ret)
   888				return ret;
   889	
   890	#ifdef CONFIG_OF_MDIO
   891			if (dp83822->fx_enabled && dp83822->fx_sd_enable)
   892				dp83822->fx_signal_det_low =
 > 893					device_property_present(dev, "ti,link-loss-low");
   894			if (!dp83822->fx_enabled)
   895				dp83822->fx_enabled =
   896					device_property_present(dev, "ti,fiber-mode");
   897	#endif
   898	
   899			if (dp83822->fx_enabled) {
   900				port->lanes = 1;
   901				port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF) |
   902						BIT(ETHTOOL_LINK_MEDIUM_BASEX);
   903			} else {
   904				/* This PHY can only to 100BaseTX max, so on 2 lanes */
   905				port->lanes = 2;
   906				port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
   907			}
   908		}
   909	
   910		return 0;
   911	}
   912	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
