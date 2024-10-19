Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769411DE4EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 08:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327352; cv=none; b=p9OyfU/CTbMzO6EuuWorwSC0eTXpX9164bYUE94aSokuLt+xIDyEpmsqhbP/ZsrW6mWIfMWobT9B+C5dL1GLhehKgp157LcKQ2BxkBlHDm+FSx4dyGkTan6HG4TVPQKlovlKp75kAJrQ7h/+MEOGci6JEN+nROOk9Klofx4o51I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327352; c=relaxed/simple;
	bh=bWxXq0+Qvw3qjgJWbe+YYj6d9dR0Pr/vZgcpNDNsW9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LIDJCDOks2F40314lqZOWaXktDo3NSd3bGIRaTiRoSpNdbZZV2orBNYvTPnqv94WhjTELZmHpCMF0mUyZqG4z24qTimANjpNuiWDzLTvNiNgmxsgtgx1kAJHejvhOq4Phn4zw62jkOXLzKMbh7WouzMb8Geuh4MjTgQ1b3gbd7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFkmxd9K; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFkmxd9K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729327351; x=1760863351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWxXq0+Qvw3qjgJWbe+YYj6d9dR0Pr/vZgcpNDNsW9o=;
  b=CFkmxd9KF4OKHvffa28X7D51PBB26yU5PnYnfl467XudpwIAETbbDyhq
   +MVtt2xO5qZOzHOoBGMF6UCbc37JyDppYAVSJ6FQdPkqrhPNbu0ZOe6hP
   NeT5an84tBNN9Bnjn+Wjou3hKhmy7g75psOxAbx+6RthCd6Mk3oRbR3MQ
   byTMQfJaBDci6lctmVl25W3vDqehiz2hA8Zj1tThXoqcaZkVWj4zmiLsc
   N2JlQ/MQXno9pvB48LusDijw2rW8oBiq5Mq51p/18kz+rcvASuMHVbYJ0
   16KQFXwGneXlwnyFfNSINGZR5ipaAOr/wGoLmaUreUy0kKoHLri61Imta
   Q==;
X-CSE-ConnectionGUID: 5eLr/Y7UT7q2wt1BVdltdA==
X-CSE-MsgGUID: a0mClYxBRqG6OlrRO94szw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32546688"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32546688"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 01:42:28 -0700
X-CSE-ConnectionGUID: oeXhLpbHScSQUHo0N4DQjw==
X-CSE-MsgGUID: xxf6Y60ATEKg3JtLc8BBPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="84135978"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2024 01:42:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t252W-000Opj-07;
	Sat, 19 Oct 2024 08:42:24 +0000
Date: Sat, 19 Oct 2024 16:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Shravan Kumar Ramani <shravankr@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	David Thompson <davthompson@nvidia.com>
Subject: drivers/platform/mellanox/mlxbf-pmc.c:1172:14: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202410191601.5pf9Y9Iw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: 423c3361855c1e81f1cb91728a2ac5ddfd2cbf16 platform/mellanox: mlxbf-pmc: Add support for BlueField-3
date:   1 year, 1 month ago
config: arm64-randconfig-r133-20241018 (https://download.01.org/0day-ci/archive/20241019/202410191601.5pf9Y9Iw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241019/202410191601.5pf9Y9Iw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191601.5pf9Y9Iw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/mellanox/mlxbf-pmc.c:1172:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/platform/mellanox/mlxbf-pmc.c:1172:14: sparse:     expected void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1172:14: sparse:     got void [noderef] __iomem *
>> drivers/platform/mellanox/mlxbf-pmc.c:1174:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/platform/mellanox/mlxbf-pmc.c:1174:31: sparse:     expected void [noderef] __iomem *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1174:31: sparse:     got void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1186:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/platform/mellanox/mlxbf-pmc.c:1186:32: sparse:     expected void [noderef] __iomem *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1186:32: sparse:     got void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1194:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/platform/mellanox/mlxbf-pmc.c:1194:14: sparse:     expected void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1194:14: sparse:     got void [noderef] __iomem *
   drivers/platform/mellanox/mlxbf-pmc.c:1198:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/platform/mellanox/mlxbf-pmc.c:1198:32: sparse:     expected void [noderef] __iomem *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1198:32: sparse:     got void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1415:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/platform/mellanox/mlxbf-pmc.c:1415:14: sparse:     expected void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1415:14: sparse:     got void [noderef] __iomem *
   drivers/platform/mellanox/mlxbf-pmc.c:1417:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/platform/mellanox/mlxbf-pmc.c:1417:31: sparse:     expected void [noderef] __iomem *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1417:31: sparse:     got void *addr
   drivers/platform/mellanox/mlxbf-pmc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +1172 drivers/platform/mellanox/mlxbf-pmc.c

  1163	
  1164	/* Method to handle crspace counter programming */
  1165	static int mlxbf_pmc_program_crspace_counter(int blk_num, uint32_t cnt_num,
  1166						     uint32_t evt)
  1167	{
  1168		uint32_t word;
  1169		void *addr;
  1170		int ret;
  1171	
> 1172		addr = pmc->block[blk_num].mmio_base +
  1173			(rounddown(cnt_num, 2) * MLXBF_PMC_CRSPACE_PERFSEL_SZ);
> 1174		ret = mlxbf_pmc_readl(addr, &word);
  1175		if (ret)
  1176			return ret;
  1177	
  1178		if (cnt_num % 2) {
  1179			word &= ~MLXBF_PMC_CRSPACE_PERFSEL1;
  1180			word |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFSEL1, evt);
  1181		} else {
  1182			word &= ~MLXBF_PMC_CRSPACE_PERFSEL0;
  1183			word |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFSEL0, evt);
  1184		}
  1185	
  1186		return mlxbf_pmc_write(addr, MLXBF_PMC_WRITE_REG_32, word);
  1187	}
  1188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
