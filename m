Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34F18488
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693476526; x=1725012526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2LJIMWMwm/YsIJWlS4hxNo0YSPwg/dxkSuyJ9YMGDjw=;
  b=G3Hmkv8fnNx2qS5H6UFrl4QSo0diGfkW2Bhh2sp5sqVIB/4BFOwGxdfZ
   GJ7WEF3bX3HMXl1p70D+g24FxRk8+EHvb8paYrg6+xx/r0gMwwbSjKBxR
   +uqH5MOlX+hff1f2nZ4JnORxvW91fuAVd1OrhBtdyy4zgZv8a3WRxxuLl
   hNozeIU9/IhkioBQxaj0HxYmMHqjuy3SgIl2Zg3tPKdTbPtrihjjgdcB9
   lEeJa+g8FvQyyjNfCd/nYU6YjV1iXwIWn5WkDQYN2G1fjeUSaC5YRnu8p
   hGm6UbxlEO1cNiilB9U3gmMwRCDuloribzo1s0Vfa+ZkqZ8C9Z2CzxltP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373290591"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="373290591"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="986178891"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="986178891"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2023 03:08:44 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbebS-00001I-0t;
	Thu, 31 Aug 2023 10:08:42 +0000
Date: Thu, 31 Aug 2023 18:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14036/24604]
 drivers/soc/imx/imx93-pd.c:208:36: error: implicit declaration of function
 'of_clk_bulk_get_all'; did you mean 'clk_bulk_get_all'?
Message-ID: <202308311819.T8bgeVZw-lkp@intel.com>
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
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5 [14036/24604] MLK-25894-4 soc: imx: add i.MX93 SRC power domain driver
config: sparc-randconfig-r021-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311819.T8bgeVZw-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311819.T8bgeVZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311819.T8bgeVZw-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
   Depends on [n]: SPARC64 [=n] && PM [=n]
   Selected by [m]:
   - SOC_IMX9 [=m] && (ARCH_MXC || COMPILE_TEST [=y])


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
https://github.com/intel/lkp-tests/wiki
