Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90E41E766D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730834150; cv=none; b=LuedOTwkmYVhPF9b3oBWHFgAa6HhyYwZZ6pLiZ5BGZl4nh+s9FDEOLZ8OkoDyda/owrER8x9m7W0thHPEZTzwzxdVi89WSfmCL8aE2lgMvQsKQWfit1IdKSYhy1Deg8LIn3vK5DcjWcrP8fqMfRkMkVwpnIAQXmTsD5fI/a3I6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730834150; c=relaxed/simple;
	bh=9Shq7F5zshytH1TIeEjlYPA2wyJYy7tpdhCPane9pqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWBeu9uQKawyyWunYb+BFIGThoTen+iWn7HDPAuJWLw0TQqPwG64rbIVtadl7C4I8e0CbRNchgw0LfmWg3BDwERY2KWFRba9Njf5jKzdCptdE8F5IGib9ocrz5KFKHJA4L8u8Wo3X8IBU6pgd0h0WR3IXUvO0iZD6Gb7GFu1pZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WryrFrYX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WryrFrYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730834148; x=1762370148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Shq7F5zshytH1TIeEjlYPA2wyJYy7tpdhCPane9pqc=;
  b=WryrFrYX8fCMtpDIeMS33iCYyJoWPUY2FvXHKnGTZ7kcGd2saPq2v159
   IN5SjdwOxT7wR+HJWh/dm8EON+iEvwVttHsgE6Aj3ysrxJVLsmwiqP5IC
   PO/eO/sNTmq6EAwqWuJ3SNbEGdVpz8n15tX7MY5wT8ia1qG62ww4jluQP
   ThwAVccvCJ+JkWUJMXp7cfJId9pIdm9Z0Rqlvh1qFl6EJgAo2ffwSjtI7
   t3xwvZ1w26eFsOLC2OpVa2DJ+UnTG203BV78+XpZtfveBBwxoM4z3fECB
   4/UOPnIrHsm3AD8YwWpKc46Rhgt3B0Ckd7qi73KXn8dE8FCi1rEDbLKgU
   g==;
X-CSE-ConnectionGUID: ZD+xMdDmS+Oos1C7fEl9pQ==
X-CSE-MsgGUID: KF5YWsKjSYyvxgvjsfov5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42001995"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="42001995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 11:15:47 -0800
X-CSE-ConnectionGUID: wR4K5R08S7SJ1rmt0i2Ouw==
X-CSE-MsgGUID: ktw9GgY6Tl2VnQ74Ya5blg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84248501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2024 11:15:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8P1h-000mNN-2I;
	Tue, 05 Nov 2024 19:15:41 +0000
Date: Wed, 6 Nov 2024 03:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quentin.schulz@cherry.de,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	heiko@sntech.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/2] phy: rockchip: Add Samsung CSI/DSI Combo DCPHY
 driver
Message-ID: <202411060336.yBL7jGAs-lkp@intel.com>
References: <20241104111121.99274-3-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104111121.99274-3-heiko@sntech.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next linus/master v6.12-rc6 next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/dt-bindings-phy-Add-Rockchip-MIPI-CSI-DSI-PHY-schema/20241104-193646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241104111121.99274-3-heiko%40sntech.de
patch subject: [PATCH v2 2/2] phy: rockchip: Add Samsung CSI/DSI Combo DCPHY driver
config: m68k-randconfig-r113-20241105 (https://download.01.org/0day-ci/archive/20241106/202411060336.yBL7jGAs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241106/202411060336.yBL7jGAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060336.yBL7jGAs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:1630:34: warning: 'samsung_mipi_dcphy_of_match' defined but not used [-Wunused-const-variable=]
    1630 | static const struct of_device_id samsung_mipi_dcphy_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/samsung_mipi_dcphy_of_match +1630 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

  1629	
> 1630	static const struct of_device_id samsung_mipi_dcphy_of_match[] = {
  1631		{
  1632			.compatible = "rockchip,rk3576-mipi-dcphy",
  1633			.data = &rk3576_samsung_mipi_dcphy_plat_data,
  1634		}, {
  1635			.compatible = "rockchip,rk3588-mipi-dcphy",
  1636			.data = &rk3588_samsung_mipi_dcphy_plat_data,
  1637		},
  1638		{ /* sentinel */ }
  1639	};
  1640	MODULE_DEVICE_TABLE(of, samsung_mipi_dcphy_of_match);
  1641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
