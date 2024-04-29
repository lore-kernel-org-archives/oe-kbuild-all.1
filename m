Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177117BCD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714379859; cv=none; b=avzPK0j5jsdv558CI4aODezIIWYQKW7nC/rdLPbKkQ9z01w98FRGgwVutIgn/LlMsIxaQ6jzb6pkA1g1x4pk2JUWRS+zjuXD+HxiE9QWCIRzes/MCx7h5tSSJfVk/Mh+CAJ19Iy5xtj2FGLsQtpdxKqE3hDgwJnqOeW/SIBThto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714379859; c=relaxed/simple;
	bh=gl/cUUZ3YShGsj9tgEMW7G1FZ5SSB1JUlmM9Osy9RtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j1f+F/FRsaeNmIgdZpuJdv0TjW+pAXBy0tWPX5Wa/v1Nq2BLriNat5eedjTams6gNnFnxEmSJONICIrFqeHn8P6+1R9QP/a3c5v7iHS0IqnubyecvdwETJc6cKidzvzz2BKFtPrXB2irYTdhfwhC40+0UtvuMHrymlEZobmtTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emtHAD3Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emtHAD3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714379858; x=1745915858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gl/cUUZ3YShGsj9tgEMW7G1FZ5SSB1JUlmM9Osy9RtY=;
  b=emtHAD3Y4ovOhrUa6h6oAhGtrZn0HF6UWM77jx33vg8nl4DJh7w668Zj
   /GsAhs7crTVK+GzVZBiOXTvrVZsUWXHdElkGYGG9edz1Zz0L6SSfIwi8E
   wxNLPDJCEsN/8TUwtkQFoKv5MsEUXPUQ+T6MVSpYD3iqz93ns/wTztkgM
   hbLR+do2OPOxCaA18czDDCRKBx9LWpNYS42llq6IHS110TJUB6pe+k1o6
   +yS+JIm4vUU2Mo8IUfp1LUUn1r4BwFkYX1wdkj3AvmRgjxX2LYjW2axhk
   QayNQu1uUrosZp0pcS/ul3e4onlfO+wBeMIpXIvmhxxJ8xYKJpteNL7hY
   A==;
X-CSE-ConnectionGUID: 1HZYjtZZTzaDvmiDvfFt9A==
X-CSE-MsgGUID: NnoC/Jr/QciWjqyBhX9+Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21182419"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="21182419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:37:35 -0700
X-CSE-ConnectionGUID: Btth/0b4RBSf5oVo12ZJEg==
X-CSE-MsgGUID: jMoG3kteSI2OuHVCAX4lQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="25919243"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2024 01:37:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1MVv-00073w-12;
	Mon, 29 Apr 2024 08:37:31 +0000
Date: Mon, 29 Apr 2024 16:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14036/29983]
 drivers/soc/imx/imx93-pd.c:208:22: error: implicit declaration of function
 'of_clk_bulk_get_all'
Message-ID: <202404291619.DBBdriJK-lkp@intel.com>
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
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: c7aa30ff9f1ace2dbacdb6cd2720606e7f74c4c5 [14036/29983] MLK-25894-4 soc: imx: add i.MX93 SRC power domain driver
config: hexagon-randconfig-002-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291619.DBBdriJK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291619.DBBdriJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291619.DBBdriJK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/imx/imx93-pd.c:208:22: error: implicit declaration of function 'of_clk_bulk_get_all' [-Werror,-Wimplicit-function-declaration]
     208 |                 domain->num_clks = of_clk_bulk_get_all(np, &domain->clks);
         |                                    ^
   drivers/soc/imx/imx93-pd.c:208:22: note: did you mean 'clk_bulk_get_all'?
   include/linux/clk.h:807:32: note: 'clk_bulk_get_all' declared here
     807 | static inline int __must_check clk_bulk_get_all(struct device *dev,
         |                                ^
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
https://github.com/intel/lkp-tests/wiki
