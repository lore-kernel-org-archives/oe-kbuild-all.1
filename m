Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479A0A47
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 00:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329348; cv=none; b=E1A4wgVUINTl0aIggnortIJ63JPU22blfKVrXXtDwFd6sAq8vwtCG4WUhgiGdiLXe50+rp7oCVSXfaup4PlhQaW+TB/n400JR92uzCHQw0N7U9O69xS+cEhJYjIvtJLDP2yEgp4so15i1/Sjhs56hFyr6aE7hz3I3rUiGZG82K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329348; c=relaxed/simple;
	bh=pi/BvbCmltlq9BSDyttKz2JN6v6gtw/tOM6iviamQTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=diON1+jwLeBarcwwviPBgHhGbMDpdnQOh2ViH7IAsR/MuXYCj9LP17pUxP+Zz7XGYP/+5aYW3MypnPT3/yFcd/JtySWT648PcnQzMtflEvz+As+leemXDcPsAa+9NB8HzJ6LtwUT9RpvRo+pKYiXNzA36PlZhRn/B7lOVX92tTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCeso4Bs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCeso4Bs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751329346; x=1782865346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pi/BvbCmltlq9BSDyttKz2JN6v6gtw/tOM6iviamQTA=;
  b=PCeso4BspxeYcXrAPcmekT1OeCaabsPtlB6JnnfpJZpWjuQsCaivr+1p
   DrM5uhFKiFYSNyP125MnI3Qrjf64zYLSujNPaczS6h1xbHIv0nMZphzT3
   LBW7chGdPb7W+bcq6Uvgw7itvrVvQaFYHtFNw8vPZQmHBCdopt6l6ujAw
   1SVa7/RWM+6oHuniXJJYVjygVXqDoAZdIX5iWZdlRqzjX1fGehUsSMoHa
   OOKWI2Bvnq84UJsPTxNsAO+US9M7AM5xNUUYQ6z7bv/CueJP1y7xQSpqZ
   QVy7ySNWtk6kgpa5IkuEcbGoJHRjE+pUdlOFLZM3FBxfXsWEIggbz/Z72
   A==;
X-CSE-ConnectionGUID: r/QE/OB0SsyvdFKSkvz+7g==
X-CSE-MsgGUID: iOU3KfXDRnah3y/vVFK0ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53509244"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53509244"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 17:22:26 -0700
X-CSE-ConnectionGUID: QOw3xPUwQOWCF13ZONw5dw==
X-CSE-MsgGUID: 9B5qjxxATPaVEht9k9JPTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153358998"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2025 17:22:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWOlS-000ZTG-1C;
	Tue, 01 Jul 2025 00:22:22 +0000
Date: Tue, 1 Jul 2025 08:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:sha256-lib-cleanup-v2 39/41]
 lib/crypto/powerpc/sha256.h:51:42: error: passing argument 1 of
 'ppc_spe_sha256_transform' from incompatible pointer type
Message-ID: <202507010837.ERX7aWw7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v2
head:   4cce364e759fe100945fbf8020df6d4350f96efc
commit: 54d41ebbde875a89d5f61fa3fb26291ece399fb2 [39/41] lib/crypto: sha256: Consolidate into single module
config: powerpc-tqm8540_defconfig (https://download.01.org/0day-ci/archive/20250701/202507010837.ERX7aWw7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010837.ERX7aWw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010837.ERX7aWw7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crypto/sha256.c:153:
   lib/crypto/powerpc/sha256.h: In function 'sha256_blocks':
>> lib/crypto/powerpc/sha256.h:51:42: error: passing argument 1 of 'ppc_spe_sha256_transform' from incompatible pointer type [-Wincompatible-pointer-types]
      51 |                 ppc_spe_sha256_transform(state, data, unit);
         |                                          ^~~~~
         |                                          |
         |                                          struct sha256_block_state *
   lib/crypto/powerpc/sha256.h:26:43: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'struct sha256_block_state *'
      26 | extern void ppc_spe_sha256_transform(u32 *state, const u8 *src, u32 blocks);
         |                                      ~~~~~^~~~~


vim +/ppc_spe_sha256_transform +51 lib/crypto/powerpc/sha256.h

1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  41  
54d41ebbde875a8 lib/crypto/powerpc/sha256.h      Eric Biggers 2025-06-24  42  static void sha256_blocks(struct sha256_block_state *state,
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  43  			  const u8 *data, size_t nblocks)
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  44  {
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  45  	do {
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  46  		/* cut input data into smaller blocks */
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  47  		u32 unit = min_t(size_t, nblocks,
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  48  				 MAX_BYTES / SHA256_BLOCK_SIZE);
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  49  
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28  50  		spe_begin();
1a49c573bf88634 arch/powerpc/lib/crypto/sha256.c Eric Biggers 2025-04-28 @51  		ppc_spe_sha256_transform(state, data, unit);

:::::: The code at line 51 was first introduced by commit
:::::: 1a49c573bf886349c7bc958b331c700cf18601d8 crypto: powerpc/sha256 - implement library instead of shash

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
