Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF907F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 05:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675573635; x=1707109635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BbimtX4Dd236cyYmvFY2Bw9tzQlHQN+O6iSa7yr+EOU=;
  b=T1jWWVA4UKETS++2yhO4rGfejhJCwGRfnlrIrw43PNBGo9dEucnLO9Ir
   3oNWvaz0M7xrF4er6Ib4fnhiu3GFvbQqPv9OrJJloC/rMwl50BxBGXta2
   yGMSHLP3fUz6thJRwhmQDZZSRS8h5hN7m5+QKxHCit7WUu7IvOHJHVZnW
   QpS7yH4bcGHK5PrtjLew3eoGhxBqz82gLssd+CCSDibR6QZEcU5sTHDzt
   Azw1RVyIjdaG4kYDGcsLoA2TSJkRl8+bLgPCbaon/uvtb/F8QvivDN2Ma
   oSXOsyA1RBy9/Z+17KAAZw7XKrtQsAZclyGWM6yd94z5Zl9jcoQtTtgqB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393616030"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393616030"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 21:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734781668"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="734781668"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 21:07:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOXF6-0001kv-1l;
	Sun, 05 Feb 2023 05:07:08 +0000
Date: Sun, 5 Feb 2023 13:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14036/20209]
 drivers/soc/imx/imx93-pd.c:208:36: error: implicit declaration of function
 'of_clk_bulk_get_all'; did you mean 'clk_bulk_get_all'?
Message-ID: <202302051330.nn02U1hB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5 [14036/20209] MLK-25894-4 soc: imx: add i.MX93 SRC power domain driver
config: powerpc-randconfig-r005-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051330.nn02U1hB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/soc/imx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/soc/imx/imx93-pd.c: In function 'imx93_pd_probe':
>> drivers/soc/imx/imx93-pd.c:208:36: error: implicit declaration of function 'of_clk_bulk_get_all'; did you mean 'clk_bulk_get_all'? [-Werror=implicit-function-declaration]
     208 |                 domain->num_clks = of_clk_bulk_get_all(np, &domain->clks);
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    clk_bulk_get_all
   drivers/soc/imx/imx93-pd.c: At top level:
   drivers/soc/imx/imx93-pd.c:113:34: warning: 'imx93_power_domain_ids' defined but not used [-Wunused-const-variable=]
     113 | static const struct of_device_id imx93_power_domain_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +208 drivers/soc/imx/imx93-pd.c

   158	
   159	static int imx93_pd_probe(struct platform_device *pdev)
   160	{
   161		struct device *dev = &pdev->dev;
   162		const struct imx93_plat_data *data = of_device_get_match_data(dev);
   163		const struct imx93_slice_info *slice_info = data->slices;
   164		struct imx93_power_domain *pd;
   165		u32 num_domains = data->num_slice;
   166		struct device_node *slice_np, *np;
   167		void __iomem *base;
   168		bool is_off;
   169		int ret;
   170	
   171		slice_np = of_get_child_by_name(dev->of_node, "slice");
   172		if (!slice_np) {
   173			dev_err(dev, "No slices specified in DT\n");
   174			return -EINVAL;
   175		}
   176	
   177		base = devm_platform_ioremap_resource(pdev, 0);
   178		if (IS_ERR(base))
   179			return PTR_ERR(base);
   180	
   181		pd = devm_kcalloc(dev, num_domains, sizeof(*pd), GFP_KERNEL);
   182		if (!pd)
   183			return -ENOMEM;
   184	
   185		platform_set_drvdata(pdev, pd);
   186	
   187		for_each_child_of_node(slice_np, np) {
   188			struct imx93_power_domain *domain;
   189			u32 index;
   190	
   191			if (!of_device_is_available(np))
   192				continue;
   193	
   194			ret = of_property_read_u32(np, "reg", &index);
   195			if (ret) {
   196				dev_err(dev, "Failed to read 'reg' property\n");
   197				of_node_put(np);
   198				return ret;
   199			}
   200	
   201			if (index >= num_domains) {
   202				dev_warn(dev, "Domain index %d is out of bounds\n", index);
   203				continue;
   204			}
   205	
   206			domain = &pd[index];
   207	
 > 208			domain->num_clks = of_clk_bulk_get_all(np, &domain->clks);
   209			if (domain->num_clks < 0) {
   210				return dev_err_probe(domain->dev, domain->num_clks,
   211						     "Failed to get %s's clocks\n",
   212						     slice_info[index].name);
   213			}
   214	
   215			domain->genpd.name = slice_info[index].name;
   216			domain->genpd.power_off = imx93_pd_off;
   217			domain->genpd.power_on = imx93_pd_on;
   218			domain->slice_info = &slice_info[index];
   219			domain->base = base;
   220	
   221			is_off = readl(domain->base + slice_info->mix_off + MIX_FUNC_STAT_OFF) &
   222				FUNC_STAT_ISO_STAT_MASK;
   223			/* Just to sync the status of hardware */
   224			if (!is_off) {
   225				ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
   226				if (ret) {
   227					dev_err(domain->dev, "failed to enable clocks for domain: %s\n",
   228						domain->genpd.name);
   229					clk_bulk_put_all(domain->num_clks, domain->clks);
   230					return 0;
   231				}
   232			}
   233	
   234			dev_info(dev, "%s: state: %x\n", domain->genpd.name,
   235				 readl(domain->base + MIX_FUNC_STAT_OFF));
   236			ret = pm_genpd_init(&domain->genpd, NULL, is_off);
   237			if (ret) {
   238				dev_err(dev, "failed to init genpd\n");
   239				clk_bulk_put_all(domain->num_clks, domain->clks);
   240				return ret;
   241			}
   242	
   243			ret = of_genpd_add_provider_simple(np, &domain->genpd);
   244			if (ret) {
   245				clk_bulk_put_all(domain->num_clks, domain->clks);
   246				return ret;
   247			}
   248		}
   249	
   250		return 0;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
