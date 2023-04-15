Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B097EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 01:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681523165; x=1713059165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ORyg6cXUNoKxNfhS7VJ5/Gi6TJktlbEudkjy2jw7UsA=;
  b=l/bUHRVtFAJpueEFXV6nFVVr8FQyxyNxTaGC2mjBTHSu/wdnFX+Zxxt4
   atXYFeraF4WUQlXBo5g/Qh4n+DxhhaXxiV7nsnuVH+qlWvwNFXB7jkbyA
   WoPfaQW9BG15GvEBvCXIiqtHloPZQI45ia7APp/X9gG3chBNVnsJGrl0i
   xCNkBUJ0k/jdCkJLrLfoE8lITjUE1Xkep9QXnd+bTTzSuNTGpWK9lOqDY
   Qsc4OUzIcqCP7PLl1fBKq5L0Rzq8q+ADfO1ZxveeFGzo7uD+K73WIVmSO
   Sql/SNxCf5SDN6GG0EN7SDeHN/X0avmz/MJNchmTmyN5zWVJQG6GlZ3VV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="409815072"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="409815072"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 18:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="692627930"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="692627930"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Apr 2023 18:46:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnUzL-000aGP-15;
	Sat, 15 Apr 2023 01:46:03 +0000
Date: Sat, 15 Apr 2023 09:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Pagani <marpagan@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/4] fpga: add initial KUnit test suites
Message-ID: <202304150951.2g2EoCUr-lkp@intel.com>
References: <20230414163636.236174-5-marpagan@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414163636.236174-5-marpagan@redhat.com>

Hi Marco,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/fpga-add-fake-FPGA-manager/20230415-003918
base:   09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
patch link:    https://lore.kernel.org/r/20230414163636.236174-5-marpagan%40redhat.com
patch subject: [RFC PATCH v3 4/4] fpga: add initial KUnit test suites
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304150951.2g2EoCUr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5883c4e0127553e7d1bba4ecb9c84f9409844122
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marco-Pagani/fpga-add-fake-FPGA-manager/20230415-003918
        git checkout 5883c4e0127553e7d1bba4ecb9c84f9409844122
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/fpga/tests/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150951.2g2EoCUr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/fpga/tests/fake-fpga-region.c:170:1: error: expected ',' or ';' before 'static'
     170 | static int fake_region_get_bridges(struct fpga_region *region)
         | ^~~~~~
   drivers/fpga/tests/fake-fpga-region.c: In function 'fake_fpga_region_probe':
>> drivers/fpga/tests/fake-fpga-region.c:223:28: error: 'fake_region_get_bridges' undeclared (first use in this function)
     223 |         info.get_bridges = fake_region_get_bridges;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/tests/fake-fpga-region.c:223:28: note: each undeclared identifier is reported only once for each function it appears in


vim +170 drivers/fpga/tests/fake-fpga-region.c

