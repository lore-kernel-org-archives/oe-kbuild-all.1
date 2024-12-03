Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B081DFDB7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212924; cv=none; b=aWgQTk0Fm4OB2cKv2kwhZywfMy1f1biafekXykFAMYz+vmKI7/zbZl8tCHygAZ4nY7DBQ2n2Rda4AP8MvvBXhkr9jszlBSbzNMd6bzvVZ0gWoWsuQ0TFbP4688F53yrNCeBEgZ8cuvwmIhBoGCzpMdZ8/m/m0b4bwwO2QAkEcCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212924; c=relaxed/simple;
	bh=yrTiH58SBk67hOQIf8TbASdcT8ZQv+oKPkHzhsgOLQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PShTYTytWudTUo8Kj/sGEeyGD5NCoSW22IkhTK2NWbxqnTw9eaP4sLU5xAORzgU62EyyDHaoNgevuNECWnfjCRIE8hViOFtPgbPsz5RDCD7WMjBYMVzIaGlmIckLkljbR2KP+jWrmxaSm3E9z+3rvy7TSm8WyKer2bXEgZzNgug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKYTsWVC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKYTsWVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733212923; x=1764748923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrTiH58SBk67hOQIf8TbASdcT8ZQv+oKPkHzhsgOLQ8=;
  b=LKYTsWVCfBvrG1TEhQVXQCpDO+c21d84vxPojDSYdbZDmj5h0Wobag7O
   iQ2FYQGLUCDE9rf2Fkhw/cubkgnbrrorq0YrITf5/vNoTZ8duZIQp7AHN
   2XdfijUSn5tXBBscIGhM5rLoMWsz28vf2Pa9jXEbwzMlzrPFft9B7OTJX
   p/dQkWmJ42BfoP3X1SLx5YDAGgzitD85/Uo8F02RapgCSKMpwJ89QhHWk
   9AJ5FPeLq8S1u9kV0rwhlIc4SgcMXuwog7ZFcFcd0g/nQHKJAyyCwZkMI
   04bExrEkL/blr2pi1XxTHYI5Hjq5JaOijGUH0l4tWffNLrLtEmvykWUPB
   g==;
X-CSE-ConnectionGUID: nBmwlRCZQoS9KieBC649Cg==
X-CSE-MsgGUID: VfGUx+0qR5m3H+Q1snaJIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44079172"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44079172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:02:02 -0800
X-CSE-ConnectionGUID: TOqXueqATRCZcTN1PHEaWg==
X-CSE-MsgGUID: rU5+6HiRR6yooe03GUD38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98364763"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2024 00:02:02 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINr5-0000KH-1G;
	Tue, 03 Dec 2024 08:01:59 +0000
Date: Tue, 3 Dec 2024 16:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 3/6] ld.lld: error: undefined symbol:
 __tracepoint_cros_chown_common_exit
Message-ID: <202412031508.3IdslOb8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   5364f3daf83cf23c2954c705695dac08704ca501
commit: 63100bdb333adae1618a0bc1513bd90d57383c9b [3/6] UPSTREAM: arm64: dts: mt8195: Fix dtbs_check error for mutex node
config: arm64-randconfig-004-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031508.3IdslOb8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031508.3IdslOb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031508.3IdslOb8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tracepoint_cros_chown_common_exit
   >>> referenced by open.c
   >>>               fs/open.o:(__jump_table+0x48) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
