Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F519D065
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 02:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752113817; cv=none; b=EuaJ+9d4B5nGWN088+m10W84nSxiAuKV+V0EvrBpSjEQFl6W0O1GtVfXnpb5ch9oE7AOb6Ik5MBIAOVY0dzRG+Nhp1yF0lFUJocRWx0hK8FE68vcJEjixYsquREuX3kD43kfYQstRMLEk2i4hnAClp5vd771QvsweIIPvdq+oCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752113817; c=relaxed/simple;
	bh=fhqvlIiafLG97neWONlOEnYubzs7VXbTnCoQD5fBu8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=StQtc/aZSEM9cqzLM9wOmjOfYF7PNP8S++uUOtQ/NBJj98FfDFj941NrB4mM3UTlgWbVrKm0j/nonXl1LtP4wvqzlCQk4rH65So9ERyvWchgx6awNCHCUE9vQKoeZ3COH9nROik6thKZTn8XQrGnWrsbyMMxsJoByQjPA/n9ESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoDX1Lg0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoDX1Lg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752113816; x=1783649816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhqvlIiafLG97neWONlOEnYubzs7VXbTnCoQD5fBu8A=;
  b=IoDX1Lg0Yq1wHsPkK1uxvoUmwDQg79PNRCaocFS8emOAQhMbPeo8+139
   P/W73Qtz6VbvhqBxpuWANvnSsWlETf20y9mwDNpZ4218X9HHWuVSRViT0
   Ui9pmOjrnPLARRreG2SaQnq1Ww1EG9ONAc8U+3l2OmjWgUe5muxNOzgLR
   IHS2kaFfDblDJtqLCWbiJR26msXXfOdCZcoHriczIFi66SHgHz5AT7iEc
   zGlLAdNuXWRVHyztX22FQLZUY+ROnpJZ2pROw9Am++JljE2cHyqOnXiIZ
   nir4G9X4R8yHTGl84NbQeUiXPXQkOeSpdYlKFn7bf5mwllvRobiIDyOO6
   A==;
X-CSE-ConnectionGUID: 2wQjMIG8RCKIcyTUU17PMQ==
X-CSE-MsgGUID: bnRdtqcmTrKucQo4T+MKUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="56993875"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="56993875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 19:16:55 -0700
X-CSE-ConnectionGUID: g5axivPWS9+RHIjjPaUttA==
X-CSE-MsgGUID: avcPDE8zTj+tqVC4xqJiKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="161605109"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2025 19:16:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZgqB-0004MB-2x;
	Thu, 10 Jul 2025 02:16:51 +0000
Date: Thu, 10 Jul 2025 10:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:clk-remove-round-rate 44/195]
 drivers/clk/imx/clk-composite-8m.c:157:10: sparse: sparse: Initializer entry
 defined twice
Message-ID: <202507101015.hyTgDThZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/masneyb/linux clk-remove-round-rate
head:   223ddb8c5ed239a12476045a09b8f1443bfeab95
commit: aaa202d3f47fbc572eedee4c134717993d67174d [44/195] clk: imx: composite-8m: convert from round_rate() to determine_rate()
config: loongarch-randconfig-r131-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101015.hyTgDThZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250710/202507101015.hyTgDThZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101015.hyTgDThZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/imx/clk-composite-8m.c:157:10: sparse: sparse: Initializer entry defined twice
   drivers/clk/imx/clk-composite-8m.c:159:10: sparse:   also defined here
   drivers/clk/imx/clk-composite-8m.c:191:9: sparse: sparse: context imbalance in 'imx8m_clk_composite_mux_set_parent' - different lock contexts for basic block

vim +157 drivers/clk/imx/clk-composite-8m.c

   154	
   155	static const struct clk_ops imx8m_clk_composite_divider_ops = {
   156		.recalc_rate = imx8m_clk_composite_divider_recalc_rate,
 > 157		.determine_rate = imx8m_clk_composite_divider_determine_rate,
   158		.set_rate = imx8m_clk_composite_divider_set_rate,
   159		.determine_rate = imx8m_divider_determine_rate,
   160	};
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
