Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096483537CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 09:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488941; cv=none; b=GUBVaM3Pc7sfDII4s1swPMS803CSaNc0FEJPmi+1kMTSfX1OBIdsQbA1SMCQ1K1xmwkZH/Rsd1bQJrQ070rdtCDtT6Te9I8tncX7R4ff5r0XYzAJNwvs0SFro0J2kjbc2X4yb5HNamys3YcljxcmQ0C0mxNZB+gYjMcds/nDqL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488941; c=relaxed/simple;
	bh=/63cRkw0FVjM82j1xBjyLhgnyUV9vT9TZOLJxQgsKKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GCAPL71Rrqk7ImopyaA7eTl2KHMNMaAhK1hOHNVOKXhhMg5j6zbJyNrmAjvcTkb3mJcXsjiXnIp81XuiFVFjbUSUnUgMltKbh4lneKDSiTziTQ52bZPCGSxJjz6OHgRyxXi/W0N6V2DTiV5K5nxhjgZqhyYKsgIDzuUaEauIGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1TMGJCu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1TMGJCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785488939; x=1817024939;
  h=date:from:to:cc:subject:message-id;
  bh=/63cRkw0FVjM82j1xBjyLhgnyUV9vT9TZOLJxQgsKKs=;
  b=k1TMGJCuMBn5zDhdYeUp7KJOfU1zIcz8lRNk2zI/+BfCQy4lGsWE1NNF
   z415+Ok7kPdnfLgoa/SC+3GU107u6YxioJW+SC2QbIRfHnH5Ls/nIOBB/
   3v7dQgS4r2+wjFd38Qk5W1c0Rtb6nrJk9QNDdGQSwUeVPqw1QarwwtJIP
   +QJBKTYFYu05Gk5UMjIBn/Xpvpv6foQs8j2LRfwBhNavuPwu9f3MUhzR3
   UctC4tRKN0dvAqWv0wgjGs9gGawba057cJIIAcQD0y25M0S5no/Bb1V76
   0xJYVTec2CtOOnHx15KVaaqkTaLbvdUedQ0Agul/lu5AHj6wIVjY713FK
   Q==;
X-CSE-ConnectionGUID: IHNNKVz6Rb6bOEL/TU1kNQ==
X-CSE-MsgGUID: SCWFvA3qT8mkKDX7BcLdXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88646226"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="88646226"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:08:58 -0700
X-CSE-ConnectionGUID: CfUF/JnESzOIJqu5nwW3ag==
X-CSE-MsgGUID: 1yfcu3aORwGp4fZ5NViaGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="259288765"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jul 2026 02:08:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpjEc-000000000Q9-3LpF;
	Fri, 31 Jul 2026 09:08:54 +0000
Date: Fri, 31 Jul 2026 17:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 10/700]
 drivers/clk/mstar/clk-msc313-clkgen-ssd210.h:64:39: warning: 'ssd210_data'
 defined but not used
Message-ID: <202607311657.FmkV48Xj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 118ab59cba575cb2ce4bc2ea0dd970d23987ec2f [10/700] dt-bindings: clkgen header
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311657.FmkV48Xj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311657.FmkV48Xj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311657.FmkV48Xj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/mstar/clk-msc313-clkgen.c:526:
>> drivers/clk/mstar/clk-msc313-clkgen-ssd210.h:64:39: warning: 'ssd210_data' defined but not used [-Wunused-const-variable=]
      64 | static const struct msc313_muxes_data ssd210_data = MSC313_MUXES_DATA(ssd210_muxes);
         |                                       ^~~~~~~~~~~
   In file included from drivers/clk/mstar/clk-msc313-clkgen.c:524:
>> drivers/clk/mstar/clk-msc313-clkgen-msc313.h:141:39: warning: 'msc313_data' defined but not used [-Wunused-const-variable=]
     141 | static const struct msc313_muxes_data msc313_data = MSC313_MUXES_DATA(msc313_muxes);
         |                                       ^~~~~~~~~~~


vim +/ssd210_data +64 drivers/clk/mstar/clk-msc313-clkgen-ssd210.h

200ee40b6f539cb Daniel Palmer 2023-02-25  63  
200ee40b6f539cb Daniel Palmer 2023-02-25 @64  static const struct msc313_muxes_data ssd210_data = MSC313_MUXES_DATA(ssd210_muxes);
200ee40b6f539cb Daniel Palmer 2023-02-25  65  

:::::: The code at line 64 was first introduced by commit
:::::: 200ee40b6f539cb37be385de2042262d15b88f36 clk: mstar: msc313 clkgen

:::::: TO: Daniel Palmer <daniel@0x0f.com>
:::::: CC: Daniel Palmer <daniel@0x0f.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
