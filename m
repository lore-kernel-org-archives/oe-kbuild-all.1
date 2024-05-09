Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C68C10
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715274797; cv=none; b=Gp1E5W1WgZDsf/fTzQbS0Vs7BnL8oNMRtMF44ZjtiNITakczKBPJFt/Y4L8bX9OGTpwrfJS51GV94lIkrTQdzyfnpPty6LZVQrMj2QoTsNTIxlyicolSU9pvNPBuuBzI+ZKcilF5fDqz1eP4rNYYtiDZnInmuexsnzaD7T+xbKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715274797; c=relaxed/simple;
	bh=4Xl31/ORaPQbSeG3WrtZb7FXfHRyuhk7q32AktWVyOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQ206IM4X7zmyOcJUbd9vnjQQY9UicBZ+nTljHN06QJcMIZwMBOtddInRUPZ4F9NdY+iqaCypFDoCox2ixxV8eMeMN9HC3fveXV+uSPqk/UXZvDNVVDpCnyvX7vbuWW5AXVbxRhpaMVM/4umtFHS+ZbjA/5cC3tffp+eM8nraQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1ANO8fp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1ANO8fp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715274796; x=1746810796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Xl31/ORaPQbSeG3WrtZb7FXfHRyuhk7q32AktWVyOY=;
  b=a1ANO8fpEu2GkIE/iOapnBYDNbr7ghfMUrBQx6JpYXT1pWBZykvgoXz0
   +D0xbOE8cZB6G2azVUI0k9V1ew/JZaN77ig8CiWF0nYgELxiTKKH+v3gw
   HPJ80MRiu+zffNdKSYZRxi5k73NuLwk/loF2YAmXzMVI+hhDJ+YJ1N+XQ
   mo6K6sNRdun8o0XI+XZKT7obcpviey+YH39oEyvimLo+MXCs2WcXpW7co
   Jt7+rvC3IPt58IyWfrL+IkV6O/wKnf/OsxkdRFCzF6UFIk6b1iu9l8mBq
   lC+4MKPpBQLACv4rQ5M2PihQREalLFOR+akl2Oa4MO4ahLhgjY3zcwEXL
   Q==;
X-CSE-ConnectionGUID: O86NHSF+SceF+TMUQaRkgw==
X-CSE-MsgGUID: vox80fbdRv2I8hSdvFqckg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15022678"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15022678"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 10:13:15 -0700
X-CSE-ConnectionGUID: I7VdY1TkTkmTCx8yoc/tSA==
X-CSE-MsgGUID: v1sP5OD5T3G2TJ458VKZIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33842729"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 May 2024 10:13:14 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s57KR-0005AH-2b;
	Thu, 09 May 2024 17:13:11 +0000
Date: Fri, 10 May 2024 01:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [arm:zii 40/102] drivers/net/dsa/b53/b53_common.c:1484:34: error:
 initialization of 'struct ethtool_keee *' from incompatible pointer type
 'struct ethtool_eee *'
Message-ID: <202405100102.n1YFCS8g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   e9436a5c3f1e8dc9d425f51b98e96e185a20704d
commit: 7e189be0111c723d361907eecee7f5f96000b518 [40/102] net: dsa: b53: Call b53_eee_init() from b53_mac_link_up()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240510/202405100102.n1YFCS8g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100102.n1YFCS8g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100102.n1YFCS8g-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/b53/b53_common.c: In function 'b53_phylink_mac_link_up':
>> drivers/net/dsa/b53/b53_common.c:1484:34: error: initialization of 'struct ethtool_keee *' from incompatible pointer type 'struct ethtool_eee *' [-Werror=incompatible-pointer-types]
    1484 |         struct ethtool_keee *p = &dev->ports[port].eee;
         |                                  ^
>> drivers/net/dsa/b53/b53_common.c:1488:18: error: invalid use of undefined type 'struct ethtool_keee'
    1488 |                 p->eee_enabled = b53_eee_init(ds, port, phydev);
         |                  ^~
   cc1: some warnings being treated as errors


vim +1484 drivers/net/dsa/b53/b53_common.c

  1475	
  1476	static void b53_phylink_mac_link_up(struct dsa_switch *ds, int port,
  1477					    unsigned int mode,
  1478					    phy_interface_t interface,
  1479					    struct phy_device *phydev,
  1480					    int speed, int duplex,
  1481					    bool tx_pause, bool rx_pause)
  1482	{
  1483		struct b53_device *dev = ds->priv;
> 1484		struct ethtool_keee *p = &dev->ports[port].eee;
  1485	
  1486		if (mode == MLO_AN_PHY) {
  1487			/* Re-negotiate EEE if it was enabled already */
> 1488			p->eee_enabled = b53_eee_init(ds, port, phydev);
  1489			return;
  1490		}
  1491	
  1492		if (mode == MLO_AN_FIXED) {
  1493			/* Force flow control on BCM5301x's CPU port */
  1494			if (is5301x(dev) && dsa_is_cpu_port(ds, port))
  1495				tx_pause = rx_pause = true;
  1496	
  1497			b53_force_port_config(dev, port, speed, duplex,
  1498					      tx_pause, rx_pause);
  1499			b53_force_link(dev, port, true);
  1500			return;
  1501		}
  1502	
  1503		if (phy_interface_mode_is_8023z(interface) &&
  1504		    dev->ops->serdes_link_set)
  1505			dev->ops->serdes_link_set(dev, port, mode, interface, true);
  1506	}
  1507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
