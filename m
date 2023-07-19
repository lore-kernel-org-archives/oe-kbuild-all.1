Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2426211C93
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689783778; x=1721319778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4WaPiroj5v9mPk65Z0OTtkfjBduK6wpl3IUEkkKYjM=;
  b=JVpOYPU5rvMBf14CGOWf/eD+D1AsxoIMtu++BoZ2DkWnYs7Y3wUy+6Is
   BnH+0+0Omcrbv6QD6JfKlriYtcd6r5zcAb8BRyIlvdBuvUSvSMZgE/t2c
   BX696Vk/DhVGtGkvY0+ESguPT0s5Gw7D1BZFoIA0APd/S1KuEmvgsooRU
   gxOacDdh+scVombqeBURySg8KH8Ol16VaSqFH0BCC4SmIiQAAzbLWy/p3
   CZguxQNEkKkohb21o0TqMryTtHB9NqY20scEV9FE9VGQFkWe6szs7wUEm
   0jXTA4HusAl917Bcy3YxYNf815A7m3xCz3gFFwE1DpG1RwzG8rndXKr09
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="370072580"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="370072580"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 09:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789475078"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="789475078"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 09:19:49 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM9u0-00058D-2g;
	Wed, 19 Jul 2023 16:19:48 +0000
Date: Thu, 20 Jul 2023 00:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 4839/12467]
 drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype
 for 'int_imx_secvio_sc_check_state'
Message-ID: <202307200053.kBD8bCXa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   791ee62ff569635e685d84c09b2179f002c4e0bf
commit: e5c2ac92c948f8eab9eab1fd89a5c15437168e7d [4839/12467] Merge branch 'firmware/next' into next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200053.kBD8bCXa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200053.kBD8bCXa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200053.kBD8bCXa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype for 'int_imx_secvio_sc_check_state' [-Wmissing-prototypes]
     140 | int int_imx_secvio_sc_check_state(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: In function 'int_imx_secvio_sc_disable_irq':
>> drivers/soc/imx/secvio/imx-secvio-sc.c:377:36: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     377 |         struct imx_secvio_sc_data *data;
         |                                    ^~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: At top level:
>> drivers/soc/imx/secvio/imx-secvio-sc.c:459:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     459 | const static struct file_operations imx_secvio_sc_fops = {
         | ^~~~~
--
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous prototype for 'fuse_reader' [-Wmissing-prototypes]
      35 | int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:5: warning: no previous prototype for 'snvs_reader' [-Wmissing-prototypes]
      56 | int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:5: warning: no previous prototype for 'snvs_dgo_reader' [-Wmissing-prototypes]
      95 | int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~~~~~


vim +/int_imx_secvio_sc_check_state +140 drivers/soc/imx/secvio/imx-secvio-sc.c

16674772de567c Franck LENORMAND 2019-12-05  139  
16674772de567c Franck LENORMAND 2019-12-05 @140  int int_imx_secvio_sc_check_state(struct device *dev)
16674772de567c Franck LENORMAND 2019-12-05  141  {
16674772de567c Franck LENORMAND 2019-12-05  142  	struct secvio_sc_notifier_info info = {0};
16674772de567c Franck LENORMAND 2019-12-05  143  	int ret = 0;
16674772de567c Franck LENORMAND 2019-12-05  144  
16674772de567c Franck LENORMAND 2019-12-05  145  	ret = int_imx_secvio_sc_get_state(dev, &info);
16674772de567c Franck LENORMAND 2019-12-05  146  	if (ret) {
16674772de567c Franck LENORMAND 2019-12-05  147  		dev_err(dev, "Failed to get secvio state\n");
16674772de567c Franck LENORMAND 2019-12-05  148  		goto exit;
16674772de567c Franck LENORMAND 2019-12-05  149  	}
16674772de567c Franck LENORMAND 2019-12-05  150  
16674772de567c Franck LENORMAND 2019-12-05  151  	/* Call chain of CB registered to this module if status detected */
16674772de567c Franck LENORMAND 2019-12-05  152  	if (info.hpsvs || info.lps || info.lptds)
16674772de567c Franck LENORMAND 2019-12-05  153  		if (imx_secvio_sc_notifier_call_chain(&info))
16674772de567c Franck LENORMAND 2019-12-05  154  			dev_warn(dev,
16674772de567c Franck LENORMAND 2019-12-05  155  				 "Issues when calling the notifier chain\n");
16674772de567c Franck LENORMAND 2019-12-05  156  
16674772de567c Franck LENORMAND 2019-12-05  157  exit:
16674772de567c Franck LENORMAND 2019-12-05  158  	return ret;
16674772de567c Franck LENORMAND 2019-12-05  159  }
16674772de567c Franck LENORMAND 2019-12-05  160  

:::::: The code at line 140 was first introduced by commit
:::::: 16674772de567c3aa328f328af2ae484abc4edd0 SSI-87: soc: imx: secvio: Add support for SNVS secvio and tamper via SCFW

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
