Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898732066E6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041720; cv=none; b=cYIiWVjjGah4e7AubEhY4MSiEA6UVkbCnQloIAVT0c/RdhwUXTXr+ZuElpirY7drMFFeEXtgCNi3FTRbCKfx8MeAuwhDIrsaxTo4/TZ3euWf2pfdWky9GT/jtcCiVobNGqHgb3T+Ysq805eUsfhFvHERNDFc9Yiguy9KLzFzhXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041720; c=relaxed/simple;
	bh=2PRSDaOTD+b7WmHObyjPK75/SWgrji7vEkAc/jeP/Js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pfd15UApMXuI16CO3IhkKePD6m4EYDzrTw1vgKgWa33ZOTRmJ4uLIDPtxuqEqBqIzucnkP5y+r9tFHQpET1wu/lH2SPEOpJAO+W44/1JkShM0+A8fQDbXGpB2JdeLXU8BflvzNcZOQDKRVY11QlLKh/5XF6n88K7u11ZhLRjrmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEJF/A/a; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEJF/A/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744041718; x=1775577718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2PRSDaOTD+b7WmHObyjPK75/SWgrji7vEkAc/jeP/Js=;
  b=AEJF/A/a/py8prKKhPrRfC/Uwdct8ktqS3+yJScE3uj94dsFFhoUTI8w
   LyIwtbC6Nxptyaor0hDpebo/YUNGGg/m2dS4izIVVn3N91YRlsa5PB7xs
   2UKIWBoRinmphUadO1HBgi2z7js7uzueoyjykDPsmiIdeRV1/ENNNKC5L
   tDwGoyfmkmQySPltA7x99shoE6Mz1NvmjqMBusIo07n6Ai8T5F38eVpbg
   EqpbsjniPvPeYMBUv05M9pRIHGxE/pVa6VftgZ5Jb17DrxgcKeY+aBysB
   PwZJ2qS5q2HrdbFmjZLU2Hng7AbIBsdfYSHUzav2KNkpYcbDFFIU6Qkw1
   w==;
X-CSE-ConnectionGUID: s3d1U2U8SIOAdM+Xgza84Q==
X-CSE-MsgGUID: fDfOTLmcSAmszjw/K8dzEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45325980"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45325980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:01:57 -0700
X-CSE-ConnectionGUID: gfsaiwj7QfKGHodahrAJ8Q==
X-CSE-MsgGUID: xMQ9sIZUSD27kZmX1izvqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128527711"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Apr 2025 09:01:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1ov3-0003Z3-1y;
	Mon, 07 Apr 2025 16:01:53 +0000
Date: Tue, 8 Apr 2025 00:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [linux-next:master 602/1199]
 drivers/cpufreq/sun50i-cpufreq-nvmem.c:229:20: sparse: sparse: cast to
 restricted __le32
Message-ID: <202504072322.EwPvc4ch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
commit: 1efdea0517384d30316acdfb006c0650804dc2ff [602/1199] cpufreq: sun50i: prevent out-of-bounds access
config: riscv-randconfig-r111-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072322.EwPvc4ch-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce: (https://download.01.org/0day-ci/archive/20250407/202504072322.EwPvc4ch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072322.EwPvc4ch-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/cpufreq/sun50i-cpufreq-nvmem.c:229:20: sparse: sparse: cast to restricted __le32

vim +229 drivers/cpufreq/sun50i-cpufreq-nvmem.c

   184	
   185	/**
   186	 * sun50i_cpufreq_get_efuse() - Determine speed grade from efuse value
   187	 *
   188	 * Returns non-negative speed bin index on success, a negative error
   189	 * value otherwise.
   190	 */
   191	static int sun50i_cpufreq_get_efuse(void)
   192	{
   193		const struct sunxi_cpufreq_data *opp_data;
   194		struct nvmem_cell *speedbin_nvmem;
   195		const struct of_device_id *match;
   196		struct device *cpu_dev;
   197		void *speedbin_ptr;
   198		u32 speedbin = 0;
   199		size_t len;
   200		int ret;
   201	
   202		cpu_dev = get_cpu_device(0);
   203		if (!cpu_dev)
   204			return -ENODEV;
   205	
   206		struct device_node *np __free(device_node) =
   207			dev_pm_opp_of_get_opp_desc_node(cpu_dev);
   208		if (!np)
   209			return -ENOENT;
   210	
   211		match = of_match_node(cpu_opp_match_list, np);
   212		if (!match)
   213			return -ENOENT;
   214	
   215		opp_data = match->data;
   216	
   217		speedbin_nvmem = of_nvmem_cell_get(np, NULL);
   218		if (IS_ERR(speedbin_nvmem))
   219			return dev_err_probe(cpu_dev, PTR_ERR(speedbin_nvmem),
   220					     "Could not get nvmem cell\n");
   221	
   222		speedbin_ptr = nvmem_cell_read(speedbin_nvmem, &len);
   223		nvmem_cell_put(speedbin_nvmem);
   224		if (IS_ERR(speedbin_ptr))
   225			return PTR_ERR(speedbin_ptr);
   226	
   227		if (len <= 4)
   228			memcpy(&speedbin, speedbin_ptr, len);
 > 229		speedbin = le32_to_cpu(speedbin);
   230	
   231		ret = opp_data->efuse_xlate(speedbin);
   232	
   233		kfree(speedbin_ptr);
   234	
   235		return ret;
   236	};
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
