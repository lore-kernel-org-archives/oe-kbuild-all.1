Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A99865A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676706833; x=1708242833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BLpK+nEOEvpGWfsvDmgiRGCpkl3cXuTJYvBDY+6w588=;
  b=MHbYZjUqPPGR6oIrDB9sk2y5U1XSZdcCN+NLuk6nlu6CcFA6ecCwkX/9
   WsydeMIf8LunL8PWbqehq1lx92LYjMh5Gk8Zfb/fqUwNJGNR4gFSMEj7p
   Ft6k1ZlViI0bIl4fJXMKvqIGM2nlHc+uvxYynYrOVXMihx/Thct4hbg3a
   gQ3Ytaehi/1V1BkUFtPyptzb3x6utYNCqelty5TpTYTI8Kh/dpViHYI4O
   yLnMJueb9rsF6xZgOwE07MnNL8Rj5Pq0tH4J/qvX7vRMqf+xQ4NImthHi
   tIQ71VAAU9udMZ2z04g45/HjbZ3AGRtxedfobdi0j6drWKYCF8quYy3UD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="320264837"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="320264837"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 23:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="664114886"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="664114886"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 23:53:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTI2Z-000CDh-1i;
	Sat, 18 Feb 2023 07:53:51 +0000
Date: Sat, 18 Feb 2023 15:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 488/584]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:1432:27: error: initialization
 of 'int (*)(struct pci_epf *, const struct pci_epf_device_id *)' from
 incompatible pointer type 'int (*)(struct pci_epf *)'
Message-ID: <202302181545.zGq2AZYa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8450-hdmi-audio-on-qcomlt
head:   e1df0b14d2e3085d5ff5a1c7474b47840640da92
commit: 0a5791cface5a07c793b0192cbcc3e685f2e65a7 [488/584] PCI: endpoint: Pass EPF device ID to the probe function
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230218/202302181545.zGq2AZYa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/0a5791cface5a07c793b0192cbcc3e685f2e65a7
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout 0a5791cface5a07c793b0192cbcc3e685f2e65a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181545.zGq2AZYa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/endpoint/functions/pci-epf-vntb.c:1432:27: error: initialization of 'int (*)(struct pci_epf *, const struct pci_epf_device_id *)' from incompatible pointer type 'int (*)(struct pci_epf *)' [-Werror=incompatible-pointer-types]
    1432 |         .probe          = epf_ntb_probe,
         |                           ^~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1432:27: note: (near initialization for 'epf_ntb_driver.probe')
   cc1: some warnings being treated as errors


vim +1432 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li 2022-02-22  1429  
e35f56bb03304a Frank Li 2022-02-22  1430  static struct pci_epf_driver epf_ntb_driver = {
e35f56bb03304a Frank Li 2022-02-22  1431  	.driver.name    = "pci_epf_vntb",
e35f56bb03304a Frank Li 2022-02-22 @1432  	.probe          = epf_ntb_probe,
e35f56bb03304a Frank Li 2022-02-22  1433  	.id_table       = epf_ntb_ids,
e35f56bb03304a Frank Li 2022-02-22  1434  	.ops            = &epf_ntb_ops,
e35f56bb03304a Frank Li 2022-02-22  1435  	.owner          = THIS_MODULE,
e35f56bb03304a Frank Li 2022-02-22  1436  };
e35f56bb03304a Frank Li 2022-02-22  1437  

:::::: The code at line 1432 was first introduced by commit
:::::: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
