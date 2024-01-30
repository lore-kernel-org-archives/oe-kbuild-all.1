Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BCE55E6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 20:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706647477; cv=none; b=NgTGTIYm9MFBzFVhNB2CuaKBilwf2VjOiMAn0gcxSdzTlVMzAFTX2dR9KXg4cY75MH2kcVDICbCaLu7EyHsJnjcvMzAp4CALd8aP5VUhDFWCJfALD0htFAkiEN6w2yr9XPxLBRuFZUGIZA3Qbe/LpUlsbHOl0rZktfUEvZZM5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706647477; c=relaxed/simple;
	bh=7Lx1iA5Sq49DWl7tAO7b6f3QsB7nA0NWL2nrdqaKNzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSNByC03Yf3/XldKVgp734n/aOTFyzAA4SIYD9BvVAHseWXMvGaY2nt87thMcXDUWvED4GXD+55gnFscZgspi+IQg/9j9YTwqsuJ6CnxnHiT7tPY5CV57eZqplNnxO42AMYPJ/OUUbhrlp6QofBgWhKI0ryB9nOmnAkP/lGsOG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3X/ILqb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3X/ILqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706647476; x=1738183476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Lx1iA5Sq49DWl7tAO7b6f3QsB7nA0NWL2nrdqaKNzU=;
  b=A3X/ILqbsHmd4K0kanJigEEypsfEJCLXJ+RW+fPOdWdrzlNXDJs7KRVV
   RsOMz8pHEv832hy/WQMJSYghRtIPDapSIdZrS+t6S1DctIpxSrZZn1oYT
   k7qo67Gh1QNO1bbea8JhhNP5260gQ5DT44zcQjEbzctnvVpqq/Lip2m5g
   IQ3yKJDXoCMlxB8nHsnfmd4k0MEd20cwpbeQWIpeWQ/ExVYufWgYMx/xs
   N8kcjjwDNLjPkeGcocsvfhdVkmvrhDXotE4QHyESWeOk/W8K0egSkmD0j
   9VK4OOz7L+6RBdmaUODmF9mHBiSHb8+k+2KMbp1VX2V0beLCFTdXp9lSo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3251101"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3251101"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 12:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3813969"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2024 12:44:35 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUuy7-0000oi-3B;
	Tue, 30 Jan 2024 20:44:31 +0000
Date: Wed, 31 Jan 2024 04:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/ubsan-only 4/6] misc.c:undefined reference to
 `__ubsan_handle_shift_out_of_bounds'
Message-ID: <202401310416.s8HLiLnC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/ubsan-only
head:   ec27d9baa678ce3b875e5784ba6ebbf759daabd6
commit: c37e9d494f33891d3228e7941cba1158fe8a0e77 [4/6] ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL
config: sh-randconfig-001-20240130 (https://download.01.org/0day-ci/archive/20240131/202401310416.s8HLiLnC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310416.s8HLiLnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310416.s8HLiLnC-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: arch/sh/boot/compressed/misc.o: in function `zlib_inflate_table':
>> misc.c:(.text+0x670): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   sh4-linux-ld: arch/sh/boot/compressed/misc.o: in function `inflate_fast':
   misc.c:(.text+0xc5c): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   sh4-linux-ld: arch/sh/boot/compressed/misc.o: in function `zlib_inflateReset':
   misc.c:(.text+0xd00): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   sh4-linux-ld: arch/sh/boot/compressed/misc.o: in function `zlib_inflate':
   misc.c:(.text+0x23fc): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   sh4-linux-ld: arch/sh/boot/compressed/ashldi3.o: in function `__ashldi3':
>> ashldi3.c:(.text+0xc8): undefined reference to `__ubsan_handle_shift_out_of_bounds'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
