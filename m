Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C123B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 10:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675591578; x=1707127578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LIABKcDwMigXzX+GMp4K4sygkwPFoUo9G6uU9nxVAs4=;
  b=VdIzwn8VKCE2qcZqulKfkLqOQS/5N0QgZf7+mHBuFIf+FxIszK+7Pzdn
   bCk6oDQIDpVa85IEYDyiM1guz3NPN+8rRzETGzgC1omrir2LeMkzc0sH0
   dR2oCkOtPbgyQDT7XBM/AA5xXIiqVqdtQ4pbKxaGeQWAXnzNhVEiMumrO
   YmMF7yXB9fRue7D/tbkskPcGCiUiUgT82C7gmwCtza9vABiEtWK5vJiMf
   Leqhe0FdjbVgmWOpeOFJNy1F3xVsOJFWeDIEQrwdchwTtOSYPEBy1gs64
   RX4kM7nxWeDo78zbrPZpSriDu0vZZw5YVqgZBYWP7IcMwstf/906YadjU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="329047026"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="329047026"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 02:06:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734820296"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="734820296"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Feb 2023 02:06:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pObuZ-0001vU-2m;
	Sun, 05 Feb 2023 10:06:15 +0000
Date: Sun, 5 Feb 2023 18:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 14036/20208]
 drivers/soc/imx/imx93-pd.c:208:22: error: implicit declaration of function
 'of_clk_bulk_get_all'
Message-ID: <202302051807.iUokJTdJ-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5 [14036/20208] MLK-25894-4 soc: imx: add i.MX93 SRC power domain driver
config: hexagon-randconfig-r041-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051807.iUokJTdJ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/imx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/soc/imx/imx93-pd.c:208:22: error: implicit declaration of function 'of_clk_bulk_get_all' [-Werror,-Wimplicit-function-declaration]
                   domain->num_clks = of_clk_bulk_get_all(np, &domain->clks);
                                      ^
   drivers/soc/imx/imx93-pd.c:208:22: note: did you mean 'clk_bulk_get_all'?
   include/linux/clk.h:807:32: note: 'clk_bulk_get_all' declared here
   static inline int __must_check clk_bulk_get_all(struct device *dev,
                                  ^
   1 error generated.


vim +/of_clk_bulk_get_all +208 drivers/soc/imx/imx93-pd.c

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
