Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5520254705E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694204; cv=none; b=bibPapmdZS/jvtJLSJKPm8ZdqrB6HcN2we9jyBDu3Qrl6bONe/8m5smUyJwBmkuQEdaSlCJyTsbdYaqEOsmcz99CuQE4giZnXYt60MDo9YfLS1U5dx6wIMD6EDr4sBH0soTkQvpooOi5I5S+OBYNOwgwyVAMTxvozNmwZGcyBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694204; c=relaxed/simple;
	bh=0+FUfDz5PlE9Fxl1qC9QvDVAsXXjNpMtV7jZX70ZLXw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oy3pmwd+4/PyjWA0+JEMmc5Gn6HQcTFRNomJmEMNDOlMUBNTG58VoaSKGp5zsibgdAjgIKXr4lJkcvJpZplar9vaZgygOL9Ypzf7pMb3Dnh8dTLz+9OGECDgtwQBOfEd2R3zdOlxoFX4JvF0PrRCf/b+bA8N+MPjXF2SX49iZD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZmhgqQh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZmhgqQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791694203; x=1823230203;
  h=date:from:to:cc:subject:message-id;
  bh=0+FUfDz5PlE9Fxl1qC9QvDVAsXXjNpMtV7jZX70ZLXw=;
  b=IZmhgqQhdweb9m2KCEWokwnoDxC9qqiPVIQuiIa/SU3SjKu4Mm5Ig69v
   8JBgdTlHakBj+GV5usc0RIWKGwvSXDE0yxIoBZoYsDiSvjDtS1W9uYEOG
   Dyg+uXzNCjtmZX9x6abgkr9K/XnU83mEPE8v1GEmS84KRkTjNTvsUFxAy
   s9DIa6/GEx2KSeFizSE6yYxrwxl0LrQvQnSIV9iV6Z5wIsBwFZTHr6i7s
   WPy8r0jK6zlgeaIF358Z98DJoVwn9pYY0bG4DV67u6El3L1FRusjABldN
   sctWeAX1pLSgkNAY9cdYQqI6hbMCRbDJGee0zcrPGw7Ey19geAhQjTr5N
   g==;
X-CSE-ConnectionGUID: gmE/QEoPSKaeSOq0IRY0mw==
X-CSE-MsgGUID: FRF9QzNZRMC8QdxIOKn6Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="334252"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="334252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 21:50:03 -0700
X-CSE-ConnectionGUID: 95vSs5hXRziuTxA9vYz6mA==
X-CSE-MsgGUID: ugCJljG6RQCKhakH4VQP0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="554664"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Oct 2026 21:50:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFlVW-00000000AK8-45pe;
	Sun, 11 Oct 2026 04:49:58 +0000
Date: Sun, 11 Oct 2026 12:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:cryptobench 1/1] benchmark.c:undefined reference
 to `crypto_alloc_aead'
Message-ID: <202610111207.ffr2dlwS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git cryptobench
head:   85feb719a4d373b4f08407abfd06f8374e5569ca
commit: 85feb719a4d373b4f08407abfd06f8374e5569ca [1/1] [TESTING, DO NOT MERGE] crypto - add benchmark and testing module
config: mips-ath79_defconfig (https://download.01.org/0day-ci/archive/20261011/202610111207.ffr2dlwS-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610111207.ffr2dlwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610111207.ffr2dlwS-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: crypto/benchmark.o: in function `benchmark_aead':
>> benchmark.c:(.text+0x1014): undefined reference to `crypto_alloc_aead'
>> mips-linux-ld: benchmark.c:(.text+0x136c): undefined reference to `crypto_aead_setkey'
>> mips-linux-ld: benchmark.c:(.text+0x1498): undefined reference to `crypto_aead_encrypt'
>> mips-linux-ld: benchmark.c:(.text+0x1584): undefined reference to `crypto_aead_decrypt'
   mips-linux-ld: crypto/benchmark.o: in function `benchmark_skcipher':
>> benchmark.c:(.text+0x1a54): undefined reference to `crypto_alloc_skcipher'
>> mips-linux-ld: benchmark.c:(.text+0x1a78): undefined reference to `crypto_skcipher_setkey'
>> mips-linux-ld: benchmark.c:(.text+0x1b38): undefined reference to `crypto_skcipher_encrypt'
>> mips-linux-ld: benchmark.c:(.text+0x1c28): undefined reference to `crypto_skcipher_decrypt'
   mips-linux-ld: benchmark.c:(.text+0x1e34): undefined reference to `crypto_skcipher_encrypt'
   mips-linux-ld: benchmark.c:(.text+0x1eb4): undefined reference to `crypto_skcipher_encrypt'
   mips-linux-ld: benchmark.c:(.text+0x1fcc): undefined reference to `crypto_skcipher_decrypt'
   mips-linux-ld: benchmark.c:(.text+0x2060): undefined reference to `crypto_skcipher_decrypt'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
