Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5182866
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 01:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783734343; cv=none; b=ax8afYUCKMQcFIHUolxBrKDhNunJ44gxeu0GLe/tjzsbrGEsXdPYfZtLvP3BsWk72JYm42PTXBU2J+OUE+t92aHz7OfS5EZPGYCz+TFoCxKu800KNUxfoDdLWoPO6kGyEpN8tpxZ6bfiXSlTd1BnSFT9ZacDsP1QHNeC8WDK0qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783734343; c=relaxed/simple;
	bh=Dy7Dsrs2SEaOCSsCR+lyCdgW3Gu9+0bXrtkff+PoXIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CQ/JRlppBr0AHr8JICwX+5ZXvrI7o8HZZdsXZhr1zPe/oHJNaHaZ4BiYU8cFnXQ5IHarsQ+nKT3e46wsmxAWXQ9ZVtUILWnjfyF7rkOLu/Dbds8D+mC/zI4g2Cs5JR0M8w9cXBfNttI7DO4pf/0sxjF0eHlpzOGjBsfHhkLRMGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbuYG6Lz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbuYG6Lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783734340; x=1815270340;
  h=date:from:to:cc:subject:message-id;
  bh=Dy7Dsrs2SEaOCSsCR+lyCdgW3Gu9+0bXrtkff+PoXIU=;
  b=kbuYG6LzGF3nM4MriZd/J+2zvmZEmXf/EazxfcAhgTSZaTiH4tVYVeB2
   JD9uoiBUhxxuszrcnQwCJ66rrPdPbBx87lGnn1aUTG4eaZsBZoyItrTs4
   JqLPDCpdVYmRmJAqn164JWkg2IDyYlcU/YcO9KHR3aEqd5uvjskZjzBAv
   mTzxpqJwS7gMPThigubtI3Sqklpi5HkSOj3FNWfRCeHjtQmHKCLSm3gkG
   61k5MyB+7xqozZEcLkOM0po7z3OFW1sZ88Q4QwEQYn0i+z0g4+1+BYWsC
   8UgYT9mCPpmNJ1/W3jNC31SnKlkSJcAOefuDt9sRsZwTlE/03kzbETCeO
   w==;
X-CSE-ConnectionGUID: q7HbEDDGRx2VrLNz5YypsA==
X-CSE-MsgGUID: aUovthFTTc+/rDjbFhWl5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83412237"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83412237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 18:45:40 -0700
X-CSE-ConnectionGUID: bfwxDHCDQVG79XoNTqtPVA==
X-CSE-MsgGUID: EXWht3AzSXGrEdtSXOipuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258908654"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2026 18:45:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiMmd-00000000Jc0-44X2;
	Sat, 11 Jul 2026 01:45:35 +0000
Date: Sat, 11 Jul 2026 09:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes 29/37] aes.c:undefined reference to
 `ghash_update'
Message-ID: <202607110856.Rn8Dgi2Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   11d4308c758c0308cdb17cd4fff4a59360a2f1a9
commit: 072d0787348922430c5c3ed2d6de2fe66514f0ec [29/37] wifi: mac80211: Use crypto libraries for GCMP and CCMP suites
config: mips-sb1250_swarm_defconfig (https://download.01.org/0day-ci/archive/20260711/202607110856.Rn8Dgi2Q-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110856.Rn8Dgi2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110856.Rn8Dgi2Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: lib/crypto/aes.o: in function `aes_gcm_encrypt_update':
>> aes.c:(.text+0x31b8): undefined reference to `ghash_update'
>> mips64-linux-ld: aes.c:(.text+0x3204): undefined reference to `ghash_update'
   mips64-linux-ld: aes.c:(.text+0x3250): undefined reference to `ghash_update'
   mips64-linux-ld: aes.c:(.text+0x329c): undefined reference to `ghash_update'
   mips64-linux-ld: lib/crypto/aes.o: in function `aes_gcm_decrypt_update':
   aes.c:(.text+0x338c): undefined reference to `ghash_update'
   mips64-linux-ld: lib/crypto/aes.o:aes.c:(.text+0x33f4): more undefined references to `ghash_update' follow
   mips64-linux-ld: lib/crypto/aes.o: in function `aes_gcm_encrypt_final':
>> aes.c:(.text+0x3594): undefined reference to `ghash_final'
   mips64-linux-ld: aes.c:(.text+0x35fc): undefined reference to `ghash_update'
   mips64-linux-ld: lib/crypto/aes.o: in function `aes_gcm_decrypt_final':
   aes.c:(.text+0x3708): undefined reference to `ghash_update'
>> mips64-linux-ld: aes.c:(.text+0x3714): undefined reference to `ghash_final'
   mips64-linux-ld: aes.c:(.text+0x37a4): undefined reference to `ghash_update'
   mips64-linux-ld: lib/crypto/aes.o: in function `aes_gcm_auth_update':
   aes.c:(.text+0x3840): undefined reference to `ghash_update'
   mips64-linux-ld: lib/crypto/aes.o: in function `aes_gcm_preparekey':
>> aes.c:(.text+0x45bc): undefined reference to `ghash_preparekey'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
