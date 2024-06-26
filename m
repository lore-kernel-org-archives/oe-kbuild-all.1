Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817F1BF31
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 03:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719371386; cv=none; b=EkytNI0GK7ZSR5gaXJfKCczs6A2hs8sHYAKi7dQADQLwdNB96alx+sWqvhNPRoT+lGOJ3N2xa3mZ1waqOHN0xwXmtNeCcTdUHQUdOPgpMQ2bxk5vcFYARuUrR7Gf5sDhsTO03FbkDoOZC9SCrKqaJFlxzxwbBy4QstgkBwiCBs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719371386; c=relaxed/simple;
	bh=vSMMmin2Xnq0Q3ej3CqJDuMajQJfqtSRf1T+AZp0CFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lTLPYn1WwXTkhbwZISo8ajGiqHAB7D/+DAyL5zJh5T615livm1l1wnoTYY+G9qcq0kSEDboAGbdij2a9XEQpyEqG5ZwCo3eA0FWnYlua5gL1hwuQaeEEKw89ZhtgFtUh5XdfYEmH8kCvMMMvleD+uLLCJ0AV4KDpd9f+laCKG6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeSmecpr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeSmecpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719371384; x=1750907384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSMMmin2Xnq0Q3ej3CqJDuMajQJfqtSRf1T+AZp0CFA=;
  b=GeSmecprujN7ZzzP6+CCaeVxdJfqokXr0SWIIcGhf2YM6KaPiuWA+h7a
   dm6e0FVuFlYUMM7RJfmSQ7TSvK4LLYiHARBrIfEBHdwikbyNjDP2zHfuw
   pxZc7utU/S41mL5xWOr5iP4rsyF/rLVBOb3s0ptie4gvs8/9L9Mj4Gs/0
   Qz+VMkzy6MLUYKoiD7/UNdgMOjfE8IDG/sdV2From6fjCdSwTiKQ7pvHb
   KcsGwDPDK414dnOjfg0uCydrHlkViaW1gcZkatHzf+kywSPahKctNeaDd
   WiYDAF7KLjqtLWzsSyWpf73W4AdIIJa99fiOMFjQmrmKKexwQLAEytnqd
   A==;
X-CSE-ConnectionGUID: vTywL58/RPSSglQnoY0z+g==
X-CSE-MsgGUID: c1cJe15XT2yitOu0ke1Z4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20199768"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="20199768"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 20:09:44 -0700
X-CSE-ConnectionGUID: 8LvYWTnjS825/NlxpbC3iw==
X-CSE-MsgGUID: g8YGozlyR+G9oTPdw06O7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="49026566"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jun 2024 20:09:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMJ2O-000Evg-2Y;
	Wed, 26 Jun 2024 03:09:36 +0000
Date: Wed, 26 Jun 2024 11:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/7880] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_LZ4 when selected by EMM_ZRAM_CONF
Message-ID: <202406261045.clTXwrHZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ca7064b2308b42201419e17b030e6a9347be29cd
commit: 5723adb73901b05640a72b59bfa6125a3a469cd3 [5561/7880] emm: configs: enabled EMM related configs
config: loongarch-kismet-CONFIG_CRYPTO_LZ4-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20240626/202406261045.clTXwrHZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240626/202406261045.clTXwrHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261045.clTXwrHZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_LZ4 when selected by EMM_ZRAM_CONF
   WARNING: unmet direct dependencies detected for CRYPTO_LZO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for MEMCG_ZRAM
     Depends on [n]: CGROUPS [=n] && MEMCG [=n] && SWAP [=y]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
