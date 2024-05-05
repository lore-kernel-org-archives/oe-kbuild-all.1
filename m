Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E4B1E52A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714927720; cv=none; b=YS1V31drn18K2qfPwbDTI3J2tx6cioT8Q5LPIKY8oT7BkhAeqe8uWqf5lTC7Wv3hSi1F0KOGAFKA9pY6cL7TwPwGq2PKidneS7WU5nKM74xOaFLW5vHqQa7rGMXYoVH0fxc/DHIDhs1+kCijAOLvRyfeCmN7QpCVdJBWWZtas3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714927720; c=relaxed/simple;
	bh=1BlGPFr3tthQUVP/HTvwsbYQm63gyqoiIGYiGjA0dsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D9IX7wDSW9rwi9AMEoQLyFrmlRjVyZQjk243I2IrVKKdNLpoOvmX52GbRHf8jy+3fezT2aII+97mExcpXTSxMQAQgB/MgFZCLBeeMxgqr93aLRCO7p0VWSpf8lyZCmU1ZvRWtbhMjCwWSmh1RJwOyq0EzZ45WDBenxu5Kfd0Ayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oK1U1Kro; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oK1U1Kro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714927719; x=1746463719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1BlGPFr3tthQUVP/HTvwsbYQm63gyqoiIGYiGjA0dsw=;
  b=oK1U1Kro0SBy9osUrCDyzMfS44Eu1V5kNRkNcyqQbjYHqnomGqL7H/HY
   xgqqfaw0LkV8G6oHdWbVIZ/wL3mlPgQH4qPjTV+nU9EBJVtODsV5brB+L
   zXES7G5XrvEf9o7RX0gumxgJsaJ+6mHFKm8Wvxu3qHMz+6XdVWd+LR5in
   M4moKFCiYGy+OiY3IfThY+aJcDvnXmM2rsqCFpJZS54fPuOy+1W9iQHW6
   jrjwI2RcphGIYonB9mpvIAUUcwXO6v5P73CX1BpdnKMsGIp1U8ljamhGx
   dmgsCBZWrd1If5RA2U4zmkJd2FxWlQmfdDTeQ9u6tVLb+SI2/ZWPwmJLs
   w==;
X-CSE-ConnectionGUID: o0x1NGOdQiyrXrjZOx+CLQ==
X-CSE-MsgGUID: gLnARozzRDGq8kcCGVpU/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14459698"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="14459698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 09:48:38 -0700
X-CSE-ConnectionGUID: jfGUagowQsWPE5AE6LMzmg==
X-CSE-MsgGUID: v9EwR4gjSmyaR55djDOATg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="32548046"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2024 09:48:37 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3f2Q-00004X-2w;
	Sun, 05 May 2024 16:48:34 +0000
Date: Mon, 6 May 2024 00:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4198/30000] ld.lld: error: undefined
 symbol: linflex_string_write
Message-ID: <202405060048.5rB3txuP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Larisa,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: 093375dfcc1c685b974c21cb9b50f44df4dcf29f [4198/30000] LF-631-7 tty: serial: linflexuart: Add support for FIFO with DMA
config: hexagon-randconfig-002-20240505 (https://download.01.org/0day-ci/archive/20240506/202405060048.5rB3txuP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060048.5rB3txuP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060048.5rB3txuP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: linflex_string_write
   >>> referenced by fsl_linflexuart.c
   >>>               tty/serial/fsl_linflexuart.o:(linflex_set_termios) in archive drivers/built-in.a
   >>> referenced by fsl_linflexuart.c
   >>>               tty/serial/fsl_linflexuart.o:(linflex_set_termios) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
