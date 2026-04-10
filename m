Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662303B5842
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819016; cv=none; b=IfP9lGf0mdEK+O1LNa6ITuYV0+amwRSt7Gjb7GvfyMcu4Itr3jdv+jaE0dYwO2E14peP0BvD2BYaqHVa18l+CXaIo3bJQwu0EvBGTeK5bXpAKnwDHbpUSHBG/VKf9Z32j4z84AT/J5bRtLwh+KtoykQ2IoQUfFuWhce6L6DPb1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819016; c=relaxed/simple;
	bh=l4DUECnI8+UeqMU5aywEL1bC9tSsbxLiKzuzzkz/GIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FtG3kxUGivlHMt+aMiC1ZfIwZ9/0qCKHmxCGwSWywdpp9ADmnlWSj4IFhqdIsdiD7iekWXXC57axCMx+aiGZ5trXyLWlUO6yGMIxe+9sNLG7NL+uPf6gJA9WI1rVrHYJeMuTytHyY41hWO+gDdBbHWt92+VZrAB3DrYHagvqXlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXSD9jG0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXSD9jG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775819016; x=1807355016;
  h=date:from:to:cc:subject:message-id;
  bh=l4DUECnI8+UeqMU5aywEL1bC9tSsbxLiKzuzzkz/GIg=;
  b=XXSD9jG0/rhu4yrRQqZp8XsvMWWpx2zeB25HZn+09bwtc75hqQC/BR1C
   uL2qaJ0oGiARnkxOhO5WHj6BzvpyySKodBX9keM/5DfYVYg6U6qHCJHC5
   klIhuhLIVA6DgPG0QFDO2CwsDwxURGafPReFPncAMaRdSJRz+gwa0GEtr
   +TRjhYxj35UtPQC3lB54kgRFVgsH2ENjx8z2bnaXg03RIHQJoSZ/DQepI
   lrXRL7Tejc5PlePj8Ieh9zWGdkX+T6yJB+oKI/T9ayIXp1wq+BYPb+irA
   IaEqkOjG6SrQVXuwQJDNTrkOBfspqU9sI/XzaMhRhGv7Ki39+yyhEleLj
   A==;
X-CSE-ConnectionGUID: PaKwzsb1Q6yvLh8+U5bccA==
X-CSE-MsgGUID: g1pa00Z3TTq/PLLCdo3jrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80696329"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80696329"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:03:33 -0700
X-CSE-ConnectionGUID: 6ufKXxjdT8CMbCm5nThCAg==
X-CSE-MsgGUID: cLV1aCR4QSe4LbCVJu+BFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="267021734"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Apr 2026 04:03:30 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB9e4-000000003dY-0AGG;
	Fri, 10 Apr 2026 11:03:28 +0000
Date: Fri, 10 Apr 2026 19:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: drivers/remoteproc/imx_dsp_rproc.c:653:12: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202604101809.Gks0Zpaz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: a84a1e21c0678032f1185173f816cbb500a87877 remoteproc: imx_dsp_rproc: Fix multiple start/stop operations
date:   4 months ago
config: arm-randconfig-r132-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101809.Gks0Zpaz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101809.Gks0Zpaz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a84a1e21c067 ("remoteproc: imx_dsp_rproc: Fix multiple start/stop operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101809.Gks0Zpaz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/imx_dsp_rproc.c:653:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/imx_dsp_rproc.c:653:12: sparse:     expected void *va
   drivers/remoteproc/imx_dsp_rproc.c:653:12: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/imx_dsp_rproc.c:668:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *io_addr @@     got void *va @@
   drivers/remoteproc/imx_dsp_rproc.c:668:20: sparse:     expected void volatile [noderef] __iomem *io_addr
   drivers/remoteproc/imx_dsp_rproc.c:668:20: sparse:     got void *va

vim +653 drivers/remoteproc/imx_dsp_rproc.c

   646	
   647	static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
   648					   struct rproc_mem_entry *mem)
   649	{
   650		struct device *dev = rproc->dev.parent;
   651		void *va;
   652	
 > 653		va = ioremap_wc(mem->dma, mem->len);
   654		if (!va) {
   655			dev_err(dev, "Unable to map memory region: %pa+%zx\n",
   656				&mem->dma, mem->len);
   657			return -ENOMEM;
   658		}
   659	
   660		mem->va = va;
   661	
   662		return 0;
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
