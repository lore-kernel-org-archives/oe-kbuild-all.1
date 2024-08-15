Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895821420DD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746549; cv=none; b=uI/HWtnW0cRgA+BNns43UEiVvPgc3I5WI76NM+w6xvSvMaeSJ9L+2auLPCx3rGHlHa6UgXZgGhM037hcPiLT7a2oM3PnKiV8Ix5vLLexX4AnaiDQ/kffWPeekWCL1iboCyz9FppwOjFwqL9IVNv6mpVlLwV7nPDU4GOtiSMsz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746549; c=relaxed/simple;
	bh=Ff2Fzd5k0YVT5teeqp00lwdQRFZJavfRfjgx197Q6e8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHaWkANVYC35sjRRRVNBorIkGjv/+rrtExn24/nvnHp1oWTi++IEOZiWIsRv+OWKaBBrZR7QLZGFq2kOL43XP6ca4qxUFXNjPsqkstF73y4XvQPLjLgqM3DJK7vY7EOhQ7v2Tu6W/Pw0Js4LF34jZTljBfBrxdlr7X2Ld2Y7PyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3z9mLGx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3z9mLGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723746548; x=1755282548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ff2Fzd5k0YVT5teeqp00lwdQRFZJavfRfjgx197Q6e8=;
  b=R3z9mLGxPotaHpkW6X1vickeihKuApHJxVauTWwGtKx1pAopB4+OH9No
   9KQTv5TyjOrF9p4H+g5lpEX+9uGIMfMc3QwErJYYhPSWVVRrDf9g9ymqJ
   7hpHogZohOzBdeydunmR1oPqQa0mEZL87FyhR1lFsl2+7iTEs8WjwNMQt
   yyW68Ms66RtXwtfy0K2Bb6g89PS+Bn2HfoDAAUA988jd2jnhSJGSG8wH9
   kp7J7vw08kU6HNsAZEqbCwgfnjGWwJ38ghPnvTAPC38qGvW3m0i8UaiyX
   yR9OKGJ3lpl1KFJTJYoNWzYTigl/rM9pm3LcZ4T4LXLyfTHYKCr776PVo
   g==;
X-CSE-ConnectionGUID: QeNjDCPDTZe9gbGqfrA1lA==
X-CSE-MsgGUID: 0Y2X7GJ+QgK4IGnHKDBNCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="24921694"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="24921694"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 11:29:04 -0700
X-CSE-ConnectionGUID: 2wFHRPpjTZuqTdIJbeY0fg==
X-CSE-MsgGUID: 2UdS7zfRRMKZXf/bo5F5jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="59428355"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Aug 2024 11:29:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sefDY-0004n0-3D;
	Thu, 15 Aug 2024 18:29:01 +0000
Date: Fri, 16 Aug 2024 02:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: drivers/platform/cznic/turris-omnia-mcu-trng.c:(.text.omnia_mcu_register_trng+0x1a4):
 undefined reference to `devm_hwrng_register'
Message-ID: <202408160251.1obs1D1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1fb918967b56df3262ee984175816f0acb310501
commit: c7da0d4e33ce262dbed7b9ae4cf013aad0f541f6 platform: cznic: turris-omnia-mcu: Make TRNG code optional
date:   8 days ago
config: mips-randconfig-r064-20240815 (https://download.01.org/0day-ci/archive/20240816/202408160251.1obs1D1q-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160251.1obs1D1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160251.1obs1D1q-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/platform/cznic/turris-omnia-mcu-trng.o: in function `omnia_mcu_register_trng':
>> drivers/platform/cznic/turris-omnia-mcu-trng.c:(.text.omnia_mcu_register_trng+0x1a4): undefined reference to `devm_hwrng_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
