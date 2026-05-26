Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2141C31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817877; cv=none; b=SdSyj5F+eguqyfis5/KClemcdDao+Os7lP6uc0kjtCipKlxctfpB133nD3K0GotjttPAYn8p5Hqr6+J74sk0rhp13UI/oHqoiBKwjL2i4LQF65bRWdkbSA9CrvRndPRkrxaxIvmvndz9ZP1DaOo51XgdAx0TCYy12u632LW3RSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817877; c=relaxed/simple;
	bh=4X09m26wDfK+8GeyTbmGfyHRrf5SSTl3PwU+s2LfjAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TT3iBg5nk2reYtFy9GTFB3J2CHBavcS0xnhx1oqM6/hOp9wDWRma1O76kMtgn6CvUyoI8H27P+w2fBtzSPjqE9UdO/qdSq36aJONzPT4gZZBX6o/vkUSeG7Vf+7jWyfD0q5HwYUxKaDDXEdbilTHvN0g5im2XvGGwCYSWYn2a4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnQUt+NZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnQUt+NZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779817876; x=1811353876;
  h=date:from:to:cc:subject:message-id;
  bh=4X09m26wDfK+8GeyTbmGfyHRrf5SSTl3PwU+s2LfjAg=;
  b=UnQUt+NZ0xHftAfXkdmpX48XWXOAIEsX2ZWiS9GfliSlP7Y5Podmh7iS
   nbFXHKNA1s9WlQ7fpt2S1k+4lX7ceM2KAHyN2O7nwPMipz2qJSSXGkIBm
   1eQQLFVljlISkS+t5x3rTl+GRZCXRj+0ymxHuAPV8AGmVopmjEM9DlLjr
   2wyR5LdTah3Dc9z1QZ+jMISH4IO+nF1+JM9hp+P/IXhbgY4PKr5LoUSvf
   Khz3Y7Dv8SFIs9Gm+Z3WnE2xFQieK2tkPmhtxwB/sSF51u4i0AcO3fooD
   W9NsHnOxr5sTTZj8Von6llGaUCh669+iAq94MnBAIa1zzmftqRPMjO6fZ
   A==;
X-CSE-ConnectionGUID: LEKd3uOXSri1MwoD+7nhdA==
X-CSE-MsgGUID: /Ll1esydQruP7YAhoz9ZVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83219495"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="83219495"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:51:14 -0700
X-CSE-ConnectionGUID: sfULZ6eSQFG8007QP9eVnw==
X-CSE-MsgGUID: i5d7lskIQwuZ/ZQptp+2Gw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 May 2026 10:51:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRvvq-000000002t6-1Jkt;
	Tue, 26 May 2026 17:51:10 +0000
Date: Wed, 27 May 2026 01:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Timo Alho <talho@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>
Subject: [jonhunter:tegra/next-fixes 5/15]
 drivers/clk/tegra/clk-bpmp.c:373:62: warning: '%d' directive output may be
 truncated writing between 1 and 11 bytes into a region of size between 0 and
 39
Message-ID: <202605270149.KtjT0Beq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   481d5480de40f0d03543c40ecf3f52fc9eee6dc8
commit: 02d423743ae213a112604e7de6d52fcf3cd4d26c [5/15] clk: tegra: Support unique names for multi-socket platforms
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260527/202605270149.KtjT0Beq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270149.KtjT0Beq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270149.KtjT0Beq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/tegra/clk-bpmp.c: In function 'tegra_bpmp_clk_get_info':
>> drivers/clk/tegra/clk-bpmp.c:373:62: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 39 [-Wformat-truncation=]
     373 |                 snprintf(info->name, sizeof(info->name), "%s.%d",
         |                                                              ^~
   drivers/clk/tegra/clk-bpmp.c:373:58: note: using the range [-2147483648, 2147483647] for directive argument
     373 |                 snprintf(info->name, sizeof(info->name), "%s.%d",
         |                                                          ^~~~~~~
   drivers/clk/tegra/clk-bpmp.c:373:17: note: 'snprintf' output between 3 and 52 bytes into a destination of size 40
     373 |                 snprintf(info->name, sizeof(info->name), "%s.%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     374 |                          response.name, dev_to_node(bpmp->dev));
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
 > 373			snprintf(info->name, sizeof(info->name), "%s.%d",
   374				 response.name, dev_to_node(bpmp->dev));
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
