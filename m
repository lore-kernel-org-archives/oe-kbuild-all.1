Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7BF145B26
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 21:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723931516; cv=none; b=K1f6f24G537SmKezVzSsOMf8N++wrHQbs//ZUPVmp5EzYxWVoyvPilDnDQJ/RHNgSl+alXxJMGkNQFXY6vr1kasTpKcZj1NMpEbbIeZmf8txY6+Al+IyK0YQDfv9XxEyIVe/EsNasK23hs85Ak9ApjtNzTRRzygub2mgKjzKugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723931516; c=relaxed/simple;
	bh=+NbQPD8ww2gtMF/490HUTShdOG/sY02BI4y/baLQvsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRIBsSecfdcTys3FtkMwcpTf0ZxMV+VUoe6Zx6FAvZxf5XOyWb7L1UGjb7dRH+jBjGZqXKxj7UlPcuOCrXf+Zv1BuvUS/oWSdRt1gi6d7faeAkXQN/r1WdC9UVcpykut2eqYJUl0IKp56Rf4Y1autCTgura6aflH3k0XVA6+QVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqd0VB8o; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqd0VB8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723931514; x=1755467514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+NbQPD8ww2gtMF/490HUTShdOG/sY02BI4y/baLQvsc=;
  b=fqd0VB8oHTKBtQSKErzv5UYptxaas2aIakLK17SMIV3UI7CRKIkjWme+
   qVbtrIRPTh8xilpA74EhLMr1LcMBPmsq+XrlfmdtuAo8v7PpultO7wrOn
   kKslX5Ze+cIWhTbAk5TeHei8sSqDwP2mQYrgjmMjWQXwvZfKV28A6AvCR
   Hvzz+DVXLjeYiIZ54cN2PLrlMrGuewBITeRsQthv5kOIZyKV6PEB0qEDe
   p4HhChVGYXpMCSEJDMun1wUF7Pg4yeBQ/CMUCrQD9YNTSgWuDss0yeY9N
   8opjvqWqIx/PXRrU0dzH1Uu+eNNqUD+Gv/+lej2PeyhV9h5/pHC+wUUA0
   g==;
X-CSE-ConnectionGUID: Nph8p2ItTIasd28sp5vk8Q==
X-CSE-MsgGUID: I7UDynGTQPuX/x4r0IcqcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32833276"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="32833276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 14:51:54 -0700
X-CSE-ConnectionGUID: ksCXAUzlQ5Cpa0zTgM+OBg==
X-CSE-MsgGUID: nhM65I0HSBquaYEncVhyZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="60007285"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2024 14:51:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfRKx-0007pq-0G;
	Sat, 17 Aug 2024 21:51:51 +0000
Date: Sun, 18 Aug 2024 05:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net] net: phy: fix may not suspend when phy has WoL
Message-ID: <202408180500.8KltRAST-lkp@intel.com>
References: <20240815110907.609-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815110907.609-1-guanwentao@uniontech.com>

Hi Wentao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Guan/net-phy-fix-may-not-suspend-when-phy-has-WoL/20240815-191124
base:   net/main
patch link:    https://lore.kernel.org/r/20240815110907.609-1-guanwentao%40uniontech.com
patch subject: [RFC net] net: phy: fix may not suspend when phy has WoL
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240818/202408180500.8KltRAST-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180500.8KltRAST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180500.8KltRAST-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/net/phy/phy_device.c:12:
   drivers/net/phy/phy_device.c: In function 'mdio_bus_phy_may_suspend':
>> drivers/net/phy/phy_device.c:310:27: error: 'dev' undeclared (first use in this function); did you mean 'drv'?
     310 |                 dev_info(&dev->dev, "phy wol enabled,cannot suspend\n");
         |                           ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/net/phy/phy_device.c:310:17: note: in expansion of macro 'dev_info'
     310 |                 dev_info(&dev->dev, "phy wol enabled,cannot suspend\n");
         |                 ^~~~~~~~
   drivers/net/phy/phy_device.c:310:27: note: each undeclared identifier is reported only once for each function it appears in
     310 |                 dev_info(&dev->dev, "phy wol enabled,cannot suspend\n");
         |                           ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/net/phy/phy_device.c:310:17: note: in expansion of macro 'dev_info'
     310 |                 dev_info(&dev->dev, "phy wol enabled,cannot suspend\n");
         |                 ^~~~~~~~


vim +310 drivers/net/phy/phy_device.c

   281	
   282	static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
   283	{
   284		struct device_driver *drv = phydev->mdio.dev.driver;
   285		struct phy_driver *phydrv = to_phy_driver(drv);
   286		struct net_device *netdev = phydev->attached_dev;
   287	
   288		if (!drv || !phydrv->suspend)
   289			return false;
   290	
   291		/* PHY not attached? May suspend if the PHY has not already been
   292		 * suspended as part of a prior call to phy_disconnect() ->
   293		 * phy_detach() -> phy_suspend() because the parent netdev might be the
   294		 * MDIO bus driver and clock gated at this point.
   295		 */
   296		if (!netdev)
   297			goto out;
   298	
   299		if (netdev->ethtool->wol_enabled)
   300			return false;
   301	
   302		/* Ethernet and phy device wol state may not same, netdev->wol_enabled
   303		 * disabled,and phydev set wol_enabled enabled, so netdev->wol_enabled
   304		 * is not enough, so check phydev->wol_enabled.
   305		 */
   306		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
   307	
   308		phy_ethtool_get_wol(phydev, &wol);
   309		if (wol.wolopts) {
 > 310			dev_info(&dev->dev, "phy wol enabled,cannot suspend\n");
   311			return false;
   312		}
   313	
   314		/* As long as not all affected network drivers support the
   315		 * wol_enabled flag, let's check for hints that WoL is enabled.
   316		 * Don't suspend PHY if the attached netdev parent may wake up.
   317		 * The parent may point to a PCI device, as in tg3 driver.
   318		 */
   319		if (netdev->dev.parent && device_may_wakeup(netdev->dev.parent))
   320			return false;
   321	
   322		/* Also don't suspend PHY if the netdev itself may wakeup. This
   323		 * is the case for devices w/o underlaying pwr. mgmt. aware bus,
   324		 * e.g. SoC devices.
   325		 */
   326		if (device_may_wakeup(&netdev->dev))
   327			return false;
   328	
   329	out:
   330		return !phydev->suspended;
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
