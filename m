Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD701E47A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 02:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742524937; cv=none; b=anDpx6bsrqzCqZVH+twk1s0dqF267BNbrbAb0Pcyj2tpzBG3UCYVtbZYyPfaX9IDPHYy93vAu089tQgjanDbE3EYlHubz4Sf29YYEF1xYIB3HHkmP7nhVU5VS2pnPaaeBAxjTjl0QDNDJ9ry2o3oCJtPbHu9hoNSUwKcIysxT6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742524937; c=relaxed/simple;
	bh=6fFZB10S4y9KoN6y15XmXrUds/vJgH0OB+XZq8/nlVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BhlPlNe5gyMc3LgY79D6dfw2RNRF7o0/XTDkU2gAKl5zcF/8sej3J52N41/wccu11ehEUmPp8RexMjjdMnW032HmQIK2+42QbKo8VpkhrUKLE8/wmS/Kg3vXg7p4lRQl5WwDBi5Rxpkv5uKGXFsc3ox4J8tf64pgs6F2ABIpfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHxvI1qY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHxvI1qY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742524934; x=1774060934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6fFZB10S4y9KoN6y15XmXrUds/vJgH0OB+XZq8/nlVw=;
  b=nHxvI1qYI+KWev44DABeLGc5j+SpDmm2gOjOet57jsrL3mVc5z7VhCGf
   F15zYNsJxSkgJC6BApjGoQeVJ2c/uSRMfldA/kUbnRCKrll+0pOfZPFZg
   SqXxS1ik+Ty5gnvQmeg1l/cd5UljnTlgPWper/ROqi0WvBCB9b00FplWm
   TIPb62yG0rsQdyfPyzuacsQU5wgMhgascBFnpVgsU2MvOD1/Qe0RqYCOT
   9kWCayOrcGxmPtxM4iDAm6wBeHD4Y3GswZgvIbeoAUcojiTLVq6SMHMIj
   ESVpIPaUBlDDz75jbuHSkeUXhJlUb5dCrbTuyTZtXdv4TiqjZCyHAR8wW
   Q==;
X-CSE-ConnectionGUID: aPuYsavxRpeLr8Q6yS2bqQ==
X-CSE-MsgGUID: FEsvohaoTMerfiVoTwZzFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54418807"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="54418807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 19:42:13 -0700
X-CSE-ConnectionGUID: O3l+moyTRTmAGrZ8q7doLg==
X-CSE-MsgGUID: 70qIrQzPQlqrIEC82XlqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="154171389"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2025 19:42:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvSKn-0000xb-1U;
	Fri, 21 Mar 2025 02:42:09 +0000
Date: Fri, 21 Mar 2025 10:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 20/24] ERROR: modpost: "__ffsdi2"
 [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
Message-ID: <202503211029.DnQpqsJs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   ba8755ab541fc629948233125db870d4dbf00a75
commit: ee7f8ed72990f28657b5bf598e695fcf4633f4ed [20/24] platform: cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211029.DnQpqsJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211029.DnQpqsJs-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "__ffsdi2" [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
