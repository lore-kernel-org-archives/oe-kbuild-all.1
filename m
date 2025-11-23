Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA272C324D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763908904; cv=none; b=rarX2SGc96w8l238y02IdVe6TlbgS4GD8RooqgCUrPEj73Jbm+qe2oVNYKwOvsIQEBBgjb4nobxr0Eopr824X688jE5WpX2TSS+uB9W6yC5ksNc5xLVNL+hn0LIWPbXSBS6plahIPqUnAOVcYWl9TDzUX6Rkl97MZ4CuZjTiY+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763908904; c=relaxed/simple;
	bh=FenuRYd0BowywOBOhrezlY4+6b2yGd5/nfPRcNkTfzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnCLqz2/g5N3jfQAPyb7ldOeCMZOJ7FdYYKCPn5bDM5fcUG9zICz+VHg+VRotN14RM1FW4nDl0dLvMKaMyLfiyvKvn3D0iNTbnfG9+YLeswEJH8bVVdnDTEJ85omp1pluxNg9FHYw+UqiASrrhywLBVKViQnxV5x1sRxqdPd/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZHHshP9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZHHshP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763908902; x=1795444902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FenuRYd0BowywOBOhrezlY4+6b2yGd5/nfPRcNkTfzE=;
  b=lZHHshP9aucKtLha/ZZ70JxpASrLZ5e3vodqG5Zbe2PSqZTR/fvcgNfa
   EZujaJq80HHFBdE0Y8HDTCkiGZuPfFcBH9+k/G0FESMzNVADlKeisMLiC
   0jwh3easpbEJF5UTqfdjYKlJ/SDPexIhRoMg6/INhvliaXtcX0CX7DFXY
   Mao4x+ts+QGWWePD9EshG/KdrnTi39LoBORHPWGx3VF5yFsYBE8b27nmI
   DoDs7yAR0LkwPj+QMdbUaN6BVIU5Yd2BJ9JOgexn4hVaMfkpiKf8+SXc5
   LYmgCnw1WovHUphV4i3GEQjLTbgbTUjwhdVdlBEQjJxDo2+hEprMUWY2U
   A==;
X-CSE-ConnectionGUID: 9H3D+A/bSHmnORFK+5zrjw==
X-CSE-MsgGUID: 8hBpC01nQa6uI6bDjYMg1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65819220"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="65819220"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 06:41:40 -0800
X-CSE-ConnectionGUID: 1P8ULNKGS9muuynd/6+eig==
X-CSE-MsgGUID: plhztZeIQj6tVJPNU1uzeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="196273969"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Nov 2025 06:41:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vNBHU-0008Jp-1Q;
	Sun, 23 Nov 2025 14:41:36 +0000
Date: Sun, 23 Nov 2025 22:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 7/9]
 lib/crypto/tests/poly1305_kunit.c:21:2: error: implicit declaration of
 function 'poly1305_init'; did you mean 'poly1305_final'?
Message-ID: <202511232203.aXObANdA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git more-at-least-decorations-v1
head:   da707520ed1dbaed0ef9666f7adfac8910423a1f
commit: fb3cc420c064f330263417ab3ceeb27095d918c6 [7/9] lib/crypto: poly1305: Add at_least decoration to fixed-size array params
config: nios2-randconfig-001-20251123 (https://download.01.org/0day-ci/archive/20251123/202511232203.aXObANdA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511232203.aXObANdA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511232203.aXObANdA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crypto/tests/poly1305_kunit.c:5:
   include/crypto/poly1305.h:62:19: error: 'at_least' undeclared here (not in a function)
         const u8 key[at_least POLY1305_KEY_SIZE]);
                      ^~~~~~~~
   include/crypto/poly1305.h:62:27: error: expected ']' before numeric constant
         const u8 key[at_least POLY1305_KEY_SIZE]);
                              ^
                              ]
   lib/crypto/tests/poly1305_kunit.c: In function 'poly1305':
>> lib/crypto/tests/poly1305_kunit.c:21:2: error: implicit declaration of function 'poly1305_init'; did you mean 'poly1305_final'? [-Werror=implicit-function-declaration]
     poly1305_init(&ctx, key);
     ^~~~~~~~~~~~~
     poly1305_final
   cc1: some warnings being treated as errors


vim +21 lib/crypto/tests/poly1305_kunit.c

6dd4d9f7919e73 Eric Biggers 2025-07-09  14  
6dd4d9f7919e73 Eric Biggers 2025-07-09  15  /* This probably should be in the actual API, but just define it here for now */
6dd4d9f7919e73 Eric Biggers 2025-07-09  16  static void poly1305(const u8 key[POLY1305_KEY_SIZE], const u8 *data,
6dd4d9f7919e73 Eric Biggers 2025-07-09  17  		     size_t len, u8 out[POLY1305_DIGEST_SIZE])
6dd4d9f7919e73 Eric Biggers 2025-07-09  18  {
6dd4d9f7919e73 Eric Biggers 2025-07-09  19  	struct poly1305_desc_ctx ctx;
6dd4d9f7919e73 Eric Biggers 2025-07-09  20  
6dd4d9f7919e73 Eric Biggers 2025-07-09 @21  	poly1305_init(&ctx, key);
6dd4d9f7919e73 Eric Biggers 2025-07-09  22  	poly1305_update(&ctx, data, len);
6dd4d9f7919e73 Eric Biggers 2025-07-09  23  	poly1305_final(&ctx, out);
6dd4d9f7919e73 Eric Biggers 2025-07-09  24  }
6dd4d9f7919e73 Eric Biggers 2025-07-09  25  

:::::: The code at line 21 was first introduced by commit
:::::: 6dd4d9f7919e73bc7ad247eca82e8be1c123af0a lib/crypto: tests: Add KUnit tests for Poly1305

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
