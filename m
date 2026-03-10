Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6D13EBF0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130865; cv=none; b=sMQAQ0ZU+v/Bf4GURsdd2Jl+EsoVQVdgnrbJnxcVvg8LvSLJIowUtXgoAEZnMAcYBlQKtcIXjZl5zGUEgmccr7yCo7riWQgXoNC6+jFr9YMmaQWrO9beXqIaI54Elb9EqELD9unLWwYV0h0UzVza0vkUeONuvSprGMC5u4XMBVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130865; c=relaxed/simple;
	bh=R3GKQOnVlA4SWTygyFTFJ/WrC//pJcp8RTlaslxgtw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIUzowCMvOOyYB7GMiWmn4xHClbjCJEJn+maA2gnOuqmnnfxiNI+/KcRjlzMVMN5TE8mY/lSQGoBdlBcjVVwn/OCm/orwQ4+wo/sJtLJPsz+mT540Xo45RQ6jkFpIBOgWyv4wGm2kIPxYGj9NmmcigruapkDt69EBxSwvGY1vAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lb87WGKd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lb87WGKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773130863; x=1804666863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R3GKQOnVlA4SWTygyFTFJ/WrC//pJcp8RTlaslxgtw0=;
  b=lb87WGKd5h31JzD3tVTgFjWYr2knbwOnOCzhx1JItSxlpKTUtwM3FXRx
   VBXrjRUXtQavjg2cEa4uEaaLMueldK3yrP1yWtzXB7LQRx9TujtKgjld5
   sGfq9IOTczY9h5fapXHoZMGIngO+v1agAKyHc7IhYkjPpn0fhwXqvcCwJ
   YOwHPEqwNhUsYJphjOr5ojUXei6bbmNuYm1NT5knLXc+O4G68F2Iwv2bx
   fsjA+XCzl48zvF2rqaaDSpl6rGuWyKhuGktaJUbgEUmTBlOKtlpFtQpUF
   N/rZDx8OwmzDne4VAiKgjFaIaHbkG9HZo6KdIqNF+NdITqkC/E/K84ys4
   g==;
X-CSE-ConnectionGUID: 2Nwj9P/QThSAm8T2BuTYXQ==
X-CSE-MsgGUID: kE+FIiLdRlyVFGCdRkHPHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85258829"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="85258829"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:21:03 -0700
X-CSE-ConnectionGUID: ggYeroAwQsyekMGker3Ecg==
X-CSE-MsgGUID: akZXxMLnTa61BAn8g334nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="219286524"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Mar 2026 01:20:57 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzsKj-000000001aC-1OCZ;
	Tue, 10 Mar 2026 08:20:53 +0000
Date: Tue, 10 Mar 2026 16:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into
 a struct
Message-ID: <202603101641.aPJli6Zx-lkp@intel.com>
References: <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>

Hi Vijayanand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3fa5e5702a82d259897bd7e209469bc06368bf31]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijayanand-Jitta/of-Add-convenience-wrappers-for-of_map_id/20260309-033633
base:   3fa5e5702a82d259897bd7e209469bc06368bf31
patch link:    https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8%40oss.qualcomm.com
patch subject: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into a struct
config: i386-buildonly-randconfig-005-20260310 (https://download.01.org/0day-ci/archive/20260310/202603101641.aPJli6Zx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101641.aPJli6Zx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101641.aPJli6Zx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cdx/cdx_msi.c: In function 'cdx_msi_prepare':
>> drivers/cdx/cdx_msi.c:128:13: warning: variable 'dev_id' set but not used [-Wunused-but-set-variable]
     128 |         u32 dev_id;
         |             ^~~~~~


vim +/dev_id +128 drivers/cdx/cdx_msi.c

0e439ba38e615e Nipun Gupta       2024-02-26  119  
0e439ba38e615e Nipun Gupta       2024-02-26  120  static int cdx_msi_prepare(struct irq_domain *msi_domain,
0e439ba38e615e Nipun Gupta       2024-02-26  121  			   struct device *dev,
0e439ba38e615e Nipun Gupta       2024-02-26  122  			   int nvec, msi_alloc_info_t *info)
0e439ba38e615e Nipun Gupta       2024-02-26  123  {
ab5be96a55e45e Charan Teja Kalla 2026-03-09  124  	struct of_phandle_args msi_spec = { .np = NULL };
0e439ba38e615e Nipun Gupta       2024-02-26  125  	struct cdx_device *cdx_dev = to_cdx_device(dev);
0e439ba38e615e Nipun Gupta       2024-02-26  126  	struct device *parent = cdx_dev->cdx->dev;
0e439ba38e615e Nipun Gupta       2024-02-26  127  	struct msi_domain_info *msi_info;
0e439ba38e615e Nipun Gupta       2024-02-26 @128  	u32 dev_id;
0e439ba38e615e Nipun Gupta       2024-02-26  129  	int ret;
0e439ba38e615e Nipun Gupta       2024-02-26  130  
0e439ba38e615e Nipun Gupta       2024-02-26  131  	/* Retrieve device ID from requestor ID using parent device */
ab5be96a55e45e Charan Teja Kalla 2026-03-09  132  	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, &msi_spec);
0e439ba38e615e Nipun Gupta       2024-02-26  133  	if (ret) {
0e439ba38e615e Nipun Gupta       2024-02-26  134  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
0e439ba38e615e Nipun Gupta       2024-02-26  135  		return ret;
0e439ba38e615e Nipun Gupta       2024-02-26  136  	}
ab5be96a55e45e Charan Teja Kalla 2026-03-09  137  	of_node_put(msi_spec.np);
ab5be96a55e45e Charan Teja Kalla 2026-03-09  138  	dev_id = msi_spec.args[0];
0e439ba38e615e Nipun Gupta       2024-02-26  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
