Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8906515B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 03:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681790182; x=1713326182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SP8Gp0AaPRzpxyRHZqHBd78jYguJutNSOFbhHGgejiE=;
  b=TqDpPmOCRJJbG8m7gKp1BeiJpHpU88iPuJDvRRx3Q76V8QDjVyR9thhW
   AL3TS6AjNQbGsJ26eNcK7i+lVJ91LxyN6z8PXU9es9yJT7KDFh0IQeHUR
   OC/q75keW1/fUa/W7jqUKyK5oLwBnUQOnGa42knDC5Xll3vtHDZULT9gK
   zAJ2O5moaaBdHtOE7Mr36Aew4RbZjfzSA8MZ3oTUA2SaFshW3hwPh46Fh
   PjeJb4sG43sMkWXSHDhumzxQQu82M3WDNvp7wsltplkdh5ioTpeDCTev3
   1D3tIcmboClpHY7UhYtT1TKNycDILvX6aLDdK7/3T6ZZJO9dlWZdG/9jJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347817028"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="347817028"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 20:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="690930721"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="690930721"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Apr 2023 20:56:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pocS2-000cwZ-26;
	Tue, 18 Apr 2023 03:56:18 +0000
Date: Tue, 18 Apr 2023 11:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Shannon Nelson <shannon.nelson@amd.com>, brett.creeley@amd.com,
	davem@davemloft.net, netdev@vger.kernel.org, kuba@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, drivers@pensando.io, leon@kernel.org,
	jiri@resnulli.us, simon.horman@corigine.com
Subject: Re: [PATCH v10 net-next 14/14] pds_core: Kconfig and pds_core.rst
Message-ID: <202304181137.WaZTYyAa-lkp@intel.com>
References: <20230418003228.28234-15-shannon.nelson@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418003228.28234-15-shannon.nelson@amd.com>

Hi Shannon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Shannon-Nelson/pds_core-initial-framework-for-pds_core-PF-driver/20230418-083612
patch link:    https://lore.kernel.org/r/20230418003228.28234-15-shannon.nelson%40amd.com
patch subject: [PATCH v10 net-next 14/14] pds_core: Kconfig and pds_core.rst
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304181137.WaZTYyAa-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/98284802ba918b756684dcf00cfa88bbab5cb498
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shannon-Nelson/pds_core-initial-framework-for-pds_core-PF-driver/20230418-083612
        git checkout 98284802ba918b756684dcf00cfa88bbab5cb498
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181137.WaZTYyAa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/amd/pds_core/auxbus.c: In function 'pds_client_register':
>> drivers/net/ethernet/amd/pds_core/auxbus.c:30:9: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
      30 |         strncpy(cmd.client_reg.devname, devname,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                 sizeof(cmd.client_reg.devname));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +30 drivers/net/ethernet/amd/pds_core/auxbus.c

de85ef78c6b4f6 Shannon Nelson 2023-04-17   8  
283e6c9307d7f4 Shannon Nelson 2023-04-17   9  /**
283e6c9307d7f4 Shannon Nelson 2023-04-17  10   * pds_client_register - Link the client to the firmware
283e6c9307d7f4 Shannon Nelson 2023-04-17  11   * @pf_pdev:	ptr to the PF driver struct
283e6c9307d7f4 Shannon Nelson 2023-04-17  12   * @devname:	name that includes service into, e.g. pds_core.vDPA
283e6c9307d7f4 Shannon Nelson 2023-04-17  13   *
283e6c9307d7f4 Shannon Nelson 2023-04-17  14   * Return: 0 on success, or
283e6c9307d7f4 Shannon Nelson 2023-04-17  15   *         negative for error
283e6c9307d7f4 Shannon Nelson 2023-04-17  16   */
283e6c9307d7f4 Shannon Nelson 2023-04-17  17  int pds_client_register(struct pci_dev *pf_pdev, char *devname)
283e6c9307d7f4 Shannon Nelson 2023-04-17  18  {
283e6c9307d7f4 Shannon Nelson 2023-04-17  19  	union pds_core_adminq_comp comp = {};
283e6c9307d7f4 Shannon Nelson 2023-04-17  20  	union pds_core_adminq_cmd cmd = {};
283e6c9307d7f4 Shannon Nelson 2023-04-17  21  	struct pdsc *pf;
283e6c9307d7f4 Shannon Nelson 2023-04-17  22  	int err;
283e6c9307d7f4 Shannon Nelson 2023-04-17  23  	u16 ci;
283e6c9307d7f4 Shannon Nelson 2023-04-17  24  
283e6c9307d7f4 Shannon Nelson 2023-04-17  25  	pf = pci_get_drvdata(pf_pdev);
283e6c9307d7f4 Shannon Nelson 2023-04-17  26  	if (pf->state)
283e6c9307d7f4 Shannon Nelson 2023-04-17  27  		return -ENXIO;
283e6c9307d7f4 Shannon Nelson 2023-04-17  28  
283e6c9307d7f4 Shannon Nelson 2023-04-17  29  	cmd.client_reg.opcode = PDS_AQ_CMD_CLIENT_REG;
283e6c9307d7f4 Shannon Nelson 2023-04-17 @30  	strncpy(cmd.client_reg.devname, devname,
283e6c9307d7f4 Shannon Nelson 2023-04-17  31  		sizeof(cmd.client_reg.devname));
283e6c9307d7f4 Shannon Nelson 2023-04-17  32  
283e6c9307d7f4 Shannon Nelson 2023-04-17  33  	err = pdsc_adminq_post(pf, &cmd, &comp, false);
283e6c9307d7f4 Shannon Nelson 2023-04-17  34  	if (err) {
283e6c9307d7f4 Shannon Nelson 2023-04-17  35  		dev_info(pf->dev, "register dev_name %s with DSC failed, status %d: %pe\n",
283e6c9307d7f4 Shannon Nelson 2023-04-17  36  			 devname, comp.status, ERR_PTR(err));
283e6c9307d7f4 Shannon Nelson 2023-04-17  37  		return err;
283e6c9307d7f4 Shannon Nelson 2023-04-17  38  	}
283e6c9307d7f4 Shannon Nelson 2023-04-17  39  
283e6c9307d7f4 Shannon Nelson 2023-04-17  40  	ci = le16_to_cpu(comp.client_reg.client_id);
283e6c9307d7f4 Shannon Nelson 2023-04-17  41  	if (!ci) {
283e6c9307d7f4 Shannon Nelson 2023-04-17  42  		dev_err(pf->dev, "%s: device returned null client_id\n",
283e6c9307d7f4 Shannon Nelson 2023-04-17  43  			__func__);
283e6c9307d7f4 Shannon Nelson 2023-04-17  44  		return -EIO;
283e6c9307d7f4 Shannon Nelson 2023-04-17  45  	}
283e6c9307d7f4 Shannon Nelson 2023-04-17  46  
283e6c9307d7f4 Shannon Nelson 2023-04-17  47  	dev_dbg(pf->dev, "%s: device returned client_id %d for %s\n",
283e6c9307d7f4 Shannon Nelson 2023-04-17  48  		__func__, ci, devname);
283e6c9307d7f4 Shannon Nelson 2023-04-17  49  
283e6c9307d7f4 Shannon Nelson 2023-04-17  50  	return ci;
283e6c9307d7f4 Shannon Nelson 2023-04-17  51  }
283e6c9307d7f4 Shannon Nelson 2023-04-17  52  EXPORT_SYMBOL_GPL(pds_client_register);
283e6c9307d7f4 Shannon Nelson 2023-04-17  53  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
