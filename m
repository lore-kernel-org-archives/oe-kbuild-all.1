Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB768476
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680793643; x=1712329643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ADPck/2PeDP+2syBsARjyhGyalXn2rFhezikXiuOiHM=;
  b=k5CWzbRYS6fUDemb1OOg8GrWQ6TUr6zD0vLDe0lIJYbFJd8rZlXKJdt1
   EywakX9IinnfT2bNtKafIMijO/8W4RsYEPq3AvQ0nrj+yD4nu+NBLu9R3
   ZvjYDYL6HZbQJGjskU4R88lVVbsQZNyHkY3N9qY05VxAKXKuDSeuj7gTJ
   VGPjS4ambzrUtatWivdv6drdj6K53LfBEy9/j7PUBfFWmE9T1iadr5Rle
   vWMPNnymBf3VjbER/ITZKwZ9zxMdQaMiQQTbS1SNKjnpgY0lcE4fO7hti
   4JWeKIWpCxmUQqMB+hlTS8EQjdZkXhoLip7fqKXw66CijVCovBcJdcD1o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341489151"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="341489151"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 08:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="637340299"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="637340299"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Apr 2023 08:06:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkRCR-000RSY-2t;
	Thu, 06 Apr 2023 15:06:55 +0000
Date: Thu, 6 Apr 2023 23:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gautam Dawar <gautam.dawar@amd.com>, linux-net-drivers@amd.com,
	jasowang@redhat.com, Edward Cree <ecree.xilinx@gmail.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	eperezma@redhat.com, harpreet.anand@amd.com, tanuj.kamde@amd.com,
	koushik.dutta@amd.com, Gautam Dawar <gautam.dawar@amd.com>
Subject: Re: [PATCH net-next v3 06/14] sfc: implement vDPA management device
 operations
Message-ID: <202304062229.feOqJmLW-lkp@intel.com>
References: <20230406065706.59664-7-gautam.dawar@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406065706.59664-7-gautam.dawar@amd.com>

Hi Gautam,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Gautam-Dawar/sfc-add-function-personality-support-for-EF100-devices/20230406-151436
patch link:    https://lore.kernel.org/r/20230406065706.59664-7-gautam.dawar%40amd.com
patch subject: [PATCH net-next v3 06/14] sfc: implement vDPA management device operations
config: openrisc-randconfig-r025-20230403 (https://download.01.org/0day-ci/archive/20230406/202304062229.feOqJmLW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0887a40c60d1983214d417491dc9ef46191ab1ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gautam-Dawar/sfc-add-function-personality-support-for-EF100-devices/20230406-151436
        git checkout 0887a40c60d1983214d417491dc9ef46191ab1ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/ethernet/sfc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062229.feOqJmLW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/sfc/ef100_nic.c: In function 'efx_ef100_init_datapath_caps':
   drivers/net/ethernet/sfc/ef100_nic.c:214:25: error: 'struct ef100_nic_data' has no member named 'vdpa_supported'
     214 |                 nic_data->vdpa_supported = efx->type->is_vf &&
         |                         ^~
   drivers/net/ethernet/sfc/ef100_nic.c: In function 'ef100_probe_vf':
   drivers/net/ethernet/sfc/ef100_nic.c:1300:29: error: 'struct ef100_nic_data' has no member named 'vdpa_supported'
    1300 |                 if (nic_data->vdpa_supported) {
         |                             ^~
>> drivers/net/ethernet/sfc/ef100_nic.c:1301:31: error: implicit declaration of function 'ef100_vdpa_register_mgmtdev' [-Werror=implicit-function-declaration]
    1301 |                         err = ef100_vdpa_register_mgmtdev(efx);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ef100_nic.c: In function 'ef100_remove':
   drivers/net/ethernet/sfc/ef100_nic.c:1316:52: error: 'struct ef100_nic_data' has no member named 'vdpa_supported'
    1316 |         if (IS_ENABLED(CONFIG_SFC_VDPA) && nic_data->vdpa_supported)
         |                                                    ^~
>> drivers/net/ethernet/sfc/ef100_nic.c:1317:17: error: implicit declaration of function 'ef100_vdpa_unregister_mgmtdev' [-Werror=implicit-function-declaration]
    1317 |                 ef100_vdpa_unregister_mgmtdev(efx);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ef100_vdpa_register_mgmtdev +1301 drivers/net/ethernet/sfc/ef100_nic.c

  1287	
  1288	int ef100_probe_vf(struct efx_nic *efx)
  1289	{
  1290		struct ef100_nic_data *nic_data __maybe_unused;
  1291		int err __maybe_unused;
  1292		int rc;
  1293	
  1294		rc = ef100_probe_main(efx);
  1295		if (rc)
  1296			return rc;
  1297	
  1298		if (IS_ENABLED(CONFIG_SFC_VDPA)) {
  1299			nic_data = efx->nic_data;
  1300			if (nic_data->vdpa_supported) {
> 1301				err = ef100_vdpa_register_mgmtdev(efx);
  1302				if (err)
  1303					pci_warn(efx->pci_dev,
  1304						 "register_mgmtdev failed, rc: %d\n",
  1305						 err);
  1306			}
  1307		}
  1308	
  1309		return 0;
  1310	}
  1311	
  1312	void ef100_remove(struct efx_nic *efx)
  1313	{
  1314		struct ef100_nic_data *nic_data = efx->nic_data;
  1315	
  1316		if (IS_ENABLED(CONFIG_SFC_VDPA) && nic_data->vdpa_supported)
> 1317			ef100_vdpa_unregister_mgmtdev(efx);
  1318	
  1319		if (IS_ENABLED(CONFIG_SFC_SRIOV) && efx->mae) {
  1320			efx_ef100_fini_reps(efx);
  1321			efx_fini_mae(efx);
  1322		}
  1323	
  1324		efx_mcdi_detach(efx);
  1325		efx_mcdi_fini(efx);
  1326		if (nic_data) {
  1327			efx_nic_free_buffer(efx, &nic_data->mcdi_buf);
  1328			mutex_destroy(&nic_data->bar_config_lock);
  1329		}
  1330		kfree(nic_data);
  1331		efx->nic_data = NULL;
  1332	}
  1333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
