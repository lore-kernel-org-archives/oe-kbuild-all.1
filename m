Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D079C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 20:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679950589; x=1711486589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8FoG2zlo8XMO3jMkzveJbjSudevqK3Rh+zQ5Gvd7jfE=;
  b=l1JJqugRIGgXkJd5gK9vqoTrXW4dyf49fUG1G49ek6PSYmJOUWB092ZP
   qBqf6RcUin21a2Mtjc537NhQJ3NbNTeVVd0cXGfTR5sM4ZPZtZYfSCFC7
   2slcPDFMEtZpnfikkej+mbrK5GrsM/3LCgc9O9ihm1RaA6dTHiC0LCWwI
   Foi9fYVJXfzkaN0mHhCfegtQivFz7cQ0/3H9NjLbu3e5gZP2fnxI1skiz
   wJ3RFmtbjoB6+Mgnhc4iB0fvde/bVFotDouFGi1KOzSw0/L7/tU95dpi4
   gN+O8sVqWg2rcVwXL1M8x7PPE4JJSh8YFmdiJuqCsvKU+1M/91chCPp1E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="405316427"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="405316427"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="857794857"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="857794857"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Mar 2023 13:56:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgttD-000I0l-2K;
	Mon, 27 Mar 2023 20:56:27 +0000
Date: Tue, 28 Mar 2023 04:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC/RFT 18/23] net: usb: lan78xx: Fixup EEE
Message-ID: <202303280408.oSjPt0Zb-lkp@intel.com>
References: <20230327170201.2036708-19-andrew@lunn.ch>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327170201.2036708-19-andrew@lunn.ch>

Hi Andrew,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/main]
[also build test ERROR on next-20230327]
[cannot apply to horms-ipvs/master net/main linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Lunn/net-phy-Add-phydev-eee_active-to-simplify-adjust-link-callbacks/20230328-011028
patch link:    https://lore.kernel.org/r/20230327170201.2036708-19-andrew%40lunn.ch
patch subject: [RFC/RFT 18/23] net: usb: lan78xx: Fixup EEE
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230328/202303280408.oSjPt0Zb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1c73847c47808e1b064f8520dda3d05868e771eb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andrew-Lunn/net-phy-Add-phydev-eee_active-to-simplify-adjust-link-callbacks/20230328-011028
        git checkout 1c73847c47808e1b064f8520dda3d05868e771eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280408.oSjPt0Zb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/usb/lan78xx.c: In function 'lan78xx_link_status_change':
>> drivers/net/usb/lan78xx.c:2106:17: error: 'data' undeclared (first use in this function); did you mean '_data'?
    2106 |                 data |=  MAC_CR_EEE_EN_;
         |                 ^~~~
         |                 _data
   drivers/net/usb/lan78xx.c:2106:17: note: each undeclared identifier is reported only once for each function it appears in


vim +2106 drivers/net/usb/lan78xx.c

  2099	
  2100	static void lan78xx_link_status_change(struct net_device *net)
  2101	{
  2102		struct lan78xx_net *dev = netdev_priv(net);
  2103		struct phy_device *phydev = net->phydev;
  2104	
  2105		if (phydev->eee_active)
> 2106			data |=  MAC_CR_EEE_EN_;
  2107		else
  2108			data &= ~MAC_CR_EEE_EN_;
  2109		lan78xx_write_reg(dev, MAC_CR, data);
  2110	
  2111		phy_print_status(phydev);
  2112	}
  2113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
