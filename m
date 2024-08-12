Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8F17967F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723489312; cv=none; b=qiULk3FzIt5aE7Cl5o2ixwovKpCJCyBzy5t7EYNjbmbWEBLpDlUSH2GfGhOsBLUNjNzArdfwg4Ux99Fez2/6zjLGx52G1OW7Qd3V1Owf9J22JbEdcb/6/1SezsUf0C5NX4eMVVqq4yR+frUljxozeqxyHuUHzz5hCT4j2B/X19I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723489312; c=relaxed/simple;
	bh=WH1qjcedajJg4fAlnZMDulZSQdpOkUq2iqqpEQSrpBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VYz0gt+ciVAEHZQ26OjNNJYsdVFnHXm1SfhrNnsP/lAR8q8cWNbtSqoXZvtS7NjR0c2/aMexWZ+20s4Za3JDo1B/FGOwdIWAyliCNfMeDMruD43W/FpJmIbFz/z9Axv93gkvi46nwyGfIHSKYeotigxhHEb49cI01tFB/cW7y1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iba17LAi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iba17LAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723489311; x=1755025311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WH1qjcedajJg4fAlnZMDulZSQdpOkUq2iqqpEQSrpBo=;
  b=iba17LAiM5xZiDIdJkYIz92TpA0K6fdj66/jmc5nK+fcGg9GrtDvCjVG
   ahNPkuSmqYDC7B32UzFBVpQeFCpeo6OPcygbzO9yHmIY8ivMpAqrJqzwB
   xN8csRrgTVY8CGVdeBEy3+MKrFqhjUyPqhkflgQUliYIrNRHm1T2S1DQF
   zs8l/8ritxtLBadt0sCUhWVO+j6tUTj9U37kIKjCmf1uZvc8CZ269SRs2
   g4iE1874P4tWQPkzbwFSoVXkm5sKH3HxNqJBz3SdAth4n4/zXkRE7A/TT
   W3nIoLk8QkK7g3suVUa4EIOTFoOUzf5IATJyzuXosQdy06NvwI/o/gM9w
   A==;
X-CSE-ConnectionGUID: muOjWr2uQ1qFYJVty2SONg==
X-CSE-MsgGUID: hmXLCnt0T8aI95WNpgMtfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39133851"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="39133851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 12:01:50 -0700
X-CSE-ConnectionGUID: HLGx6L2QQUK/7fN+mY77vA==
X-CSE-MsgGUID: IxuuvJ9MQkuaU/YxHnd6fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58019170"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2024 12:01:49 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdaId-000C5P-10;
	Mon, 12 Aug 2024 19:01:47 +0000
Date: Tue, 13 Aug 2024 03:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pic64gx 16/24] clk-regmap.c:undefined reference to
 `divider_ro_determine_rate'
Message-ID: <202408130208.dAYsrig1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pic64gx
head:   0f5d55e6ec0ab7dcbcf6f46c778dc4efcf6832dc
commit: c65c4e4aca500c1573d937b39a5c80f05234f0c0 [16/24] copy meson clk-regmap for now
config: i386-buildonly-randconfig-001-20240813 (https://download.01.org/0day-ci/archive/20240813/202408130208.dAYsrig1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130208.dAYsrig1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130208.dAYsrig1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/clk/microchip/clk-regmap.o: in function `clk_regmap_div_set_rate':
   clk-regmap.c:(.text+0x140): undefined reference to `divider_get_val'
   ld: drivers/clk/microchip/clk-regmap.o: in function `clk_regmap_div_determine_rate':
>> clk-regmap.c:(.text+0x248): undefined reference to `divider_ro_determine_rate'
>> ld: clk-regmap.c:(.text+0x27c): undefined reference to `divider_determine_rate'
   ld: drivers/clk/microchip/clk-regmap.o: in function `clk_regmap_div_recalc_rate':
   clk-regmap.c:(.text+0x31a): undefined reference to `divider_recalc_rate'
   ld: drivers/clk/microchip/clk-regmap.o: in function `clk_regmap_mux_get_parent':
   clk-regmap.c:(.text+0x3ac): undefined reference to `clk_mux_val_to_index'
   ld: drivers/clk/microchip/clk-regmap.o: in function `clk_regmap_mux_determine_rate':
   clk-regmap.c:(.text+0x3db): undefined reference to `clk_mux_determine_rate_flags'
   ld: drivers/clk/microchip/clk-regmap.o: in function `clk_regmap_mux_set_parent':
   clk-regmap.c:(.text+0x409): undefined reference to `clk_mux_index_to_val'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
