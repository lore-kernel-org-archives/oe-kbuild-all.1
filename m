Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8C20E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 06:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679551471; x=1711087471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eHvyqbX9Z6fPW/wO+c/yTG6qcRfnYaMuFfg6Fz/5h40=;
  b=Gj38czTGEocm4aFxROwmzgI+BoZIuMWFMA4zTy8aJVOPi1dh5BUzYXYP
   OYdAcxGdor6JHV9QBT8PxgEQy95xrvQP7NGTV0Dcm8bUEwFSrNn28TXJI
   qBXkfPFGKLWDn9Hw1viwQNk9l4GCA8AKaJgE3zwiSsMAKS9lKsf6kImp1
   f4vtbR/7s7VJeODDXodcS9kzsVz2FEnpUug+CQJJ20JJobDeQGLZxvkJO
   eolKFhtH73tJMDuo0TfLRn9ByiPoD2WbcsprdgR8SxouYUHJhIG0St3B0
   X25UlUCcoURCIux8QyeXKuFNvE089o4gEA9sxMVMbuqpMd1lcBecVgAt5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="367142822"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="367142822"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 23:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682190681"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="682190681"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Mar 2023 23:04:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfE3X-000E1w-2g;
	Thu, 23 Mar 2023 06:04:11 +0000
Date: Thu, 23 Mar 2023 14:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>
Subject: [linux-stable-rc:queue/5.15 10/14]
 drivers/interconnect/qcom/icc-rpmh.c:221:9: error: implicit declaration of
 function 'icc_provider_init'; did you mean 'icc_provider_del'?
Message-ID: <202303231314.2m0ACuNY-lkp@intel.com>
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
commit: 80bc2d12ba3ae13f5baf85f247042996d4af209d [10/14] interconnect: qcom: rpmh: fix registration race
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303231314.2m0ACuNY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=80bc2d12ba3ae13f5baf85f247042996d4af209d
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout 80bc2d12ba3ae13f5baf85f247042996d4af209d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231314.2m0ACuNY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/interconnect/qcom/icc-rpmh.c: In function 'qcom_icc_rpmh_probe':
>> drivers/interconnect/qcom/icc-rpmh.c:221:9: error: implicit declaration of function 'icc_provider_init'; did you mean 'icc_provider_del'? [-Werror=implicit-function-declaration]
     221 |         icc_provider_init(provider);
         |         ^~~~~~~~~~~~~~~~~
         |         icc_provider_del
>> drivers/interconnect/qcom/icc-rpmh.c:257:15: error: implicit declaration of function 'icc_provider_register'; did you mean 'icc_provider_del'? [-Werror=implicit-function-declaration]
     257 |         ret = icc_provider_register(provider);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               icc_provider_del
   drivers/interconnect/qcom/icc-rpmh.c: In function 'qcom_icc_rpmh_remove':
>> drivers/interconnect/qcom/icc-rpmh.c:276:9: error: implicit declaration of function 'icc_provider_deregister'; did you mean 'icc_provider_del'? [-Werror=implicit-function-declaration]
     276 |         icc_provider_deregister(&qp->provider);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         icc_provider_del
   cc1: some warnings being treated as errors


vim +221 drivers/interconnect/qcom/icc-rpmh.c

   185	
   186	int qcom_icc_rpmh_probe(struct platform_device *pdev)
   187	{
   188		const struct qcom_icc_desc *desc;
   189		struct device *dev = &pdev->dev;
   190		struct icc_onecell_data *data;
   191		struct icc_provider *provider;
   192		struct qcom_icc_node **qnodes, *qn;
   193		struct qcom_icc_provider *qp;
   194		struct icc_node *node;
   195		size_t num_nodes, i, j;
   196		int ret;
   197	
   198		desc = of_device_get_match_data(dev);
   199		if (!desc)
   200			return -EINVAL;
   201	
   202		qnodes = desc->nodes;
   203		num_nodes = desc->num_nodes;
   204	
   205		qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
   206		if (!qp)
   207			return -ENOMEM;
   208	
   209		data = devm_kzalloc(dev, struct_size(data, nodes, num_nodes), GFP_KERNEL);
   210		if (!data)
   211			return -ENOMEM;
   212	
   213		provider = &qp->provider;
   214		provider->dev = dev;
   215		provider->set = qcom_icc_set;
   216		provider->pre_aggregate = qcom_icc_pre_aggregate;
   217		provider->aggregate = qcom_icc_aggregate;
   218		provider->xlate_extended = qcom_icc_xlate_extended;
   219		provider->data = data;
   220	
 > 221		icc_provider_init(provider);
   222	
   223		qp->dev = dev;
   224		qp->bcms = desc->bcms;
   225		qp->num_bcms = desc->num_bcms;
   226	
   227		qp->voter = of_bcm_voter_get(qp->dev, NULL);
   228		if (IS_ERR(qp->voter))
   229			return PTR_ERR(qp->voter);
   230	
   231		for (i = 0; i < qp->num_bcms; i++)
   232			qcom_icc_bcm_init(qp->bcms[i], dev);
   233	
   234		for (i = 0; i < num_nodes; i++) {
   235			qn = qnodes[i];
   236			if (!qn)
   237				continue;
   238	
   239			node = icc_node_create(qn->id);
   240			if (IS_ERR(node)) {
   241				ret = PTR_ERR(node);
   242				goto err_remove_nodes;
   243			}
   244	
   245			node->name = qn->name;
   246			node->data = qn;
   247			icc_node_add(node, provider);
   248	
   249			for (j = 0; j < qn->num_links; j++)
   250				icc_link_create(node, qn->links[j]);
   251	
   252			data->nodes[i] = node;
   253		}
   254	
   255		data->num_nodes = num_nodes;
   256	
 > 257		ret = icc_provider_register(provider);
   258		if (ret)
   259			goto err_remove_nodes;
   260	
   261		platform_set_drvdata(pdev, qp);
   262	
   263		return 0;
   264	
   265	err_remove_nodes:
   266		icc_nodes_remove(provider);
   267	
   268		return ret;
   269	}
   270	EXPORT_SYMBOL_GPL(qcom_icc_rpmh_probe);
   271	
   272	int qcom_icc_rpmh_remove(struct platform_device *pdev)
   273	{
   274		struct qcom_icc_provider *qp = platform_get_drvdata(pdev);
   275	
 > 276		icc_provider_deregister(&qp->provider);
   277		icc_nodes_remove(&qp->provider);
   278	
   279		return 0;
   280	}
   281	EXPORT_SYMBOL_GPL(qcom_icc_rpmh_remove);
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
