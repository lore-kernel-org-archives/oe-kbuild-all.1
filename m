Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6279457
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 19:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681242329; x=1712778329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e6g+HKZimBzafsIJUCN0jme7AcJQx/oSayUXiw2xMOU=;
  b=K8U0EhEfCRyAw1eX5Wn/GNv/g8c7TDeqVYQef85RZ9LaxCsAaOkm9IkV
   m/0bEPkHUc0Uk6KQrxUfoeMHg718e3nBL313GoNNm22zKyh4yk9D23Nk1
   gZ6YndDCr6e+s1mCbfdUDc3XvWkG4xDUGZIrKSfJjdCrarn7j+wYP6tNC
   FQKWcf2c5QL5gNTs6GFcC6pNLSu98kMIm7pnfKgdMjzycaOcFwqm4BXye
   Fv00OW8kl9HiXbd9dBx61+guOK+m5KOU0N73AOvDvKEdtIdJrSTq+GLsG
   rtHT9q+dfeN+avwZ9YdtiwdcVPY1nHuyoTsMv3f6zpiVdwVG7uMerVU2T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="345509828"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="345509828"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 12:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="778033513"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="778033513"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2023 12:45:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmJvh-000Wev-2M;
	Tue, 11 Apr 2023 19:45:25 +0000
Date: Wed, 12 Apr 2023 03:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: edward.cree@amd.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 4/6] net: ethtool: pass ctx_priv and create
 into .set_rxfh_context
Message-ID: <202304120334.ipYDVA8i-lkp@intel.com>
References: <2b0bb0b96c09cc79d39ef79ce6733fc0244c5548.1680538846.git.ecree.xilinx@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b0bb0b96c09cc79d39ef79ce6733fc0244c5548.1680538846.git.ecree.xilinx@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/edward-cree-amd-com/net-ethtool-attach-an-IDR-of-custom-RSS-contexts-to-a-netdevice/20230404-003917
patch link:    https://lore.kernel.org/r/2b0bb0b96c09cc79d39ef79ce6733fc0244c5548.1680538846.git.ecree.xilinx%40gmail.com
patch subject: [RFC PATCH net-next 4/6] net: ethtool: pass ctx_priv and create into .set_rxfh_context
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230412/202304120334.ipYDVA8i-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/44c47024e39be318c99069a6e3ffc9ef18a29cfe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review edward-cree-amd-com/net-ethtool-attach-an-IDR-of-custom-RSS-contexts-to-a-netdevice/20230404-003917
        git checkout 44c47024e39be318c99069a6e3ffc9ef18a29cfe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpio/ drivers/mtd/spi-nor/ drivers/net/ethernet/marvell/octeontx2/nic/ drivers/net/ethernet/netronome/nfp/ drivers/net/wireless/mediatek/mt76/mt7996/ drivers/nvmem/ drivers/rtc/ drivers/spi/ drivers/staging/media/tegra-video/ net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120334.ipYDVA8i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c:1447:35: error: initialization of 'int (*)(struct net_device *, struct ethtool_rxfh_context *, const u32 *, const u8 *, const u8,  u32,  bool,  bool)' {aka 'int (*)(struct net_device *, struct ethtool_rxfh_context *, const unsigned int *, const unsigned char *, const unsigned char,  unsigned int,  _Bool,  _Bool)'} from incompatible pointer type 'int (*)(struct net_device *, const u32 *, const u8 *, const u8,  u32 *, bool)' {aka 'int (*)(struct net_device *, const unsigned int *, const unsigned char *, const unsigned char,  unsigned int *, _Bool)'} [-Werror=incompatible-pointer-types]
    1447 |         .set_rxfh_context       = otx2_set_rxfh_context,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c:1447:35: note: (near initialization for 'otx2vf_ethtool_ops.set_rxfh_context')
   cc1: some warnings being treated as errors


vim +1447 drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c

