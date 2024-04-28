Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE4659165
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714326702; cv=none; b=k3JTFKHMGMqIB8YKttiHdJzvWfrsLVS7b1unv2gSMDDmnWGaip6gTCKPwLUuVzZvu7sn2Jg3JTwCd73dsX02eFlyw0gue2sWkGO8QKI88YvfXd7QadnkBVA2btH4EM3uRsp9njGSY95/AC1eDz4ecmPWk8eeatrQSID/WR7UKnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714326702; c=relaxed/simple;
	bh=/Wea1HGo6XXDncGFB6rpk8Xl5gVB7BWy5oLpcsUHNas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o4SsgIqpDy+XlXP8uOmBQzC5x/tJ9u/l5TIIJTqvvy5svFvB64af8+cLqoo1c9gfx4W2epBpHYov9SjnufvEPD67IIh6Q40d6KamHHXXsK6foOskOooowafsp1XXdbBwh44ViERh5CxFKqjsUeP60KmGB7oCcyhF2HmwvywuTg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbiTNdaY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbiTNdaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714326700; x=1745862700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Wea1HGo6XXDncGFB6rpk8Xl5gVB7BWy5oLpcsUHNas=;
  b=jbiTNdaYs2JGolFsNCrGxdVQheKzYfUtBhbtvH3qfNnMAoiuOlgSfiwe
   ccwkL9EMKsZjbZWp0HNJ9h5kM1V1woeT1YZ2lqFMWfeT/GcM+TGkIAtcM
   vexEg3/RCIqM06p2IQYUS9TcPjXIdh8AFDP5J9fQAzgvAGgqR6HZfRlZ2
   SoV7n3oSs71ui4zSyFIQu73qIr3dLMaGTL7Qv3YT9BfNFoJ//X/DprYFr
   cpWmD7OuibQghI0NwbRfkNOrekq+Bik1nt9NQ28uZ8opxP8xq23OzFqgQ
   wiN9owch5Uo/h/rhTXO45/Tmm6TqzSvsOMipVe0rPIq96+ZfV0M6WObSr
   w==;
X-CSE-ConnectionGUID: yJUNlKvPSeuk3tleDpqGfg==
X-CSE-MsgGUID: KBlrc3SYRSq59vTzO4Izyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20678840"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="20678840"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 10:51:40 -0700
X-CSE-ConnectionGUID: sAyaD4Z3R+KQTpv3xnVv3Q==
X-CSE-MsgGUID: Qfre2LrtS96WWVJiFHbjeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25877186"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2024 10:51:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s18gb-0006XC-09;
	Sun, 28 Apr 2024 17:51:37 +0000
Date: Mon, 29 Apr 2024 01:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 2754/11728] cc1: warning:
 security/keys/../../drivers/crypto/caam/: No such file or directory
Message-ID: <202404290105.k6I74Yw2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 6ba5bd5e536d9474e43b6eb0f203e78472aaa642 [2754/11728] security/keys/secure_key: Adds the secure key support based on CAAM.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404290105.k6I74Yw2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290105.k6I74Yw2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290105.k6I74Yw2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: security/keys/../../drivers/crypto/caam/: No such file or directory [-Wmissing-include-dirs]
   In file included from security/keys/securekey_desc.c:8:
   security/keys/securekey_desc.h:9:10: fatal error: compat.h: No such file or directory
       9 | #include "compat.h"
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
