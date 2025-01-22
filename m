Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBFE185B62
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737569968; cv=none; b=lgOeuG/pxPPYbFD7gxqzmcfzneK+6l+g79DS7kwOnL0Zgken8uZm+mDqD4uWJpNddqYSBs3Vvhhl0ZZCuoJTKxfk72vv6gzIqi65nVHb8U554PVWss1PZZcOIsJGvoki5YoIm4TaDtIgZL4dLjb+f3OaamubBVOzfeKMwB3N5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737569968; c=relaxed/simple;
	bh=sUctyIXfsfVNYwKtB5j2AZQfllfwRf2RXXZ0QtkXI88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uw/JqcnMIIANI9eNvIcxVsE0O6wiw7lFzDiBCRg0Uq1JcDywKesirW4mnIusRuK2+zcF+0HWNUVtwGRP+JJGmMPC+xQ5EY56ost1dzwkHmVhNBlJ2UCu8F2lwMywVfxiJiiqDcUQsPqAo5KjXqk0Ewt7qA9MQ0PgALVxgQdF5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=If7GZqy4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="If7GZqy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737569967; x=1769105967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sUctyIXfsfVNYwKtB5j2AZQfllfwRf2RXXZ0QtkXI88=;
  b=If7GZqy4rzCOpS0wrXSSrWO0pIul6cxlF0xH6iL1EXMlX100xXRU1ZY7
   E/B94VOd1rjmshqzNLlCvChkLKIS8DLfYhReOLyagOlV0JCCGeB5Q1YJL
   vftVZPIIbhVrlRI6I8BqEqcZw/WBF4hE/q3P47grAiQKA5Fuy91nEfCOs
   gj3dsDSpwqJ/vRmL8FexEME9qsSBXIWV7ebDDF1pOMHXIt7XoklqfbYWf
   dUTOQGTb9MwiVlhe+xNBJVnNyK89Q48IbhouCVM6iQmzsoLqyNw7PzrNc
   IEJn0WJllocvnhguuUWl5ugsnmU3Lt8Zz0fAYDS1/yxMvFcBgK9xooI9F
   w==;
X-CSE-ConnectionGUID: 0XE59z7SS86F3ARiJVrl1A==
X-CSE-MsgGUID: t7F7keTRTkKfdTRdsvI8Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37920283"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="37920283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 10:19:27 -0800
X-CSE-ConnectionGUID: FsoZoJLzQzeGYN++MkYndA==
X-CSE-MsgGUID: aT9cYMsBR0qMUwQZpnSLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="138067612"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jan 2025 10:19:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tafJy-000aDl-1p;
	Wed, 22 Jan 2025 18:19:22 +0000
Date: Thu, 23 Jan 2025 02:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Danny Tsen <dtsen@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: ld.lld: error: undefined symbol: curve25519_arch
Message-ID: <202501230223.ikroNDr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c4b9570cfb63501638db720f3bee9f6dfd044b82
commit: b42519dbba838c928e82b55f32712fbe3eed2c45 crypto: ppc/curve25519 - Update Kconfig and Makefile for ppc64le
date:   8 months ago
config: powerpc64-randconfig-r111-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230223.ikroNDr1-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250123/202501230223.ikroNDr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230223.ikroNDr1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: curve25519_arch
   >>> referenced by curve25519.h:39 (include/crypto/curve25519.h:39)
   >>>               lib/crypto/curve25519-selftest.o:(curve25519_selftest) in archive vmlinux.a
   >>> referenced by curve25519.h:39 (include/crypto/curve25519.h:39)
   >>>               lib/crypto/curve25519-selftest.o:(curve25519_selftest) in archive vmlinux.a
   >>> referenced by curve25519.h:39 (include/crypto/curve25519.h:39)
   >>>               drivers/net/wireguard/noise.o:(wg_noise_precompute_static_static) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: curve25519_base_arch
   >>> referenced by curve25519.h:55 (include/crypto/curve25519.h:55)
   >>>               lib/crypto/curve25519-selftest.o:(curve25519_selftest) in archive vmlinux.a
   >>> referenced by curve25519.h:55 (include/crypto/curve25519.h:55)
   >>>               drivers/net/wireguard/noise.o:(wg_noise_set_static_identity_private_key) in archive vmlinux.a
   >>> referenced by curve25519.h:55 (include/crypto/curve25519.h:55)
   >>>               drivers/net/wireguard/noise.o:(wg_noise_handshake_create_initiation) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: curve25519_generic
   >>> referenced by curve25519-selftest.c:1307 (lib/crypto/curve25519-selftest.c:1307)
   >>>               lib/crypto/curve25519-selftest.o:(curve25519_selftest) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: curve25519_null_point
   >>> referenced by curve25519-selftest.c
   >>>               lib/crypto/curve25519-selftest.o:(.toc+0x0) in archive vmlinux.a
   >>> referenced by noise.c
   >>>               drivers/net/wireguard/noise.o:(.toc+0x0) in archive vmlinux.a
   >>> referenced by netlink.c
   >>>               drivers/net/wireguard/netlink.o:(.toc+0x8) in archive vmlinux.a
   pahole: .tmp_vmlinux.btf: Invalid argument
   ld.lld: error: .btf.vmlinux.bin.o: unknown file type

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_LIB_CURVE25519
   Depends on [m]: CRYPTO_ARCH_HAVE_LIB_CURVE25519 [=m] || !CRYPTO_ARCH_HAVE_LIB_CURVE25519 [=m]
   Selected by [y]:
   - WIREGUARD [=y] && NETDEVICES [=y] && NET_CORE [=y] && NET [=y] && INET [=y] && (IPV6 [=y] || !IPV6 [=y]) && !KMSAN [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
