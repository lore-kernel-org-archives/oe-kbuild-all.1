Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C1198A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692299333; x=1723835333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M9avB4hjRPmzUaLJsgpn0o2yXipbxT+flNXP1FdCeCE=;
  b=a50m6rjLIuJLW3Arrq+4IMepF0gIIzM626iONeytjqnYBe+qUxKexQRQ
   JWZpOOAy+J7fGGZtPaMvAQr/9W9LTkG9ojUhIZaCfpcC/fhZuCGgVQuvk
   nHgFjtqZXSKJxqd5RReL6L5BgllYaVMuGDgUXk/Hwa44+mMMwPPHb8rzJ
   EOJVXWCQ6m3b38YqEdRWwqOU+cdehFLzNMdphVzvrddzWtb7+fK/And2h
   q8f9oOCZTgL8+u4suSPB8Y3rB1tk22K9e1qf6Py4O9EcaCeB63j8bu5A6
   cd9vBSb9h8xQWKFL/cC1ViUaAn84l8CvpErbfipKChGDPBQR+p+qPowNG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439287359"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="439287359"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 12:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858328807"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="858328807"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 12:08:52 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWiMV-0001PP-1w;
	Thu, 17 Aug 2023 19:08:51 +0000
Date: Fri, 18 Aug 2023 03:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 3/8] phy: xgkr: add configuration interface
 for copper backplane Ethernet PHYs
Message-ID: <202308180210.dMqqsV1h-lkp@intel.com>
References: <20230817150644.3605105-4-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817150644.3605105-4-vladimir.oltean@nxp.com>

Hi Vladimir,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/phy-introduce-the-phy_check_cdr_lock-function/20230817-231048
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230817150644.3605105-4-vladimir.oltean%40nxp.com
patch subject: [RFC PATCH net-next 3/8] phy: xgkr: add configuration interface for copper backplane Ethernet PHYs
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230818/202308180210.dMqqsV1h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180210.dMqqsV1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180210.dMqqsV1h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/phy/phy.h:22,
                    from drivers/phy/phy-core.c:18:
>> include/linux/phy/phy-xgkr.h:146:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     146 | static void inline c72_coef_update_print(const struct c72_coef_update *update,
         | ^~~~~~


vim +/inline +146 include/linux/phy/phy-xgkr.h

   145	
 > 146	static void inline c72_coef_update_print(const struct c72_coef_update *update,
   147						 char buf[C72_COEF_UPDATE_BUFSIZ])
   148	{
   149		sprintf(buf, "INIT %d, PRESET %d, C(-1) %s, C(0) %s, C(+1) %s",
   150			update->init, update->preset,
   151			coef_update_to_string(update->com1),
   152			coef_update_to_string(update->coz),
   153			coef_update_to_string(update->cop1));
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
