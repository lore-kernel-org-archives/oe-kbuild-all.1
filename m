Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2859B4C79
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 02:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719456186; cv=none; b=SbKThcoo6Wk5NjT8drl8blqqFHY1TVMXIEhzLRlqx4sL9JVCTUKksV8eMf3NoZPPZDL6AX6x93FaXWhlnC4gizlYNGkrpBeitzOzP6BD3O8EwJQHKYl6Q8ZpTMvB0X7SO0WCfjU7GcV2Jg6b/MP/RHu8+hJTfmg8YGC3PHWzdt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719456186; c=relaxed/simple;
	bh=h4Y7Lwu4pR2cz9mw9ep5FKZmM0et+MaVpEC2C19+OZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Be8vfvaRT5PBvrpXeBhxyjfZzvAYyYK97ttEo1gqD5dKv4Co4PhfjRpdOAEoJCih0WyFEUPlp+tL/GyXTYXVs7GQRvEYnRk2acsvY0nwDly7LShQDdcAQoAdmNQusVX6C2WoGymNjSDPJkEcVHsr72MDQ5mH45EZdq9S5F5kj58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKYiNYBW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKYiNYBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719456184; x=1750992184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4Y7Lwu4pR2cz9mw9ep5FKZmM0et+MaVpEC2C19+OZM=;
  b=FKYiNYBWcEpnhtlM0WmEOQUuUcSfwbToOORmtcMA/y5/TodBnQK69xFu
   LOPjOlk4y/8Mu779N0Gb9rXK1Kpc0mQOvmyj1o1JTC0lECQ7oeK+H+xjL
   rwT4UqFufLts0f7/pHgQ9JzcKQM8ecxC2EwCBpwG5NbU+Ktnj9IVNJbyD
   lcNaPyvCzzToojUlDtHpJ6G4Dmio2bIK8nCk3aoh0rovCPRorT8EBQh0m
   CoztovwfAgtxUvejIbBvYAk9B0kEymcBiDHQSuSS4NWkZmxZbwBNSim+9
   2howE+RbIS7K5ixvCuLp8O27BUy+vGbzPISivCB7CwL+bXPRaWL1w2b04
   g==;
X-CSE-ConnectionGUID: Mbz8WhJ3R8eDbCmtvA3gUg==
X-CSE-MsgGUID: OFovj10xTP+fqYrSjkDp7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16520441"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="16520441"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 19:43:04 -0700
X-CSE-ConnectionGUID: D1xe8Xn7ShmGPuNqcilJnQ==
X-CSE-MsgGUID: rARicT9LSsiHH2Abcv+3XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="67446910"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2024 19:43:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMf6A-000Fna-1p;
	Thu, 27 Jun 2024 02:42:58 +0000
Date: Thu, 27 Jun 2024 10:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/7880] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_ZSTD when selected by EMM_ZRAM_CONF
Message-ID: <202406271057.455s7lYR-lkp@intel.com>
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
config: loongarch-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20240627/202406271057.455s7lYR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406271057.455s7lYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271057.455s7lYR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by EMM_ZRAM_CONF
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
