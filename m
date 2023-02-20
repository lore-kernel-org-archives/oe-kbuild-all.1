Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4C63201
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676893816; x=1708429816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMNKujlqZjG5Bj9fEjPqI2hmpK/LsbPv2POhzPuXeXU=;
  b=ELqhLXnNboAtnbNAaTAogY4DyYagrkyHzm5sxrQ6GqDvSTtOLXG+pECW
   q3vq1doAtNT7yaPxkcez77GrRdffes9YPulUq5pIOSFbU1dappzqFFhhR
   hfB6NzplkMoXDZYeECj8YWXEIL2R9jvWjdp2IcwCdwi822U9BLMUNA+32
   SywfdXAo1IhjRk86hkQQReX10vxnLyVbhBbkNlakmAAqGn4NOExhNvtsj
   fGcQ+/ZxPX9J8UB4aPRR7t6CYVwjK6bYXYfZ+6GUkomdiX+po5+KUROe5
   eKZNN3Moo1Iify9gy0P+ACtNc7ekQSnYk02iBz0gZhoNFqtjGve3qgIOa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="331048632"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="331048632"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 03:50:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="1000240155"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="1000240155"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Feb 2023 03:50:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU4gQ-000Dt9-1x;
	Mon, 20 Feb 2023 11:50:14 +0000
Date: Mon, 20 Feb 2023 19:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.2 164/230]
 drivers/bluetooth/hci_qca.c:1890:37: warning: 'qca_soc_data_wcn6855' defined
 but not used
Message-ID: <202302201908.cwZkVuru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.2
head:   452fdd4dbb40b949e73cb3229abd19a8b44b0a33
commit: 7c16a979bbd68b569a773687dc8e7930d5bbc8d8 [164/230] Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6855
config: i386-buildonly-randconfig-r002-20230220 (https://download.01.org/0day-ci/archive/20230220/202302201908.cwZkVuru-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/steev/linux/commit/7c16a979bbd68b569a773687dc8e7930d5bbc8d8
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-v6.2
        git checkout 7c16a979bbd68b569a773687dc8e7930d5bbc8d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201908.cwZkVuru-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/hci_qca.c:1890:37: warning: 'qca_soc_data_wcn6855' defined but not used [-Wunused-const-variable=]
    1890 | static const struct qca_device_data qca_soc_data_wcn6855 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1873:37: warning: 'qca_soc_data_wcn6750' defined but not used [-Wunused-const-variable=]
    1873 | static const struct qca_device_data qca_soc_data_wcn6750 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1857:37: warning: 'qca_soc_data_wcn3998' defined but not used [-Wunused-const-variable=]
    1857 | static const struct qca_device_data qca_soc_data_wcn3998 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1845:37: warning: 'qca_soc_data_wcn3991' defined but not used [-Wunused-const-variable=]
    1845 | static const struct qca_device_data qca_soc_data_wcn3991 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1834:37: warning: 'qca_soc_data_wcn3990' defined but not used [-Wunused-const-variable=]
    1834 | static const struct qca_device_data qca_soc_data_wcn3990 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~


vim +/qca_soc_data_wcn6855 +1890 drivers/bluetooth/hci_qca.c

  1889	
> 1890	static const struct qca_device_data qca_soc_data_wcn6855 = {
  1891		.soc_type = QCA_WCN6855,
  1892		.vregs = (struct qca_vreg []) {
  1893			{ "vddio", 5000 },
  1894			{ "vddxo", 126000 },
  1895			{ "vddrf", 12500 },
  1896			{ "vddch0", 102000 },
  1897			{ "vddch1", 302000 },
  1898		},
  1899		.num_vregs = 5,
  1900		.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
  1901	};
  1902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