34b28b44394492 Marco Pagani 2023-04-14  169  
34b28b44394492 Marco Pagani 2023-04-14 @170  static int fake_region_get_bridges(struct fpga_region *region)
34b28b44394492 Marco Pagani 2023-04-14  171  {
34b28b44394492 Marco Pagani 2023-04-14  172  	struct fake_region_priv *priv;
34b28b44394492 Marco Pagani 2023-04-14  173  	struct bridge_elem *elem;
34b28b44394492 Marco Pagani 2023-04-14  174  	int ret;
34b28b44394492 Marco Pagani 2023-04-14  175  
34b28b44394492 Marco Pagani 2023-04-14  176  	priv = region->priv;
34b28b44394492 Marco Pagani 2023-04-14  177  
34b28b44394492 Marco Pagani 2023-04-14  178  	/* Copy the list of bridges from the private context to the region */
34b28b44394492 Marco Pagani 2023-04-14  179  	list_for_each_entry(elem, &priv->bridge_list, node) {
34b28b44394492 Marco Pagani 2023-04-14  180  		ret = fpga_bridge_get_to_list(elem->bridge->dev.parent,
34b28b44394492 Marco Pagani 2023-04-14  181  					      region->info,
34b28b44394492 Marco Pagani 2023-04-14  182  					      &region->bridge_list);
34b28b44394492 Marco Pagani 2023-04-14  183  		if (ret)
34b28b44394492 Marco Pagani 2023-04-14  184  			break;
34b28b44394492 Marco Pagani 2023-04-14  185  	}
34b28b44394492 Marco Pagani 2023-04-14  186  
34b28b44394492 Marco Pagani 2023-04-14  187  	return ret;
34b28b44394492 Marco Pagani 2023-04-14  188  }
34b28b44394492 Marco Pagani 2023-04-14  189  
34b28b44394492 Marco Pagani 2023-04-14  190  static int fake_fpga_region_probe(struct platform_device *pdev)
34b28b44394492 Marco Pagani 2023-04-14  191  {
34b28b44394492 Marco Pagani 2023-04-14  192  	struct device *dev;
34b28b44394492 Marco Pagani 2023-04-14  193  	struct fpga_region *region;
34b28b44394492 Marco Pagani 2023-04-14  194  	struct fpga_manager *mgr;
34b28b44394492 Marco Pagani 2023-04-14  195  	struct fake_region_data *pdata;
34b28b44394492 Marco Pagani 2023-04-14  196  	struct fake_region_priv *priv;
34b28b44394492 Marco Pagani 2023-04-14  197  	struct fpga_region_info info;
34b28b44394492 Marco Pagani 2023-04-14  198  	static int id_count;
34b28b44394492 Marco Pagani 2023-04-14  199  
34b28b44394492 Marco Pagani 2023-04-14  200  	dev = &pdev->dev;
34b28b44394492 Marco Pagani 2023-04-14  201  	pdata = dev_get_platdata(dev);
34b28b44394492 Marco Pagani 2023-04-14  202  
34b28b44394492 Marco Pagani 2023-04-14  203  	if (!pdata) {
34b28b44394492 Marco Pagani 2023-04-14  204  		dev_err(&pdev->dev, "Missing platform data\n");
34b28b44394492 Marco Pagani 2023-04-14  205  		return -EINVAL;
34b28b44394492 Marco Pagani 2023-04-14  206  	}
34b28b44394492 Marco Pagani 2023-04-14  207  
34b28b44394492 Marco Pagani 2023-04-14  208  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
34b28b44394492 Marco Pagani 2023-04-14  209  	if (!priv)
34b28b44394492 Marco Pagani 2023-04-14  210  		return -ENOMEM;
34b28b44394492 Marco Pagani 2023-04-14  211  
34b28b44394492 Marco Pagani 2023-04-14  212  	mgr = fpga_mgr_get(pdata->mgr->dev.parent);
34b28b44394492 Marco Pagani 2023-04-14  213  	if (IS_ERR(mgr))
34b28b44394492 Marco Pagani 2023-04-14  214  		return PTR_ERR(mgr);
34b28b44394492 Marco Pagani 2023-04-14  215  
34b28b44394492 Marco Pagani 2023-04-14  216  	INIT_LIST_HEAD(&priv->bridge_list);
34b28b44394492 Marco Pagani 2023-04-14  217  	priv->id = id_count++;
34b28b44394492 Marco Pagani 2023-04-14  218  	priv->test = pdata->test;
34b28b44394492 Marco Pagani 2023-04-14  219  
34b28b44394492 Marco Pagani 2023-04-14  220  	memset(&info, 0, sizeof(info));
34b28b44394492 Marco Pagani 2023-04-14  221  	info.priv = priv;
34b28b44394492 Marco Pagani 2023-04-14  222  	info.mgr = mgr;
34b28b44394492 Marco Pagani 2023-04-14 @223  	info.get_bridges = fake_region_get_bridges;
34b28b44394492 Marco Pagani 2023-04-14  224  
34b28b44394492 Marco Pagani 2023-04-14  225  	region = fpga_region_register_full(dev, &info);
34b28b44394492 Marco Pagani 2023-04-14  226  	if (IS_ERR(region)) {
34b28b44394492 Marco Pagani 2023-04-14  227  		fpga_mgr_put(mgr);
34b28b44394492 Marco Pagani 2023-04-14  228  		return PTR_ERR(region);
34b28b44394492 Marco Pagani 2023-04-14  229  	}
34b28b44394492 Marco Pagani 2023-04-14  230  
34b28b44394492 Marco Pagani 2023-04-14  231  	platform_set_drvdata(pdev, region);
34b28b44394492 Marco Pagani 2023-04-14  232  
34b28b44394492 Marco Pagani 2023-04-14  233  	return 0;
34b28b44394492 Marco Pagani 2023-04-14  234  }
34b28b44394492 Marco Pagani 2023-04-14  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
