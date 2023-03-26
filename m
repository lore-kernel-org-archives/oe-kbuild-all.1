Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A63C3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 18:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679854970; x=1711390970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rmRiwihXLQEn0mRmHzR08uVIsnQA0ho+0M8kwOO0NVY=;
  b=Ys12iBbRlZ4dNC0vsa6zkfaumXVs4OMumFJXiDX+0C3aMa0PJTcbEr/N
   8ypkhSWNyboolfRxxoUkSvYImkzcCSVU0kOlFud0oICLDSZMRuFaJzCtr
   4c7A3DLW1dVVXK7Ku4ogCRn38ZnME4M4N//jJXIDO6vjinBIFiearsMcF
   c1QPpAvW0rnJtehz5XUZsRQjabt22Tlo119IuNxGAeqbIxjqjKseSA35R
   dDM0gn5CSVtdlKA36crUTHTrNre3L+XlYFemDMgFfgSMncms5uMS9OI+l
   y+GFIH0SgZctZY3M15MzJXuXDLNHuK1k2pEDPKLZQFwF+iqU0fkJP17Pp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402714542"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="402714542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 11:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660631211"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="660631211"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Mar 2023 11:22:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgV0y-000HIR-0f;
	Sun, 26 Mar 2023 18:22:48 +0000
Date: Mon, 27 Mar 2023 02:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 10/69]
 drivers/interconnect/qcom/icc-rpmh.c:221:2: error: implicit declaration of
 function 'icc_provider_init'
Message-ID: <202303270243.CnUWBsJx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   a2eb82d76c5874c00ea3d120f3dbfc0f5c1b2cc8
commit: e5e394be0da9c37be4e97d70ca839df05ae0c555 [10/69] interconnect: qcom: rpmh: fix registration race
config: arm-randconfig-r011-20230326 (https://download.01.org/0day-ci/archive/20230327/202303270243.CnUWBsJx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=e5e394be0da9c37be4e97d70ca839df05ae0c555
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout e5e394be0da9c37be4e97d70ca839df05ae0c555
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/interconnect/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303270243.CnUWBsJx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/interconnect/qcom/icc-rpmh.c:221:2: error: implicit declaration of function 'icc_provider_init' [-Werror,-Wimplicit-function-declaration]
           icc_provider_init(provider);
           ^
>> drivers/interconnect/qcom/icc-rpmh.c:257:8: error: implicit declaration of function 'icc_provider_register' [-Werror,-Wimplicit-function-declaration]
           ret = icc_provider_register(provider);
                 ^
>> drivers/interconnect/qcom/icc-rpmh.c:276:2: error: implicit declaration of function 'icc_provider_deregister' [-Werror,-Wimplicit-function-declaration]
           icc_provider_deregister(&qp->provider);
           ^
   3 errors generated.


vim +/icc_provider_init +221 drivers/interconnect/qcom/icc-rpmh.c

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
