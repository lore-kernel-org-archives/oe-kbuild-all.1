Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53A320A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679562503; x=1711098503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZVXWFJ+3+iJsY4TniJtc5gue7ezl0Kc+fETNKZIuOuo=;
  b=VvniFl9gPTCSl+J5/TbhG06OXesWvLn1dCkKvhVDR8UC3MEUIpCcQXmV
   EQbssq7dA87l9+qvnEFvLvZGrv1wRGgPpLUm16bwQcoZViyGtNfzNmrE0
   jW9KHcj3nyjTXXAvd8vONLueb+r+mn5+0tCm9dfsBce9nRQPJOXLPMn+/
   4oz5jKwV3Z4luOMEWbjQKyQMSmLuo0UyAneVytn3VcnUupVCnvus+fOfM
   UVmUNCsErrt/zgPhXd0cG2aukgKMipx9AXuWPfsjuZ2AG1QBwZmOeKb8V
   21D/gq6Z1XJEQeGBBL7B92/tsToKuxm5/vhozV/HoRBi2489R0j3wMYKV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319824615"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319824615"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 02:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659522513"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="659522513"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Mar 2023 02:08:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfGvj-000ECe-0p;
	Thu, 23 Mar 2023 09:08:19 +0000
Date: Thu, 23 Mar 2023 17:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>
Subject: [linux-stable-rc:queue/5.15 11/14]
 drivers/interconnect/qcom/msm8974.c:702:9: error: implicit declaration of
 function 'icc_provider_init'; did you mean 'icc_provider_del'?
Message-ID: <202303231627.bO3bUaXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   63f11815ccc27da754b99f5819faf19077089d30
commit: 91493803e680b201403360cbe33c40f2154e8be4 [11/14] interconnect: qcom: msm8974: fix registration race
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303231627.bO3bUaXC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=91493803e680b201403360cbe33c40f2154e8be4
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout 91493803e680b201403360cbe33c40f2154e8be4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231627.bO3bUaXC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/interconnect/qcom/msm8974.c: In function 'msm8974_icc_probe':
>> drivers/interconnect/qcom/msm8974.c:702:9: error: implicit declaration of function 'icc_provider_init'; did you mean 'icc_provider_del'? [-Werror=implicit-function-declaration]
     702 |         icc_provider_init(provider);
         |         ^~~~~~~~~~~~~~~~~
         |         icc_provider_del
>> drivers/interconnect/qcom/msm8974.c:727:15: error: implicit declaration of function 'icc_provider_register'; did you mean 'icc_provider_del'? [-Werror=implicit-function-declaration]
     727 |         ret = icc_provider_register(provider);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               icc_provider_del
   drivers/interconnect/qcom/msm8974.c: In function 'msm8974_icc_remove':
>> drivers/interconnect/qcom/msm8974.c:746:9: error: implicit declaration of function 'icc_provider_deregister'; did you mean 'icc_provider_del'? [-Werror=implicit-function-declaration]
     746 |         icc_provider_deregister(&qp->provider);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         icc_provider_del
   cc1: some warnings being treated as errors


vim +702 drivers/interconnect/qcom/msm8974.c

   647	
   648	static int msm8974_icc_probe(struct platform_device *pdev)
   649	{
   650		const struct msm8974_icc_desc *desc;
   651		struct msm8974_icc_node **qnodes;
   652		struct msm8974_icc_provider *qp;
   653		struct device *dev = &pdev->dev;
   654		struct icc_onecell_data *data;
   655		struct icc_provider *provider;
   656		struct icc_node *node;
   657		size_t num_nodes, i;
   658		int ret;
   659	
   660		/* wait for the RPM proxy */
   661		if (!qcom_icc_rpm_smd_available())
   662			return -EPROBE_DEFER;
   663	
   664		desc = of_device_get_match_data(dev);
   665		if (!desc)
   666			return -EINVAL;
   667	
   668		qnodes = desc->nodes;
   669		num_nodes = desc->num_nodes;
   670	
   671		qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
   672		if (!qp)
   673			return -ENOMEM;
   674	
   675		data = devm_kzalloc(dev, struct_size(data, nodes, num_nodes),
   676				    GFP_KERNEL);
   677		if (!data)
   678			return -ENOMEM;
   679	
   680		qp->bus_clks = devm_kmemdup(dev, msm8974_icc_bus_clocks,
   681					    sizeof(msm8974_icc_bus_clocks), GFP_KERNEL);
   682		if (!qp->bus_clks)
   683			return -ENOMEM;
   684	
   685		qp->num_clks = ARRAY_SIZE(msm8974_icc_bus_clocks);
   686		ret = devm_clk_bulk_get(dev, qp->num_clks, qp->bus_clks);
   687		if (ret)
   688			return ret;
   689	
   690		ret = clk_bulk_prepare_enable(qp->num_clks, qp->bus_clks);
   691		if (ret)
   692			return ret;
   693	
   694		provider = &qp->provider;
   695		provider->dev = dev;
   696		provider->set = msm8974_icc_set;
   697		provider->aggregate = icc_std_aggregate;
   698		provider->xlate = of_icc_xlate_onecell;
   699		provider->data = data;
   700		provider->get_bw = msm8974_get_bw;
   701	
 > 702		icc_provider_init(provider);
   703	
   704		for (i = 0; i < num_nodes; i++) {
   705			size_t j;
   706	
   707			node = icc_node_create(qnodes[i]->id);
   708			if (IS_ERR(node)) {
   709				ret = PTR_ERR(node);
   710				goto err_remove_nodes;
   711			}
   712	
   713			node->name = qnodes[i]->name;
   714			node->data = qnodes[i];
   715			icc_node_add(node, provider);
   716	
   717			dev_dbg(dev, "registered node %s\n", node->name);
   718	
   719			/* populate links */
   720			for (j = 0; j < qnodes[i]->num_links; j++)
   721				icc_link_create(node, qnodes[i]->links[j]);
   722	
   723			data->nodes[i] = node;
   724		}
   725		data->num_nodes = num_nodes;
   726	
 > 727		ret = icc_provider_register(provider);
   728		if (ret)
   729			goto err_remove_nodes;
   730	
   731		platform_set_drvdata(pdev, qp);
   732	
   733		return 0;
   734	
   735	err_remove_nodes:
   736		icc_nodes_remove(provider);
   737		clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
   738	
   739		return ret;
   740	}
   741	
   742	static int msm8974_icc_remove(struct platform_device *pdev)
   743	{
   744		struct msm8974_icc_provider *qp = platform_get_drvdata(pdev);
   745	
 > 746		icc_provider_deregister(&qp->provider);
   747		icc_nodes_remove(&qp->provider);
   748		clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
   749	
   750		return 0;
   751	}
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
