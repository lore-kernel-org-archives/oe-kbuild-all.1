Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF4B7C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 00:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678147604; x=1709683604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x6YbLdiiX44qz82846yYDicn6b4G4tPKv0db1Wij+Ws=;
  b=nhKudHAXmJhioSLMaRhX5x/xpaXHEpFoVv/G8y6yRyzrfu9WoszDCugC
   V3qSbWuGg+Gv6rzS4cxHr9mW5wBDM/m4CoQZN/TFfbgw0BK2HxObD7GWp
   Oawg+st18zhqXmOjGA8xZuWw6scM6X8u9mdzwMT2giTP83uhTm57uXeOU
   8b4ELUjM8AcFqoSr6b9Py+2+mTYHPSDD4PCJi7oNWlnFZKLAdqPsqiXWR
   FxaaSAT+kGwqvDpusmjm+CK3fKH1wGnBsIAk1OCBDKOalbK/R1l/4/RrX
   oYF2VsABZ8cQmF/90e8bgRVTKqlibeTY8lUHDBt9WbYO2tbAblwpmESYv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337235078"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="337235078"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 16:06:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740514107"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="740514107"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2023 16:06:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZKql-0000kZ-1D;
	Tue, 07 Mar 2023 00:06:39 +0000
Date: Tue, 7 Mar 2023 08:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@seco.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Tobias Waldekranz <tobias@waldekranz.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next] net: mdio: Add netlink interface
Message-ID: <202303070724.WmNAt4Af-lkp@intel.com>
References: <20230306204517.1953122-1-sean.anderson@seco.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306204517.1953122-1-sean.anderson@seco.com>

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/net-mdio-Add-netlink-interface/20230307-044742
patch link:    https://lore.kernel.org/r/20230306204517.1953122-1-sean.anderson%40seco.com
patch subject: [PATCH net-next] net: mdio: Add netlink interface
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230307/202303070724.WmNAt4Af-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/78ff5545f403a98977a2db207cc165cb3a3b4d8f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Anderson/net-mdio-Add-netlink-interface/20230307-044742
        git checkout 78ff5545f403a98977a2db207cc165cb3a3b4d8f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070724.WmNAt4Af-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/mdio/mdio-netlink.c: In function 'mdio_nl_eval':
>> drivers/net/mdio/mdio-netlink.c:98:40: warning: variable 'val' set but not used [-Wunused-but-set-variable]
      98 |         int phy_id, reg, prtad, devad, val;
         |                                        ^~~


vim +/val +98 drivers/net/mdio/mdio-netlink.c

    91	
    92	static int mdio_nl_eval(struct mdio_nl_xfer *xfer)
    93	{
    94		struct mdio_nl_insn *insn;
    95		unsigned long timeout;
    96		u16 regs[8] = { 0 };
    97		int pc, ret = 0;
  > 98		int phy_id, reg, prtad, devad, val;
    99	
   100		timeout = jiffies + msecs_to_jiffies(xfer->timeout_ms);
   101	
   102		mutex_lock(&xfer->mdio->mdio_lock);
   103	
   104		for (insn = xfer->prog, pc = 0;
   105		     pc < xfer->prog_len;
   106		     insn = &xfer->prog[++pc]) {
   107			if (time_after(jiffies, timeout)) {
   108				ret = -ETIMEDOUT;
   109				break;
   110			}
   111	
   112			switch ((enum mdio_nl_op)insn->op) {
   113			case MDIO_NL_OP_READ:
   114				phy_id = __arg_ri(insn->arg0, regs);
   115				prtad = mdio_phy_id_prtad(phy_id);
   116				devad = mdio_phy_id_devad(phy_id);
   117				reg = __arg_ri(insn->arg1, regs);
   118	
   119				if (mdio_phy_id_is_c45(phy_id))
   120					ret = __mdiobus_c45_read(xfer->mdio, prtad,
   121								 devad, reg);
   122				else
   123					ret = __mdiobus_read(xfer->mdio, phy_id, reg);
   124	
   125				if (ret < 0)
   126					goto exit;
   127				*__arg_r(insn->arg2, regs) = ret;
   128				ret = 0;
   129				break;
   130	
   131			case MDIO_NL_OP_WRITE:
   132				phy_id = __arg_ri(insn->arg0, regs);
   133				prtad = mdio_phy_id_prtad(phy_id);
   134				devad = mdio_phy_id_devad(phy_id);
   135				reg = __arg_ri(insn->arg1, regs);
   136				val = __arg_ri(insn->arg2, regs);
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
