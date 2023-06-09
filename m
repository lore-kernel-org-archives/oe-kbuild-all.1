Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C4118C0E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 17:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686332560; x=1717868560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZhvyhY5ypOlEVBupYOcCFTUj7puf+ZcAgPGUDWw6i5M=;
  b=hd0/0Wovl6FSDA7vn8R4Vlw4hnuWwpamcC0fUg6pgIn0oYszHwEiS7Fj
   iy0kXfG0BQ5aUyBfhBvu7ejhxg7FkRLnO9zr56u+Ljadl19rKi04aUZcU
   r9r+Jfu7A84Rn5e06DaZP1D7UUSSmRLeHQNVZIy71lfjOGaEo2bMXYXXd
   +4yFJZMyV7qQdk8RHcxqdAmEivMVeqYK0QwiXkenpGq7IoVX7T03ugyTL
   x0Id3B68eaLWeSoYlZdpTvObZdAea9OjeHqzhADYQT5E6wsGLe/XlCIwm
   MBT8DNLyTfSxA9fKIHf/yMUwp9lhkRekz8vp8ubrdtB5DVM1IfLKmHD7t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="347299504"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="347299504"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 10:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="713593836"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="713593836"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Jun 2023 10:42:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7g8D-0009GO-2V;
	Fri, 09 Jun 2023 17:42:37 +0000
Date: Sat, 10 Jun 2023 01:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/3] net: phy: realtek: Disable clock on suspend
Message-ID: <202306100152.2hG4J7Ds-lkp@intel.com>
References: <20230605154010.49611-4-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605154010.49611-4-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on net/main linus/master v6.4-rc5]
[cannot apply to net-next/main next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/net-phy-realtek-Add-optional-external-PHY-clock/20230605-234223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230605154010.49611-4-detlev.casanova%40collabora.com
patch subject: [PATCH v4 3/3] net: phy: realtek: Disable clock on suspend
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230610/202306100152.2hG4J7Ds-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch robh for-next
        git checkout robh/for-next
        b4 shazam https://lore.kernel.org/r/20230605154010.49611-4-detlev.casanova@collabora.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100152.2hG4J7Ds-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/realtek.c: In function 'rtl821x_suspend':
>> drivers/net/phy/realtek.c:434:22: error: 'struct phy_device' has no member named 'wol_enabled'; did you mean 'eee_enabled'?
     434 |         if (!phydev->wol_enabled) {
         |                      ^~~~~~~~~~~
         |                      eee_enabled
   drivers/net/phy/realtek.c: In function 'rtl821x_resume':
   drivers/net/phy/realtek.c:451:22: error: 'struct phy_device' has no member named 'wol_enabled'; did you mean 'eee_enabled'?
     451 |         if (!phydev->wol_enabled)
         |                      ^~~~~~~~~~~
         |                      eee_enabled
   drivers/net/phy/realtek.c: At top level:
>> drivers/net/phy/realtek.c:962:35: error: 'PHY_ALWAYS_CALL_SUSPEND' undeclared here (not in a function)
     962 |                 .flags          = PHY_ALWAYS_CALL_SUSPEND,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~


vim +434 drivers/net/phy/realtek.c

   428	
   429	static int rtl821x_suspend(struct phy_device *phydev)
   430	{
   431		struct rtl821x_priv *priv = phydev->priv;
   432		int ret = 0;
   433	
 > 434		if (!phydev->wol_enabled) {
   435			ret = genphy_suspend(phydev);
   436	
   437			if (ret)
   438				return ret;
   439	
   440			clk_disable_unprepare(priv->clk);
   441		}
   442	
   443		return ret;
   444	}
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
