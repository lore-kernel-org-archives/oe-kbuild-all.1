Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB38185D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 04:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677816411; x=1709352411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JFnok9TXQHjct/eaLUAh5ucV3QS8JwjW54Dm8pnyvJQ=;
  b=k9UUMnC+7OTuxVLzrpdyctXlZiENWMHi6IL3vdyBgHWhnVcRjj8i3QOp
   rG2643h8h2GtxX5GcMTZHYFpV+bWAsogn5bD1CQGCdCyuMgr3+IpTuAea
   9+k/YJUULQJzmQGd+PIVrLfJAJbGqMbrlHjolPwIDg/qj9MYG8IfcS9s3
   iupB6muj+tHBOBM7K4IxpJGJGymLZxlnjvfgu4zv1PPo6pmmHN95vT3nW
   LEslRymAChykxn6bBXA1OiGo1+wJrHkEu/GAMSx9gbUauNQIdfT9Vfmv8
   WoeICQwDVreOtPf+PoGoN+m6QEFa3GodEnDMUf/P8SX8VShduF65roTOL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="399756790"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="399756790"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 20:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="920966366"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="920966366"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2023 20:06:49 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXwgy-0001BH-2p;
	Fri, 03 Mar 2023 04:06:48 +0000
Date: Fri, 3 Mar 2023 12:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next] net: phy: intel-xway: remove LED
 configuration
Message-ID: <202303031136.GXeZqF30-lkp@intel.com>
References: <20230302141651.377261-1-michael@walle.cc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302141651.377261-1-michael@walle.cc>

Hi Michael,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Walle/net-phy-intel-xway-remove-LED-configuration/20230302-222034
patch link:    https://lore.kernel.org/r/20230302141651.377261-1-michael%40walle.cc
patch subject: [PATCH RFC net-next] net: phy: intel-xway: remove LED configuration
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303031136.GXeZqF30-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/689386222eb79ab10b990a46e1b67a89dc32022d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Walle/net-phy-intel-xway-remove-LED-configuration/20230302-222034
        git checkout 689386222eb79ab10b990a46e1b67a89dc32022d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031136.GXeZqF30-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/intel-xway.c: In function 'xway_gphy_config_init':
>> drivers/net/phy/intel-xway.c:120:13: warning: unused variable 'ledxl' [-Wunused-variable]
     120 |         u32 ledxl;
         |             ^~~~~
>> drivers/net/phy/intel-xway.c:119:13: warning: unused variable 'ledxh' [-Wunused-variable]
     119 |         u32 ledxh;
         |             ^~~~~


vim +/ledxl +120 drivers/net/phy/intel-xway.c

be393dd685d215d Martin Schiller 2021-07-20  115  
112b558d025712c Hauke Mehrtens  2016-06-05  116  static int xway_gphy_config_init(struct phy_device *phydev)
112b558d025712c Hauke Mehrtens  2016-06-05  117  {
112b558d025712c Hauke Mehrtens  2016-06-05  118  	int err;
112b558d025712c Hauke Mehrtens  2016-06-05 @119  	u32 ledxh;
112b558d025712c Hauke Mehrtens  2016-06-05 @120  	u32 ledxl;
112b558d025712c Hauke Mehrtens  2016-06-05  121  
112b558d025712c Hauke Mehrtens  2016-06-05  122  	/* Mask all interrupts */
112b558d025712c Hauke Mehrtens  2016-06-05  123  	err = phy_write(phydev, XWAY_MDIO_IMASK, 0);
112b558d025712c Hauke Mehrtens  2016-06-05  124  	if (err)
112b558d025712c Hauke Mehrtens  2016-06-05  125  		return err;
112b558d025712c Hauke Mehrtens  2016-06-05  126  
112b558d025712c Hauke Mehrtens  2016-06-05  127  	/* Clear all pending interrupts */
112b558d025712c Hauke Mehrtens  2016-06-05  128  	phy_read(phydev, XWAY_MDIO_ISTAT);
112b558d025712c Hauke Mehrtens  2016-06-05  129  
be393dd685d215d Martin Schiller 2021-07-20  130  	err = xway_gphy_rgmii_init(phydev);
be393dd685d215d Martin Schiller 2021-07-20  131  	if (err)
be393dd685d215d Martin Schiller 2021-07-20  132  		return err;
be393dd685d215d Martin Schiller 2021-07-20  133  
112b558d025712c Hauke Mehrtens  2016-06-05  134  	return 0;
112b558d025712c Hauke Mehrtens  2016-06-05  135  }
112b558d025712c Hauke Mehrtens  2016-06-05  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
