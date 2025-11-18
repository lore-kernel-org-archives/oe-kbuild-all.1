Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143E1DA55
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 02:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763432362; cv=none; b=l54jVtFIrBFwxDpNImI/am7Il/0cYfOgcWUTLrxKT7YozTbXwJgPbVBGK7CfUUs96NvmZi5QKEsj3EiNG6y0fSqzyqd3Bhr4wnILReNzWjlw69yn2sdVbCoqdXJsMN7g5snYU5JF3NPR0d0M7VWXRFxHYTUtoohPqLFkY8HbdUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763432362; c=relaxed/simple;
	bh=wEbKpVi2B7UWX5Nmb0V4fQvc/4BNhiqYMt00e0ROHas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VeyCjOjoVuTjVa+pDM1LSbXb4PyjfGOE9GwiK61ODcRNaSVkwqaOyYY1078AEs0hJsiXSzVEsfJhifcg64QXEKeoG1Qray+uqiafdBj0HlGr4JwITG3xWxSPZhc1vMMmQW1cdi4v7RX/8UOHLlFy6E6d0YIyXKNS6JIcsDYTef8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJlLNjJf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJlLNjJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763432360; x=1794968360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wEbKpVi2B7UWX5Nmb0V4fQvc/4BNhiqYMt00e0ROHas=;
  b=FJlLNjJfC+G5ZnPmy+TZY5T514BFxyn8yIVatDUDbHq6hDCeN2gYJvT0
   XfYs+d0N7iArsRC+tqDCA4nfFa07508V2a2NYXFCKiwP2+RBZAIsLstf8
   Ka0nvwBEAIgS7Nd91iBtVqarQ3ADwjDsXMwpPFgXUf8wazID52kn0wl12
   aBNaqs2OQa/C61BXlQLT10HLDPyu3rveT5cAj6PCiyo8F0Gxx2ybIfwNS
   z2CfcuUq3HPPJMuCK7P4MV3MtH1nCM8kI44miTUnMl+m0tcWgth2d17NK
   mXt42DMqQDKGA9rFKEBxLvIvVVcg+INlysJuZBigmVe1o9RDF5kL3nvd8
   g==;
X-CSE-ConnectionGUID: ayHdH/GMRB6tiO2UquCLcA==
X-CSE-MsgGUID: J5zdoCu/T5SQRJmPvInrdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64645595"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="64645595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 18:19:19 -0800
X-CSE-ConnectionGUID: U79XHX06QPi7iG5Op1ySQg==
X-CSE-MsgGUID: 064f8HcaRgqoqRfS9JP7cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="190423855"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Nov 2025 18:19:18 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLBJM-0001FT-19;
	Tue, 18 Nov 2025 02:19:16 +0000
Date: Tue, 18 Nov 2025 10:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-12-sparrow-hawk 22/38]
 drivers/media/platform/renesas/rcar-isp/core.c:794:30: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202511181020.PxfGORfW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-12-sparrow-hawk
head:   11f217b1fe4a19683c22731f4ac67c682bb96bde
commit: 5f5046abae4620e2209def6367c4917313dce94d [22/38] media: rcar-isp: Add support for ISPCORE
config: powerpc64-randconfig-r112-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181020.PxfGORfW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181020.PxfGORfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181020.PxfGORfW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/renesas/rcar-isp/core.c:794:30: sparse: sparse: Using plain integer as NULL pointer
   drivers/media/platform/renesas/rcar-isp/core.c:444:13: sparse: sparse: context imbalance in 'risp_core_svspx_frame_end' - wrong count at exit
   drivers/media/platform/renesas/rcar-isp/core.c:612:20: sparse: sparse: context imbalance in 'risp_core_irq' - wrong count at exit

vim +794 drivers/media/platform/renesas/rcar-isp/core.c

   782	
   783	int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
   784			    void __iomem *csbase, struct reset_control *csrstc)
   785	{
   786		int ret;
   787	
   788		core->dev = &pdev->dev;
   789		core->csrstc = csrstc;
   790		core->csbase = csbase;
   791	
   792		ret = risp_core_probe_resources(core, pdev);
   793		if (ret) {
 > 794			core->base = 0;
   795			return ret;
   796		}
   797	
   798		ret = v4l2_device_register(core->dev, &core->v4l2_dev);
   799		if (ret)
   800			return ret;
   801	
   802		ret = risp_core_create_subdev(core);
   803		if (ret)
   804			return ret;
   805	
   806		mutex_init(&core->io_lock);
   807		spin_lock_init(&core->lock);
   808		INIT_LIST_HEAD(&core->risp_jobs);
   809	
   810		return 0;
   811	}
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
