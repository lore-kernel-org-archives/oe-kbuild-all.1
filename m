Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648C28689B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Sep 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758360642; cv=none; b=H528ozXm/LmUbvFCZ7vpwoVPjIbGlA9a/TiAHHwoCBidlKuYSdiwAME9k+z0aEelRxG+HsPWDsnC+3P8zGG/MLFqWCq44ZU7tY7e31ABZPg9C9WBMSfWgW2HrmppkDpTM112DGLV9sTs1HrqQQ6kLca51Oh73UTCeI6F9DG3iWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758360642; c=relaxed/simple;
	bh=YBN2hBiwfIhKHnbZ4GH6X3MRGEgryywA5I0+3OP58GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/fCGAfRjiWsopE73QqbQZVqrmKa1z8dC0EDDpETlavCblq4vpWeA2jKW+1bFB6UACZvbvvpz524aACLmsigH7PhqPqb3kL1VMxq79wWikvulQK/ZjsKofx+8tyuOn0qGNiUOk1QDUZCFvCNswPZl+jiykeC0yzR72gr4UxhAHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0iyH4m1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0iyH4m1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758360640; x=1789896640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YBN2hBiwfIhKHnbZ4GH6X3MRGEgryywA5I0+3OP58GY=;
  b=B0iyH4m12s+MFdgTRGZQSGhcA7FDd5eUVukmhwl2OnHzirnk9lDtwDKG
   YveuMj+BpFjs4SY+jkym5lmkQU/LS/WnRhBCNwB1dfUXCAStC99pZru0f
   C7e8IBVkIMOaexU87uyM03JFeMF0LIf4isdesn8AQ/AOVQT+HknFHKGqO
   J1LsJsF/kSTUcEcMfs35i0qhA1O0IxwMWhpJrC57mWx4EX+EUBfaLfZgj
   eMxHkspAM+BiD8OQK314F07FsEprFQrOPwZHE6F7y38mHuUE565/9mcEZ
   eDnHMpWkhFlJxnqh5PmbUTODfRES5zcnDAHDLEV5P8IS2bNFQrH7DHSvK
   g==;
X-CSE-ConnectionGUID: oanOQx52TvCGi/0F64J42Q==
X-CSE-MsgGUID: ZDf91hb2Sr2nGa11hAx4aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="64514020"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="64514020"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 02:30:39 -0700
X-CSE-ConnectionGUID: uEPx+zCeRX2zD/PlH4F1NQ==
X-CSE-MsgGUID: vjIS7FbCRx6JT0DFGr5QqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="176467817"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Sep 2025 02:30:38 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uztvQ-0005Cl-03;
	Sat, 20 Sep 2025 09:30:36 +0000
Date: Sat, 20 Sep 2025 17:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
Message-ID: <202509201730.nTm6qpou-lkp@intel.com>
References: <20250919093741.1695015-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919093741.1695015-1-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/PCI-rzg3s-host-Add-Renesas-RZ-G3S-SoC-host-driver/20250919-174238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250919093741.1695015-1-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250920/202509201730.nTm6qpou-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201730.nTm6qpou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201730.nTm6qpou-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/pci/controller/pcie-rzg3s-host.c:834:29: warning: variable 'irq' is uninitialized when used here [-Wuninitialized]
     834 |                 return dev_err_probe(dev, irq ? irq : -EINVAL,
         |                                           ^~~
   drivers/pci/controller/pcie-rzg3s-host.c:826:9: note: initialize the variable 'irq' to silence this warning
     826 |         int irq, ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/irq +834 drivers/pci/controller/pcie-rzg3s-host.c

   819	
   820	static int rzg3s_pcie_msi_enable(struct rzg3s_pcie_host *host)
   821	{
   822		struct platform_device *pdev = to_platform_device(host->dev);
   823		struct rzg3s_pcie_msi *msi = &host->msi;
   824		struct device *dev = host->dev;
   825		const char *devname;
   826		int irq, ret;
   827	
   828		ret = devm_mutex_init(dev, &msi->map_lock);
   829		if (ret)
   830			return ret;
   831	
   832		msi->irq = platform_get_irq_byname(pdev, "msi");
   833		if (msi->irq < 0)
 > 834			return dev_err_probe(dev, irq ? irq : -EINVAL,
   835					     "Failed to get MSI IRQ!\n");
   836	
   837		devname = devm_kasprintf(dev, GFP_KERNEL, "%s-msi", dev_name(dev));
   838		if (!devname)
   839			return -ENOMEM;
   840	
   841		ret = rzg3s_pcie_msi_allocate_domains(msi);
   842		if (ret)
   843			return ret;
   844	
   845		ret = request_irq(msi->irq, rzg3s_pcie_msi_irq, 0, devname, host);
   846		if (ret) {
   847			dev_err_probe(dev, ret, "Failed to request IRQ: %d\n", ret);
   848			goto free_domains;
   849		}
   850	
   851		ret = rzg3s_pcie_msi_setup(host);
   852		if (ret) {
   853			dev_err_probe(dev, ret, "Failed to setup MSI!\n");
   854			goto free_irq;
   855		}
   856	
   857		return 0;
   858	
   859	free_irq:
   860		free_irq(msi->irq, host);
   861	free_domains:
   862		irq_domain_remove(msi->domain);
   863		return ret;
   864	}
   865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
