Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70C21C5F13
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 04:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783311639; cv=none; b=JygVfgljzwmNvqj8g6Z4tAjl8NwlH1BBOUqXZBOJxcYgw5MLTbRPDDErK9V6gCre50cSgaPokrE0XpGCl8l4doAtuDyq+JF24g2xasrcqDc37XKNR8q7ywrcFvu9SU1Jccq9APPsEqBikqu9zVdOyXehcV9jghZLj8NgcsOJo00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783311639; c=relaxed/simple;
	bh=XzA/ufZpHWFaXZuUH4pLVAwA7r1scVmQEJET3dDBewM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtgzk62hbR9VO/fpQ5DE7JQlqol9+9LDrmDfsitQAh/IJrBhY6n48aw/t5XbZypF+XxkvWU2NZSN7J0ubfHdj+KkrTY21HHNwX3r2GwCqr3NsXBLIvcAJUmfIDs5qMbeTjMiF9eVZxFJJFeVUEsctCEgheKa6fM2FsBn35584NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFOFvCmq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFOFvCmq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783311638; x=1814847638;
  h=date:from:to:cc:subject:message-id;
  bh=XzA/ufZpHWFaXZuUH4pLVAwA7r1scVmQEJET3dDBewM=;
  b=hFOFvCmq99qq77CEBi4TFCXb7/0GpYgRUjj7saTZS3oC9lIT76QhWcEW
   hpHbCPG+GBKd06etvG7VlBP+c4YFbiZHBw+Bp9WxRVBrXCviUToT8Z5zG
   +VAPBXTZjJ+BdNX1c4s66+c/y0rsM6IQXGGZvlTpIeCsbBj5NvWclG4F8
   UOWcFmMtXYvMMKBlXXeDnwOCVSF/e7Ar+XIfsCewq9sjSKlytC4PQDwNs
   3PM2USHiN51NR3IUsYmXF8+iLDMPZ1Y4cVVD/0QYM/HmoBs96+fYu6k0k
   YH84vLQiozEZZyfsa0Xs8FLQ+XGfB96bUqxkbyqTd8pb1elzSIJ6EwXfe
   Q==;
X-CSE-ConnectionGUID: esIPsE4xSKSAB0+CvDtiQw==
X-CSE-MsgGUID: 6BT1fY3RQtenlMSn3OH6mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87850007"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87850007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 21:20:37 -0700
X-CSE-ConnectionGUID: 91Ind4vhRiuv8CXxNlyg7Q==
X-CSE-MsgGUID: 04gv+HwoQke8W45zSzGe+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="249614275"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jul 2026 21:20:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgaor-00000000E4t-0BOj;
	Mon, 06 Jul 2026 04:20:33 +0000
Date: Mon, 06 Jul 2026 12:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:drivers-for-7.3 3/12]
 drivers/soc/qcom/socinfo.c:25:27: error: 'QCOM_ID_SDM850' undeclared here
 (not in a function); did you mean 'QCOM_ID_SDM450'?
Message-ID: <202607061242.K5MinnT1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-7.3
head:   889ee1f4f6633f8300500b529518d30bec282762
commit: 743af1d6a8b4bfa62dd01b5c2d81b1c62ea597f7 [3/12] soc: qcom: socinfo: Add SoC ID for SDM850
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260706/202607061242.K5MinnT1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061242.K5MinnT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061242.K5MinnT1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/socinfo.c:25:27: error: 'QCOM_ID_SDM850' undeclared here (not in a function); did you mean 'QCOM_ID_SDM450'?
      25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
         |                           ^~~~~~~~
   drivers/soc/qcom/socinfo.c:428:11: note: in expansion of macro 'qcom_board_id'
     428 |         { qcom_board_id(SDM850) },
         |           ^~~~~~~~~~~~~


vim +25 drivers/soc/qcom/socinfo.c

34ec89e68db2682 Krzysztof Kozlowski 2022-08-30  23  
34ec89e68db2682 Krzysztof Kozlowski 2022-08-30  24  /* Helper macros to create soc_id table */
34ec89e68db2682 Krzysztof Kozlowski 2022-08-30 @25  #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
34ec89e68db2682 Krzysztof Kozlowski 2022-08-30  26  #define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
34ec89e68db2682 Krzysztof Kozlowski 2022-08-30  27  

:::::: The code at line 25 was first introduced by commit
:::::: 34ec89e68db2682469a9a51d9ed4022ee3992389 soc: qcom: socinfo: create soc_id table from bindings

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
