Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB3C35E1C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 01:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784685149; cv=none; b=RFx81OBVSt8oM+KsMoN64102EhbT1hjOh5n9O2TAjG+iAIKglSNZKYBSYoAOvuVXiA51mOZxyuXGiJLHc2rxKA0uP2dHC7/5mF4ZBETNyQ3ZV84N9YrNmdWtud2O5qb2W0Wd0imU9CE7ENcsQZ2nhnVawAmn+ZO6So74nRk32P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784685149; c=relaxed/simple;
	bh=EjUzcMUk0odFtFI86blawN+qIj2g21tQB8/5341PzwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dlNYh3V/MAU0TezJWfVSVt7HwBn+ztjWS5UdwR+iXB/aTBfFSAAAzutkBJOVNO4kVwwI+qRBr7blJC+1jc4K053PpHX8gIWwf7L4KW4L8OXHxiUiI15bZoRVkArQ4D0bLJgjrOii+/cMyhxBh3qbKszsNM1xanHeZdHlJnDmL3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4dmwTqz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4dmwTqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784685147; x=1816221147;
  h=date:from:to:cc:subject:message-id;
  bh=EjUzcMUk0odFtFI86blawN+qIj2g21tQB8/5341PzwE=;
  b=b4dmwTqzy5/e/5U7Yg+txpxTHmSpoFVf2YDnS5vPsdH5GaxLjEFHEpd3
   FwMq56FCJ1vN+ynwtcYimjPH58CJlF6bh5jYTcBzAy2rtvN7gPArJyvQA
   EjwZ/UUOlOiwS7jaBtssN92lsCCeCr6tfeoWZo5Gcw+tsnfDyNpqQyRl7
   XDOQaqYAqw+aL4l9WVG4od+8Vpjdcic71GvGhT53Xg+DbBojOcRyrsZ7U
   xn+QOcMw3/HFyVMCTQXKVu+0bURnMweWUkNcv8fNHtOMIIRp95to1LO09
   EQYkrMKv7NRlmTVXSYwnVnFazZbTVyBOHIHJEsNeJp/xdVTK5+ktNNuvS
   Q==;
X-CSE-ConnectionGUID: CSIijcS0S+abWz4KB1tNAw==
X-CSE-MsgGUID: oyXO2ikXRgCEYOP0PTnK7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108096309"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="108096309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 18:52:26 -0700
X-CSE-ConnectionGUID: 1+rxuJCITh+CyhslreyGbA==
X-CSE-MsgGUID: Il1C4uqzQU+7Lt6AwHYWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="258011140"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Jul 2026 18:52:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmM89-00000000YIP-3UJg;
	Wed, 22 Jul 2026 01:52:18 +0000
Date: Wed, 22 Jul 2026 09:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6610/8209] sparc-linux-ld:
 lib/crypto/aes.c:1450:undefined reference to `ghash_update'
Message-ID: <202607220918.2RL0wGGS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: 2bbb643994354c3abb2993ae699b017c21e558e9 [6610/8209] lib/crypto: aes: Add GCM support
config: sparc-randconfig-001-20260722 (https://download.01.org/0day-ci/archive/20260722/202607220918.2RL0wGGS-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607220918.2RL0wGGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220918.2RL0wGGS-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1403:(.text+0x19f8): undefined reference to `ghash_update'
   sparc-linux-ld: lib/crypto/aes.o: in function `aes_gcm_crypt_update':
   lib/crypto/aes.c:1429:(.text+0x1a4c): undefined reference to `ghash_update'
>> sparc-linux-ld: lib/crypto/aes.c:1450:(.text+0x1a90): undefined reference to `ghash_update'
   sparc-linux-ld: lib/crypto/aes.c:1478:(.text+0x1ae0): undefined reference to `ghash_update'
   sparc-linux-ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1403:(.text+0x1b7c): undefined reference to `ghash_update'
   sparc-linux-ld: lib/crypto/aes.o:lib/crypto/aes.c:1431: more undefined references to `ghash_update' follow
   sparc-linux-ld: lib/crypto/aes.o: in function `aes_gcm_encrypt_final':
>> lib/crypto/aes.c:1518:(.text+0x1df4): undefined reference to `ghash_final'
   sparc-linux-ld: lib/crypto/aes.o: in function `ghash_pad':
   lib/crypto/aes.c:1403:(.text+0x1f50): undefined reference to `ghash_update'
   sparc-linux-ld: lib/crypto/aes.o: in function `aes_gcm_decrypt_final':
   lib/crypto/aes.c:1541:(.text+0x1fa0): undefined reference to `ghash_update'
>> sparc-linux-ld: lib/crypto/aes.c:1542:(.text+0x1fac): undefined reference to `ghash_final'
   sparc-linux-ld: lib/crypto/aes.o: in function `aes_gcm_auth_update':
   lib/crypto/aes.c:1392:(.text+0x2050): undefined reference to `ghash_update'
   sparc-linux-ld: lib/crypto/aes.o: in function `aes_gcm_preparekey':
   lib/crypto/aes.c:1362:(.text+0x2824): undefined reference to `ghash_preparekey'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
