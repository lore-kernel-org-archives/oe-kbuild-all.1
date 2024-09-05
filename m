Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5EB2BB15
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 06:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725517380; cv=none; b=DeV/mJAg082mnjvvobjb5LBD+TSqMtvId+YLUGTjr1Qf16Ok7c1unHtpdDmxoQ0Dz0IyGdbAqKK7SceTs1Gl0iLcrwAagYu0WNYfoX//2QXrtPKMTciSNRY+7rrbj0MBbMgcxdfaOHP0Zmy9XgoyvLLrhMWFBYb7F6FOuX13JTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725517380; c=relaxed/simple;
	bh=f1LWhimz2UBbLV/EoSNso4y9Ig1HNZjzqmPZciwieiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VYXQ7xyurwFQ2B6fSbYpJQooO8XUFwM+Uk6wW+AgPdSaAp8ZYL8NWyHlK7n8PcrJYivYAVAatHITss0p1/omK+P0HoP5N/APa7TXFcX2k86MtnS53SCAiL5C3s7RCKWPeE6Lv4/mlMS2yzSad/VZzpyHLeleKseVQIfjQZJ3NcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFaeFTwV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFaeFTwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725517379; x=1757053379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1LWhimz2UBbLV/EoSNso4y9Ig1HNZjzqmPZciwieiI=;
  b=DFaeFTwVXFH5gMAWf+XJ/lMVM73EnV3WRRbBa6ZTsIh67qXQB73wJmWg
   YnmvcPvkXClRAp+2REl5aQlQ1gJaoPgs1xi8/gimrV/gOUIGimTA2y5FR
   lCG7qVpAbn957OyZPMYHi8KQ+xIV8Px2FnCOy0Y9PQWr5zkzIEMAkUw6i
   xmqs4YmwLhSB4ttJsQsxkmdGTltTs7pCv0L50hHvcMz6naKYVOjJWyQ3e
   p7zV74v440nbTs+tzSvXs564OUV1HUuwXQc+IJYIwy8xByVQ2O2tspwX+
   NNkNA+sgnDNkhT5tivvsC5C6ByEhdj+lH12W88uRQXxw6ZXWvkiHluZNq
   A==;
X-CSE-ConnectionGUID: pYdk1VcTSui0u5orZYEBOw==
X-CSE-MsgGUID: 7ujJITCIQdWcK2rfC3L2Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27134915"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="27134915"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 23:22:58 -0700
X-CSE-ConnectionGUID: IjnysbzvSKeOM1ulyK7N1A==
X-CSE-MsgGUID: 5PUti+rXRlezqBR8EZ0prQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="96311567"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Sep 2024 23:22:57 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm5tO-00090R-2n;
	Thu, 05 Sep 2024 06:22:54 +0000
Date: Thu, 5 Sep 2024 14:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [soc:soc/drivers 125/151] ERROR: modpost:
 "ucc_mux_set_grant_tsa_bkpt" [drivers/soc/fsl/qe/tsa.ko] undefined!
Message-ID: <202409051409.fszn8rEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   a0e199ecf93575cc9314a7b7a555594ee346f786
commit: 7ac947021d9d002d207ba9c376b4fe498926ea8d [125/151] soc: fsl: cpm1: tsa: Add support for QUICC Engine (QE) implementation
config: arm-randconfig-r064-20240905 (https://download.01.org/0day-ci/archive/20240905/202409051409.fszn8rEo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051409.fszn8rEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051409.fszn8rEo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
>> ERROR: modpost: "ucc_mux_set_grant_tsa_bkpt" [drivers/soc/fsl/qe/tsa.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
