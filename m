Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAECF3346B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 May 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780237122; cv=none; b=ZT44wmL5ggydj3oPn0obvJZpFnTO2O7qVx8serSNS4YbCy++fZ29dHj4BnN1uoPtLWoZMEERNnhieQWQajElTTVerLEHIPy8gX9gflSJAL26ESEomthqOzr5l+3yHYHAr5Tlv/2dUlN6xEt17uVrinpp0IbAu92OhDd8vUSlmnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780237122; c=relaxed/simple;
	bh=6Y0/dl0n64w4a3Lz9fCIOWOpMpFz4N6hfZiQtsP00HQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iE5IPic3SNuSn4yWo4AM9ccj+bL1VyR63+orblvtAeItwb61TgLhVhl3lXNid4gpoBpa2QWx01e1eBiNo4X+pqzTeq0AfFJxpJySYlVo430pAP8B1vZWTjW/O6HFFC2VwkLN8hm6AeuidmnUlPF2LfwOmj2pq42oR3N0qgd1sYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M66hZ9PK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M66hZ9PK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780237120; x=1811773120;
  h=date:from:to:cc:subject:message-id;
  bh=6Y0/dl0n64w4a3Lz9fCIOWOpMpFz4N6hfZiQtsP00HQ=;
  b=M66hZ9PKEtQ5KZyy6VGmv88WLsNBWlN+wS0/v3wnP+cAeUt9Kpno44VM
   HIR5NoS3MvFjfARIPU8MC+kbsbHBjNOTWaeIQbLfktWVVUblizEJA2mi1
   9nToQ9jtjie3Rdc9AeBWsOwVi3hkojQmw0rhNT4NcimzWAxBcAsAHyC/L
   CQ+8UY3Hs3jhT7hWC2pnf4ZaLQ2qk52v581T+n50A4ZS640S+3VvG/xOb
   l+jgYGE1SR/49/arC/rYNj9WdRe01fU64hfUBgA+rmbH3cZMox+ruRm72
   qGKV9RvIqZrmfE7bVV7TBtIImcNeitWWI8dGGQVS3by8xwNP/kfYn68he
   A==;
X-CSE-ConnectionGUID: 9BganXf4Tlyk/ahDZRA9Qg==
X-CSE-MsgGUID: JbsXeLLHQ0iBwHB9F1IVag==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84639021"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="84639021"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 07:18:39 -0700
X-CSE-ConnectionGUID: qK6EdkcJQb6Z/9pBfU4H+g==
X-CSE-MsgGUID: /Yh560bfRHGilTW4xj+/9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="238921823"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 May 2026 07:18:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTgzr-000000009UM-2Lr7;
	Sun, 31 May 2026 14:18:35 +0000
Date: Sun, 31 May 2026 22:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Timo Alho <talho@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>
Subject: [jonhunter:tegra/next-fixes 5/24]
 drivers/clk/tegra/clk-bpmp.c:373:62: warning: '%s' directive output may be
 truncated writing up to 39 bytes into a region of size between 28 and 38
Message-ID: <202605312211.QMin2ACt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   bbc9d83793001800cd9fd2e531bf692526351dcb
commit: a4050db6c37daf99cf1df1ddc6f16f0a373ee7c2 [5/24] clk: tegra: Support unique names for multi-socket platforms
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260531/202605312211.QMin2ACt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605312211.QMin2ACt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605312211.QMin2ACt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/tegra/clk-bpmp.c: In function 'tegra_bpmp_clk_get_info':
>> drivers/clk/tegra/clk-bpmp.c:373:62: warning: '%s' directive output may be truncated writing up to 39 bytes into a region of size between 28 and 38 [-Wformat-truncation=]
     373 |                 snprintf(info->name, sizeof(info->name), "%d-%s",
         |                                                              ^~
     374 |                          dev_to_node(bpmp->dev), response.name);
         |                                                  ~~~~~~~~~~~~~
   drivers/clk/tegra/clk-bpmp.c:373:17: note: 'snprintf' output between 3 and 52 bytes into a destination of size 40
     373 |                 snprintf(info->name, sizeof(info->name), "%d-%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     374 |                          dev_to_node(bpmp->dev), response.name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +373 drivers/clk/tegra/clk-bpmp.c

   351	
   352	static int tegra_bpmp_clk_get_info(struct tegra_bpmp *bpmp, unsigned int id,
   353					   struct tegra_bpmp_clk_info *info)
   354	{
   355		struct cmd_clk_get_all_info_response response;
   356		struct tegra_bpmp_clk_message msg;
   357		unsigned int i;
   358		int err;
   359	
   360		memset(&msg, 0, sizeof(msg));
   361		msg.cmd = CMD_CLK_GET_ALL_INFO;
   362		msg.id = id;
   363		msg.rx.data = &response;
   364		msg.rx.size = sizeof(response);
   365	
   366		err = tegra_bpmp_clk_transfer(bpmp, &msg);
   367		if (err < 0)
   368			return err;
   369	
   370		if (dev_to_node(bpmp->dev) == NUMA_NO_NODE)
   371			strscpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
   372		else
 > 373			snprintf(info->name, sizeof(info->name), "%d-%s",
   374				 dev_to_node(bpmp->dev), response.name);
   375	
   376		info->num_parents = response.num_parents;
   377	
   378		for (i = 0; i < info->num_parents; i++)
   379			info->parents[i] = response.parents[i];
   380	
   381		info->flags = response.flags;
   382	
   383		return 0;
   384	}
   385	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
