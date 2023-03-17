Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FA679D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679091802; x=1710627802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sn2ex3/P8ZcRXVDLwKWvn1Kdw+sapR80g3zEzgrpHDA=;
  b=WYMDyCOwERTr3Hh9rM/Hr7l953edLDHYYfJAjdn+o90+azmoFOuy+8Nz
   diepnH1Xu+KzDd6m4rzJnunSQUzGnUELXQgnhCizvEH42M/KMriGphBpW
   lSRtT5W8KcIgReLm3NiAh3BdFwCX9Zxwlc/RugyUMX50tFWZBU+/Qqs87
   us3o4OZQMIEXDa2MiL3V+UgsmWVHY25rA1XlqoKrvyKsy1KZw+ztbkft5
   ce6rdjMtUUcT/4GyZOdDelxYpWb37v6fB6D5lmobSJS9q+idGfpGw/dZv
   qDfma9d2mx5A6YYAGRkjKdeqy74vgMLccTjfzBvTLBgthV8zn/JDLcpkx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340730362"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="340730362"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 15:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="680434768"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="680434768"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Mar 2023 15:23:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdITo-0009bq-2D;
	Fri, 17 Mar 2023 22:23:20 +0000
Date: Sat, 18 Mar 2023 06:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/4] Bluetooth: hci_qca: Add support for QTI Bluetooth
 chip wcn6855
Message-ID: <202303180653.cjf2U6RM-lkp@intel.com>
References: <20230316034759.73489-3-steev@kali.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316034759.73489-3-steev@kali.org>

Hi Steev,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on bluetooth-next/master bluetooth/master linus/master v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steev-Klimaszewski/dt-bindings-net-Add-WCN6855-Bluetooth/20230316-114914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230316034759.73489-3-steev%40kali.org
patch subject: [PATCH v6 2/4] Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6855
config: i386-randconfig-r003-20230313 (https://download.01.org/0day-ci/archive/20230318/202303180653.cjf2U6RM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2b31edfc2f1b766e5f49220b14ee4570f83456c7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steev-Klimaszewski/dt-bindings-net-Add-WCN6855-Bluetooth/20230316-114914
        git checkout 2b31edfc2f1b766e5f49220b14ee4570f83456c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180653.cjf2U6RM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/hci_qca.c:1894:37: warning: 'qca_soc_data_wcn6855' defined but not used [-Wunused-const-variable=]
    1894 | static const struct qca_device_data qca_soc_data_wcn6855 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1877:37: warning: 'qca_soc_data_wcn6750' defined but not used [-Wunused-const-variable=]
    1877 | static const struct qca_device_data qca_soc_data_wcn6750 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1861:37: warning: 'qca_soc_data_wcn3998' defined but not used [-Wunused-const-variable=]
    1861 | static const struct qca_device_data qca_soc_data_wcn3998 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1849:37: warning: 'qca_soc_data_wcn3991' defined but not used [-Wunused-const-variable=]
    1849 | static const struct qca_device_data qca_soc_data_wcn3991 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1838:37: warning: 'qca_soc_data_wcn3990' defined but not used [-Wunused-const-variable=]
    1838 | static const struct qca_device_data qca_soc_data_wcn3990 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~


vim +/qca_soc_data_wcn6855 +1894 drivers/bluetooth/hci_qca.c

  1893	
> 1894	static const struct qca_device_data qca_soc_data_wcn6855 = {
  1895		.soc_type = QCA_WCN6855,
  1896		.vregs = (struct qca_vreg []) {
  1897			{ "vddio", 5000 },
  1898			{ "vddbtcxmx", 126000 },
  1899			{ "vddrfacmn", 12500 },
  1900			{ "vddrfa0p8", 102000 },
  1901			{ "vddrfa1p7", 302000 },
  1902			{ "vddrfa1p2", 257000 },
  1903		},
  1904		.num_vregs = 6,
  1905		.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
  1906	};
  1907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
