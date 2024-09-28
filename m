Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABEA19CC38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 04:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727498943; cv=none; b=bWI4/TEJROLD4NaicGju6ikOsQoDrr9HeqxKS7TLqJSTiK+08KSa1XiXIFR8D+kvz+5hd4ae2kIx33EJB+HRv+j9dBmp8dPdTVh3HxmXf1I0Yj4KIkHGyJ6ah2zLTF391x9HRN5EQ6z2XR40nLj2jn7T2UwgjErWT587noEJJMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727498943; c=relaxed/simple;
	bh=sDECs5oF3Y9ys5OGyQiGhFszYyeyssQfFCyzsVGS22o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i4vCsxPP7OqV0gFtFjoodyK7h1BG2oNoiV59FRl962sB5QijvVrJdrLLJw2ko79VL/DA7GVVUHrW6ah6SR5CYam6Ht1XqIMrnPHq9i6KFIjh3IJNU6N833KM1T9lD+OTB9Mir/+3C3Xhl+Wvqs7b5sQYNUxNJCJumQfrL//owdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwgnNnQn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwgnNnQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727498941; x=1759034941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDECs5oF3Y9ys5OGyQiGhFszYyeyssQfFCyzsVGS22o=;
  b=UwgnNnQnLIRpxMU8j2quBRdGi4ia6KelqXyq3P/azknQsY0wYxjzja1z
   wLz7go0tPheY20zJwjtCvLWU6KCmyBmPwGvnJBHIqXG3ff+2KdMsXkU6T
   QEb8H9Z/g6J+HYUaTGWXJdpzW2UaZBDBwSg3C2p1YxwTSJEOYE8hmFOTi
   oKes0DZui29Z+huwhPO9Cw6iChs1sdQYpAUbL12VeUGJbFvaFy+IpKxpL
   vOOwGtrQ2tT1nezGxwDu2tH4b5CtM1eMcYKF60ItTzT1bi7N8vdR/3ORH
   MXP3xFE1hkez0EXrOcFwPiZ7ui1O6tQebS/PloqUW4qB4SrGZU3VpyT+p
   A==;
X-CSE-ConnectionGUID: C9LZv10ESeCoccopQUL3hQ==
X-CSE-MsgGUID: ZyF/rb9rTiiANPssnKjOlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26748033"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26748033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 21:49:01 -0700
X-CSE-ConnectionGUID: A8yu5fpOTFKQ8ENVci9I8w==
X-CSE-MsgGUID: 3C7XViS1Sm2Ir07Ly6AiyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103520223"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Sep 2024 21:49:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suPO5-000MvT-1s;
	Sat, 28 Sep 2024 04:48:57 +0000
Date: Sat, 28 Sep 2024 12:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 1/10] arch/x86/crypto/twofish-x86_64.o:
 warning: objtool: .export_symbol+0x8: data relocation to !ENDBR:
 twofish_enc_blk+0x0
Message-ID: <202409281238.hPB3vhqh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   4e155f6fbba48ed677042026d7732c6256ffa166
commit: a8cfc198458df20142631aa83f9e56deaf92ec9f [1/10] x86/cfi: Wreck things...
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240928/202409281238.hPB3vhqh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281238.hPB3vhqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281238.hPB3vhqh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/twofish-x86_64.o: warning: objtool: .export_symbol+0x8: data relocation to !ENDBR: twofish_enc_blk+0x0
>> arch/x86/crypto/twofish-x86_64.o: warning: objtool: .export_symbol+0x18: data relocation to !ENDBR: twofish_dec_blk+0x0
--
>> arch/x86/crypto/twofish-x86_64-3way.o: warning: objtool: .export_symbol+0x8: data relocation to !ENDBR: __twofish_enc_blk_3way+0x0
>> arch/x86/crypto/twofish-x86_64-3way.o: warning: objtool: .export_symbol+0x18: data relocation to !ENDBR: twofish_dec_blk_3way+0x0
--
>> arch/x86/crypto/serpent-avx-x86_64.o: warning: objtool: .export_symbol+0x8: data relocation to !ENDBR: serpent_ecb_enc_8way_avx+0x0
>> arch/x86/crypto/serpent-avx-x86_64.o: warning: objtool: .export_symbol+0x18: data relocation to !ENDBR: serpent_ecb_dec_8way_avx+0x0
>> arch/x86/crypto/serpent-avx-x86_64.o: warning: objtool: .export_symbol+0x28: data relocation to !ENDBR: serpent_cbc_dec_8way_avx+0x0
--
>> arch/x86/crypto/camellia-x86_64.o: warning: objtool: .export_symbol+0x8: data relocation to !ENDBR: __camellia_enc_blk+0x0
>> arch/x86/crypto/camellia-x86_64.o: warning: objtool: .export_symbol+0x18: data relocation to !ENDBR: camellia_dec_blk+0x0
>> arch/x86/crypto/camellia-x86_64.o: warning: objtool: .export_symbol+0x28: data relocation to !ENDBR: __camellia_enc_blk_2way+0x0
>> arch/x86/crypto/camellia-x86_64.o: warning: objtool: .export_symbol+0x38: data relocation to !ENDBR: camellia_dec_blk_2way+0x0
--
>> arch/x86/crypto/camellia-aesni-avx-x86_64.o: warning: objtool: .export_symbol+0x8: data relocation to !ENDBR: camellia_ecb_enc_16way+0x0
>> arch/x86/crypto/camellia-aesni-avx-x86_64.o: warning: objtool: .export_symbol+0x18: data relocation to !ENDBR: camellia_ecb_dec_16way+0x0
>> arch/x86/crypto/camellia-aesni-avx-x86_64.o: warning: objtool: .export_symbol+0x28: data relocation to !ENDBR: camellia_cbc_dec_16way+0x0


objdump-func vmlinux.o .export_symbol:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
