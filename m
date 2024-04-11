Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212E6143C62
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826860; cv=none; b=IF96XeTxqOLNbB1l/U70quDrAiKaadRnvCNgyob/I3n3hfsJaUMuYXlCX+MrNw5ruEHM29ZwIcZIVbVx89yrnU2yJkM/f7TY6V1aB+rdFjDn+rMoXjRqnPkM77flUrR+GzyOJ+oZpnI81Y+Dpz9F2/NXDczxzGXtuIfYo65+8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826860; c=relaxed/simple;
	bh=ReFZj0y56LkV62jOhIEvIkft0yg7N1pEY9xEsRBqvEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SmJ5whh7eEEJcjadFKIGsXxmRXeZZtYq6SPTWPTAL1PhXbJuH7j7bg6rSk9eOqIju/KcUFgxwe1ByK4mnLYZ687MrLnBMnOyoFmV5WBSJBxPdL0vRlsk/AAaGpmE+VPfej9f34wG68i2xvtzYKZqf3LJUmR63EdntN6t2XDEDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xn6Wghs1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xn6Wghs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712826859; x=1744362859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ReFZj0y56LkV62jOhIEvIkft0yg7N1pEY9xEsRBqvEk=;
  b=Xn6Wghs16VjznneVNj7OtHyJ3q5ViwB+kkqmh91mJ+5h6yAJo9s6b99U
   Ypjcm/6N4b4uuZFIg/OQxJs9BjqfgPg/MtKhOzEig5yg0lpmPcBqtiyi1
   1XwnviR5YuPIxVEAjyR0NcnQuX6dPel0g0OJaMKDQmJxkMMVRkj0+5VTR
   W5l56dcX8H2YbwXDVT4PI3TN2urZ/VKRUYGmnHDyVaccoZDtScQteGB1t
   slMyRauenHiMqjn33NwWVKHyi7WJB1NNggKP5QAV4qgR0f9oS/3xrgZ+z
   GOf/LxZtSzLBwJ7rtqs6VvksO8KAjv55aWEPGMVWhCF/K+hchVBazgFBv
   w==;
X-CSE-ConnectionGUID: d/iDvuoTTMe7+JI2zyUeDw==
X-CSE-MsgGUID: GkzuLEFYTGW0UvtgJOQjWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11187508"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="11187508"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:14:18 -0700
X-CSE-ConnectionGUID: iZQtsfpfQUmpvKZCD8GuNw==
X-CSE-MsgGUID: mJ00BD6eQRCNx+yQuPaxZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20803519"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2024 02:14:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruqVb-0008SN-0P;
	Thu, 11 Apr 2024 09:14:15 +0000
Date: Thu, 11 Apr 2024 17:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 16160/18110]
 drivers/net/phy/phylink.c:701:undefined reference to `linkmode_support_c73'
Message-ID: <202404111755.HrpGSK1l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   2bfda7392e6621dd9060f87d7f9d601bb1906dbf
commit: 437a7c67817908bf02b57f1259af2933ef9891e4 [16160/18110] net: phylink: add support for managed = "c73"
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111755.HrpGSK1l-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111755.HrpGSK1l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111755.HrpGSK1l-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_validate_c73':
>> drivers/net/phy/phylink.c:701:(.text+0x3928): undefined reference to `linkmode_support_c73'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_mode':
   drivers/net/phy/phylink.c:1016:(.text+0x3fc8): undefined reference to `linkmode_support_c73'


vim +701 drivers/net/phy/phylink.c

   684	
   685	/* Validation of C73 link modes should not depend on state->interface, because
   686	 * that is an output of the C73 autonegotiation process, so it cannot be used
   687	 * as an input in establishing what should be advertised. Use pcs_validate() to
   688	 * give us the core set of link modes, and mask out those modes that aren't
   689	 * supported by mac_capabilities assuming no rate matching.
   690	 */
   691	static void phylink_validate_c73(unsigned long *supported,
   692					 struct phylink_link_state *state,
   693					 unsigned long mac_capabilities)
   694	{
   695		__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
   696	
   697		phylink_set_port_modes(mask);
   698		phylink_set(mask, Autoneg);
   699		phylink_set(mask, Asym_Pause);
   700		phylink_set(mask, Pause);
 > 701		linkmode_support_c73(mask);
   702	
   703		phylink_caps_to_linkmodes(mask, mac_capabilities);
   704	
   705		linkmode_and(supported, supported, mask);
   706		linkmode_and(state->advertising, state->advertising, mask);
   707	}
   708	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