1a50280c25ecfb Christina Jacob      2021-02-09  1426  
05c22b5431488d Tomasz Duszynski     2020-03-21  1427  static const struct ethtool_ops otx2vf_ethtool_ops = {
05c22b5431488d Tomasz Duszynski     2020-03-21  1428  	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
619c010a65391d Suman Ghosh          2022-06-12  1429  				     ETHTOOL_COALESCE_MAX_FRAMES |
619c010a65391d Suman Ghosh          2022-06-12  1430  				     ETHTOOL_COALESCE_USE_ADAPTIVE,
68258596cbc9a6 Subbaraya Sundeep    2022-02-23  1431  	.supported_ring_params  = ETHTOOL_RING_USE_RX_BUF_LEN |
68258596cbc9a6 Subbaraya Sundeep    2022-02-23  1432  				  ETHTOOL_RING_USE_CQE_SIZE,
05c22b5431488d Tomasz Duszynski     2020-03-21  1433  	.get_link		= otx2_get_link,
05c22b5431488d Tomasz Duszynski     2020-03-21  1434  	.get_drvinfo		= otx2vf_get_drvinfo,
05c22b5431488d Tomasz Duszynski     2020-03-21  1435  	.get_strings		= otx2vf_get_strings,
05c22b5431488d Tomasz Duszynski     2020-03-21  1436  	.get_ethtool_stats	= otx2vf_get_ethtool_stats,
05c22b5431488d Tomasz Duszynski     2020-03-21  1437  	.get_sset_count		= otx2vf_get_sset_count,
05c22b5431488d Tomasz Duszynski     2020-03-21  1438  	.set_channels		= otx2_set_channels,
05c22b5431488d Tomasz Duszynski     2020-03-21  1439  	.get_channels		= otx2_get_channels,
3cffaed2136cd6 Rakesh Babu          2021-08-17  1440  	.get_rxnfc		= otx2_get_rxnfc,
3cffaed2136cd6 Rakesh Babu          2021-08-17  1441  	.set_rxnfc              = otx2_set_rxnfc,
05c22b5431488d Tomasz Duszynski     2020-03-21  1442  	.get_rxfh_key_size	= otx2_get_rxfh_key_size,
05c22b5431488d Tomasz Duszynski     2020-03-21  1443  	.get_rxfh_indir_size	= otx2_get_rxfh_indir_size,
05c22b5431488d Tomasz Duszynski     2020-03-21  1444  	.get_rxfh		= otx2_get_rxfh,
05c22b5431488d Tomasz Duszynski     2020-03-21  1445  	.set_rxfh		= otx2_set_rxfh,
81a4362016e7d8 Geetha sowjanya      2021-01-04  1446  	.get_rxfh_context	= otx2_get_rxfh_context,
81a4362016e7d8 Geetha sowjanya      2021-01-04 @1447  	.set_rxfh_context	= otx2_set_rxfh_context,
05c22b5431488d Tomasz Duszynski     2020-03-21  1448  	.get_ringparam		= otx2_get_ringparam,
05c22b5431488d Tomasz Duszynski     2020-03-21  1449  	.set_ringparam		= otx2_set_ringparam,
05c22b5431488d Tomasz Duszynski     2020-03-21  1450  	.get_coalesce		= otx2_get_coalesce,
05c22b5431488d Tomasz Duszynski     2020-03-21  1451  	.set_coalesce		= otx2_set_coalesce,
05c22b5431488d Tomasz Duszynski     2020-03-21  1452  	.get_msglevel		= otx2_get_msglevel,
05c22b5431488d Tomasz Duszynski     2020-03-21  1453  	.set_msglevel		= otx2_set_msglevel,
05c22b5431488d Tomasz Duszynski     2020-03-21  1454  	.get_pauseparam		= otx2_get_pauseparam,
05c22b5431488d Tomasz Duszynski     2020-03-21  1455  	.set_pauseparam		= otx2_set_pauseparam,
1a50280c25ecfb Christina Jacob      2021-02-09  1456  	.get_link_ksettings     = otx2vf_get_link_ksettings,
43510ef4ddad39 Naveen Mamindlapalli 2021-09-28  1457  	.get_ts_info		= otx2_get_ts_info,
05c22b5431488d Tomasz Duszynski     2020-03-21  1458  };
05c22b5431488d Tomasz Duszynski     2020-03-21  1459  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
