Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC0357A30
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768368212; cv=none; b=FM9VkAcF9e20GpYy6+BgVGC7XQ2jPtY4xhGS5FnccJEoDEWfpA1qlpvX6WMap4W8UckYXKShIwwIqlIacOXiFYPd+0WZJroLRW5Mh4d1/CVWQb/1b46i7IJsnk7x/8tvn9/pYTqkBwLVve+fsldAHOA5xmQP1vspkfDLEgt99x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768368212; c=relaxed/simple;
	bh=exscDrQBijEWZahSnKCG6tvpn9zzohNCW8vqS9AiyLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUw0fmjxLAiB6dEG7sHdcT6IPuArpPvOTgTbuCBsF3GRYrTdMLd0sndE+D+WOc2QN60EWgH3ZlNpdWGehvEFTH4LYucQhdYF47DfyjXpKQixlZ1kJDzlP8IdZnllGUt0jk39swu+tsPLO6qRC0ahjb0aMqTXWe3AOTaJvhExVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoSzz4mI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoSzz4mI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768368201; x=1799904201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=exscDrQBijEWZahSnKCG6tvpn9zzohNCW8vqS9AiyLE=;
  b=hoSzz4mIq/HswtAZWqVj7uP/P8BqskkZI4fRl6z9E/hqwoRfd88h7kHm
   BJyr28eNEypjPtU3SBB3NM3svRhGAETfr4QvFxrgeHo94wkuOPI7MhdYa
   J45xnaJfSChg1LEwBumdxVb/M9eoOwc0+EHzx+2mK526Y/NwqQvJgmvE5
   S7X//yGZq8yoBdJbdIF1RtyRrKaO3JCtUf6a195H23nomcjTIzY1eWCAt
   cSPXSRsmU874gNCaCHsyFaRcNvxPsM27kq727ry4/d7tBXKFBKNbhQ38U
   uE5gfW7BDFqun3sOz5nFlZ5nAr+6WaIH+MvPDjgFyUXgQa9BB6PQxI6qa
   A==;
X-CSE-ConnectionGUID: jrF+HZrNQ4qZIuXdMSRMIA==
X-CSE-MsgGUID: D8oDvS5wQNu+/HIO8s8n/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68869334"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="68869334"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 21:23:17 -0800
X-CSE-ConnectionGUID: rRAXIfHfQqaQFNNCsLSKXQ==
X-CSE-MsgGUID: 6ySEXT8OQVKt93Xlh7rZpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204600133"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jan 2026 21:23:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vftLa-00000000FqW-0WmN;
	Wed, 14 Jan 2026 05:23:10 +0000
Date: Wed, 14 Jan 2026 13:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jijie Shao <shaojijie@huawei.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: oe-kbuild-all@lists.linux.dev, shenjian15@huawei.com,
	liuyonglong@huawei.com, chenhao418@huawei.com,
	huangdonghua3@h-partners.com, yangshuaisong@h-partners.com,
	lantao5@huawei.com, jonathan.cameron@huawei.com,
	salil.mehta@huawei.com, shiyongbang@huawei.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	shaojijie@huawei.com
Subject: Re: [PATCH net-next] net: phy: change of_phy_leds() to
 fwnode_phy_leds()
Message-ID: <202601141349.H2uawAfe-lkp@intel.com>
References: <20260108073405.3036482-1-shaojijie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108073405.3036482-1-shaojijie@huawei.com>

Hi Jijie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jijie-Shao/net-phy-change-of_phy_leds-to-fwnode_phy_leds/20260108-153742
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260108073405.3036482-1-shaojijie%40huawei.com
patch subject: [PATCH net-next] net: phy: change of_phy_leds() to fwnode_phy_leds()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260114/202601141349.H2uawAfe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141349.H2uawAfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141349.H2uawAfe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/phy_device.c: In function 'fwnode_phy_leds':
>> drivers/net/phy/phy_device.c:3291:38: warning: unused variable 'led' [-Wunused-variable]
    3291 |         struct fwnode_handle *leds, *led;
         |                                      ^~~


vim +/led +3291 drivers/net/phy/phy_device.c

  3287	
  3288	static int fwnode_phy_leds(struct phy_device *phydev)
  3289	{
  3290		struct fwnode_handle *fwnode = dev_fwnode(&phydev->mdio.dev);
> 3291		struct fwnode_handle *leds, *led;
  3292		int err;
  3293	
  3294		if (!fwnode)
  3295			return 0;
  3296	
  3297		leds = fwnode_get_named_child_node(fwnode, "leds");
  3298		if (!leds)
  3299			return 0;
  3300	
  3301		/* Check if the PHY driver have at least an OP to
  3302		 * set the LEDs.
  3303		 */
  3304		if (!(phydev->drv->led_brightness_set ||
  3305		      phydev->drv->led_blink_set ||
  3306		      phydev->drv->led_hw_control_set)) {
  3307			phydev_dbg(phydev, "ignoring leds node defined with no PHY driver support\n");
  3308			goto exit;
  3309		}
  3310	
  3311		fwnode_for_each_available_child_node_scoped(leds, led) {
  3312			err = fwnode_phy_led(phydev, led);
  3313			if (err) {
  3314				fwnode_handle_put(leds);
  3315				phy_leds_unregister(phydev);
  3316				return err;
  3317			}
  3318		}
  3319	
  3320	exit:
  3321		fwnode_handle_put(leds);
  3322		return 0;
  3323	}
  3324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
