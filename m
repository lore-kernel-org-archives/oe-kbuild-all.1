Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE92BA38
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732491569; cv=none; b=WtstLZfoV1JqsNDdfA10rL64delhERmke2h7JgKfPoIFUexNG6o6P7tQJNZ1ymtXXrnuBmgKkozuvW0CyIRCK7fQx2RZ4m0LueTIHzqJBOn7og4Oi66ekqLJHVpBB7SBM/vYCf3msFfm4xtaH6O6irtK3GHSJsZTuToOfzQ4gyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732491569; c=relaxed/simple;
	bh=nhkzXHQw8bmMe4PfcepI07JukctexuyF484z9Z4iZnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UeXaUxxrgWE37OP3Zz9K25DTqezdYJVTydbtTy8QtIbZjLFy2g+6K0UejN/hWp/sal2HN7L/13x45SO/5FapvlvFrw8irBPnwq7uUIyHdpsa13NO1jyNCioeBOPyugpa2Mcw3LoHUe5iu4fTpcpFBNPaHeajK4/pKG9jaFTtqe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7g1b4u4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7g1b4u4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732491568; x=1764027568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nhkzXHQw8bmMe4PfcepI07JukctexuyF484z9Z4iZnE=;
  b=N7g1b4u43zCNlDPH2bAptfiBD9d2nmf8D/bP410xWsqhl4fnRaxzHLp8
   YvLjbuKkWsNkDyqu6HMdkpPLz4CcObT82dRD8PY2eNJufVUNEhXz9BJc2
   /blFNk6rZ7AALxxHuExfKgOGJX2EnA2D5jqFC4RWs8E4X9OPhIKnOcbR+
   Y+VfKruzuqQoBWaDzLPyPcoAqxyhdhzdFzLSbZ8dS4cxf2EZepWPb4ma1
   HB4BQ+2mwmoDfsXUEw0jD7zr7LWKf0fQr6ix1ZH+bYBsdtAJJGm2vMOqm
   pXZQl+4Xc7RFYtVg4FiB5KOGOlOLYSy8KMY0vSNHOoK/IDAAbB11xEuc8
   g==;
X-CSE-ConnectionGUID: /48h4O0OQxu/VROmIRRXWA==
X-CSE-MsgGUID: OLevNEt1RzmxT53uvaWpZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36359750"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="36359750"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 15:39:27 -0800
X-CSE-ConnectionGUID: zjHwhhTqR/OIfeL6ArO0pw==
X-CSE-MsgGUID: m+4HFRcgR2S2TtBDXX2HGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="91893008"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Nov 2024 15:39:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFMCK-0005HN-0C;
	Sun, 24 Nov 2024 23:39:24 +0000
Date: Mon, 25 Nov 2024 07:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback-dev 18/21] ERROR: modpost: "__moddi3"
 [drivers/media/v4l2-core/v4l2-loopback.ko] undefined!
Message-ID: <202411250722.b4M9WrVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jarkko,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback-dev
head:   75cc3a15ccf020596f94a23250daa0bd551ed70f
commit: 36ae93bcb2d7a7e6d13533fb976c545fc85bdee8 [18/21] media: v4l2-loopback: Remove v4l2l_mod64()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241125/202411250722.b4M9WrVV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250722.b4M9WrVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250722.b4M9WrVV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "__moddi3" [drivers/media/v4l2-core/v4l2-loopback.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
