Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247851C84B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740318926; cv=none; b=Rng+4i3QOVS9kPkTNZMf2c4x1f8Ew6Vkwm5GSu2mCzoi4gB1fMMyHTGX7JOLAoxhdlXYhgX7JqzjRvz0qbgYV92w2FO4s/FCjEB7lByKmWZjVPbtdq8pwAWa6MnVnFBsORhrs8nJPvdC97nCw2G2FRy0OQHnUhXzt085mcBlipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740318926; c=relaxed/simple;
	bh=hw44ByTdUYk50z3XDb/JoVSiQG+PPhJ5JUdR58IzaLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6rAQzj1PSHc8UhtQ8LBc0gLsI1Oq09QTvmAEOEVKRRWga3ngSlOp+i0J2Cal7lYn3jVg/C6OqaWOc3Lh0DD/j5yTQV+NYqNpL3y6hoQEYlcxK4C+UnClVKNQG0MzD7eBzybxy2QkEP0JYNvgUap3HpBsNmuFBA+PGtcIjnD0sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTcbUnic; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTcbUnic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740318924; x=1771854924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hw44ByTdUYk50z3XDb/JoVSiQG+PPhJ5JUdR58IzaLE=;
  b=nTcbUnic7rUG/C19nn5gkxq9pn+/o5rgGye2DPr7NQLIGG3+bbyWovXc
   D5D7F3juu2FnATEoouO801DEtoFaBcRaClTviwWL1bWRBBrpVFCJkX+E0
   5ccUhRGQenwqmTlbSSsui0quAgui9rNLd3b1B1ZNzTjbxuXWT2+TMBDjt
   U5/aUbvpiJHX+BOTAGK0NUuaLgVtlPy0zCt3KJCTnX8qYb9dumO9yw14q
   L460Le5jAFeIKza/kkahAYUksmQN2TVPLTsD/1iUdlCDvNJ9PcfovWd4j
   SwkE1rE45W7F8zyolDobXLczcOFvzW+PX/l42Aj+lgG/OjjS9TQNZt661
   A==;
X-CSE-ConnectionGUID: xqOhAaVTS3yHQuVneHi28w==
X-CSE-MsgGUID: giJHg5ueTmWZPqHoXRsx6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41202020"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41202020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 05:55:24 -0800
X-CSE-ConnectionGUID: 3lVE7KFsTRufC8kH0h3pWQ==
X-CSE-MsgGUID: Kk5m5mVETjetGdHn04FEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115852422"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2025 05:55:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmCS0-0007Mp-1V;
	Sun, 23 Feb 2025 13:55:20 +0000
Date: Sun, 23 Feb 2025 21:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] crypto: lib/Kconfig - Fix lib built-in failure when arch
 is modular
Message-ID: <202502232152.JC84YDLp-lkp@intel.com>
References: <Z6woN4vgdaywOZxm@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6woN4vgdaywOZxm@gondor.apana.org.au>

Hi Herbert,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-lib-Kconfig-Fix-lib-built-in-failure-when-arch-is-modular/20250212-125048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/Z6woN4vgdaywOZxm%40gondor.apana.org.au
patch subject: [PATCH] crypto: lib/Kconfig - Fix lib built-in failure when arch is modular
config: s390-randconfig-r072-20250223 (https://download.01.org/0day-ci/archive/20250223/202502232152.JC84YDLp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502232152.JC84YDLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502232152.JC84YDLp-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha20poly1305_encrypt':
>> chacha20poly1305.c:(.text+0x27a): undefined reference to `chacha_init_arch'
   s390x-linux-ld: lib/crypto/chacha20poly1305.o: in function `__chacha20poly1305_encrypt':
>> chacha20poly1305.c:(.text+0x5bc): undefined reference to `chacha_crypt_arch'
>> s390x-linux-ld: chacha20poly1305.c:(.text+0x638): undefined reference to `chacha_crypt_arch'
   s390x-linux-ld: lib/crypto/chacha20poly1305.o: in function `xchacha_init':
   chacha20poly1305.c:(.text+0x9f2): undefined reference to `chacha_init_arch'
>> s390x-linux-ld: chacha20poly1305.c:(.text+0xa04): undefined reference to `hchacha_block_arch'
>> s390x-linux-ld: chacha20poly1305.c:(.text+0xa1a): undefined reference to `chacha_init_arch'
   s390x-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha20poly1305_decrypt':
   chacha20poly1305.c:(.text+0xeca): undefined reference to `chacha_init_arch'
   s390x-linux-ld: lib/crypto/chacha20poly1305.o: in function `__chacha20poly1305_decrypt':
   chacha20poly1305.c:(.text+0x126a): undefined reference to `chacha_crypt_arch'
   s390x-linux-ld: chacha20poly1305.c:(.text+0x13ca): undefined reference to `chacha_crypt_arch'
   s390x-linux-ld: lib/crypto/chacha20poly1305.o: in function `chacha20poly1305_crypt_sg_inplace':
   chacha20poly1305.c:(.text+0x18ec): undefined reference to `chacha_init_arch'
   s390x-linux-ld: chacha20poly1305.c:(.text+0x190c): undefined reference to `chacha_crypt_arch'
   s390x-linux-ld: chacha20poly1305.c:(.text+0x1bb6): undefined reference to `chacha_crypt_arch'
   s390x-linux-ld: chacha20poly1305.c:(.text+0x1c24): undefined reference to `chacha_crypt_arch'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
