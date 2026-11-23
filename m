Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406174;
	b=qzixsn+3PIlQvW/x2wzDn9JLgcCN1NpewYddFB2prag2W3vi4FPOCXXZ2POOcSW5ep+C
	 oEilq2HQjZMzHoYezWes4NJibojZY9KCSprDg3McjhRUeSGeJ45/cxsVd7/mwYt26oL9u
	 7FGWY0LUzDO7KjWsPlYFShxgcw8YpMbAkSzrMqKqZi0qH4QvfGyyM6yfRvesA5z3YjWRk
	 ktLX+uLb/V2U2rPai9HPj80Ximg8EwlRV3eAcHw6wQIC5kCmrysjcCFhYl+wWiDP1AVNZ
	 CW1TpdLTD7c4DHQiQNa4gcHD2D2HNTKrwK0U+i3u/PD5NWR2hNqsmBad7DAESZCF8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406174;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=A/fTpRqX6pvU4792OuYWLQRR6TZs6suxEdTx5Vb4Be4=;
	b=sHkU52UPuOhEowkyDEqGn6ILlapaHGYW73R/JFcx3m4EGUTmx8GmjiVail6FDV9LruXp
	 RVzT4NZDh5OQKXl8lM0xJjUa0LRtrGXPC9WcRzROX4cWx9pIX4ddzQqbYAPnfXqynpkIH
	 57wrsMCY/jwxhVi1e4ZwDd0ga/eai0ZDCDAVGwjXAUBRoz67DyCf1RZGh1/ydCHlZdQVT
	 CRznYcV8k0Jt+83hlnC1qhGanquN4zF8TKIlWjhJoqxlhoFhPa491pi8LZUNEQH0vTbeq
	 tWT95MnyE4AhU+ofgnvl7l4lDNUL7antZiU/zcoJfgGkzbBmYFquhQxv5gbS9vAmr/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jhl4Wqo+;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A392B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 03:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A392B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jhl4Wqo+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795406173; x=1826942173;
  h=date:from:to:cc:subject:message-id;
  bh=eWfyZYx4I3uqZ1W7tBhf+ooDKVS4cLQ1ETOAMwjspHE=;
  b=jhl4Wqo+oW5n1QT+4FRjjkKvolGep40hXvtP9i0xXVF3Co4TkueFbxt3
   A9oprgRNqFo7MdCRNQTbZmWCaGWrtzLKnHFlbxLFJ1nHvMS8i8f2mjWEI
   KxbEuUcAaDWHEXGR64qP5tGCg8x8H1fj3IP1ouEPRfPpLqiVfPPbl6F80
   JeS7aO6LZ61pkyaehhAnHjZ+F7EhEudbjCqewe0709PGxwoQ3thsk9N8f
   pWVdySg24Ota1FLslLSiGzjYJw/ZFjHTOVWYPBArR/lNObBhbB0UrfrIa
   ByX5onxaudNGzPu0XJF6G31hGFMDpC8I8zFdLVlV77zO1ieWMLrUcIUa4
   A==;
X-CSE-ConnectionGUID: 9l0NCeGOQtW39R3kRdnb9A==
X-CSE-MsgGUID: pMK4ytyDSQuvM3YmLvPH9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4098192"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4098192"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 19:56:12 -0800
X-CSE-ConnectionGUID: lKU3NL1RRHiMfp/qpGC+Tw==
X-CSE-MsgGUID: MLvx7qBvSOWSTwiKgCPTvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11533552"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2026 19:56:11 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVLA0-000000004k2-2RFu;
	Mon, 23 Nov 2026 03:56:08 +0000
Date: Mon, 23 Nov 2026 04:56:06 +0100
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/qcom-kconfig-unify-interconnect 6/15]
 drivers/soc/qcom/kryo-l2-accessors.c:8:10: fatal error: asm/sysreg.h: No such
 file or directory
Message-ID: <20261123044817.vr20MNwM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/krzk/linux b4/qcom-kconfig-unify-interconnect
head:   bbcb5f4d2545aa663011b1a5e4d21ea9ba744b64
commit: 4430e8bec5c893c5a325e041b9b1a98d640bfdcc [6/15] clk: qcom: Consistently handle MSM8996 and SAR2130P
config: loongarch-randconfig-r2302-20261123 (https://download.01.org/0day-ci/archive/20261123/20261123044817.vr20MNwM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123044817.vr20MNwM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261123044817.vr20MNwM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/kryo-l2-accessors.c:8:10: fatal error: asm/sysreg.h: No such file or directory
       8 | #include <asm/sysreg.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/clk/qcom/clk-cpu-8996.c:64:10: fatal error: asm/cputype.h: No such file or directory
      64 | #include <asm/cputype.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_KRYO_L2_ACCESSORS
   Depends on [n]: ARM64
   Selected by [y]:
   - QCOM_CLK_APCC_MSM8996 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]


vim +8 drivers/soc/qcom/kryo-l2-accessors.c

6d0efeb14bbe2350 Ilia Lin 2020-07-03  @8  #include <asm/sysreg.h>
6d0efeb14bbe2350 Ilia Lin 2020-07-03   9  #include <soc/qcom/kryo-l2-accessors.h>
6d0efeb14bbe2350 Ilia Lin 2020-07-03  10  

:::::: The code at line 8 was first introduced by commit
:::::: 6d0efeb14bbe2350a94ba07b403a686d731c5179 soc: qcom: Separate kryo l2 accessors from PMU driver

:::::: TO: Ilia Lin <ilialin@codeaurora.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
