Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB943C156
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723485635; cv=none; b=uFBlKNefUCLPla7XjqgC4PFSmujCTtQcIh5HbcQElfusD0NpFGIyzhMwOnjdqVeXgd0c9Jdv4oOC1SSHXZD/4PSR0xzTvVueI4dz69LtOGT54kvyLFpKmalHs95/K62lJzBhSN5TR6z8z1ND2yKPffvqTsV09/839NpHGgcvm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723485635; c=relaxed/simple;
	bh=GcQ3pmQgUgo33G+RQPdGhY+H6RisyT3MltILk5P24vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I71DtwAiEEzDxBFhaPrxTaxSo5AGjx5QyBf/wdLWo2S3OZlfRE6F1SRdyh0aq+H1NEPfhl6Fioul632yWObWA6zjRhA3P90jcCNrev6qDD09vWr6BiyZMfVyRJnuVTMCPCgxSqTcGZqoEus7cNUXVTxNjWAur2pI6ctfmVeQ0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ts5vU1aK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts5vU1aK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723485634; x=1755021634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GcQ3pmQgUgo33G+RQPdGhY+H6RisyT3MltILk5P24vw=;
  b=Ts5vU1aKREtMTs1zaRrF5i9BsR/4MBevMQbFbY2sMNwKHMAUus2NoOmx
   UEc+QX62jbNzvQgFXH9Ru0GQ+FEt35Ww8ePKHiZNeqBGgV+o0HVSGNoC8
   yx/0UAAZ0Yje+HVU4xLFsLWjotC7RvtqiqN14xwhLtxy7VE0jQt3T2GEU
   MK58thFhuk70mHPMcyLU2vtzg4LDcxhtaZTkRFnB779n5rBIl/qsM8OMA
   GP4u5tjy6K75vFztOFwL7/XTvwNGfnxTN0T1LsQQAcMuQWH0RRFn8T7vy
   udYuWjYb6JwTHnOJnnwQ3EkjJwyuBLgfJKYd8IzJ1Gr++H/36eennrzgZ
   Q==;
X-CSE-ConnectionGUID: ktjeon/DTeG5Trr//TiLgg==
X-CSE-MsgGUID: 2ikhY/lZS8CpG/gz+Yfl0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21420709"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21420709"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 11:00:33 -0700
X-CSE-ConnectionGUID: mUE+uA3CR8W/7kQ2RMEtXg==
X-CSE-MsgGUID: WaI5wNcDTGCVKXOWte2SHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="62998891"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2024 11:00:32 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdZLJ-000C2j-27;
	Mon, 12 Aug 2024 18:00:29 +0000
Date: Tue, 13 Aug 2024 01:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pic64gx 16/24] ld.lld: error: undefined symbol:
 divider_determine_rate
Message-ID: <202408130124.RaNiY6Ox-lkp@intel.com>
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
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240813/202408130124.RaNiY6Ox-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130124.RaNiY6Ox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130124.RaNiY6Ox-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: divider_determine_rate
   >>> referenced by clk-regmap.c
   >>>               drivers/clk/microchip/clk-regmap.o:(clk_regmap_div_determine_rate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: divider_get_val
   >>> referenced by clk-regmap.c
   >>>               drivers/clk/microchip/clk-regmap.o:(clk_regmap_div_set_rate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_mux_determine_rate_flags
   >>> referenced by clk-regmap.c
   >>>               drivers/clk/microchip/clk-regmap.o:(clk_regmap_mux_determine_rate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_mux_index_to_val
   >>> referenced by clk-regmap.c
   >>>               drivers/clk/microchip/clk-regmap.o:(clk_regmap_mux_set_parent) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
